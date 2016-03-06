<?php 
Class cCat{    
    public function getCatalogById($catalog_id,$light=false){        
        global $utils;
        $row = !is_array($catalog_id);
        $ids = $row ? array($catalog_id) : $catalog_id;
        if($light){
            $query = "select * from catalog where id in (".implode(',',$ids).")";
        }else{
            $query = "SELECT c.*, count(c_sub.id) as subs, count(wc.ware_id) as ware,
                CONCAT('".CATALOG_IMG_URL."/small/',cf.filename) as filepath
                from catalog c
                left join ware_catalog wc on c.id = wc.catalog_id
                left join catalog c_sub on c.id = c_sub.parent_id
                left join catalog_files cf on c.id = cf.catalog_id and cf.is_main=1                
                where c.id in (".implode(',',$ids).")
                group by c.id
                order by c.seqno";
        }
        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? ($row ? $dt[0] : $dt) : false;      
    }  
    
    public function getCatalogByParentId($parent_id,$op=array()){        
        global $utils;

        $op["active"] = isset($op["active"]) ? $op["active"] : false;
        $op["file"] = isset($op["file"]) ? $op["file"] : false;
        
        $query = "SELECT c.*, count(c_sub.id) as subs, count(wc.ware_id) as ware
            ".($op["file"] ? ",CONCAT('".CATALOG_IMG_URL."/small/',cf.filename) as filepath" : "")."
            from catalog c
            left join ware_catalog wc on c.id = wc.catalog_id 
            left join catalog c_sub on c.id = c_sub.parent_id".($op["active"] ? " and c_sub.isactive=1" : "")."
            ".($op["file"] ? "left join catalog_files cf on c.id = cf.catalog_id and cf.is_main=1" : "")."
            where c.parent_id = ".$parent_id."
            ".($op["active"] ? " and c.isactive=1" : "")."
            group by c.id
            order by c.seqno
            ";
        $dt = $utils->GetAssocArray($query);
        
        if($op["file"] && $dt){
            $sec=0;
            foreach($dt as &$dr){
                $dr["sec"] = $sec + 0.2;
            }
        }
        
        return count($dt)>0 ? $dt : false;        
    }
    
    public function getCatalogByWareId($ware_id){
        global $utils;
        $query = "SELECT DISTINCT catalog_id FROM ware_catalog WHERE ware_id = ".$ware_id;
        $arr = $utils->GetIndexHash($query);
        
        return $arr;      
    }
    
    public function delCatalogById($catalog_id){
        global $dbconn, $utils;
        
        $query = "delete from catalog where id = ".$catalog_id;
        $dbconn->Execute($query);
        
        //delete catalog images
        $query = "select id, filename from catalog_files where catalog_id =".$catalog_id;
        $dt_i = $utils->GetAssocArray($query);	

        foreach($dt_i as $dr){
            $utils->delImageFiles("catalog",$dr["filename"]);
        }

        $query = "delete from catalog_files where catalog_id =".$catalog_id;
        $dbconn->Execute($query); 
        
        return true;
    } 
    
    public function getCatalogFiles($catalog_id){
        global $utils;
        
        $query = "select * from catalog_files where catalog_id=".$catalog_id." and is_main<>1 order by creationdate desc";
        $dt = $utils->GetAssocArray($query);	
        
        return $dt;
    }
    
    public function getFeaturedCatalogs($num){
        global $utils;
        $query = "select c.* from catalog c where c.parent_id = 0 order by RAND() limit ".$num;
        
        $dt_rc = $utils->GetAssocArray($query);	

        return $dt_rc;
    }  
    
    public function reorderCatalog($id,$after_id){
        global $dbconn;
            
        //var_dump($id,$after_id);
        $c = $this->getCatalogById($id,true);
        $af = $this->getCatalogById($after_id,true);
        
        if($c["seqno"]<$af["seqno"]){
            $query = "update catalog set seqno=seqno-1
                    where seqno<=".$af["seqno"]."
                    and seqno>=".$c["seqno"]."
                    and id<>".$id."
                    and parent_id=".$c["parent_id"];  

            $dbconn->Execute($query);   
            
            $query = "update catalog set seqno=".$af["seqno"]." where id=".$id;
            $dbconn->Execute($query);  
        }
        
        if($c["seqno"]>$af["seqno"]){
            $query = "update catalog set seqno=seqno+1
                    where seqno>=".($af["seqno"]+1)."
                    and seqno<=".$c["seqno"]." 
                    and id<>".$id."
                    and parent_id=".$c["parent_id"];        
            $dbconn->Execute($query); 
            
            $query = "update catalog set seqno=".($af["seqno"]+1)." where id=".$id;
            $dbconn->Execute($query);              
        }        
        
        return true;
    }
}
?>
<?php 
Class AFunc{
    public function handler_CatalogTree($open_ids=array(),$ware_id=0){
        global $smarty;
        if(count($open_ids)==0 && $ware_id>0){
            $open_ids = $this->getCatalogByWareId($ware_id);
        }
        
        $json_tree = $this->getTree($open_ids, $ware_id, true);
        //var_dump($json_tree);
        $jsvars["json_tree"] = $json_tree;
        $smarty->assign(array(
            "jsvars"=> $jsvars,
        ));
    }    
    
    public function getCatalogById($catalog_id){
        global $utils;
        $query = "select * from catalog where id=".$catalog_id;
        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? $dt[0] : false;      
    }  
    
    public function getCatalogByParentId($parent_id){
        global $utils;
        
        global $utils;
        $query = "SELECT c.*, count(c_sub.id) as subs, count(wc.ware_id) as ware
            from catalog c
            left join ware_catalog wc on c.id = wc.catalog_id
            left join catalog c_sub on c.id = c_sub.parent_id
            where c.parent_id = ".$parent_id."
            group by c.id";
        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? $dt : false;;         
    }
    
    public function getCatalogByWareId($ware_id){
        global $utils;
        $query = "SELECT DISTINCT catalog_id FROM ware_catalog WHERE ware_id = ".$ware_id;
        $arr = $utils->GetIndexHash($query);;
        
        return $arr;      
    }
    
    public function getTree($open_ids, $ware_id, $json=false){
        $opened = array();
        foreach($open_ids as $open_id){
            $path = $this->getTreePath($open_id);
            $opened = array_unique(array_merge($opened, $path));
        }
        $tree = $this->dipTree(0,$opened,$ware_id);
        
        return $json ? json_encode($tree) : $tree;
    }
    
    public function getTreePath($catalog_id, $returntext = false){
        $path = array();
        
        while ($catalog_id > 0){
            $catalog = $this->getCatalogById($catalog_id);
            $path[] = $returntext == false ? $catalog_id : $catalog["name"];
            
            $catalog_id = $catalog["parent_id"];            
        }

        return $path;
    }   
    
    public function getWareByCatalogId($catalog_id){
        global $utils;
        $query = "SELECT w.*
            FROM ware w
            JOIN ware_catalog wc on w.id = wc.ware_id
            WHERE wc.catalog_id = ".$catalog_id;
        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? $dt : false;           
    }
    
    public function getWareInCatalog($catalog_id, $ware_id=0){        
        $icn_endpoint = '/assets/img/icn_ware.png';   
        $dt = $this->getWareByCatalogId($catalog_id);
        
        foreach($dt as $dr){
            $node = array(
                "id"=> "w".$dr["id"],
                "text"=>$dr["name"],
                "state"=> array(
                    "opened"=>false,
                    "disabled"=>false,
                    "selected"=>($dr["id"] == $ware_id ? true : false)
                ),
                "children"=>false,
                "li_attr"=>array("data-type"=>"ware"),
                "a_attr"=>"",
                "icon"=>$icn_endpoint
            );
            $nodes[] = $node;
        }
        return $nodes;
    }
    
    public function dipTree($parent_id, $opened=array(), $ware_id=0){
        $tree = array();
        
        $dt = $this->getCatalogByParentId($parent_id);   
        if($dt){
            foreach($dt as $dr){
                $span_name = '<span class="x-catalog">'.$dr["name"].'</span>';
                //$span_sub = $dr["subs"]>0 ? '<span class="text-muted"><small>вложенные папки - '.$dr["subs"].'</small></span>' : '';
                //$span_ware = $dr["ware"]>0 ? '<span class="text-muted"><small>продукты - '.$dr["ware"].'</small></span>' :  '';
                $node = array(
                    "id"=> "c".$dr["id"],
                    //"text"=>$span_name.$span_sub.$span_ware,
                    "text"=>$span_name,
                    "state"=> array(
                        "opened"=>in_array($dr["id"],$opened),
                        "disabled"=>false,
                    ),
                    "children"=>($dr["subs"]>0 || $dr["ware"]>0),
                    "li_attr"=>array("data-type"=>"catalog","data-subs"=>$dr["subs"],"data-ware"=>$dr["ware"]),
                    "a_attr"=>"",
                );
                if(in_array($dr["id"],$opened)){
                    if($dr["subs"]>0){
                        $node["children"] = $this->dipTree($dr["id"],$opened,$ware_id);
                    }else if($dr["ware"]>0){
                        $node["children"] = $this->getWareInCatalog($dr["id"], $ware_id);
                    }
                }
                /*if($dr["level_id"] == 5){
                    $node["icon"] = $icn_endpoint;
                }*/
                $tree[] = $node;
            }
        }
        return $tree;
    }    
}
?>
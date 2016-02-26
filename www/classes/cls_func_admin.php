<?php 
Class AFunc{
    public function handler_getCatalogTree($open_ids=array(),$ware_id=0){
        global $smarty;
        if(count($open_ids)==0 && $ware_id>0){
            $open_ids = $this->getCatalogByWareId($ware_id);
        }
        
        $json_tree = $this->getTree($open_ids, $ware_id, true);
        $jsvars["json_tree"] = $json_tree;
        
        $smarty->assign(array(
            "jsvars"=> $jsvars,
        ));
    }    

    public function handler_editCatalog($p){
        global $smarty;
        
        if($p["id"]>0){
            $dr = $this->getCatalogById($p["id"],true);
            $p["parent_id"] = $dr ? $dr["parent_id"] : $p["parent_id"];
        }
        
        $path = $this->getTreePath($p["parent_id"], true);    
        
        $jsvars["is_saved"] = isset($_SESSION["catalog_saved"]) ? $_SESSION["catalog_saved"] : 0;
        unset($_SESSION["catalog_saved"]);
        
        $smarty->assign(array(
            "p"=>$p,
            "dr"=>$dr,
            "path"=>count($path)>0 ? implode('->',$path) : 'Корневой каталог',
            "jsvars"=> $jsvars,
        ));
        
    }

    public function handler_saveCatalog($p){
        global $utils;
        
        $id = $p["f_id"];
        $table = "catalog";
        $fields = "parent_id,name,descr,isactive";
        $bind = $utils->dbPrepareBind($fields,$p,'f_');
        if($id==0){
            //insert
            $id = $utils->dbInsert($table,$bind,true,array("timestamp"=>"creationdate"));
        }else{
            //update
            $utils->dbUpdate($table,$bind,array("id"=>$id));            
        }
        $_SESSION["catalog_saved"] = 1;
        return $id;
    }    
    
    public function handler_editWare($p){
        global $smarty;

        // get ware details
        if($p["id"]>0){
            $dr = $this->getWareById($p["id"],true);
            $open_ids = $this->getCatalogByWareId($p["id"]);            
        }else{
            $open_ids = array($p["parent_id"]);
        }
        $p["parent_id"] = implode(',',$open_ids);
        $op = array("editmode"=>true);
        $json_tree = $this->getTree($open_ids, $p["id"], true, $op);
        $jsvars["json_tree"] = $json_tree;        
        
        $jsvars["is_saved"] = isset($_SESSION["ware_saved"]) ? $_SESSION["ware_saved"] : 0;
        unset($_SESSION["ware_saved"]);
        
        $smarty->assign(array(
            "p"=>$p,
            "dr"=>$dr,
            //"path"=>count($path)>0 ? implode('->',$path) : 'Корневой каталог',
            "jsvars"=> $jsvars,
        ));
        
    }

    public function handler_saveWare($p){
        global $utils;
        
        $id = $p["f_id"];
        $table = "ware";
        $fields = "name,descr,isactive";
        $bind = $utils->dbPrepareBind($fields,$p,'f_');
        if($id==0){
            //insert
            $id = $utils->dbInsert($table,$bind,true,array("timestamp"=>"creationdate"));
        }else{
            //update
            $utils->dbUpdate($table,$bind,array("id"=>$id));            
        }
        
        if(!$p["f_parent_id"]==0 && strlen($p["f_parent_id"])>0){
            $parent_ids = explode(',',$p["f_parent_id"]);
            $utils->dbDelete("ware_catalog",array("ware_id"=>$id));
            foreach($parent_ids as $parent_id){
                $bind = array("ware_id"=>$id,"catalog_id"=>$parent_id);
                $utils->dbInsert("ware_catalog",$bind,false);                
            }
        }
        
        $_SESSION["ware_saved"] = 1;
        
        return $id;
    }    
    
    /* ware */
    public function getWareById($ware_id){        
        global $utils;
        $row = !is_array($ware_id);
        $ids = $row ? array($ware_id) : $ware_id;
        $query = "select * from catalog where id in (".implode(',',$ids).")";        

        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? ($row ? $dt[0] : $dt) : false;      
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
    
    public function delImageFiles($filetype,$filename){
        global $utils;
        $filedir = $filetype=="ware" ? WARE_IMG_DIR : CATALOG_IMG_DIR;
        $files = array();
        $files[] = $filedir.$filename;
        $files[] = $filedir."thumbnail/".$filename;
        $files[] = $filedir."small/".$filename;
        
        foreach($files as $filepath){
            $utils->delFile($filepath);
        }    
    }
    
    public function delWareById($ware_id){
        global $dbconn, $utils;
        
        //get catalogs
        $catalog_ids = $this->getCatalogByWareId($ware_id);
        $dt_c = $this->getCatalogById($catalog_ids);

        //delete ware
        $query = "delete from ware where id = ".$ware_id;
        $dbconn->Execute($query);
        
        //delete ware catalog
        $query = "DELETE FROM ware_catalog WHERE ware_id = ".$ware_id;
        $dbconn->Execute($query);
        
        //delete ware images
        $query = "select id, filename from ware_files where ware_id =".$ware_id;
        $dt_i = $utils->GetAssocArray($query);	

        foreach($dt_i as $dr){
            $utils->delImageFiles("ware",$dr["filename"]);
        }

        $query = "delete from ware_files where ware_id =".$ware_id;
        $dbconn->Execute($query);    

        return $dt_c;
    }
    
    /* catalog */
    public function getCatalogById($catalog_id,$light=false){        
        global $utils;
        $row = !is_array($catalog_id);
        $ids = $row ? array($catalog_id) : $catalog_id;
        if($light){
            $query = "select * from catalog where id in (".implode(',',$ids).")";
        }else{
            $query = "SELECT c.*, count(c_sub.id) as subs, count(wc.ware_id) as ware
                from catalog c
                left join ware_catalog wc on c.id = wc.catalog_id
                left join catalog c_sub on c.id = c_sub.parent_id
                where c.id in (".implode(',',$ids).")
                group by c.id";
        }
        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? ($row ? $dt[0] : $dt) : false;      
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
    
/* tree & nodes */    
    
    public function getTree($open_ids, $ware_id, $json=false, $op=array()){
        $opened = array();
        foreach($open_ids as $open_id){
            $path = $this->getTreePath($open_id);
            $opened = array_unique(array_merge($opened, $path));
        }
        $op["endparent"] = $open_ids;
        $tree = $this->dipTree(0,$opened,$ware_id,$op);
        
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
    
    public function getWareInCatalog($catalog_id, $ware_id=0){        
        $icn_endpoint = '/assets/img/icn_ware.png';   
        $dt = $this->getWareByCatalogId($catalog_id);
        
        foreach($dt as $dr){
            $node = array(
                "id"=> "c".$catalog_id."_w".$dr["id"],
                "text"=>$dr["name"],
                "state"=> array(
                    "opened"=>false,
                    "disabled"=>false,
                    "selected"=>($dr["id"] == $ware_id ? true : false)
                ),
                "children"=>false,
                "li_attr"=>array("data-type"=>"ware","text"=>$dr["name"],"data-id"=>$dr["id"]),
                "a_attr"=>"",
                "icon"=>$icn_endpoint
            );
            $nodes[] = $node;
        }
        return $nodes;
    }
    
    public function dipTree($parent_id, $opened=array(), $ware_id=0, $op=array()){
        $op["editmode"] = isset($op["editmode"]) ? $op["editmode"] : false;
        $op["endparent"] = isset($op["endparent"]) ? $op["endparent"] : array();
        $tree = array();
        
        $dt = $this->getCatalogByParentId($parent_id);   
        if($dt){
            foreach($dt as $dr){
                $span_name = "<span>".$dr["name"]."</span>";
                $span_info = $op["editmode"] ? " <span>(папки: ".$dr["subs"].", товары: ".$dr["ware"].")</span>" : "";
                $node = array(
                    "id"=> "c".$dr["id"],
                    "text"=>$span_name.$span_info,
                    "state"=> array(
                        "opened"=>in_array($dr["id"],$opened),
                        "disabled"=>($op["editmode"] ? ($dr["subs"]>0) : false),
                        "selected"=>($op["editmode"] ? in_array($dr["id"],$op["endparent"]) : false)
                    ),
                    "children"=>($op["editmode"] ? ($dr["subs"]>0) : ($dr["subs"]>0 || $dr["ware"]>0)),
                    "li_attr"=>array("data-type"=>"catalog","data-subs"=>$dr["subs"],"data-ware"=>$dr["ware"],"data-text"=>$dr["name"],"data-id"=>$dr["id"]),
                    "a_attr"=>"",
                );
                if(in_array($dr["id"],$opened)){
                    if($dr["subs"]>0){
                        $node["children"] = $this->dipTree($dr["id"],$opened,$ware_id,$op);
                    }else if($dr["ware"]>0 && !$op["editmode"]){
                        $node["children"] = $this->getWareInCatalog($dr["id"], $ware_id);
                    }
                }
                $tree[] = $node;
            }
        }
        return $tree;
    }    
}
?>
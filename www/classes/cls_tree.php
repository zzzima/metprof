<?php 
Class cTree{
    
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
        global $cCat;
        $path = array();
        
        while ($catalog_id > 0){
            $catalog = $cCat->getCatalogById($catalog_id);
            $path[] = $returntext == false ? $catalog_id : $catalog["name"];
            
            $catalog_id = $catalog["parent_id"];            
        }

        return $path;
    }   
    
    public function getWareNode($catalog_id, $ware_id=0){    
        global $cWare;
        $icn_endpoint = '/assets/img/icn_ware.png';   
        $dt = $cWare->getWareByCatalogId($catalog_id);
        
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
        global $cCat;
        
        $op["editmode"] = isset($op["editmode"]) ? $op["editmode"] : false;
        $op["endparent"] = isset($op["endparent"]) ? $op["endparent"] : array();
        $op["allsubs"] = isset($op["allsubs"]) ? $op["allsubs"] : array();
        $tree = array();
        
        $dt = $cCat->getCatalogByParentId($parent_id);   
        if($dt){
            foreach($dt as $dr){
                $span_name = "<span>".$dr["name"]."</span>";
                //$span_info = $op["editmode"] ? "  [".$dr["id"]."] <span>(подкатегории: ".$dr["subs"].", товары: ".$dr["ware"].")</span>" : "";
                $span_info = $op["editmode"] ? "  [".$dr["id"]."] <span>(подкатегории: ".$dr["subs"].")</span>" : "";
                $node = array(
                    "id"=> "c".$dr["id"],
                    "text"=>$span_name.$span_info,
                    "state"=> array(
                        "opened"=>in_array($dr["id"],$opened),
                        //"disabled"=>($op["editmode"] ? ($dr["subs"]>0) : false),
                        "disabled"=>($op["editmode"] ? ( $ware_id==0 ? ($dr["ware"]>0 || in_array($dr["id"],$op["allsubs"])) : ($dr["subs"]>0) ) : false),
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
                        $node["children"] = $this->getWareNode($dr["id"], $ware_id);
                    }
                }
                $tree[] = $node;
            }
        }
        return $tree;
    }    
      
    public function dipTreePathDown($parent_id,$arr){
        global $cCat;
        global $arr;
        
        $arr[] = $parent_id;
        $dt = $cCat->getCatalogByParentId($parent_id);
        if($dt){
            foreach($dt as $dr){
                $arr = $this->dipTreePathDown($dr["id"],$arr);
            }
        }
        return $arr;
    }      
    
    /* user */
    public function getTreeMenu($open_ids, $ware_id, $json=false, $op=array()){
        $opened = array();
        foreach($open_ids as $open_id){
            $path = $this->getTreePath($open_id);
            $opened = array_unique(array_merge($opened, $path));
        }
        $op["endparent"] = $open_ids;
        $tree = $this->dipTreeMenu(0,$opened,$ware_id,$op);
        
        return $json ? json_encode($tree) : $tree;
    }    
    
    public function dipTreeMenu($parent_id, $opened=array(), $ware_id=0, $op=array()){
        global $cCat;
        
        $op["endparent"] = isset($op["endparent"]) ? $op["endparent"] : array();
        $op["active"] = isset($op["active"]) ? $op["active"] : false;
        $op["file"] = isset($op["file"]) ? $op["file"] : false;
        $tree = array();
        
        $dt = $cCat->getCatalogByParentId($parent_id,$op);   
        if($dt){
            foreach($dt as $dr){
                $node = array(
                    "id"=> $dr["id"],
                    "text"=>$dr["name"],
                    "subs"=>$dr["subs"],
                    "opened"=>in_array($dr["id"],$opened),
                    "selected"=>($op["editmode"] ? in_array($dr["id"],$op["endparent"]) : false)
                );
                //if(in_array($dr["id"],$opened)){
                    if($dr["subs"]>0){
                        $node["children"] = $this->dipTreeMenu($dr["id"],$opened,$ware_id,$op);
                    }
                //}
                $tree[] = $node;
            }
        }
        return $tree;
    }     
}
?>
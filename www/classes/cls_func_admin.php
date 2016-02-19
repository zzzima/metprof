<?php 
Class AFunc{
    public function handler_CatalogTree(){
        global $utils;    
        
        
    }    
    
    public function getTree($catalog_id, $op){
        $path = $this->getTreePath($catalog_id);
        $tree = $this->dipTree(0,$path,$catalog_id);
        
        return (isset($op["json"]) && $op["json"]==true) ? json_encode($tree) : $tree;
    }
    
    public function getTreePath($open_id, $returntext = false){
        $path = array();
        
        while ($catalog_id > 0){
            $catalog = $this->getCatalogById($catalog_id);
            $path[] = $returntext == false ? $open_id : $catalog["name"];
            
            $open_id = $catalog["parent_id"];            
        }

        return $path;
    }   
    
function getTreePath($query,$open_id,$arr0){
	global $dbconn,$utils;
	global $arr0;

	$query1 = $query." and id = $open_id";
	$dt = $utils->GetAssocArray($query1);

	$k=count($arr0);
	$arr0[$k]=$open_id;

	if (count($dt) > 0) {
		$open_id1 = $dt[0]["PARENTID"];
		$arr0 = $utils->getTreePath($query,$open_id1,$arr0);
	}
	return $arr0; 

}

    
    public function dipTree($parent_id, $path, $open_id){
        $tree = array();
        $icn_endpoint = '/img/icn_loc.png';

        $show = array(0=>'style="display:none;"',1=>'');
        $fulldescr_inv = $fulldescr == 1 ? 0 : 1;
                
        $dt = $this->getLocationListByParentId($parent_id, true);   
        if($dt){
            foreach($dt as $dr){
                $span_code = '<span class="x-code" '.$show[$fulldescr_inv].'>'.$dr["code"].'</span>';
                $span_full = '<span class="x-fulldescr" '.$show[$fulldescr].'>'.$dr["description"].' ('.$dr["code"].')</span>';
                $span_parts = $dr["level_id"]==5 ? '<span class="x-parts"><i>&nbsp;-&nbsp;'.$dr["subs"].' parts</i></span>' : '';
                $node = array(
                    "id"=> $dr["location_id"],
                    "text"=>$span_full.$span_code.$span_parts,
                    "state"=> array(
                        "opened"=>in_array($dr["location_id"],$path),
                        "disabled"=>false,
                        "selected"=>($dr["location_id"] == $loc_id ? true : false)
                    ),
                    "children"=>($dr["level_id"]<5 && $dr["subs"]>0),
                    "li_attr"=>array("data-level"=>$dr["level_id"],"data-subs"=>$dr["subs"]),
                    "a_attr"=>"",
                );
                if(in_array($dr["location_id"],$path)){
                    $node["children"] = $this->dipTree($dr["location_id"],$path,$loc_id,$fulldescr);
                }
                if($dr["level_id"] == 5){
                    $node["icon"] = $icn_endpoint;
                }
                $tree[] = $node;
            }
        }
        return $tree;
    }    
    
    public function getCatalogById($catalog_id){
        global $utils;
        $query = "select * from catalog where id=".$catalog_id;
        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? $dt[0] : false;;        
    }    
}

?>
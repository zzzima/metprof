<?php 
Class UFunc{

    public function handler_getCatalogTree($open_ids=array(),$ware_id=0, $op=array()){        
        global $smarty, $cTree;
        if(count($open_ids)==0 && $ware_id>0){
            $open_ids = $cTree->getCatalogByWareId($ware_id);
        }
        
        $tree = $cTree->getTreeMenu($open_ids, $ware_id, false, $op);

        $smarty->assign(array(
            "menu"=> $tree,
        ));
    } 
    
}
?>
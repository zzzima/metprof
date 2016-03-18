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
 
    public function handle_CatalogView($p){
        global $smarty, $cCat;

        $id = $p["id"];
        if($id>0){
            $dr_c = $cCat->getCatalogById($id);            
        }
        
        if($id>0 && $dr_c["subs"]==0){
            $dt_f = $cCat->getCatalogFiles($id);
            
            $smarty->assign("fancybox",true);
            $content_template = "user_catalog_view_single.tpl";
        }else{
            $op = array("active"=>true,"file"=>true);
            $dt_c = $cCat->getCatalogByParentId($id,$op);
            //if($id == 0) {
                $dt_rc = $cCat->getFeaturedCatalogs(3);
            //}
                
            $content_template = "user_catalog_view_all.tpl";
        }
        
        $smarty->assign(array(
            "p"=>$p,
            "dr_c"=>$dr_c,
            "dt_c"=>$dt_c,
            "dt_f"=>isset($dt_f) ? $dt_f : array(),
            "dt_rc"=>isset($dt_rc) ? $dt_rc : array(),
            "cat_file_url"=>CATALOG_IMG_URL,
            "fancybox"=>true
        ));
        
        return array(
            "content_template"=>$content_template
        );
    }
    
    public function sendRequest($p){
        global $utils,$smarty;
        
        if(strlen($p["email"])==0) { return 'MF003'; }

        $smarty->assign("p",$p);
        $to = $p["email"];
        $body = $smarty->fetch("_email_template.tpl");        
        $utils->sendMail($to,EMAIL_SUBJECT,$body);
        
        return 'MF000';
    }
}
?>
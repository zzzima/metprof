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

        $body = $smarty->fetch("_email_template.tpl");   
        $from=array("name"=>"","email"=>$p["email"]);
        $to = EMAIL_FROM;
        //$utils->sendMail($from,$to,EMAIL_SUBJECT,$body);
        $utils->MailSmtp($from, $to, EMAIL_SUBJECT, $body);
        return 'MF000';
    }
    
    public function getKeywords($page,$catalog_id=0){
        global $cCat;
        
        $catalog = $cCat->getCatalogByParentId_Lignt(0,'name');

        $catalog_name = '';
        if($catalog_id !== 0){
            $dr = $cCat->getCatalogById($catalog_id,true);
            if($dr["parent_id"]>0){
                $dr_p = $cCat->getCatalogById($dr["parent_id"],true);
            }
            $catalog_name = mb_strtolower((isset($dr_p["name"])?$dr_p["name"]." ":"").$dr["name"]);

            for($i=0; $i<count($catalog); $i++){
               if($catalog[$i] == $catalog_name){ unset($catalog[$i]); } 
            }            
            if(strlen($catalog_name)>0){ array_unshift($catalog, $catalog_name); }            
        }
        
        $addon = array();
        switch($page){
            case "aboutus": 
                $addon = array("низкая цена","высокое качество","минимальные сроки");
                break;
            case "catalog":
                $addon = array("доставка","монтаж","качественные материалы");
                break;  
            case "contacts":
                $addon = array("марий эл");
                break; 
            case "home":
            default:
                $addon = array("изделия из металла","низкая цена","высокое качество","минимальные сроки");
                break;
        }
        
        return array(
            "catalog"=>$catalog,
            "full"=>array_merge($catalog, $addon)
            );
    }
}
?>
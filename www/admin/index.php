<?php
include_once("admin.inc.php");

$a = $_REQUEST["a"];
$jsscripts = array();
$stylesheet = array();

switch($a){
    case "catalog":      
        $open_ids = isset($_REQUEST["open_ids"]) ? $_REQUEST["open_ids"] : array();
        $open_ids = is_string($open_ids) ? explode(',', $open_ids) : $open_ids;
        
        $ware_id = isset($_REQUEST["ware_id"]) ? $_REQUEST["ware_id"] : 0;
        $afunc->handler_getCatalogTree($open_ids,$ware_id);
        
        $jsscripts[] = "tparty/jstree/jstree.min.js";
        $jsscripts[] = "js/admin.catalog.js";
        
        $stylesheet[] = "/assets/tparty/jstree/themes/default/style.min.css";
        $content_template = 'admin_catalog_tree.tpl'; 
        
        break;
    case "editcatalog":
        $p = $utils->getRequestParams(array("id"=>0,"parent_id"=>0));
        $afunc->handler_editCatalog($p);
        
        $jsscripts[] = "tparty/jstree/jstree.min.js";        
        $jsscripts[] = "js/admin.catalog.edit.js";     
        
        $stylesheet[] = "/assets/tparty/jstree/themes/default/style.min.css";        
        //$stylesheet[] = "/plugins/jqfileupload/css/style.css";
        $stylesheet[] = "/assets/tparty/blueimp/css/blueimp-gallery.min.css";
        $stylesheet[] = "/plugins/jqfileupload/css/jquery.fileupload.css";
        $stylesheet[] = "/plugins/jqfileupload/css/jquery.fileupload-ui.css";
        $content_template = 'admin_catalog_edit.tpl'; 
        break;
    case "savecatalog":
        $rp = array("f_parent_id"=>0,"f_id"=>0,"f_name"=>"","f_descr"=>"","f_isactive"=>0);
        $p = $utils->getRequestParams($rp);
        $id = $afunc->handler_saveCatalog($p);
        header('Location: /admin/?a=editcatalog&id='.$id);
        exit();
        break;    
    case "editware":
        $p = $utils->getRequestParams(array("id"=>0,"parent_id"=>0));
        $afunc->handler_editWare($p);
        
        $jsscripts[] = "tparty/jstree/jstree.min.js";        
        $jsscripts[] = "js/admin.ware.edit.js";     
        
        $stylesheet[] = "/assets/tparty/jstree/themes/default/style.min.css";        
        //$stylesheet[] = "/plugins/jqfileupload/css/style.css";
        $stylesheet[] = "/assets/tparty/blueimp/css/blueimp-gallery.min.css";
        $stylesheet[] = "/plugins/jqfileupload/css/jquery.fileupload.css";
        $stylesheet[] = "/plugins/jqfileupload/css/jquery.fileupload-ui.css";
        
        $content_template = 'admin_ware_edit.tpl'; 
        break;
    case "saveware":
        $rp = array("f_parent_id"=>0,"f_id"=>0,"f_name"=>"","f_descr"=>"","f_isactive"=>0);
        $p = $utils->getRequestParams($rp);
        $id = $afunc->handler_saveWare($p);
        header('Location: /admin/?a=editware&id='.$id);
        exit();
        break;     
    case "changepassword":     
        $jsscripts[] = "js/admin.changepassword.js";  
        $afunc->handler_changePassword();
        $content_template = 'admin_changepassword.tpl';
        break;
    case "savepassword":     
        $p=$utils->getRequestParams(array("f_password_old"=>"","f_password_new"=>""));
        
        $afunc->handler_savePassword($p);
        
        if($_SESSION["is_saved"]){ 
            login('admin', $p["f_password_new"]);   
        }
            
        header('Location: /admin/?a=changepassword');
        exit();
        break;    
    default:
        $content_template = 'admin_home.tpl';        
        break;
}

$smarty->assign(array(
    "jsscripts"         =>$jsscripts,
    "stylesheet"        =>$stylesheet,
    "content_template"  =>$content_template
));

$smarty->display('admin_index.tpl');

?>
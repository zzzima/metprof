<?php
include_once("admin.inc.php");

$a = $_REQUEST["a"];
$jsscripts = array();

switch($a){
    case "catalog":
        $afunc->handler_CatalogTree($param["ware_id"]);
        $jsscripts[] = "admin.catalog.js";        
        $content_template = 'admin_catalog_tree.tpl'; 
        
        break;
    case "settings":
        break;
    default:
        $content_template = 'admin_home.tpl';        
        break;
}

$smarty->assign("jsscripts",$jsscripts);
$smarty->assign("content_template",$content_template);

$smarty->display('user_index.tpl');

?>
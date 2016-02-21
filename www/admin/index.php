<?php
include_once("admin.inc.php");

$a = $_REQUEST["a"];
$jsscripts = array();
$stylesheet = array();

switch($a){
    case "catalog":
        $open_ids = isset($_REQUEST["open_ids"]) ? explode(',', $_REQUEST("open_ids")) : array();
        $ware_id = isset($_REQUEST["ware_id"]) ? $_REQUEST["ware_id"] : 0;
        $ware_id = 7;
        $afunc->handler_CatalogTree($open_ids,$ware_id);
        
        $jsscripts[] = "tparty/jstree/jstree.min.js";
        $jsscripts[] = "js/admin.catalog.js";
        
        $stylesheet[] = "tparty/jstree/themes/default/style.min.css";
        $content_template = 'admin_catalog_tree.tpl'; 
        
        break;
    case "settings":
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
<?php

include_once("user.inc.php");

$a = $_REQUEST["a"];
$jsscripts = array();
$stylesheet = array();

//get menu tree
$open_ids = isset($_REQUEST["open_ids"]) ? $_REQUEST["open_ids"] : array();
$open_ids = is_string($open_ids) ? explode(',', $open_ids) : $open_ids;
$op = array("active"=>true,"file"=>true);
$ufunc->handler_getCatalogTree($open_ids,$ware_id);

switch($a){    
    case "catalog":
        $p = $utils->getRequestParams(array("id"=>0));
        $ufunc->handle_CatalogView($p);
        break;
    case "aboutus":
        $content_template = "user_aboutus.tpl";
        break;
    default:
        $dt_c = $cCat->getCatalogByParentId(0,$op);
        $smarty->assign("dt_c",$dt_c);
        $content_template = "user_home.tpl";
        break;
}

//get site base info 
$baseinf = array(
    "org_name"=>ORG_NAME,
    "email"=>EMAIL_FROM,
    "phone1"=>ORG_PHONE1,
    "phone2"=>ORG_PHONE2,
    "year"=>date("Y")
);

$smarty->assign(array(
    "jsscripts"         =>$jsscripts,
    "stylesheet"        =>$stylesheet,
    "baseinf"           =>$baseinf,    
    "content_template"  =>$content_template
));

$smarty->display('user_index.tpl');

?>
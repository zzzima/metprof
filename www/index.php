<?php

include_once("user.inc.php");

$a = isset($_REQUEST["a"]) ? $_REQUEST["a"] : "home";
$jsscripts = array();
$stylesheet = array();

//get menu tree
$open_ids = isset($_REQUEST["open_ids"]) ? $_REQUEST["open_ids"] : array();
$open_ids = is_string($open_ids) ? explode(',', $open_ids) : $open_ids;
$op = array("active"=>true,"file"=>true);
$ufunc->handler_getCatalogTree($open_ids,$ware_id);

$jsscripts = array();
switch($a){    
    case "catalog":
        $p = $utils->getRequestParams(array("id"=>0));
        $res = $ufunc->handle_CatalogView($p);
        $content_template = $res["content_template"];
        $jsscripts[] = "js/user.catalog.view.js";  
        break;
    case "aboutus":
        $content_template = "user_aboutus.tpl";
        break;
    case "contacts":
        $content_template = "user_contacts.tpl";
        break;
    case "home":
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
    "a"=>$a,
    "jsscripts"         =>$jsscripts,
    "stylesheet"        =>$stylesheet,
    "baseinf"           =>$baseinf,    
    "content_template"  =>$content_template
));

$smarty->display('user_index.tpl');

?>
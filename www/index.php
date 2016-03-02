<?php
include_once("common.php");

$a = $_REQUEST["a"];
$jsscripts = array();
$stylesheet = array();

switch($a){
    default:
        $content_template = "user_home.tpl";
        break;
}

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
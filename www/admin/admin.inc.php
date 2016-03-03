<?php
include_once("../common.php");

include_once SITE_DIR."/classes/cls_func_admin.php";
$afunc = new AFunc;
  
include_once SITE_DIR."/classes/cls_ware.php";
$cWare = new cWare;

include_once SITE_DIR."/classes/cls_catalog.php";
$cCat = new cCat;

include_once SITE_DIR."/classes/cls_tree.php";
$cTree = new cTree;

$script = esc_url($_SERVER["PHP_SELF"]);
$is_loggedin = login_check($dbconn);

if (preg_match("/login\.php/i", $_SERVER["PHP_SELF"])){
    if($is_loggedin){ header('Location: '.DEFAULT_ADMIN_PAGE); exit();}    
}else{
    if(!$is_loggedin){ header('Location: login.php'); exit();}    
}

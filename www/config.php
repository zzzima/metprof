<?php

// BASE INFO
define("SITE_URL","http://metprof.loc/");
define("SITE_DIR","C:/WebServers/home/metprof.loc/www/");
define("SITE_DOMEN","metprof.loc");
define("ORG_NAME","МетПроф");

$config = array();
// DB settings
$config["dbtype"] = "mysql";
$config["dbhost"] = "localhost";
$config["dbuname"] = "root";
$config["dbpass"] = "";
$config["dbname"] = "metprof";

// CONSTANTS
define("EMAIL_DEV","zzma@inbox.ru");
define("EMAIL_ADMIN","admin@".SITE_DOMEN);
define("EMAIL_FROM","info@".SITE_DOMEN);

define("DEFAULT_ADMIN_PAGE","index.php");
   
define("CATALOG_IMG_DIR",SITE_DIR."_docstore/catalog_files/"); 
define("WARE_IMG_DIR",SITE_DIR."_docstore/ware_files/");    

define("CATALOG_IMG_URL",SITE_URL."_docstore/catalog_files/"); 
define("WARE_IMG_URL",SITE_URL."_docstore/ware_files/");  
?>
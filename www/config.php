<?php
// BASE INFO
define("SITE_URL","http://metprof.loc/");
define("SITE_DIR","C:/WebServers/home/metprof.loc/www/");
define("SITE_DOMEN","metprof.loc");
define("ORG_NAME","МетАллекс");
define("ORG_PHONE1","8(8362) 324-669");
define("ORG_PHONE2","8(8362) 545-075");

$config = array();
// DB settings
$config["dbtype"] = "mysql";
$config["dbhost"] = "localhost";
$config["dbuname"] = "root";
$config["dbpass"] = "";
$config["dbname"] = "metprof";

//SMTP
define("SMTP_SERVER","mail.hostland.ru");
define("SMTP_PORT",25);
define("SMTP_USER","info@metallex12.ru");
define("SMTP_PASSW","28hoVatX");     

// CONSTANTS
define("EMAIL_DEV","zzma@inbox.ru");
define("EMAIL_FROM","metallex12@mail.ru");
define("EMAIL_FROM_NAME",ORG_NAME);
define("EMAIL_SUBJECT","Запрос с сайта ".SITE_DOMEN);

define("DEFAULT_ADMIN_PAGE","/admin/?a=catalog");
   
define("CATALOG_IMG_DIR",SITE_DIR."_docstore/catalog_files/"); 
define("WARE_IMG_DIR",SITE_DIR."_docstore/ware_files/");    

define("CATALOG_IMG_URL",SITE_URL."_docstore/catalog_files/"); 
define("WARE_IMG_URL",SITE_URL."_docstore/ware_files/");  

//info@metallex12.ru
//28hoVatX
?>
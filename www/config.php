<?php

// BASE INFO
define("SITE_URL","http://metprof.loc");
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

define("DEFAULT_ADMIN_PAGE","index.php")
?>
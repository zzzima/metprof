<?
include_once "config.php";

//Smarty
//include_once $dir."/smarty/Smarty.class.php";
require_once SITE_DIR.'/smarty/libs/Smarty.class.php';
$smarty = new Smarty;
$smarty->force_compile = false;
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 180;

//Smarty
$smarty->template_dir = SITE_DIR."/smarty/templates";
$smarty->compile_dir = SITE_DIR."/smarty/templates_c";
$smarty->config_dir = SITE_DIR."/smarty/configs/";
$smarty->cache_dir =  SITE_DIR."/smarty/cache/";

//ADODB
include_once SITE_DIR."/adodb/adodb.inc.php";

//$dbconn = &ADONewConnection($config["dbtype"]);
$dbconn = ADONewConnection($config["dbtype"]);
$dbconn ->debug=false;
$dbh = $dbconn->Connect($config["dbhost"], $config["dbuname"], $config["dbpass"], $config["dbname"]);
mysql_query("set names cp1251");
mysql_query("SET lc_time_names = 'ru_RU'");


GLOBAL $ADODB_FETCH_MODE, $ADODB_CACHE_DIR;
$ADODB_FETCH_MODE = ADODB_FETCH_BOTH;

/*switch ($config["system"]) {
    case "unix":
        $ADODB_CACHE_DIR = "/tmp";
    break;
    case "win":
        if (!is_dir("c:/tmp")) {
            mkdir("c:/tmp", 0700);
        }
        $ADODB_CACHE_DIR = "c:/tmp";
    break;
}*/

//classes
include_once SITE_DIR."/classes/cls_utils.php";
//Utils
//if ((isset($utils) && (!is_object($utils) || (get_class($utils) != "utils"))) || !isset($utils)) {
  $utils = new Utils;
//}

include_once "/includes/functions.php";
sec_session_start();
//session_start();

?>
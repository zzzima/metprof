<?php
include_once("admin.inc.php");

ajaxAction();
    
function ajaxAction(){
    global $utils;
    
    $pkeys = array("ajaxaction", "none");
    $p = $utils->getRequestParams($pkeys);
    $srv = ajaxCase($p["ajaxaction"]);
    echo json_encode($srv);
}

function ajaxCase($ajaxaction,$request){
    global $utils, $afunc;
    $srv = array("status"=>"ok","message"=>"","data"=>array());
    
    switch($ajaxaction){
        case "get_catalog_treenode":
            $p = $utils->getRequestParams(array("node_id"=>0));
            if($p["node_id"]==0){
                $srv["status"]="error";
                $srv["message"]="Передан неверный ID каталога";
                return $srv;
            }
            $srv["data"]=$afunc->dipTree($p["node_id"]);
            break;
    }
    return $srv;
}

?>
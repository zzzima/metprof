<?php
include_once("user.inc.php");

ajaxAction();
    
function ajaxAction(){
    global $utils;
    
    $pkeys = array("a"=>"none");
    $p = $utils->getRequestParams($pkeys);
    $srv = ajaxCase($p["a"]);
    
    if(isset($srv["code"])){
        echo $srv["code"];
    }else{
        echo json_encode($srv);
    }
}

function ajaxCase($ajaxaction){    
    global $utils, $ufunc;
    $srv = array("status"=>"ok","message"=>"","data"=>array());
    
    switch($ajaxaction){
        case "sendrequest":
            $pkeys = array("name"=>"","email"=>"","phone"=>"","message"=>"");
            $p=$utils->getRequestParams($pkeys);
            $code = $ufunc->sendRequest($p);
            $srv["code"] = $code;
            break;
    }
    return $srv;
}

?>

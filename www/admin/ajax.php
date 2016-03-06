<?php
include_once("admin.inc.php");

ajaxAction();
    
function ajaxAction(){
    global $utils;
    
    $pkeys = array("ajaxaction"=>"none");
    $p = $utils->getRequestParams($pkeys);
    $srv = ajaxCase($p["ajaxaction"]);
    echo json_encode($srv);
}

function ajaxCase($ajaxaction){    
    global $utils, $afunc, $cCat, $cWare, $cTree;
    $srv = array("status"=>"ok","message"=>"","data"=>array());
    
    switch($ajaxaction){
        case "get_catalog_treenode":
            $p = $utils->getRequestParams(array("node_id"=>0,"type"=>"catalog","editmode"=>false,"allsubs"=>""));
            if($p["node_id"]==0){
                $srv["status"]="error";
                $srv["message"]="Передан неверный ID каталога";
                return $srv;
            }
            if($p["type"]=="ware"){ 
                $srv["data"] = $cTree->getWareNode($p["node_id"]);
            }else{
                $op = array("editmode"=>$p["editmode"],"allsubs"=>explode(',',$p["allsubs"]));
                $srv["data"]=$cTree->dipTree($p["node_id"],array(),0,$op);
            }
            break;
        case "reorder_catalog_treenode":
            $p = $utils->getRequestParams(array("id"=>0,"after_id"=>0));
            if($p["id"]==0 || $p["after_id"]==0){
                $srv["status"]="error";
                $srv["message"]="Передан неизвестный ID текущего каталога";
                return $srv;
            }
            $cCat->reorderCatalog($p["id"],$p["after_id"]);
            break;
        case "delete_catalog":
            $p = $utils->getRequestParams(array("node_id"=>0));
            if($p["node_id"]==0){
                $srv["status"]="error";
                $srv["message"]="Передан неверный ID категории";
                return $srv;
            }            
            $dr = $cCat->getCatalogById($p["node_id"]);
            if($dr["subs"]>0 || $dr["ware"]>0){
                $srv["status"]="error";
                $srv["message"]="Невозможно удалить не пустую категорию";
                return $srv;                
            }
            $cCat->delCatalogById($p["node_id"]);
            break;
        case "delete_ware":
            $p = $utils->getRequestParams(array("node_id"=>0));
            if($p["node_id"]==0){
                $srv["status"]="error";
                $srv["message"]="Передан неверный ID товара";
                return $srv;
            }            
            $srv["data"] = $cWare->delWareById($p["node_id"]);            
            break; 
        case "check_password":
            $p=$utils->getRequestParams(array("password"=>""));
            $valid = $afunc->checkPassword('admin', $p["password"]);
            if(!$valid){ 
                $srv["status"]="error";                 
            }
            break;
    }
    return $srv;
}

?>

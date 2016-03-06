<?php 
Class AFunc{
    public function handler_getCatalogTree($open_ids=array(),$ware_id=0){        
        global $smarty, $cTree;
        if(count($open_ids)==0 && $ware_id>0){
            $open_ids = $cTree->getCatalogByWareId($ware_id);
        }
        
        $json_tree = $cTree->getTree($open_ids, $ware_id, true);
        $jsvars["json_tree"] = $json_tree;
        
        $smarty->assign(array(
            "jsvars"=> $jsvars,
        ));
    }    

    public function handler_editCatalog($p){
        global $smarty, $cTree, $cCat;
        
        if($p["id"]>0){
            $dr = $cCat->getCatalogById($p["id"],true);
            $p["parent_id"] = $dr ? $dr["parent_id"] : $p["parent_id"];
        }
        $open_ids = array($p["parent_id"]);
        
        if( $p["id"]==0){ $allsubs==array(); }
        else{
            $allsubs = $cTree->dipTreePathDown($p["id"],array());
        }
        $op = array("editmode"=>true,"allsubs"=>$allsubs);
        $json_tree = $cTree->getTree($open_ids, 0, true, $op);
        $jsvars["json_tree"] = $json_tree;          
        
        $jsvars["is_saved"] = isset($_SESSION["catalog_saved"]) ? $_SESSION["catalog_saved"] : 0;
        unset($_SESSION["catalog_saved"]);
        
        $smarty->assign(array(
            "p"=>$p,
            "dr"=>$dr,
            "allsubs"=>count($allsubs)==0 ? "" : implode(',',$allsubs),
            //"path"=>count($path)>0 ? implode('->',$path) : 'Корневой каталог',
            "jsvars"=> $jsvars,
        ));
        
    }

    public function handler_saveCatalog($p){
        global $utils;
        
        $id = $p["f_id"];
        $table = "catalog";
        $fields = "parent_id,name,descr,isactive";
        $bind = $utils->dbPrepareBind($fields,$p,'f_');        
        if($id==0){
            //insert
            $query = "select max(seqno) from catalog where parent_id=".$bind["parent_id"];
            $max_seqno = $utils->GetSingleValue($query);
            $bind["seqno"]=$max_seqno+1;
            $id = $utils->dbInsert($table,$bind,true,array("timestamp"=>"creationdate"));
        }else{
            //update
            $utils->dbUpdate($table,$bind,array("id"=>$id));            
        }
        $_SESSION["catalog_saved"] = 1;
        return $id;
    }    
    
    public function handler_editWare($p){
        global $smarty, $cWare, $cCat, $cTree;

        // get ware details
        if($p["id"]>0){
            $dr = $cWare->getWareById($p["id"],true);
            $open_ids = $cCat->getCatalogByWareId($p["id"]);            
        }else{
            $open_ids = array($p["parent_id"]);
        }
        $p["parent_id"] = implode(',',$open_ids);
        $op = array("editmode"=>true);
        $json_tree = $cTree->getTree($open_ids, $p["id"], true, $op);
        $jsvars["json_tree"] = $json_tree;        
        
        $jsvars["is_saved"] = isset($_SESSION["ware_saved"]) ? $_SESSION["ware_saved"] : 0;
        unset($_SESSION["ware_saved"]);
        
        $smarty->assign(array(
            "p"=>$p,
            "dr"=>$dr,
            //"path"=>count($path)>0 ? implode('->',$path) : 'Корневой каталог',
            "jsvars"=> $jsvars,
        ));
        
    }

    public function handler_saveWare($p){
        global $utils;
        
        $id = $p["f_id"];
        $table = "ware";
        $fields = "name,descr,isactive";
        $bind = $utils->dbPrepareBind($fields,$p,'f_');
        if($id==0){
            //insert
            $id = $utils->dbInsert($table,$bind,true,array("timestamp"=>"creationdate"));
        }else{
            //update
            $utils->dbUpdate($table,$bind,array("id"=>$id));            
        }
        
        if(!$p["f_parent_id"]==0 && strlen($p["f_parent_id"])>0){
            $parent_ids = explode(',',$p["f_parent_id"]);
            $utils->dbDelete("ware_catalog",array("ware_id"=>$id));
            foreach($parent_ids as $parent_id){
                $bind = array("ware_id"=>$id,"catalog_id"=>$parent_id);
                $utils->dbInsert("ware_catalog",$bind,false);                
            }
        }
        
        $_SESSION["ware_saved"] = 1;
        
        return $id;
    }    
    
    public function handler_changePassword(){
        global $smarty;
        
        if(isset($_SESSION["is_saved"])){ $jsvars["is_saved"]=$_SESSION["is_saved"]; }
        unset($_SESSION["is_saved"]);    
        
        $smarty->assign(array(
            "jsvars"=> $jsvars,
        ));        
    }
    
    public function handler_savePassword($p){    
        global $dbconn;

        if($this->checkPassword('admin', $p["f_password_old"]) && strlen($p["f_password_new"])>0){
            $a = $this->hashPassword($p["f_password_new"]);
            $query = "update user 
                set password='".$a["password_hash"]."', salt='".$a["salt"]."' 
                where username = 'admin'";

            $dbconn->Execute($query);
            $_SESSION["is_saved"] = 1;
        }

        return true;
    }
    
    /* ware */
    /* catalog */    
    /* tree & nodes */    
    
    /* settings */
    public function checkPassword($username, $password){
        global $utils;
        
        $query= "SELECT * FROM user WHERE username='".$username."' LIMIT 1";
        $dt = $utils->GetAssocArray($query);  
        if (count($dt) == 1) {
            $dr = $dt[0];
            $password = hash('sha512', $password . $dr["salt"]);
        }
        
        return ($password == $dr["password"]);
    }
    
    private function hashPassword($password){
        $salt = hash('sha512', uniqid(openssl_random_pseudo_bytes(16), TRUE));
        $password = hash('sha512', $password . $salt);  
        
        return array(
            "salt" => $salt,
            "password_hash"=> $password
        );
    }
}
?>
<?php 
Class cWare{
    public function getWareById($ware_id){        
        global $utils;
        $row = !is_array($ware_id);
        $ids = $row ? array($ware_id) : $ware_id;
        $query = "select * from catalog where id in (".implode(',',$ids).")";        

        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? ($row ? $dt[0] : $dt) : false;      
    }    

    public function getWareByCatalogId($catalog_id){
        global $utils;
        $query = "SELECT w.*
            FROM ware w
            JOIN ware_catalog wc on w.id = wc.ware_id
            WHERE wc.catalog_id = ".$catalog_id;
        $dt = $utils->GetAssocArray($query);
        
        return count($dt)>0 ? $dt : false;           
    }

    public function delWareById($ware_id){
        global $dbconn, $utils, $cCat;
        
        //get catalogs
        $catalog_ids = $cCat->getCatalogByWareId($ware_id);
        $dt_c = $cCat->getCatalogById($catalog_ids);

        //delete ware
        $query = "delete from ware where id = ".$ware_id;
        $dbconn->Execute($query);
        
        //delete ware catalog
        $query = "DELETE FROM ware_catalog WHERE ware_id = ".$ware_id;
        $dbconn->Execute($query);
        
        //delete ware images
        $query = "select id, filename from ware_files where ware_id =".$ware_id;
        $dt_i = $utils->GetAssocArray($query);	

        foreach($dt_i as $dr){
            $utils->delImageFiles("ware",$dr["filename"]);
        }

        $query = "delete from ware_files where ware_id =".$ware_id;
        $dbconn->Execute($query);    

        return $dt_c;
    }    
}
?>
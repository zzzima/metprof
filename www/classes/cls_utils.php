<?php 
Class Utils{
// Session

function getRequestParams($pkeys){
    $p = array();
    $b = array("true"=>true,"false"=>false);
    foreach($pkeys as $key=>$defval){
        $p[$key] = isset($_REQUEST[$key]) ? $_REQUEST[$key] : $defval;
        if(in_array($p[$key],array_keys($b))){
            $p[$key] = $b[$p[$key]];
        }
    }
    return $p;
}

function getRequestParam($p_key,$p_default_value){
    return isset($_REQUEST[$p_key]) ? $_REQUEST[$p_key] : $p_default_value;
}

// Database
function GetAssocArray($query)
{
	global $dbconn;
	$dt = array();
	$rs = $dbconn->Execute($query);

	if ($rs->RowCount() > 0)
	{
		$i=0;
		while (!$rs->EOF) 
		{
			$dt[$i] = $rs->GetRowAssoc();
			$i++;
			$rs->MoveNext();
		}
	}
	return $dt; 
}

function GetIndexHash($query)
{
	global $dbconn;
	$idx = array();
	$rs = $dbconn->Execute($query);

	if ($rs->RowCount() > 0)
	{
		$i=0;
		while (!$rs->EOF) 
		{
			$idx[$i] = $rs->fields[0];
			$i++;
			$rs->MoveNext();
		}
	}
	return $idx; 
}

function GetHashtable($query,$fkey,$fval){
	global $dbconn;
	$ht = array();
	$rs = $dbconn->Execute($query);

	if ($rs->RowCount() > 0)
	{
		while (!$rs->EOF) 
		{
			$k = $rs->fields[$fkey];
			$ht[$k] = $rs->fields[$fval];
			$rs->MoveNext();
		}
	}
	return $ht; 
}

function GetHashtableWithArrayValue($query,$fkey){
	global $dbconn;
	$ht = array();
	$rs = $dbconn->Execute($query);

	if ($rs->RowCount() > 0)
	{
		$nf = $rs->FieldCount();
		while (!$rs->EOF) 
		{
                        $k = $rs->fields[$fkey];
			$ht[$k] = $rs->GetRowAssoc();
			$rs->MoveNext();
		}
	}
	return $ht; 
}

function GetHashtableWithScalarArrayValue($query,$fkey,$sa_keys=array()){
	global $dbconn;
	$ht = array();
	$rs = $dbconn->Execute($query);

	if ($rs->RowCount() > 0)
	{
		$nf = $rs->FieldCount();
		while (!$rs->EOF) 
		{
                        $k = $rs->fields[$fkey];
			//$ht[$k] = $rs->GetRowAssoc();
                        foreach($sa_keys as $sa_key){
                            // $rs->fields[$sa_key]  should be commaseparated list ov values
                            $ht[$k][$sa_key] = $rs->fields[$sa_key]==null ? array() : explode(',',$rs->fields[$sa_key]);
                        }
			$rs->MoveNext();
		}
	}
	return $ht; 
}

// insert method
function dbInsert($table,$bind,$last_insert_id,$op=array()){    
    global $dbconn;
    //bind - list of fields (key/value) for insert
    //$last_insert_id: true/false
    
    $fields = array();
    $values = array();
    foreach($bind as $key=>$val){
        $fields[] = $key;
        $values[] = is_numeric($val) ? $val : "'".$val."'";
    }
    if(isset($op["timestamp"])){
        $fields[] = $op["timestamp"];
        $values[] = 'NOW()';
    }
    $query = "insert into ".$table." (".implode(',',$fields).") values (".implode(',',$values).")";
    $dbconn->Execute($query);
    $id = $last_insert_id ? $dbconn->Insert_ID() : true;    
    
    return $id;
}

/*function dbInsertExt($table,$bind,$p,$field_prefix='',$last_insert_id=true){    
    global $dbconn;
    //p - parameters from request
    //bind - list of fields for insert
    $fields = array();
    $values = array();
    foreach($p as $key=>$val){
        if(in_array($key,$bind)){
            $fields[] = strlen($field_prefix)>0 ? str_replace($field_prefix,'',$key) : $key;
            $values[] = is_numeric($val) ? $val : "'".$val."'";
        }
    }
    $query = "insert into ".$table." (".implode(',',$fields).") values (".implode(',',$values).")";
    $dbconn->Execute($query);
    $id = $last_insert_id ? $dbconn->Insert_ID() : true;    
    
    return $id;
}*/

// update method
function dbUpdate($table,$bind,$where){    
    global $dbconn;
    //p - parameters from request
    //bind - list of fields for insert
    $set = array();
    foreach($bind as $key=>$val){
        $fkey = $key;
        $fval = is_numeric($val) ? $val : "'".$val."'";
        $set[] = $fkey."=".$fval;
    }
    
    $clause = array();
    foreach($where as $key=>$val){
        $val = is_numeric($val) ? $val : "'".$val."'";        
        $clause[]="and ".$key."=".$val;
    }
    
    $query = "update ".$table." set ".implode(',',$set)." where 1=1 ".implode(' ',$clause);
    $dbconn->Execute($query);
    
    return true;
}

/*
function dbUpdateExt($table,$bind,$p,$id_field,$field_prefix=''){    
    global $dbconn;
    //p - parameters from request
    //bind - list of fields for insert
    $set = array();
    foreach($p as $key=>$val){
        if(in_array($key,$bind)){
            $fkey = strlen($field_prefix)>0 ? str_replace($field_prefix,'',$key) : $key;
            $fval = is_numeric($val) ? $val : "'".$val."'";
            $set[] = $fkey."=".$fval;
        }
    }
    $query = "update ".$table." set ".implode(',',$set)." where ".$id_field."=".$p[$field_prefix.$id_field];
    $dbconn->Execute($query);
    
    return true;
}
*/

function dbDelete($table,$where){
    global $dbconn;
    
    $clause = array();
    foreach($where as $key=>$val){
        $val = is_numeric($val) ? $val : "'".$val."'";        
        $clause[]="and ".$key."=".$val;
    }
   
    $query = "delete from ".$table." where 1=1 ".implode(' ',$clause);
    $dbconn->Execute($query);
    
    return true;        
}

function dbPrepareBind($fields,$p,$prefix){
    $bind = array();
    $_fields = explode(',',$fields);
    foreach($_fields as $key){
        $bind[$key] = $p[$prefix.$key];
    }
    return $bind;
}
// end database

// file
function delFile($filepath){
    if (file_exists($filepath)){
        unlink($filepath);
    }		
}
// end file

//end class
}
?>
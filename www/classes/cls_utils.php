<?php 
Class Utils{
// Session

function getRequestParams($pkeys){
    $p = array();
    foreach($pkeys as $key=>$defval){
        $p[$key] = isset($_REQUEST[$key]) ? $_REQUEST[$key] : $defval;
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
function dbInsert($table,$bind,$p,$field_prefix=''){    
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
    $query = "insert into ".$table." (".implode(',',$fields).") values (".$values.")";
    $dbconn->Execute($query);
    $id = $dbconn->Insert_ID();    
    
    return $id;
}
// update method
function dbUpdate($table,$bind,$p,$id_field,$field_prefix=''){    
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
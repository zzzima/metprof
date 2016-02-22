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

function getSizetypeSize(){
    $query="
        select sizetype_id, group_concat(size_id separator ',') as sizes
        from ref_sizetype_size_tbl
        group by sizetype_id;
        ";
    $ht = $this->GetHashtableWithScalarArrayValue($query,"sizetype_id",array("sizes"));
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
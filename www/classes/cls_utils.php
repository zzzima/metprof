<?php 
Class Utils{
// Session
    

function getRequestParams($p_keys){
	$p=array();

	$keys = explode(",", $p_keys);
        
        foreach($keys as $key){
            if(isset($_REQUEST[$key])){
                $p[$key] = $_REQUEST[$key];
            }else{
                $p[$key] = null;
            }
        }
	return $p;
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

//end class
}
?>
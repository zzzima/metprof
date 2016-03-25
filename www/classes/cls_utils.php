<?php 
Class Utils{
// Session

function getRequestParams($pkeys){
    $p = array();
    $b = array("true"=>true,"false"=>false);
    foreach($pkeys as $key=>$defval){
        $p[$key] = isset($_REQUEST[$key]) ? $_REQUEST[$key] : $defval;
        if(!is_numeric($p[$key]) && in_array($p[$key],array_keys($b))){
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
        //var_dump($query);
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

function GetSingleValue($query){
    global $dbconn;
    
    $rs = $dbconn->Execute($query);
    
    return $rs->fields[0];
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

public function delImageFiles($filetype,$filename){
    global $utils;
    $filedir = $filetype=="ware" ? WARE_IMG_DIR : CATALOG_IMG_DIR;
    $files = array();
    $files[] = $filedir.$filename;
    $files[] = $filedir."thumbnail/".$filename;
    $files[] = $filedir."small/".$filename;

    foreach($files as $filepath){
        $this->delFile($filepath);
    }    
}
// end file
// 
// mail
function sendMail($from,$to,$subject,$body){
    
    $headers   = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/html; charset=windows-1251";
    $headers[] = "From: ".$from["name"]." <".$from["email"].">";
    $headers[] = "Reply-To: ".$from["name"]." <".$from["email"].">";
    $headers[] = "Subject: ".$subject;
    $headers[] = "X-Mailer: PHP/".phpversion();

    mail($to, $subject, $body, implode("\r\n", $headers));    
}

function smtp_msg($sock, $msg) {
  if (!$sock) {
    printf("Broken socket!\n");
    exit(1);
  }

  if (isset($_SERVER['debug']) && $_SERVER['debug']) {
    printf("Send from us: %s<BR>", nl2br(htmlspecialchars($msg)));
  }
  fputs($sock, "$msg\r\n");
  $str = fgets($sock, 512);
  if (!$sock) {
    printf("Socket is down\n");
    exit(1);
  }
  else {
    if (isset($_SERVER['debug']) && $_SERVER['debug']) {
      printf("Got from server: %s<BR>", nl2br(htmlspecialchars($str)));
    }

    $e = explode(" ", $str);
    $code = array_shift($e);
    $str = implode(" ", $e);

    if ($code > 499) {
      printf("Problems with SMTP conversation.<BR><BR>Code %d.<BR>Message %s<BR>", $code, $str);
      exit(1);
    }
  }
}

// Если нужно показать лог SMTP-сессии, то можно раскомментировать следующую строчку.
//$_SERVER['debug'] = true;
function MailSmtp($from, $to, $subject, $body, $headers=false, $debug = 0) {

  $smtp_server = SMTP_SERVER; // адрес SMTP-сервера
  $smtp_port = SMTP_PORT; // порт SMTP-сервера
  $smtp_user = SMTP_USER; // Имя пользователя для авторизации на SMTP-сервере
  $smtp_password = SMTP_PASSW; // Пароль для авторизации на SMTP-сервере
  $mail_from = $from["email"]; // Ящик, с которого отправляется письмо

  $sock = fsockopen($smtp_server,$smtp_port,$errno,$errstr,30);

  $str = fgets($sock,512);
  if (!$sock) {
    printf("Socket is not created\n");
    exit(1);
  }

  $this->smtp_msg($sock, "HELO " . $_SERVER['SERVER_NAME']);
  $this->smtp_msg($sock, "AUTH LOGIN");
  $this->smtp_msg($sock, base64_encode($smtp_user));
  $this->smtp_msg($sock, base64_encode($smtp_password));
  $this->smtp_msg($sock, "MAIL FROM: <" . $mail_from . ">");
  $this->smtp_msg($sock, "RCPT TO: <" . $to . ">");
  $this->smtp_msg($sock, "DATA");

  if(!$headers){
    // Заголовки сообщения, в них определяется кодировка сообщения, поля From, To и т.д.
    $headers = "MIME-Version: 1.0\r\n";
    //$headers .= "Content-type: text/html; charset=windows-1251\r\n";
    $headers .= "Content-type: text/html; charset=utf-8\r\n";
    $headers .= "To: $to\r\n";
    $headers .= "From: <".$from["email"].">";      
  }
  $headers = "Subject: " . $subject . "\r\n" . $headers;

  $data = $headers . "\r\n\r\n" . $body . "\r\n.";

  $this->smtp_msg($sock, $data);
  $this->smtp_msg($sock, "QUIT");

  fclose($sock);
}

//end mail

//end class
}
?>
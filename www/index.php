<?php
include_once("common.php");

$query= "SELECT * FROM user";			
$dt = $utils->GetAssocArray($query);		

print_r($dt); 

$password = 'admin';
$random_salt = hash('sha512', uniqid(openssl_random_pseudo_bytes(16), TRUE));
$password = hash('sha512', $password . $random_salt);

$a = 'smarty success';
$smarty->assign("a",$a);
$smarty->assign("random_salt",$random_salt);
$smarty->assign("password",$password);
$smarty->display('user_index.tpl');

?>
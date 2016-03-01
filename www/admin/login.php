<?php
include_once("admin.inc.php");

$errorcode = array(
    0=>"",
    101=>"Неверный пароль. Попробуйте снова.",
    102=>"Пять попыток неправильного ввода пароля. Попробуйте снова через 15 минут.",
    103=>"Пользователь не найден. Попробуйте снова."
);

$code = 0;
if (isset($_REQUEST['username'], $_REQUEST['password'])) {
    $username = $_REQUEST['username'];
    $password = $_REQUEST['password']; // The hashed password.

    $code = login($username, $password);
    if ($code == 0) {
        // Login success
        header('Location: '.DEFAULT_ADMIN_PAGE);
        exit();
        //var_dump($_SESSION['user_id'],$_SESSION['username'],$_SESSION['login_string']);
    } else {
        // Login failed 
        //header('Location: login.php?error='.$code);
    }
} else {
    // The correct POST variables were not sent to this page. 
    //echo 'Invalid Request';
}      
$smarty->assign(array(
    "err"       =>$errorcode[$code],
    "username"  =>isset($username) ? $username : "",
    "nonav"     =>true
));
$smarty->display('admin_login.tpl');        

?>
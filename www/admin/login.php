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


function login($username, $password) {
    global $dbconn, $utils;
    // Using prepared statements means that SQL injection is not possible. 
    $query= "SELECT * FROM user WHERE username='".$username."' LIMIT 1";
    $dt = $utils->GetAssocArray($query);

    $code = 0; //0-sucess; 101-brutforce; 102-incorrect password; 103-user not found
    if (count($dt) == 1) {
        $dr = $dt[0];
        $password = hash('sha512', $password . $dr["salt"]);  
        $user_id = $dr["id"];
        // If the user exists we check if the account is locked
        // from too many login attempts 

        if (checkbrute($dr["id"]) == true) {
            // Account is locked 
            // Send an email to user saying their account is locked
            $code = 102;
            //return false;
        } else {
            // Check if the password in the database matches
            // the password the user submitted.
            if ($dr["password"] == $password) {
                // Password is correct!
                // Get the user-agent string of the user.
                $user_browser = $_SERVER['HTTP_USER_AGENT'];
                // XSS protection as we might print this value
                $user_id = preg_replace("/[^0-9]+/", "", $user_id);
                $_SESSION['user_id'] = $user_id;
                // XSS protection as we might print this value
                $username = preg_replace("/[^a-zA-Z0-9_\-]+/","",$username);
                $_SESSION['username'] = $username;
                $_SESSION['login_string'] = hash('sha512', $password . $user_browser);
                // Login successful.
                $code = 0;
                //return true;
            } else {
                // Password is not correct
                // We record this attempt in the database
                $query = "INSERT INTO login_attempts(user_id) VALUES (".$user_id.")";
                $dbconn->Execute($query);
                
                $code = 101;
                //return false;
            }
        }
    } else {
        // No user exists.
        $code = 103;
        //return false;
    }
    return $code;
}

function checkbrute($user_id) {
    global $dbconn;

    // All login attempts are counted from the past 2 hours. 
    $query = "SELECT count(user_id) from login_attempts 
        WHERE user_id = ".$user_id." 
        AND creationdate > DATE_SUB(NOW(),INTERVAL 2 HOUR)
        GROUP BY user_id
        ";
    $rs = $dbconn->Execute($query);
    $attempts = ($rs->RowCount() > 0) ? $rs->fields[0] : 0; 
    
    // If there have been more than 5 failed logins 
    if ($attempts > 5) {
        return true;
    } else {
        return false;
    }
}

?>
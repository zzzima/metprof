<?php 
function sec_session_start() {
    $session_name = 'sec_session_id';   // Set a custom session name
    $secure = false;
    // This stops JavaScript being able to access the session id.
    $httponly = true;
    // Forces sessions to only use cookies.
    
    if (ini_set('session.use_only_cookies', 1) === FALSE) {
        header("Location: ../error.php?err=Could not initiate a safe session (ini_set)");
        exit();
    }   
    // Gets current cookies params.
    $cookieParams = session_get_cookie_params();   
    session_set_cookie_params($cookieParams["lifetime"],
        $cookieParams["path"], 
        $cookieParams["domain"], 
        $secure,
        $httponly);     
    // Sets the session name to the one set above.
    session_name($session_name);
    session_start();            // Start the PHP session 
    session_regenerate_id();    // regenerated the session, delete the old one. 
}

function esc_url($url) {
 
    if ('' == $url) {
        return $url;
    }
 
    $url = preg_replace('|[^a-z0-9-~+_.?#=!&;,/:%@$\|*\'()\\x80-\\xff]|i', '', $url);
 
    $strip = array('%0d', '%0a', '%0D', '%0A');
    $url = (string) $url;
 
    $count = 1;
    while ($count) {
        $url = str_replace($strip, '', $url, $count);
    }
 
    $url = str_replace(';//', '://', $url);
 
    $url = htmlentities($url);
 
    $url = str_replace('&amp;', '&#038;', $url);
    $url = str_replace("'", '&#039;', $url);
 
    if ($url[0] !== '/') {
        // We're only interested in relative links from $_SERVER['PHP_SELF']
        return '';
    } else {
        return $url;
    }
}

function login_check($dbconn) {
    // Check if all session variables are set 
    if (isset($_SESSION['user_id'],$_SESSION['username'],$_SESSION['login_string'])) {
        $user_id = $_SESSION['user_id'];
        $login_string = $_SESSION['login_string'];
 
        // Get the user-agent string of the user.
        $user_browser = $_SERVER['HTTP_USER_AGENT'];
 
        $query = "SELECT password FROM user WHERE id = ".$user_id." LIMIT 1";
        $rs = $dbconn->Execute($query);
 
        if ($rs->RowCount() == 1) {
            $password = $rs->fields[0]; 
            $login_check = hash('sha512', $password . $user_browser);

            if ($login_check == $login_string) {
                // Logged In!!!! 
                return true;
            } else {
                // Not logged in 
                return false;
            }
        } else {
            // Not logged in 
            return false;
        }
    } else {
        // Not logged in 
        return false;
    }
}

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
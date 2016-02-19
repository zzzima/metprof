<?php
include_once("../common.php");

if(login_check($dbconn)){
    header('Location: index.php');
    exit();
}
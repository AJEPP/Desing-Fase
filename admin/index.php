<?php

    namespace Ajepp;

    session_start();
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
    date_default_timezone_set('America/Managua');

    require_once "models/config.php";

    use \Ajepp\Controllers\linksController as mvc;

    $mvc = new mvc();
    $mvc -> template();
?>
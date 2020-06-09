<?php

    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', '');
    define('DB_HOST', 'localhost');
    define('DB_NAME', 'ajepp');

    spl_autoload_register(function($className)
    {
        $exp = explode("\\", $className);
        if(count($exp) > 2)
        {
            $className = $exp[2];
        }

        $sources = array($_SERVER['DOCUMENT_ROOT']."/controllers/".$className.".php", $_SERVER['DOCUMENT_ROOT']."/models/".$className.".php", $_SERVER['DOCUMENT_ROOT']."/models/db/".$className.".php", $_SERVER['DOCUMENT_ROOT']."/models/functions/".$className.".php",$_SERVER['DOCUMENT_ROOT']."/models/utils/".$className.".php");

        foreach ($sources as $source) 
        {
            //echo $source."<br>";
            if (file_exists($source)) 
            {
                require_once $source;
            }
        } 
    
    });

?>
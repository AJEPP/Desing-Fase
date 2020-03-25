<?php

    define('DB_USERNAME', '');
    define('DB_PASSWORD', '');
    define('DB_HOST', '');
    define('DB_NAME', '');

    spl_autoload_register(function($className)
    {
        $exp = explode("\\", $className);
        if(count($exp) > 2)
        {
            $className = $exp[2];
        }

        $sources = array("controllers/".$className.".php", "models/".$className.".php" );

        foreach ($sources as $source) 
        {
            
            if (file_exists($source)) 
            {
                require_once $source;
            }
        } 
    
    });
?>
<?php

namespace Ajepp\DB;
class Connection {
 
    public function connect() 
    {
        $conn = new \mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);


        if (!mysqli_connect_errno()) 
        {
           
            $conn->set_charset('utf8');
            
            // returing connection resource
            return $conn;

        } else 
        {
            printf("Falló la conexión: %s\n", mysqli_connect_error());
            exit();
        }
        
    }
 
}
?>

<?php

    namespace Ajepp\Models;

    class LinksModel
    {
        private $links;

        public function __construct()
        {
            $this->links = array("dashboard", "login","departamento","marca","tipoVehiculo","usuarios","cargo","modeloVehiculo","piezasVehiculo");
        }

        public function getModule($link)
        {
           if(in_array($link, $this->links))
           {
                if(file_exists("views/modules/".$link.".php"))
                {
                    $module = "views/modules/".$link.".php";
                }
                else
                {
                    $module = "views/modules/404.php";
                }
           }
           else
           {
                $module = "views/modules/404.php";
           }

           return $module;
        }

        public function getScript($script)
        {
            if(in_array($script, $this->links))
            {
                $js = "views/modules/js/".$script.".js";
            }
            else
            {
                $js = "views/modules/js/dashboard.js";
            }

            if(file_exists($js)) 
            {
                return $js;
            }
            else
            {
                return "nothing";
            }

        }
    }
?>
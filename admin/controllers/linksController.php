<?php

    namespace Ajepp\Controllers;

    use \Ajepp\Models\linksModel as linksM;

    class LinksController
    {

        public function template()
        {
            include "views/template.php";
        }

        public function setModules()
        {
            $linksModel = new linksM();
            
            if(isset($_SESSION['user']))
            {
                if(isset($_GET['view']))
                {
                    $link = $_GET['view'];
                }
                else
                {
                    $link = "dashboard";
                }
            }
            else
            {
				if(isset($_GET['view']))
				{
					if($_GET['view'] == "activate")
					{
						$link = $_GET['view'];
					}
					else
					{
						$link = "login";
					}
				}
				else
				{
					$link = "login";
				}
            }

            $module = $linksModel->getModule($link);
            include $module;
        }

        public function setScript()
        {
            $linksModel = new linksM();
            
            if(isset($_SESSION['user']))
            {
                if (isset($_GET['view'])) 
                {
                    $link = $_GET['view'];
                }
                else
                {
                    $link = "dashboard";
                }
            }
            else
            {
				if(isset($_GET['view']))
				{
					if($_GET['view'] == "activate")
					{
						$link = $_GET['view'];
					}
					else
					{
						$link = "login";
					}
				}
				else
				{
					$link = "login";
				}
            }
            
            $script = $linksModel->getScript($link);
            //echo $script;
            if ($script != "nothing") 
            {
                $ret = "<script src = 'http://".$_SERVER['SERVER_NAME'].'/'.$script."'></script>";
                return $ret;
            }

        }
    }
?>
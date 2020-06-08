<?php
   /**
   *
   * @About:      Controller of menu of System
   * @File:       menuController.php
   * @Date:       2020-06-06T16:55:14
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Controllers;

   use Ajepp\Models\menuModel as model;

   class MenuController
   {
       private $model;

       public function __construct()
       {
           $this->model = new model();
       }

       public function setMenu()
       {
            $menus = $this->model->getMenu();
            $lista = '';

            while($menu = $menus->fetch_object())
            {
                $item = json_decode($menu->contenido);
                /*var_dump($item);*/
                if(in_array($_SESSION['user']->personal_ajepp_id, $item->show))
                {
                    if(count($item->child) == 0)
                    {
                        if(isset($_GET['view']))
                        {
                            if($_GET['view'] == $item->link)
                            {
                                $lista.= '<li class="nav-item bg-info">
                                    <a class="nav-link" href="'.$item->link.'">
                                        <i class="fas fa-fw fa-'.$item->icon.' text-white"></i>
                                        <span class ="text-white">'.$item->text.'</span>
                                    </a>
                                </li>';
                            }
                            else
                            {
                                $lista.= '<li class="nav-item">
                                <a class="nav-link" href="'.$item->link.'">
                                    <i class="fas fa-fw fa-'.$item->icon.'"></i>
                                    <span>'.$item->text.'</span>
                                </a>
                            </li>';
                            }
                        }
                        else
                        {
                            $lista.= '<li class="nav-item">
                                <a class="nav-link" href="'.$item->link.'">
                                    <i class="fas fa-fw fa-'.$item->icon.'"></i>
                                    <span>'.$item->text.'</span>
                                </a>
                            </li>';
                        }
                    }
                    else
                    {

                        if(isset($_GET['view']))
                        {
                            $links = array();
                            for($i = 0; $i < count($item->child); $i++)
                            {
                                array_push($links, $item->child[$i]->link);
                            }

                            if(in_array($_GET['view'], $links))
                            {
                                $cl = "bg-info";
                            }
                            else
                            {
                                $cl = "";
                            }
                        }

                        $lista.= '<li class="nav-item collapsed '.$cl.'">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse'.$menu->id_menu.'" aria-expanded="true" aria-controls="collapse'.$menu->id_menu.'">
                                        <i class="fas fa-fw fa-'.$item->icon.'"></i>
                                        <span>'.$item->text.'</span>
                                    </a>
                                    <div id="collapse'.$menu->id_menu.'" class="collapse" aria-labelledby="heading'.$menu->id_menu.'" data-parent="#accordionSidebar">
                                        <div class="bg-white py-2 collapse-inner rounded">';
                                    for($i = 0; $i < count($item->child); $i++)
                                    {
                                        if(in_array($_SESSION['user']->nivel, $item->child[$i]->show))
                                        {
                                            $lista.= '<a class="collapse-item" href="'.$item->child[$i]->link.'">
                                            <i class="fas fa-fw fa-'.$item->child[$i]->icon.'"></i>
                                            '.$item->child[$i]->text.'
                                            </a>';
                                        }
                                    }
                        $lista.= '	</div>
                                 </li>';	
                    }
                }
            }
            echo $lista;
       }
   }
?>
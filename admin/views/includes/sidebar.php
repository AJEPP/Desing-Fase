<?php
   /**
   *
   * @About:      Sidebar menu of project
   * @File:       sidebar.php
   * @Date:       2020-03-05T19:19:04
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

  namespace Ajepp;
  use \Ajepp\controllers\menuController as mctr;

  $class = '';

  if(isset($_GET['view']))
  {
      if($_GET['view'] == 'pos')
      {
          $class = 'toggled';
      }
  }
?>

        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion  p-0 <?php echo $class; ?>"style="background-color:#8B0000">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3"><span>AJEPP</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <?php

                        $menuCtr = new mctr();
                        $menuCtr->setMenu($_SESSION['user']->usuario);

                    ?>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>

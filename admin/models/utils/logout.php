<?php
   /**
   *
   * @About:      Logout function
   * @File:       logout.php
   * @Date:       2020-06-10T13:36:26
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/
   session_start();
   session_destroy();

   header('location: /');
?>
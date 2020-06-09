<?php
   /**
   *
   * @About:      Db request for login form
   * @File:       login.php
   * @Date:       2020-05-24T22:02:29
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Requests;
   // error_reporting(E_ALL);
   // ini_set('display_errors', '1');
   require_once "../config.php";
   use \Ajepp\Controllers\loginController as lctrl;
   use \Ajepp\Functions\formDecode as frm;

   $controller = new lctrl();

   $decode = new frm();

   $form = $decode->getFormData($_POST['data']);

   $resp = $controller->login($form);

   echo json_encode($resp);

?>

<?php
   /**
   *
   * @About:      Controller for user login
   * @File:       loginController.php
   * @Date:       2020-05-24T22:05:21
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Controllers;

   use \Ajepp\Models\loginModel as loginM;
   class LoginController
   {
      private $model;

      public function __construct()
      {
         $this->model = new loginM();
      }

      public function login($form)
      {
         return $this->model->uerLogin($form);
      }
   }

?>

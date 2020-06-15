<?php
   /**
   *
   * @About:      Controller for clients functions
   * @File:       clientesController.php
   * @Date:       2020-06-14T09:42:56
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Controllers;

   use Ajepp\Models\clientesModel as model;

   class ClientesController
   {
       private $model;


       public function __construct()
       {
           $this->model = new model();
       }

       public function saveClient($data)
       {
           $save = $this->model->saveClient($data);

           return $save;
       }
   }
?>
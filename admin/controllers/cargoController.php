<?php
   /**
    *
    * @About:      cargoController for all modules
    * @File:       cargoController.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Marlon Anthony Bendliss Chávez. (anthonybendliss7@gmail.com)
    **/

  namespace Ajepp\Controllers;
  
  use Ajepp\Models\cargoModel as cargoModel;

  class cargoController
  {
      private $model;

      public function __construct()
      {
         $this->model = new cargoModel();
      }

      public function getcargos()
      {
         $cargo = $this->model->getcargos();

         $list = '';
         $cont = 1;

         while($car = $cargo->result->fetch_object())
         {

            $list.= '<tr>
                        <td>'.$cont.'</td>
                        <td>'.$car->departamento_ajepp_id.'</td>
                        <td>'.$car->cargo_nombre.'</td>
                        <td>'.$car->pago_cargo.'</td>
                        <td class = "">
                           <a class ="text-warning edit" href="#" data-id = "'.$car->id.'"><i class="fas fa-edit"></i></a>
                           <a class ="text-danger delete" href="#" data-id = "'.$car->id.'"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>';

            $cont++;
         }

         echo $list;
      }

      public function addcargo($data)
      {
         $add = $this->model->addcargo($data);  
         return $add;     
      }

      public function getcargo($id)
      {
         $car = $this->model->getcargo($id);
         if($car->result->num_rows > 0 )
         {
            $rsp = (object) array('error' => false, 'data' => $car->result->fetch_object());
         }
         else
         {
            $rsp = (object) array('error' => true, 'data' => null);
         }
         return $rsp;
      }

      public function editcargo($data)
      {
         $edit = $this->model->editcargo($data);
         return $edit;     
      }

      public function deletecargo($id)
      {
         $delete = $this->model->deletecargo($id);
         return $delete;
      }


  }
?>

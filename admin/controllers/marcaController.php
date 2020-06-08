<?php
   /**
    *
    * @About:      marcaController for all modules
    * @File:       marcaController.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Marlon Anthony Bendliss Chávez. (anthonybendliss7@gmail.com)
    **/

  namespace Ajepp\Controllers;
  
  use Ajepp\Models\marcaModel as marcaModel;

  class marcaController
  {
      private $model;

      public function __construct()
      {
         $this->model = new marcaModel();
      }

      public function getmarcas()
      {
         $marca = $this->model->getmarcas();

         $list = '';
         $cont = 1;

         while($mar = $marca->result->fetch_object())
         {

            $list.= '<tr>
                        <td>'.$cont.'</td>
                        <td>'.$mar->marca_vehiculo.'</td>
                        <td>'.$mar->mar_img.'</td>
                        <td>'.$mar->tipo.'</td>
                        <td class = "">
                           <a class ="text-warning edit" href="#" data-id = "'.$mar->id.'"><i class="fas fa-edit"></i></a>
                           <a class ="text-danger delete" href="#" data-id = "'.$mar->id.'"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>';

            $cont++;
         }

         echo $list;
      }

      public function addmarca($data)
      {
         $add = $this->model->addmarca($data);  
         return $add;     
      }

      public function getmarca($id)
      {
         $mar = $this->model->getmarca($id);
         if($mar->result->num_rows > 0 )
         {
            $rsp = (object) array('error' => false, 'data' => $mar->result->fetch_object());
         }
         else
         {
            $rsp = (object) array('error' => true, 'data' => null);
         }
         return $rsp;
      }

      public function editmarca($data)
      {
         $edit = $this->model->editmarca($data);
         return $edit;     
      }

      public function deletemarca($id)
      {
         $delete = $this->model->deletemarca($id);
         return $delete;
      }


  }
?>

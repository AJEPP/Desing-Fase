<?php
   /**
    *
    * @About:      piezasVehiculoController for all modules
    * @File:       piezasVehiculoController.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/

  namespace Ajepp\Controllers;
  
  use Ajepp\Models\piezasVehiculoModel as piezasVehiculoModel;

  class piezasVehiculoController
  {
    private $model;

    public function __construct()
    {
        $this->model = new piezasVehiculoModel();
    }

    public function getpiezasVehiculos()
    {
        $piezasVehiculo = $this->model->getpiezasVehiculos();

        $list = '';
        $cont = 1;

        while($pie = $piezasVehiculo->result->fetch_object())
        {
         $list.= '<tr>
               <td>'.$cont.'</td>
               <td>'.$pie->mod_vehiculo.'</td>
               <td>'.$pie->pie_clasi.'</td>
               <td>'.$pie->pie_nombre.'</td>
               <td>'.$pie->pie_descripcion.'</td>
              
               <td class = "">
                  <a class ="text-warning edit" href="#" data-id = "'.$pie->id.'"><i class="fas fa-edit"></i></a>
                  <a class ="text-danger delete" href="#" data-id = "'.$pie->id.'"><i class="fas fa-trash"></i></a>
               </td>
         </tr>';

        $cont++;
        }

        echo $list;
    }

    public function addpiezasVehiculo($data)
    {
        $add = $this->model->addpiezasVehiculo($data);  
        return $add;     
    }

    public function getpiezasVehiculo($id)
      {
         $dep = $this->model->getpiezasVehiculo($id);
         if($dep->result->num_rows > 0 )
         {
            $rsp = (object) array('error' => false, 'data' => $dep->result->fetch_object());
         }
         else
         {
            $rsp = (object) array('error' => true, 'data' => null);
         }
         return $rsp;
      }

      public function editpiezasVehiculo($data)
      {
         $edit = $this->model->editpiezasVehiculo($data);
         return $edit;     
      }

      public function deletepiezasVehiculo($id)
      {
         $delete = $this->model->deletepiezasVehiculo($id);
         return $delete;
      }

  }
?>

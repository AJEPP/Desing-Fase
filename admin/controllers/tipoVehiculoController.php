<?php
   /**
    *
    * @About:      tipoVehiculoController for all modules
    * @File:       tipoVehiculoController.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/

  namespace Ajepp\Controllers;
  
  use Ajepp\Models\tipoVehiculoModel as tipoVehiculoModel;

  class tipoVehiculoController
  {
    private $model;

    public function __construct()
    {
        $this->model = new tipoVehiculoModel();
    }

    public function gettipoVehiculos()
    {
        $tipoVehiculo = $this->model->gettipoVehiculos();

        $list = '';
        $cont = 1;

        while($tipo = $tipoVehiculo->result->fetch_object())
        {
        $list.= '<tr>
                    <td>'.$cont.'</td>
                    <td>'.$tipo->tipo_vehiculo.'</td>
                    <td>'.$tipo->clasificacion_vehiculo.'</td>
                    <td>'.$tipo->vehiculo_img.'</td>
                    <td class = "">
                        <a class ="text-warning edit" href="#" data-id = "'.$tipo->id.'"><i class="fas fa-edit"></i></a>
                        <a class ="text-danger delete" href="#" data-id = "'.$tipo->id.'"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>';

        $cont++;
        }

        echo $list;
    }

    public function addtipoVehiculo($data)
    {
        $add = $this->model->addtipoVehiculo($data);  
        return $add;     
    }

    public function gettipoVehiculo($id)
      {
         $tipo = $this->model->gettipoVehiculo($id);
         if($tipo->result->num_rows > 0 )
         {
            $rsp = (object) array('error' => false, 'data' => $tipo->result->fetch_object());
         }
         else
         {
            $rsp = (object) array('error' => true, 'data' => null);
         }
         return $rsp;
      }

      public function edittipoVehiculo($data)
      {
         $edit = $this->model->edittipoVehiculo($data);
         return $edit;     
      }

      public function deletetipoVehiculo($id)
      {
         $delete = $this->model->deletetipoVehiculo($id);
         return $delete;
      }

  }
?>

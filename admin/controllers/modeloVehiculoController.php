<?php
   /**
    *
    * @About:      modeloVehiculoController for all modules
    * @File:       modeloVehiculoController.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/

  namespace Ajepp\Controllers;

  use Ajepp\Models\modeloVehiculoModel as modeloVehiculoModel;

  class modeloVehiculoController
  {
    private $model;

    public function __construct()
    {
        $this->model = new modeloVehiculoModel();
    }

    public function getmodeloVehiculos()
    {
        $modeloVehiculo = $this->model->getmodeloVehiculos();

        $list = '';
        $cont = 1;

        while($modelo = $modeloVehiculo->result->fetch_object())
        {
        $list.= '<tr>
                    <td>'.$cont.'</td>
                    <td>'.$modelo->marca.'</td>
                    <td>'.$modelo->mod_vehiculo.'</td>
                    <td>'.$modelo->mod_anio.'</td>
                    <td>'.$modelo->procedencia.'</td>
                    <td>'.$modelo->mob_chasis_tipo.'</td>
                    <td>'.$modelo->mob_motor_tam.'</td>
                    <td>'.$modelo->mod_anio_termina.'</td>
                    <td class = "">
                        <a class ="text-warning edit" href="#" data-id = "'.$modelo->id.'"><i class="fas fa-edit"></i></a>
                        <a class ="text-danger delete" href="#" data-id = "'.$modelo->id.'"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>';

        $cont++;
        }

        echo $list;
    }

    public function addmodeloVehiculo($data)
    {
        $add = $this->model->addmodeloVehiculo($data);
        return $add;
    }

    public function getmodeloVehiculo($id)
      {
         $modelo = $this->model->getmodeloVehiculo($id);
         if($modelo->result->num_rows > 0 )
         {
            $rsp = (object) array('error' => false, 'data' => $modelo->result->fetch_object());
         }
         else
         {
            $rsp = (object) array('error' => true, 'data' => null);
         }
         return $rsp;
      }

      public function getmodeloVehiculoDatos($id)
        {
           $modelo = $this->model->getModeloVehiculoDatos($id);
           $list= array();
           while($modelos = $modelo->result->fetch_object())
           {
             $list []=(object) array("name"=>$modelos->mod_vehiculo);
           }
           return $list;
        }

      public function getmodeloVehiculoAnio($id)
        {
           $modelo = $this->model->getModeloVehiculoAnio($id);
           $list= array();
           while($modelos = $modelo->result->fetch_object())
           {
             $list []=(object) array("inicio"=>$modelos->inicio, "termina"=>$modelos->termina);
           }
           return $list;
        }

        public function getmodeloVehiculoMotor($id, $modelo, $marca)
          {
             $modelo = $this->model->getModeloVehiculoMotor($id, $modelo, $marca);
             $list= array();
             while($modelos = $modelo->result->fetch_object())
             {
               $list []=(object) array("motor"=>$modelos->mob_motor_tam);
             }
             return $list;
          }

      public function editmodeloVehiculo($data)
      {
         $edit = $this->model->editmodeloVehiculo($data);
         return $edit;
      }

      public function deletemodeloVehiculo($id)
      {
         $delete = $this->model->deletemodeloVehiculo($id);
         return $delete;
      }

  }
?>

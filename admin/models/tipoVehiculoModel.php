<?php
     /**
    *
    * @About:      tipoVehiculoModel for all modules
    * @File:       tipoVehiculoModel.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/
  namespace Ajepp\Models;
 
  use Ajepp\DB\cruddb as crud;
  class TipoVehiculoModel
  {
    private $bd;
    public function __construct()
    {
        $this->bd = new crud();
    }

    public function getTipoVehiculos()
    {
        $tipo = $this->bd->query("SELECT * FROM `tipo_vehiculo` WHERE 1");

        return $tipo;
    }

    public function addTipoVehiculo($data)
    {    
        $tipo = $this->bd->query("INSERT INTO `tipo_vehiculo`(`tipo_vehiculo`, `clasificacion_vehiculo`) VALUES ('".$data->tipo_vehiculo."','".$data->clasificacion_vehiculo."')");
        
        // echo "INSERT INTO `tipo_vehiculo`(`tipo_vehiculo`, `clasificacion_vehiculo`) VALUES ('".$data->tipo_vehiculo."','".$data->clasificacion_vehiculo."')";
    }

    public function getTipoVehiculo($id)
    {
        $tipo = $this->bd->query("SELECT * FROM `tipo_vehiculo` WHERE id = ".$id); 
        return $tipo;
        // $sql = "SELECT * FROM `tipo_vehiculo` WHERE id = ".$id;
        // return $sql;
    }

    public function editTipoVehiculo($data)
    {
     
        $tipo = $this->bd->query("UPDATE `tipo_vehiculo` SET `tipo_vehiculo`='".$data->tipo_vehiculo."', `clasificacion_vehiculo`='".$data->clasificacion_vehiculo."'  WHERE id = ".$data->id);
        //   echo "UPDATE `tipoVehiculo_vehiculo` SET `nombre`='".$data->nombre."',`id`='".$data->id."' WHERE id = ".$data->id;
    }

    public function deleteTipoVehiculo($id)
    {
        $tipo = $this->bd->query("DELETE FROM `tipo_vehiculo` WHERE id = ".$id);
        //echo "DELETE FROM `depca_vehiculo` WHERE id = ".$id;

        return $tipo;
    }

  }
?>

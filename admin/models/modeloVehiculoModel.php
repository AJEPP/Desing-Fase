<?php
     /**
    *
    * @About:      ModeloVehiculodModel for all modules
    * @File:       ModeloVehiculodModel.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/
  namespace Ajepp\Models;

  use Ajepp\DB\crudDb as crud;
  class ModeloVehiculoModel
  {
    private $bd;
    public function __construct()
    {
        $this->bd = new crud();
    }

    public function getModeloVehiculos()
    {
        $modelo = $this->bd->query("SELECT mo.*, ma.marca_vehiculo AS marca FROM `modelo_vehiculo` mo INNER JOIN marca_vehiculo ma ON ma.id = mo.marca_vehiculo_id WHERE 1");

        return $modelo;
    }

    public function addModeloVehiculo($data)
    {
        $modelo = $this->bd->query("INSERT INTO `modelo_vehiculo`(`marca_vehiculo_id`,`mod_vehiculo`, `mod_anio`,`procedencia`) VALUES ('".$data->marca_vehiculo_id."','".$data->mod_vehiculo."','".$data->mod_anio."','".$data->procedencia."')");

        // echo "INSERT INTO `modelo_vehiculo`(`marca_vehiculo_id`,`mod_vehiculo`, `mod_anio`,`procedencia`) VALUES ('".$data->marca_vehiculo_id."','".$data->mod_vehiculo."','".$data->mod_anio."','".$data->procedencia."')";
    }

    public function getModeloVehiculoDatos($id)
    {
        $modelo = $this->bd->query("SELECT DISTINCT `mod_vehiculo` FROM `modelo_vehiculo` WHERE `marca_vehiculo_id` = ".$id);
        return $modelo;
        // $sql = "SELECT * FROM `modelo_vehiculo` WHERE id = ".$id;
        // return $sql;
    }
    public function getModeloVehiculoAnio($id)
    {
        $modelo = $this->bd->query("SELECT DISTINCT `mod_anio` AS 'inicio', `mod_anio_termina` AS 'termina' FROM `modelo_vehiculo` WHERE `mod_vehiculo` ='".$id."' ORDER BY `mod_anio` asc");
        return $modelo;
        // $sql = "SELECT * FROM `modelo_vehiculo` WHERE id = ".$id;
        // return $sql;
    }

    public function getModeloVehiculoMotor($id, $modelo_buscar, $marca)
    {
        $fechas = explode("-", $id);
        $modelo = $this->bd->query("SELECT `mob_motor_tam`  FROM `modelo_vehiculo` WHERE `marca_vehiculo_id` =".$marca." AND `mod_vehiculo` = '".$modelo_buscar."' AND `mod_anio` ='".$fechas[0]."' AND `mod_anio_termina` = '".$fechas[1]."'");
        return $modelo;
        // $sql = "SELECT * FROM `modelo_vehiculo` WHERE id = ".$id;
        // return $sql;
    }
    public function editModeloVehiculo($data)
    {

        $modelo = $this->bd->query("UPDATE `modelo_vehiculo` SET `marca_vehiculo_id`='".$data->marca_vehiculo_id."',`mod_vehiculo`='".$data->mod_vehiculo."', `mod_anio`='".$data->mod_anio."',`procedencia`='".$data->procedencia."' WHERE id = ".$data->id);
        //   echo "UPDATE `ModeloVehiculo_vehiculo` SET `nombre`='".$data->nombre."',`id`='".$data->id."' WHERE id = ".$data->id;
    }

    public function deleteModeloVehiculo($id)
    {
        $modelo = $this->bd->query("DELETE FROM `modelo_vehiculo` WHERE id = ".$id);
        //echo "DELETE FROM `depca_vehiculo` WHERE id = ".$id;

        return $modelo;
    }

  }
?>

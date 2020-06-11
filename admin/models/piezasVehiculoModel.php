<?php
     /**
    *
    * @About:      departamentodModel for all modules
    * @File:       departamentodModel.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/
  namespace Ajepp\Models;
 
  use Ajepp\DB\cruddb as crud;
  class PiezasVehiculoModel
  {
    private $bd;
    public function __construct()
    {
        $this->bd = new crud();
    }

    public function getPiezasVehiculos()
    {
        $pieza = $this->bd->query("SELECT pi.*, mo.mod_vehiculo AS mod_vehiculo, cl.pi_nombre AS pie_clasi FROM `piezas_vehiculo` pi INNER JOIN modelo_vehiculo mo ON mo.id = pi.modelo_vehiculo_id INNER JOIN clasificacion_pieza cl ON cl.id = pi.clasificacion_pieza_id WHERE 1 ORDER BY id DESC");

        return $pieza;
    }

    public function addPiezasVehiculo($data)
    {    
        $pieza = $this->bd->query("INSERT INTO `piezas_vehiculo`(`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`) VALUES ('".$data->modelo_vehiculo_id."','".$data->clasificacion_pieza_id."','".$data->pie_nombre."','".$data->pie_descripcion."')");
        
        // echo "INSERT INTO `piezas_vehiculo`(`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`) VALUES ('".$data->modelo_vehiculo_id."','".$data->clasificacion_pieza_id."','".$data->pie_nombre."','".$data->pie_descripcion."')";
    }

    public function getPiezasVehiculo($id)
    {
        $pieza = $this->bd->query("SELECT * FROM `piezas_vehiculo` WHERE id = ".$id); 
        return $pieza;
        // $sql = "SELECT * FROM `departamento_ajepp` WHERE id = ".$id;
        // return $sql;
    }

    public function editPiezasVehiculo($data)
    {
     
        $pieza = $this->bd->query("UPDATE `piezas_vehiculo` SET `modelo_vehiculo_id`='".$data->modelo_vehiculo_id."', `clasificacion_pieza_id`='".$data->clasificacion_pieza_id."',`pie_nombre`='".$data->pie_nombre."',  `pie_descripcion`='".$data->pie_descripcion."' WHERE id = ".$data->id);
        //   echo "UPDATE `Departamento_vehiculo` SET `nombre`='".$data->nombre."',`id`='".$data->id."' WHERE id = ".$data->id;
    }

    public function deletePiezasVehiculo($id)
    {
        $pieza = $this->bd->query("DELETE FROM `piezas_vehiculo` WHERE id = ".$id);
        //echo "DELETE FROM `depca_vehiculo` WHERE id = ".$id;

        return $pieza;
    }

  }
?>

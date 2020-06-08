<?php
     /**
    *
    * @About:      facultadModel for all modules
    * @File:       facultadModel.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Marlon Anthony Bendliss Chávez. (anthonybendliss7@gmail.com)
    **/
  namespace Ajepp\Models;
 
  use Ajepp\DB\cruddb as crud;
  class MarcaModel
  {
    private $bd;
    public function __construct()
    {
        $this->bd = new crud();
    }

    public function getMarcas()
    {
        $mar = $this->bd->query("SELECT ma.*, tp.tipo_vehiculo AS tipo FROM `marca_vehiculo` ma INNER JOIN tipo_vehiculo tp ON tp.id = ma.tipo_vehiculo_id WHERE 1");

        return $mar;
    }

    public function addMarca($data)
    {    
        $mar = $this->bd->query("INSERT INTO `marca_vehiculo`(`marca_vehiculo`, `mar_img`,`tipo_vehiculo_id`) VALUES ('".$data->marca_vehiculo."','','".$data->tipo_vehiculo_id."')");
        
        // echo "INSERT INTO `marca_vehiculo`(`marca_vehiculo`, `mar_img`,`tipo_vehiculo_id`) VALUES ('".$data->marca_vehiculo."','','".$data->tipo_vehiculo_id."')";
    }

    public function getMarca($id)
    {
        $mar = $this->bd->query("SELECT * FROM `marca_vehiculo` WHERE id = ".$id); 
        return $mar;
        // $sql = "SELECT * FROM `marca_vehiculo` WHERE id = ".$id;
        // return $sql;
    }

    public function editMarca($data)
    {
     
        $mar = $this->bd->query("UPDATE `marca_vehiculo` SET `marca_vehiculo`='".$data->marca_vehiculo."',`tipo_vehiculo_id`='".$data->tipo_vehiculo_id."' WHERE id = ".$data->id);
        // echo "UPDATE `marca_vehiculo` SET `marca_vehiculo`='".$data->marca_vehiculo."',`tipo_vehiculo_id`='".$data->tipo_vehiculo_id."' WHERE id = ".$data->id;
    }

    public function deleteMarca($id)
    {
        $mar = $this->bd->query("DELETE FROM `marca_vehiculo` WHERE id = ".$id);
        //echo "DELETE FROM `marca_vehiculo` WHERE id = ".$id;

        return $mar;
    }



  }
?>

<?php
     /**
    *
    * @About:      cargoModel for all modules
    * @File:       cargoModel.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose daniel quijano
    **/
  namespace Ajepp\Models;
 
  use Ajepp\DB\cruddb as crud;
  class CargoModel
  {
    private $bd;
    public function __construct()
    {
        $this->bd = new crud();
    }

    public function getCargos()
    {
        $cargo = $this->bd->query("SELECT ca.*, dp.dep_nombre AS departamento FROM `cargo_ajepp` ca INNER JOIN departamento_ajepp dp ON dp.id = ca.departamento_ajepp_id WHERE 1");

        return $cargo;
    }

    public function addCargo($data)
    {    
        $cargo = $this->bd->query("INSERT INTO `cargo_ajepp`(`departamento_ajepp_id`, `car_nombre`,`pago_cargo`) VALUES ('".$data->departamento_ajepp_id."','".$data->car_nombre."','".$data->pago_cargo."')");
        
        // echo "INSERT INTO `cargo_ajepp`(`departamento_ajepp_id`, `car_nombre`,`pago_cargo`) VALUES ('".$data->departamento_ajepp_id."','".$data->car_nombre."','".$data->pago_cargo."')";
    }

    public function getCargo($id)
    {
        $cargo = $this->bd->query("SELECT * FROM `cargo_ajepp` WHERE id = ".$id); 
        return $cargo;
        // $sql = "SELECT * FROM `cargo_ajepp` WHERE id = ".$id;
        // return $sql;
    }

    public function editCargo($data)
    {
     
        $cargo = $this->bd->query("UPDATE `cargo_ajepp` SET `departamento_ajepp_id`='".$data->departamento_ajepp_id."',`car_nombre`= '".$data->car_nombre."',`pago_cargo`='".$data->pago_cargo."' WHERE id = ".$data->id);
        // echo "UPDATE `cargo_ajepp` SET `cargo_ajepp`='".$data->Cargo_vehiculo."',`pago_cargo`='".$data->pago_cargo."' WHERE id = ".$data->id;
    }

    public function deleteCargo($id)
    {
        $cargo = $this->bd->query("DELETE FROM `cargo_ajepp` WHERE id = ".$id);
        //echo "DELETE FROM `cargo_ajepp` WHERE id = ".$id;

        return $cargo;
    }



  }
?>

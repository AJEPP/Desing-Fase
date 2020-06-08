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
  class DepartamentoModel
  {
    private $bd;
    public function __construct()
    {
        $this->bd = new crud();
    }

    public function getDepartamentos()
    {
        $depa = $this->bd->query("SELECT * FROM `departamento_ajepp` WHERE 1");

        return $depa;
    }

    public function addDepartamento($data)
    {    
        $depa = $this->bd->query("INSERT INTO `departamento_ajepp`(`dep_nombre`, `dep_locacion`) VALUES ('".$data->dep_nombre."','".$data->dep_locacion."')");
        
        // echo "INSERT INTO `departamento_ajepp`(`dep_nombre`, `dep_locacion`) VALUES ('".$data->dep_nombre."','".$data->dep_locacion."')";
    }

    public function getDepartamento($id)
    {
        $dep = $this->bd->query("SELECT * FROM `departamento_ajepp` WHERE id = ".$id); 
        return $dep;
        // $sql = "SELECT * FROM `departamento_ajepp` WHERE id = ".$id;
        // return $sql;
    }

    public function editDepartamento($data)
    {
     
        $dep = $this->bd->query("UPDATE `departamento_ajepp` SET `dep_nombre`='".$data->dep_nombre."', `dep_locacion`='".$data->dep_locacion."'  WHERE id = ".$data->id);
        //   echo "UPDATE `Departamento_vehiculo` SET `nombre`='".$data->nombre."',`id`='".$data->id."' WHERE id = ".$data->id;
    }

    public function deleteDepartamento($id)
    {
        $dep = $this->bd->query("DELETE FROM `departamento_ajepp` WHERE id = ".$id);
        //echo "DELETE FROM `depca_vehiculo` WHERE id = ".$id;

        return $dep;
    }

  }
?>

<?php
   /**
   *
   * @About:      Model of providers
   * @File:       proveedoresModel.php
   * @Date:       2020-06-14T13:41:30
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/


   namespace Ajepp\Models;

   use Ajepp\DB\crudDb as db;

   class ProveedoresModel
   {
        private $db;

        public function __construct()
        {
            $this->db = new db();
        }

        public function getProveedoress()
        {
            $providers = $this->db->query("SELECT *, pv.id AS id_prov FROM proveedor pv LEFT JOIN contacto_proveedor cp ON cp.proveedor_id = pv.id WHERE 1");

            return $providers;
        }

    public function addProveedores($data)
    {    
        $pro = $this->db->query("INSERT INTO `proveedor`(`pro_nombre`, `pro_apellido`, `pro_edad`, `pro_genero`, `pro_nacionalidad`, `pro_dirreccion`, `pro_img`) VALUES ('".$data->pro_nombre."','".$data->pro_apellido."','".$data->pro_edad."','".$data->pro_genero."','".$data->pro_nacionalidad."','".$data->pro_dirreccion."','')");
        
        // echo "INSERT INTO `proveedor`(`pro_nombre`, `pro_apellido`, `pro_edad`, `pro_genero`, `pro_nacionalidad`, `pro_dirreccion`, `pro_img`) VALUES ('".$data->pro_nombre."','".$data->pro_apellido."','".$data->pro_edad."','".$data->pro_genero."','".$data->pro_nacionalidad."','".$data->pro_dirreccion."','')";
    }

    public function getProveedores($id)
    {
        $pro = $this->db->query("SELECT *, pv.id AS id_prov FROM proveedor pv LEFT JOIN contacto_proveedor cp ON cp.proveedor_id = pv.id WHERE pv.id = ".$id); 
        return $pro;
        // $sql = "SELECT *, pv.id AS id_prov FROM proveedor pv LEFT JOIN contacto_proveedor cp ON cp.proveedor_id = pv.id WHERE pv.id = ".$id;
        // return $sql;
    }


    public function editProveedores($data)
    {
     
        $pro = $this->db->query("UPDATE `proveedor` SET `pro_nombre`='".$data->pro_nombre."',`pro_apellido`='".$data->pro_apellido."',`pro_edad`='".$data->pro_edad."',`pro_genero`='".$data->pro_genero."',`pro_nacionalidad`='".$data->pro_nacionalidad."',`pro_dirreccion`='".$data->pro_dirreccion."' WHERE id = ".$data->id_prov);

        // echo "UPDATE `proveedor` SET `pro_nombre`='".$data->pro_nombre."',`pro_apellido`='".$data->pro_apellido."',`pro_edad`='".$data->pro_edad."',`pro_genero`='".$data->pro_genero."',`pro_nacionalidad`='".$data->pro_nacionalidad."',`pro_dirreccion`='".$data->pro_dirreccion."' WHERE id = ".$data->id_prov;
    }

    public function deleteProveedores($id)
    {
        $pro = $this->db->query("DELETE FROM `proveedor` WHERE id = ".$id);
        //echo "DELETE FROM `proveedor` WHERE id = ".$id;

        return $pro;
    }
   }
?>
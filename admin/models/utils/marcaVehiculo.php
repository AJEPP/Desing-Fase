<?php
   /**
      *
      * @About:      tipoUsuario module
      * @File:       tipoUsuario.php
      * @Date:       2020-03-25T19:26:04
      * @Version:    $Rev:$ 1.0
      * @Developer:  Marlon Anthony Bendliss
   **/
    
   namespace Ajepp\Utils;

   use \Ajepp\DB\cruddb as db;

   class MarcaVehiculo
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getMarcaVehiculo()
       {
            $marca = $this->db->query("SELECT * FROM `marca_vehiculo` WHERE 1");

            $list = '';

            while ($mar = $marca->result->fetch_object()) 
            {
                $list.= '<option value="'.$mar->id.'">'.$mar->marca_vehiculo.'</option>';
            }

            echo $list;
       }
   }

?>
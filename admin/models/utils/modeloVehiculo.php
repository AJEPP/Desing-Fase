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

   class ModeloVehiculo
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getModelovehiculo()
       {
            $modelo = $this->db->query("SELECT * FROM `modelo_vehiculo` WHERE 1");

            $list = '';

            while ($mod = $modelo->result->fetch_object()) 
            {
                $list.= '<option value="'.$mod->id.'">'.$mod->mod_vehiculo.'</option>';
            }

            echo $list;
       }
   }

?>
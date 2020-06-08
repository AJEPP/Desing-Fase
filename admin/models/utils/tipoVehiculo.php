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

   class tipoVehiculo
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getTipovehiculo()
       {
            $tipo = $this->db->query("SELECT * FROM `tipo_vehiculo` WHERE 1");

            $list = '';

            while ($tip = $tipo->result->fetch_object()) 
            {
                $list.= '<option value="'.$tip->id.'">'.$tip->tipo_vehiculo.'</option>';
            }

            echo $list;
       }
   }

?>
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

   class PiezaVehiculo
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getPiezaVehiculo()
       {
            $pieza = $this->db->query("SELECT * FROM `piezas_vehiculo` WHERE 1");

            $list = '';

            while ($pie = $pieza->result->fetch_object()) 
            {
                $list.= '<option value="'.$pie->id.'">'.$pie->pie_nombre.'</option>';
            }

            echo $list;
       }
   }

?>
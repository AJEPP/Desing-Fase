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

   class Cargo
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getCargo()
       {
            $cargo = $this->db->query("SELECT * FROM `cargo_ajepp` WHERE 1");

            $list = '';

            while ($car = $cargo->result->fetch_object()) 
            {
                $list.= '<option value="'.$car->id.'">'.$car->car_nombre.'</option>';
            }

            echo $list;
       }
   }

?>
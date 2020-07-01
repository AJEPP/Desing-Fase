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

   class Compra
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }


       public function getPiezasModelos()
       {
            $piezas = $this->db->query("SELECT * FROM `piezas_vehiculo` WHERE 1");

            $list = '';

            $list.= '<option value="0">Selecione modelo</option>';
            while ($pie = $piezas->result->fetch_object())
            {
                $list.= '<option value="'.$pie->pie_numero.'">'.$pie->pie_numero.'</option>';
            }

            echo $list;
       }
   }

?>

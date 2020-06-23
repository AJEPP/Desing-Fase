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

   class ClasificacionPieza
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }


       public function getClasificacionPieza()
       {
            $clasificacion = $this->db->query("SELECT * FROM `clasificacion_pieza` WHERE 1");

            $list = '';
            
            while ($cla = $clasificacion->result->fetch_object())
            {
                $list.= '<option value="'.$cla->id.'">'.$cla->pi_nombre.'</option>';
            }

            echo $list;
       }
   }

?>

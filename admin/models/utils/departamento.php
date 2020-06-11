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

   class Departamento
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getDepartamento()
       {
            $depa = $this->db->query("SELECT * FROM `departamento_ajepp` WHERE 1");

            $list = '';

            while ($dep = $depa->result->fetch_object()) 
            {
                $list.= '<option value="'.$dep->id.'">'.$dep->dep_nombre.'</option>';
            }

            echo $list;
       }
   }

?>
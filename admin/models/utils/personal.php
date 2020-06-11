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

   class Personal
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getPersonal()
       {
            $personal = $this->db->query("SELECT * FROM `personal_ajepp` WHERE 1");

            $list = '';

            while ($per = $personal->result->fetch_object()) 
            {
                $list.= '<option value="'.$per->id.'">'.$per->per_nombre.'</option>';
            }

            echo $list;
       }
   }

?>
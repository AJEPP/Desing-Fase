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

   class Cliente
   {
       private $db;

       public function __construct()
       {
           $this->db = new db();
       }
   

       public function getCliente()
       {
            $cliente = $this->db->query("SELECT * FROM `cliente` WHERE 1");

            $list = '';

            while ($cli = $cliente->result->fetch_object()) 
            {
                $list.= '<option value="'.$cli->id.'">'.$cli->cli_nombres.'</option>';
            }

            echo $list;
       }
   }

?>
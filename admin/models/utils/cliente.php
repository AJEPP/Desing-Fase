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
   

       public function getClienteSelect()
       {
            $cliente = $this->db->query("SELECT * FROM `cliente` WHERE 1");

            $list = '<option value=""></option>';

            if($cliente->result->num_rows > 0)
            {
                while ($cli = $cliente->result->fetch_object()) 
                {
                    $list.= '<option value="'.$cli->id.'">'.$cli->cli_nombres.' '.$cli->cli_apellidos.'</option>';
                }
            }
            else
            {
                $list = '<option value="">No hay clientes registrados</option>';
            }

            return $list;
       }
   }

?>
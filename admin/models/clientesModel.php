<?php
   /**
   *
   * @About:      Model of clients
   * @File:       clientesModel.php
   * @Date:       2020-06-14T08:31:17
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Models;

   use \Ajepp\DB\cruddb as db;


   class ClientesModel
   {
       private $db;


       public function __construct()
       {
           $this->db = new db();
       }

       public function saveClient($data)
       {
          $save = $this->db->query("INSERT INTO `cliente`(`identificacion`, `cli_nombres`, `cli_apellidos`, `cli_edad`, `cli_genero`, `cli_domicilio`, `cli_dirreccion`) VALUES ('".$data->id_card."', '".$data->name."', '".$data->last_name."', '".$data->age."', '".$data->gender."', '".$data->city."', '".$data->address."')");

          return $save;
       }
   }
?>
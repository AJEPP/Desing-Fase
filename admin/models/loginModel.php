<?php
   /**
   *
   * @About:      Login Model for users
   * @File:       loginModel.php
   * @Date:       2020-05-24T22:00:37
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Models;

   session_start();

   class LoginModel
   {
       private $conn;

       public function __construct()
       {
           $this->conn = new \Ajepp\DB\crudDb();
       }

       public function uerLogin($data)
       {
            $login = $this->conn->query("SELECT * FROM login lg INNER JOIN personal_ajepp pa ON pa.id = lg.personal_ajepp_id INNER JOIN cargo_personal cp ON pa.id = cp.personal_ajepp_id WHERE lg.usuario = '".$data->usuario."'");

           if($login->result->num_rows > 0)
           {
                $user = $login->result->fetch_object();

                if(password_verify($data->contrasenia, $user->contrasenia))
                {
                    $_SESSION['user'] = $user;

                    $resp = array('login' => 'ok', 'name' => $user->per_nombre.' '.$user->per_apellido, 'message' => 'yes');
                }
                else
                {
                    $resp = array('login' => 'no', 'name' => null, 'message' => 'pass');
                }
           }
           else
           {
                $resp = array('login' => 'no', 'name' => $data[0]->usuario, 'message' => 'no');
           } 

           return $resp;
       }
   }

?>

<?php
   /**
    *
    * @About:      cargo for all modules
    * @File:       cargo.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/

   namespace Ajepp\Requests;
   require_once "../config.php";

   // error_reporting(E_ALL);
   // ini_set('display_errors', '1');
   

   use Ajepp\Controllers\cargoController as ustrl;

   use Ajepp\Functions\formDecode as frm;

   $controller = new ustrl();
   // $userModel = new usmd();
   $decode = new frm();
   
   switch($_POST['type'])
   {

      case 'new_cargo':

         $form = $decode->getFormData($_POST['data']);
         $cargo = $controller->addCargo($form);

      break;

      case 'get_cargo':
         
         $edit = $controller->getCargo($_POST['id']);
         
         if($edit->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'Cargo no encontrada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'Cargo encontrada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      //   echo $edit;
      break;

      case 'edit_cargo':
         
         $form = $decode->getFormData($_POST['data']);
         $cargo = $controller->editCargo($form);
      break;

      case 'delete_cargo':
         
         $delete = $controller->deleteCargo($_POST['id']);
         
         if($delete->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'Cargo no eliminada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'Cargo eliminada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      break;


   }
   

?>

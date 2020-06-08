<?php
   /**
    *
    * @About:      marca for all modules
    * @File:       marca.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Marlon Anthony Bendliss Chávez. (anthonybendliss7@gmail.com)
    **/

   namespace Ajepp\Requests;
   require_once "../config.php";

   // error_reporting(E_ALL);
   // ini_set('display_errors', '1');
   

   use Ajepp\Controllers\marcaController as ustrl;

   use Ajepp\Functions\formDecode as frm;

   $controller = new ustrl();
   // $userModel = new usmd();
   $decode = new frm();
   
   switch($_POST['type'])
   {

      case 'new_marca':

         $form = $decode->getFormData($_POST['data']);
         $mar = $controller->addMarca($form);

      break;

      case 'get_marca':
         
         $edit = $controller->getMarca($_POST['id']);
         
         if($edit->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'marca no encontrada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'marca encontrada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      //   echo $edit;
      break;

      case 'edit_marca':
         
         $form = $decode->getFormData($_POST['data']);
         $mar = $controller->editMarca($form);
      break;

      case 'delete_marca':
         
         $delete = $controller->deleteMarca($_POST['id']);
         
         if($delete->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'marca no eliminada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'marca eliminada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      break;


   }
   

?>

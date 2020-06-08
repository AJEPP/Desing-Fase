<?php
   /**
    *
    * @About:      facultad for all modules
    * @File:       facultad.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Marlon Anthony Bendliss Chávez. (anthonybendliss7@gmail.com)
    **/

   namespace Ajepp\Requests;
   require_once "../config.php";

   error_reporting(E_ALL);
   ini_set('display_errors', '1');
   

   use Ajepp\Controllers\departamentoController as ustrl;

   use Ajepp\Functions\formDecode as frm;

   $controller = new ustrl();
   // $userModel = new usmd();
   $decode = new frm();
   
   switch($_POST['type'])
   {

      case 'new_departamento':

        $form = $decode->getFormData($_POST['data']);
        $depa = $controller->addDepartamento($form);

      break;

      case 'get_departamento':
         
         $edit = $controller->getDepartamento($_POST['id']);
         
         if($edit->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'departamento no encontrada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'departamento encontrada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      //   echo $edit;
      break;

      case 'edit_departamento':
         
         $form = $decode->getFormData($_POST['data']);
         $depa = $controller->editDepartamento($form);
      break;

      case 'delete_departamento':
         
         $delete = $controller->deleteDepartamento($_POST['id']);
         
         if($delete->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'departamento no eliminada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'departamento eliminada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      break;

   }
   

?>

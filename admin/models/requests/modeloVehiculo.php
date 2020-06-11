<?php
   /**
    *
    * @About:      facultad for all modules
    * @File:       facultad.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
    **/

   namespace Ajepp\Requests;
   require_once "../config.php";

   error_reporting(E_ALL);
   ini_set('display_errors', '1');
   

   use Ajepp\Controllers\modeloVehiculoController as ustrl;

   use Ajepp\Functions\formDecode as frm;

   $controller = new ustrl();
   // $userModel = new usmd();
   $decode = new frm();
   
   switch($_POST['type'])
   {

      case 'new_modeloVehiculo':

        $form = $decode->getFormData($_POST['data']);
        $depa = $controller->addModeloVehiculo($form);

      break;

      case 'get_modeloVehiculo':
         
         $edit = $controller->getModeloVehiculo($_POST['id']);
         
         if($edit->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'modelo Vehiculo no encontrada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'modelo Vehiculo encontrada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      //   echo $edit;
      break;

      case 'edit_modeloVehiculo':
         
         $form = $decode->getFormData($_POST['data']);
         $depa = $controller->editmodeloVehiculo($form);
      break;

      case 'delete_modeloVehiculo':
         
         $delete = $controller->deleteModeloVehiculo($_POST['id']);
         
         if($delete->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'modelo Vehiculo no eliminada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'modelo Vehiculo eliminada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      break;

   }
   

?>

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
   

   use Ajepp\Controllers\piezasVehiculoController as ustrl;

   use Ajepp\Functions\formDecode as frm;

   $controller = new ustrl();
   // $userModel = new usmd();
   $decode = new frm();
   
   switch($_POST['type'])
   {

      case 'new_piezaVehiculo':

        $form = $decode->getFormData($_POST['data']);
        $pieVe = $controller->addPiezasVehiculo($form);

      break;

      case 'get_piezasVehiculo':
         
         $edit = $controller->getPiezasVehiculo($_POST['id']);
         
         if($edit->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'Piezas Vehiculo no encontrada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'Piezas Vehiculo encontrada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      //   echo $edit;
      break;

      case 'edit_piezaVehiculo':
         
         $form = $decode->getFormData($_POST['data']);
         $pieVe = $controller->editPiezasVehiculo($form);
      break;

      case 'delete_piezaVehiculo':
         
         $delete = $controller->deletePiezasVehiculo($_POST['id']);
         
         if($delete->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'Piezas Vehiculo no eliminada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'Piezas Vehiculo eliminada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      break;

   }
   

?>

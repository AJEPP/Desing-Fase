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
   

   use Ajepp\Controllers\tipoVehiculoController as ustrl;

   use Ajepp\Functions\formDecode as frm;

   $controller = new ustrl();
   // $userModel = new usmd();
   $decode = new frm();
   
   switch($_POST['type'])
   {

      case 'new_tipoVehiculo':

        $form = $decode->getFormData($_POST['data']);
        $tipo = $controller->addTipoVehiculo($form);

      break;

      case 'get_tipoVehiculo':
         
         $edit = $controller->getTipoVehiculo($_POST['id']);
         
         if($edit->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'Tipo ehiculo no encontrada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'Tipo Vehiculo encontrada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      //   echo $edit;
      break;

      case 'edit_tipoVehiculo':
         
         $form = $decode->getFormData($_POST['data']);
         $tipo = $controller->editTipoVehiculo($form);
      break;

      case 'delete_tipoVehiculo':
         
         $delete = $controller->deleteTipoVehiculo($_POST['id']);
         
         if($delete->error == true)
         {
            $resp = (object) array('error' => true, 'message' => 'Tipo Vehiculo no eliminada', 'data' => null);
         }
         else
         {
            $resp = (object) array('error' => false, 'message' => 'Tipo Vehiculo eliminada', 'data' => $edit->data);
         }

         echo json_encode($resp);
      break;

   }
   

?>

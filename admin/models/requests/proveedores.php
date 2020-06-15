<?php
   /**
    *
    * @About:      proveedores for all modules
    * @File:       proveedores.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
    **/

   namespace Ajepp\Requests;
   require_once "../config.php";

   error_reporting(E_ALL);
   ini_set('display_errors', '1');
   

   use Ajepp\Controllers\proveedoresController as ustrl;

   use Ajepp\Functions\formDecode as frm;

   $controller = new ustrl();
   // $userModel = new usmd();
   $decode = new frm();
   
   switch($_POST['type'])
   {

      case 'new_proveedores':

        $form = $decode->getFormData($_POST['data']);
        $pro = $controller->addProveedores($form);

      break;

      case 'get_proveedores':
         
        $edit = $controller->getproveedores($_POST['id']);
        
        if($edit->error == true)
        {
            $resp = (object) array('error' => true, 'message' => 'proveedor no encontrado', 'data' => null);
        }
        else
        {
            $resp = (object) array('error' => false, 'message' => 'proveedor encontrado', 'data' => $edit->data);
        }

        echo json_encode($resp);
        // echo $edit;
      break;

      case 'edit_proveedores':
         
        $form = $decode->getFormData($_POST['data']);
        $pro = $controller->editProveedores($form);
     break;

     case 'delete_proveedores':
        
        $delete = $controller->deleteProveedores($_POST['id']);
        
        if($delete->error == true)
        {
           $resp = (object) array('error' => true, 'message' => 'proveedores no eliminado', 'data' => null);
        }
        else
        {
           $resp = (object) array('error' => false, 'message' => 'proveedores eliminado', 'data' => $edit->data);
        }

        echo json_encode($resp);
     break;
   }

?>

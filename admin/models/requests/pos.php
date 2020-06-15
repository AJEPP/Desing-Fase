<?php
   /**
   *
   * @About:      File for POS requests
   * @File:       pos.php
   * @Date:       2020-06-10T21:51:22
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Requests;

   use Ajepp\Controllers\posController as ctrl;
   use Ajepp\Functions\formDecode as decode;
   use Ajepp\Controllers\clientesController as clientes;
   use Ajepp\Utils\cliente as ucliente;
   require_once "../config.php";

   $pos = new ctrl();
   $form = new decode();
   $clients = new clientes();
   $utils = new ucliente();

   switch($_REQUEST['type'])
   {
      case 'initial_data':

         $products = $pos->getProductsList();

         $resp = (object) array('products' => $products);
         echo json_encode($resp);

      break;

      case 'save_client':

         $data = $form->getFormData($_POST['data']);

         $new = $clients->saveClient($data);

         $lista = $utils->getClienteSelect();

         $resp = (object) array('insert' => $new, 'clients' => $lista);

         echo json_encode($resp);
      break;
   }
?>
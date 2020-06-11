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

   $pos = new ctrl();

   switch($_REQUEST['type'])
   {
      case 'product_autocomplete':

         $products = $pos->getProductsList();

         echo json_encode($products);

      break;
   }
?>
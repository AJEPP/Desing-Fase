<?php
   /**
   *
   * @About:      POS Controller
   * @File:       posController.php
   * @Date:       2020-06-10T21:54:25
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Controllers;

   use Ajepp\Models\posModel as model;

   class PosController
   {
        private $model;

        public function __construct()
        {
            $this->model = new model();
        }

        public function getProductsList()
        {
            $products = $this->model->getProducts();

            $list = array();

            while($product = $products->fetch_object())
            {
                array_push($list, $product);
            }

            return $list;
        }

   }
?>
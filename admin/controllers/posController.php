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
                $product->filter = $product->nombre.' - '.$product->pie_numero.' - '.$product->mod_vehiculo.' - '.$product->mod_anio.' - '.$product->marca_vehiculo;
                array_push($list, $product);
            }

            return $list;
        }

        public function getBrandsList()
        {
            $brands = $this->model->getBrands();

            $list = array();

            while($brand = $brands->fetch_object())
            {
                array_push($list, $brand);
            }

            return $list;
        }


        public function getModelsList($brand)
        {
            $models = $this->model->getModels($brand);

            $list = array();

            while($model = $models->fetch_object())
            {
                if($model->mod_img == null)
                {
                    $model->mod_img = 'http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/default_product.png';
                }

                array_push($list, $model);
            }

            return $list;
        }

        public function getProductsByModel($model)
        {
            $products = $this->model->getProductsByModel($model);

            $list = array();

            while($product = $products->fetch_object())
            {
                if($product->pie_img == null)
                {
                    $product->pie_img = 'http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/default_product.png';
                }

                $product->prod = htmlspecialchars(json_encode($product));
                $product->filter = $product->pie_nombre.' - '.$product->pie_numero.' - '.$product->mod_vehiculo.' - '.$product->mod_anio.' - '.$product->marca_vehiculo;
                array_push($list, $product);
            }

            return $list;
        }
   }
?>
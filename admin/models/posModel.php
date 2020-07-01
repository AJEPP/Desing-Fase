<?php
   /**
   *
   * @About:      Model for POS
   * @File:       posModel.php
   * @Date:       2020-06-10T21:52:16
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Models;

   use Ajepp\DB\crudDb as db;

   class PosModel
   {
       private $db;


       public function __construct()
       {
           $this->db = new db();
       }
       

       public function getProducts()
       {
          $products = $this->db->query("SELECT pv.pie_nombre as nombre,
  		pv.pie_descripcion as descripcion,
        pv.pie_numero,
        mv.mod_vehiculo,
        mv.mod_anio,
        mh.marca_vehiculo,
        (CASE WHEN ISNULL(detat.pie_precio) THEN 0 ELSE detat.pie_precio END) as precio_tienda,
        (CASE WHEN ISNULL(detat.id) THEN 0 ELSE detat.id END) as t_id,
                                            (SELECT COUNT(*) 
                                            FROM detalles_pieza_bodega 
                                            WHERE num_modelo_pieza = pv.pie_numero) 
                                        as in_were, 
                                        (SELECT COUNT(*) 
                                            FROM detalles_pieza_tienda 
                                            WHERE num_modelo_pieza = pv.pie_numero) 
                                        as in_store 
                                        FROM piezas_vehiculo pv 
                                            INNER JOIN modelo_vehiculo mv ON pv.modelo_vehiculo_id = mv.id
                                            INNER JOIN marca_vehiculo mh ON mv.marca_vehiculo_id = mh.id
                                            LEFT JOIN detalles_pieza_tienda detat ON detat.num_modelo_pieza = pv.pie_numero
                                        WHERE 1");

          return $products->result;
       }

       public function getBrands()
       {
           $brands = $this->db->query("SELECT * FROM `marca_vehiculo` WHERE 1");
           
           return $brands->result;
       }

       public function getModels($brand)
       {
           $models = $this->db->query("SELECT * FROM `modelo_vehiculo` WHERE `marca_vehiculo_id` = ".$brand);

           return $models->result;
       }

       public function getProductsByModel($model)
       {
        $products = $this->db->query("SELECT *, 
                                        (SELECT COUNT(*) 
                                        FROM detalles_pieza_bodega 
                                        WHERE piezas_vehiculo_id = pv.id) 
                                    as in_were, 
                                    (SELECT COUNT(*) 
                                        FROM detalles_pieza_tienda 
                                        WHERE piezas_vehiculo_id = pv.id) 
                                    as in_store 
                                    FROM piezas_vehiculo pv 
                                        INNER JOIN modelo_vehiculo mv ON pv.modelo_vehiculo_id = mv.id
                                        INNER JOIN marca_vehiculo mh ON mv.marca_vehiculo_id = mh.id
                                    WHERE pv.modelo_vehiculo_id = ".$model);

            return $products->result;
       }
   }
?>
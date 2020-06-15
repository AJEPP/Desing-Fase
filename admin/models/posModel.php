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
          $products = $this->db->query("SELECT pv.*, 
                                        (SELECT COUNT(*) 
                                            FROM detalles_pieza_bodega 
                                            WHERE piezas_vehiculo_id = pv.id) 
                                        as in_were, 
                                        (SELECT COUNT(*) 
                                            FROM detalles_pieza_tienda 
                                            WHERE piezas_vehiculo_id = pv.id) 
                                        as in_store 
                                        FROM piezas_vehiculo pv 
                                        WHERE 1");

          return $products->result;
       }
   }
?>
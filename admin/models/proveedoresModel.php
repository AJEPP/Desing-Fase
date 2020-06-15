<?php
   /**
   *
   * @About:      Model of providers
   * @File:       proveedoresModel.php
   * @Date:       2020-06-14T13:41:30
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/


   namespace Ajepp\Models;

   use Ajepp\DB\crudDb as db;

   class ProveedoresModel
   {
        private $db;

        public function __construct()
        {
            $this->db = new db();
        }

        public function getProviders()
        {
            $providers = $this->db->query("SELECT * FROM proveedor pv LEFT JOIN contacto_proveedor cp ON cp.proveedor_id = pv.id WHERE 1");

            return $providers->result;
        }
   }
?>
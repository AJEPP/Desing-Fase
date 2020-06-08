<?php
   /**
   *
   * @About:      Model for show System Menu
   * @File:       menuModel.php
   * @Date:       2020-06-06T16:51:34
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Models;

   use Ajepp\DB\CrudDb as db;

   class MenuModel
   {
        private $db;


        public function __construct()
        {
            $this->db = new db();
        }

        public function getMenu()
        {
            $menu = $this->db->query("SELECT * FROM menu WHERE estado = 'on'");

            return $menu->result;
        }
   }
?>
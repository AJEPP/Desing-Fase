<?php
namespace Ajepp\Models;

use Ajepp\DB\crudDb as crud;
use Ajepp\Functions\dateDecode as dt;

date_default_timezone_set("America/Managua");

class CompraModel
{
  private $bd;
  public function __construct(){
      $this->bd = new crud();
      $this->date_d = new dt();
  }

  public function getArticulosBodega()
  {
    $articulos = $this->bd->query("SELECT
                                  `id`,`pie_serie`,
                                  `pie_precio_venta`,`pie_precio_compra`,
                                  `pie_fecha_ingreso`,`pie_detalle`,
                                  `pie_cantidad`,`num_modelo_pieza`
                                  FROM `detalles_pieza_bodega`");

    return $articulos;
  }

  public function getCompraPieza($id)
  {
    $articulo = $this->bd->query("SELECT DISTINCT
                                  `bod`.`id`,`pie_serie`,
                                  `pie_precio_venta`,`pie_precio_compra`,
                                  `pie_fecha_ingreso`,`bod`.`pie_detalle`,
                                  `pie_cantidad`,`num_modelo_pieza`,
                                  `veh`.`pie_nombre`
                                  FROM `detalles_pieza_bodega` as `bod`
                                  INNER JOIN `piezas_vehiculo` as `veh` on `bod`.`num_modelo_pieza` = `veh`.`pie_numero`
                                  WHERE `bod`.`id`= ".$id."");
    return $articulo;
  }

  public function updateCompraPieza($data){
    $fecha = $this->date_d->decodeFecha($data->fecha_compra);
    if($data->modelo_compra_nuevo == '0')
    {
      $modelo = $data->modelo_compra;
    }
    else {
      $modelo = $data->modelo_compra_nuevo;
    }
    $update_compra = $this->bd->query("UPDATE `detalles_pieza_bodega` SET
                                      `pie_serie`='".$data->num_serie."',`pie_precio_venta`=".$data->venta_precio.",
                                      `pie_precio_compra`=".$data->compra_precio.", `pie_fecha_ingreso`='".$fecha."',
                                      `pie_detalle`='".$data->detalle_pieza."',`pie_cantidad`=".$data->cantidad_pieza.",
                                      `num_modelo_pieza`='".$modelo."'
                                      WHERE `id`=".$data->id_compra."");
    return $update_compra;
  }

  public function deleteCompraPieza($id){
    $delete_compra = $this->bd->query("DELETE FROM `detalles_pieza_bodega` WHERE id=".$id."");
    return $delete_compra;
  }

  public function enviarPiezaTienda($data, $existen_tienda){
    session_start();
    //Restas cantidad existen en bodega, con cantidad Enviado a Tienda
    $cantidad_en_bodega = $data->cantidad_bodega - $data->cantidad_enviar;
    //Datos para Validar Items de Tienda - Bodega
    $id_tienda = 0;
    $cantidad_tienda = 0;
    $cantidad_nueva = 0;
    if($existen_tienda->result->num_rows > 0)
    {
      while($existe = $existen_tienda->result->fetch_object()){
        $id_tienda = $existe->id;
        $cantidad_tienda = $existe->pie_cantidad;
      }
      $cantidad_nueva = $cantidad_tienda + $data->cantidad_enviar;
      $result = $this->bd->query("UPDATE `detalles_pieza_tienda` SET
                                  `pie_cantidad`=".$cantidad_nueva." WHERE id=".$id_tienda."");
    }
    //
    else{
    $result = $this->bd->query("INSERT INTO `detalles_pieza_tienda`
                                (`id`,`pie_serie`,`pie_precio`,`pie_detalles`,`pie_cantidad`,`num_modelo_pieza`)
                                VALUES (".$data->enviar_id.",'".$data->numero_serie."',".$data->precio_tienda.",
                                        '".$data->detalles_b."', ".$data->cantidad_enviar.",
                                        '".$data->num_modelo_enviar."')");

      }
    $update_bodega_cantidad = $this->bd->query("UPDATE `detalles_pieza_bodega`
                                                SET `pie_cantidad`=".$cantidad_en_bodega."
                                                WHERE id=".$data->enviar_id."");

    $fecha_enviado = date('Y-m-d h:i:s');
    $personal_id = $_SESSION['user']->personal_ajepp_id;
    $insert_bodega_tienda = $this->bd->query("INSERT INTO `bodega_tienda`
                                              (`fecha_salida`,`cantidad`,`detalle`,`fecha_ingreso`,`detalles_pieza_tienda_id`,`detalles_pieza_bodega_id`,`personal_ajepp_id`)
                                              VALUES ('".$fecha_enviado."', ".$data->cantidad_enviar.",
                                                      '".$data->detalles_b."', '".$fecha_enviado."',
                                                      ".$data->enviar_id.", ".$data->enviar_id.", ".$personal_id.")");
   return $result;

  }
  public function getPiezasTiendaIgual($data){
    $tienda = $this->bd->query("SELECT `id`, `pie_cantidad`  FROM
                              `detalles_pieza_tienda` WHERE `id`=".$data->enviar_id."");

    return $tienda;
  }

  public function addCompraBodega($data){
    $fecha_compra = date('Y-m-d h:i:s');
    $compra = $this->bd->query("INSERT INTO `detalles_pieza_bodega`
                                (`pie_serie`,`pie_precio_venta`,
                                `pie_precio_compra`,`pie_fecha_ingreso`,
                                `pie_detalle`,`pie_cantidad`,`num_modelo_pieza`)
                                VALUES ('".$data->numero_serie_compra."',".$data->precio_tienda_compra.",
                                        ".$data->precio_bodega_compra.",'".$fecha_compra."',
                                        '".$data->detalles_compra."',".$data->cantidad_bodega_compra.",
                                        '".$data->compra_pieza_modelo."')");
    return $compra;
  }

  public function getAutosCompatibles($model){
    $compatible = $this->bd->query("SELECT
                                        mo.mod_vehiculo,
                                        mo.mod_anio,
                                        mar.marca_vehiculo
                                    FROM
                                        `modelo_vehiculo` AS mo
                                    INNER JOIN `piezas_vehiculo` AS pie
                                    ON
                                        mo.id = pie.modelo_vehiculo_id
                                    INNER JOIN `marca_vehiculo` as mar
                                    ON
                                    	mar.id = mo.marca_vehiculo_id
                                    WHERE
                                    	pie.pie_numero='".$model."'; ");
  return $compatible;
  }
}
 ?>

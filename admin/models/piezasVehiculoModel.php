<?php
     /**
    *
    * @About:      departamentodModel for all modules
    * @File:       departamentodModel.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/
  namespace Ajepp\Models;

  use Ajepp\DB\crudDb as crud;
  class PiezasVehiculoModel
  {
    private $bd;
    public function __construct()
    {
        $this->bd = new crud();
    }

    public function getPiezasVehiculos()
    {
        $pieza = $this->bd->query("SELECT pi.*, mo.mod_vehiculo AS mod_vehiculo, cl.pi_nombre AS pie_clasi FROM `piezas_vehiculo` pi INNER JOIN modelo_vehiculo mo ON mo.id = pi.modelo_vehiculo_id INNER JOIN clasificacion_pieza cl ON cl.id = pi.clasificacion_pieza_id WHERE 1 ORDER BY id DESC");

        return $pieza;
    }

    public function addPiezasVehiculo($data)
    {
        $pieza = $this->bd->query("INSERT INTO `piezas_vehiculo`(`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`) VALUES ('".$data->modelo_vehiculo_id."','".$data->clasificacion_pieza_id."','".$data->pie_nombre."','".$data->pie_descripcion."')");

        // echo "INSERT INTO `piezas_vehiculo`(`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`) VALUES ('".$data->modelo_vehiculo_id."','".$data->clasificacion_pieza_id."','".$data->pie_nombre."','".$data->pie_descripcion."')";
    }

    public function getPiezasVehiculo($id)
    {
        $pieza = $this->bd->query("SELECT * FROM `piezas_vehiculo` WHERE id = ".$id);
        return $pieza;
        // $sql = "SELECT * FROM `departamento_ajepp` WHERE id = ".$id;
        // return $sql;
    }

    public function getPiezasVehiculoFiltro($marca, $modelo, $fechas, $motor, $clas)
    {
        $fecha = explode("-", $fechas);
        //$pieza = $this->bd->query("SELECT DISTINCT `pie_nombre` from `piezas_vehiculo` WHERE piezas_vehiculo.clasificacion_pieza_id=".$clas);
      $pieza = $this->bd->query("SELECT DISTINCT `pie_nombre` from `piezas_vehiculo` inner join `clasificacion_pieza` on piezas_vehiculo.clasificacion_pieza_id = clasificacion_pieza.id
                                    inner join `modelo_vehiculo` on modelo_vehiculo.id = piezas_vehiculo.modelo_vehiculo_id inner join marca_vehiculo on
                                    marca_vehiculo.id = modelo_vehiculo.marca_vehiculo_id where marca_vehiculo.id =".$marca." AND modelo_vehiculo.mod_vehiculo='".$modelo."' AND
                                    modelo_vehiculo.mod_anio ='".$fecha[0]."' and modelo_vehiculo.mod_anio_termina='".$fecha[1]."' and modelo_vehiculo.mob_motor_tam ='".$motor."' and clasificacion_pieza.id=".$clas);
        return $pieza;
        // $sql = "SELECT * FROM `departamento_ajepp` WHERE id = ".$id;
        // return $sql;
    }

    public function getPiezasVehiculoEspecifi($marca, $modelo, $fechas, $motor, $clas, $nombre, $num_motor, $chasis)
    {
        $fecha = explode("-", $fechas);
        $sql = "SELECT
                        pv.pie_nombre as nombre,
                        pv.pie_descripcion as descripcion,
                        detat.pie_precio as precio_tienda,
                        detat.id as t_id
                    FROM
                        `piezas_vehiculo` as pv
                    INNER JOIN `clasificacion_pieza` ON pv.clasificacion_pieza_id = clasificacion_pieza.id
                    INNER JOIN `modelo_vehiculo` ON modelo_vehiculo.id = pv.modelo_vehiculo_id
                    INNER JOIN marca_vehiculo ON marca_vehiculo.id = modelo_vehiculo.marca_vehiculo_id
                    INNER JOIN `detalles_pieza_tienda` as detat on pv.pie_numero = detat.num_modelo_pieza
                    WHERE ";
        if($num_motor == 'null' && $chasis != 'null'){
          $sql .= " marca_vehiculo.id = ".$marca." AND modelo_vehiculo.mod_vehiculo ='".$modelo."' AND modelo_vehiculo.mod_anio = '".$fecha[0]."' AND modelo_vehiculo.mod_anio_termina = '".$fecha[1]."' AND modelo_vehiculo.mob_motor_tam = '".$motor."' AND clasificacion_pieza.id = ".$clas." AND pv.pie_nombre = '".$nombre."'";
        }

        elseif(($num_motor != 'null' && $chasis == 'null'))
        {
          $sql .= " marca_vehiculo.id = ".$marca." AND modelo_vehiculo.mod_vehiculo ='".$modelo."' AND modelo_vehiculo.mod_anio = '".$fecha[0]."' AND modelo_vehiculo.mod_anio_termina = '".$fecha[1]."' AND modelo_vehiculo.mob_motor_tam = '".$motor."' AND clasificacion_pieza.id = ".$clas." AND pv.pie_nombre = '".$nombre."'";
        }
        elseif($num_motor != 'null' && $chasis != 'null')
        {
          $sql .= " marca_vehiculo.id = ".$marca." AND modelo_vehiculo.mod_vehiculo ='".$modelo."' AND modelo_vehiculo.mod_anio = '".$fecha[0]."' AND modelo_vehiculo.mod_anio_termina = '".$fecha[1]."' AND modelo_vehiculo.mob_motor_tam = '".$motor."' AND clasificacion_pieza.id = ".$clas." AND pv.pie_nombre = '".$nombre."'";
        }
        else{
            $sql .= " marca_vehiculo.id = ".$marca." AND modelo_vehiculo.mod_vehiculo ='".$modelo."' AND modelo_vehiculo.mod_anio = '".$fecha[0]."' AND modelo_vehiculo.mod_anio_termina = '".$fecha[1]."' AND modelo_vehiculo.mob_motor_tam = '".$motor."' AND clasificacion_pieza.id = ".$clas." AND pv.pie_nombre = '".$nombre."'";
        }
        //$pieza = $this->bd->query("SELECT DISTINCT `pie_nombre` from `piezas_vehiculo` WHERE piezas_vehiculo.clasificacion_pieza_id=".$clas);
        $pieza = $this->bd->query($sql);
        return $pieza;
        // $sql = "SELECT * FROM `departamento_ajepp` WHERE id = ".$id;
        // return $sql;
    }

    public function editPiezasVehiculo($data)
    {

        $pieza = $this->bd->query("UPDATE `piezas_vehiculo` SET `modelo_vehiculo_id`='".$data->modelo_vehiculo_id."', `clasificacion_pieza_id`='".$data->clasificacion_pieza_id."',`pie_nombre`='".$data->pie_nombre."',  `pie_descripcion`='".$data->pie_descripcion."' WHERE id = ".$data->id);
        //   echo "UPDATE `Departamento_vehiculo` SET `nombre`='".$data->nombre."',`id`='".$data->id."' WHERE id = ".$data->id;
    }

    public function deletePiezasVehiculo($id)
    {
        $pieza = $this->bd->query("DELETE FROM `piezas_vehiculo` WHERE id = ".$id);
        //echo "DELETE FROM `depca_vehiculo` WHERE id = ".$id;

        return $pieza;
    }

  }
?>

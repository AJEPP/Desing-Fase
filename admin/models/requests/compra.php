<?php
namespace Ajepp\Requests;
require_once "../config.php";
use Ajepp\Controllers\compraPiezasController as compra;
use Ajepp\Functions\formDecode as frm;

$decode = new frm();
$controller = new compra();

switch($_POST['type'])
{
  case 'getCompraPieza':

  $pieza = $controller->getCompraPieza($_POST['id']);
  if($pieza->error == true)
  {
     $resp = (object) array('error' => true, 'message' => 'Piezas Vehiculo no encontrada', 'data' => null);
  }
  else
  {
     $resp = (object) array('error' => false, 'message' => 'Piezas Vehiculo encontrada', 'data' => $pieza->data);
  }

  echo json_encode($resp);
  break;

  case 'updateCompraPieza':
  $form = $decode->getFormData($_POST['compra']);
  $datos = $controller->updateCompraPieza($form);
  if($datos->error == true)
  {
     $resp = (object) array('error' => true, 'message' => 'Piezas Vehiculo no encontrada', 'data' => null);
  }
  else
  {
     $resp = (object) array('error' => false, 'message' => 'Piezas Vehiculo encontrada', 'data' => $datos->data);
  }

  echo json_encode($resp);
  break;

  case 'deleteCompra':
  $datos = $controller->deleteCompraPieza($_POST['id']);
  if($datos->error == true)
  {
     $resp = (object) array('error' => true, 'message' => 'Compra no Eliminada', 'data' => null);
  }
  else
  {
     $resp = (object) array('error' => false, 'message' => 'Compra Elimada!', 'data' => $datos->data);
  }

  echo json_encode($resp);
  break;

  case 'enviarPiezaTienda':
  $form = $decode->getFormData($_POST['datos']);
  $datos = $controller->enviarPiezaTienda($form);

  if($datos->error == true)
  {
     $resp = (object) array('error' => true, 'message' => 'No Enviado', 'data' => null);
  }
  else
  {
     $resp = (object) array('error' => false, 'message' => 'Enviado!', 'data' => $datos->data);
  }

  echo json_encode($resp);
  break;

  case 'addCompraBodega':
  $form = $decode->getFormData($_POST['data']);
  $datos = $controller->addCompraBodega($form);
  if($datos->error == true)
  {
     $resp = (object) array('error' => true, 'message' => 'No Enviado', 'data' => null);
  }
  else
  {
     $resp = (object) array('error' => false, 'message' => 'Enviado!', 'data' => $datos->data);
  }

  echo json_encode($resp);
  break;

  case 'getAutosCompatibles':
    $datos = $controller->getAutosCompatibles($_POST['model']);
    if($datos->error == true)
    {
       $resp = (object) array('error' => true, 'message' => 'No Enviado', 'data' => null);
    }
    else
    {
       $resp = (object) array('error' => false, 'message' => 'Enviado!', 'data' => $datos->data);
    }

    echo json_encode($resp);
  break;
}
 ?>

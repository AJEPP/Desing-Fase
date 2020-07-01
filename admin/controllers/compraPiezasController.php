<?php


  namespace Ajepp\Controllers;

  use Ajepp\Models\compraModel as compraModel;

  class CompraPiezasController{
    private $model;

    public function __construct(){
      $this->model = new compraModel();
    }

    public function getComprasPiezas()
    {
      $compras = $this->model->getArticulosBodega();
      $lista ='';
      $counter = 1;
      if($compras->result->num_rows > 0){
      while($compra = $compras->result->fetch_object())
      {
        $lista .= '<tr>
                  <td>'.$counter.'</td>
                  <td>'.$compra->num_modelo_pieza.'</td>
                  <td>'.$compra->pie_serie.'</td>
                  <td>'.$compra->pie_precio_compra.' C$</td>
                  <td>'.$compra->pie_precio_venta.' C$</td>
                  <td>'.$compra->pie_fecha_ingreso.'</td>
                  <td>'.$compra->pie_detalle.'</td>
                  <td>'.$compra->pie_cantidad.'</td>
                  <td class = "">
                    <a class ="text-warning edit_compra" href="#" data-id = "'.$compra->id.'"><i class="fas fa-edit"></i></a>
                    <a class ="text-danger delete_compra" href="#" data-id = "'.$compra->id.'"><i class="fas fa-trash"></i></a>
                  </td>
                  <td><a class="text-success pieza_enviar" href="#" data-id="'.$compra->id.'" data-pieza="'.$compra->num_modelo_pieza.'"><i class="fas fa-server fa-lg"></i></a></td>
                  </tr>';

        $counter++;
      }
    }
      echo $lista;
    }

    public function getcompraPieza($id)
      {
         $com = $this->model->getcompraPieza($id);
         if($com->result->num_rows > 0 )
         {
            $rsp = (object) array('error' => false, 'data' => $com->result->fetch_object());
         }
         else
         {
            $rsp = (object) array('error' => true, 'data' => null);
         }
         return $rsp;
      }

    public function updatecompraPieza($form)
    {
      $update = $this->model->updatecompraPieza($form);

      if($update)
      {
        $rsp = (object) array('error' => false, 'data' => 'OK');
      }
      else{
        $rsp = (object) array('error' => true, 'data' => null);
      }
      return $rsp;
    }

    public function deletecompraPieza($id){
      $delete = $this->model->deletecompraPieza($id);
      if($delete)
      {
        $rsp = (object) array('error' => false, 'data' => 'OK');
      }
      else{
        $rsp = (object) array('error' => true, 'data' => null);
      }
      return $rsp;
    }

    public function enviarpiezaTienda($data){
      $existen_tienda = $this->model->getpiezasTiendaIgual($data);
      $enviar = $this->model->enviarpiezaTienda($data, $existen_tienda);

      if($enviar){
        $rsp = (object) array('error' => false, 'data' => 'OK');
      }
      else{
        $rsp = (object) array('error' => true, 'data' => null);
      }
      return $rsp;
    }

    public function addcompraBodega($data){
      $guardar = $this->model->addcompraBodega($data);
      if($guardar){
        $rsp = (object) array('error' => false, 'data' => 'OK');
      }
      else{
        $rsp = (object) array('error' => true, 'data' => null);
      }
      return $rsp;
    }

    public function getautosCompatibles($model)
    {
      $modelos = $this->model->getautosCompatibles($model);
      if($modelos->result->num_rows > 0 )
      {
         $rsp = (object) array('error' => false, 'data' => $modelos->result->fetch_object());
      }
      else
      {
         $rsp = (object) array('error' => true, 'data' => null);
      }
      return $rsp;
    }
  }
 ?>

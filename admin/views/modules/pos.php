<?php
   /**
   *
   * @About:      POS view module
   * @File:       pos.php
   * @Date:       2020-06-10T19:34:15
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

    namespace Ajepp;

    use Ajepp\Controllers\posController as ctrl;
    use Ajepp\Utils\cliente as cliente;
    $pos = new ctrl();
    $cliente = new cliente();

    use Ajepp\Utils\modeloVehiculo as model;
    use Ajepp\Utils\marcaVehiculo as marca;
    use Ajepp\Utils\clasificacionPieza as clasi;
    use Ajepp\Controllers\piezasVehiculoController as controller;
    use Ajepp\Models\piezasVehiculoModel as usmd;

    $mod = new model();
    $mar = new marca();
    $cla = new clasi();
    $ctr = new controller();
    $depar = new usmd();
?>

<div class="container-fluid">
    <!-- <h3 class="text-dark mb-4">Ventas</h3> -->
    <div class="row justify-content-end">

      <div class="col-md-4 text-right">
        <button class="btn btn-info" id="buscarpiezaVehiculoModal" data-toggle="modal" data-target=".buscar_pieza"><i class="fas fa-plus"></i> Buscar Pieza</button>
      </div>

    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body">
                    <div class="input-group input-group-sm mb-3">
                        <select class="chosen-select form-control" name="client" id="client" data-placeholder="Cliente">
                            <?php echo $cliente->getClienteSelect(); ?>
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-success" id="new_client"><i class="fas fa-plus"></i></button>
                        </div>
                    </div>
                    <div class="input-group input-group-sm mb-3">
                        <input type="text" class="form-control" placeholder="Nota de referencia">
                    </div>
                    <div class="input-group input-group-sm mb-3">
                        <input type="text" class="form-control" placeholder="Producto" id="product">
                    </div>
                    <div class="table-responsive" style="height: 30vh;">
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th style="width: 35%;">Producto</th>
                                    <th style="width: 20%;">Precio</th>
                                    <th style="width: 10%;">Cant</th>
                                    <th style="width: 20%;">Subtotal</th>
                                    <th style="width: 5%; text-align: right;"><i class="fas fa-trash"></i></th>
                                </tr>
                            </thead>
                            <tbody id="product_list"></tbody>
                        </table>
                    </div>
                    <div class="mb-3">
                        <table class="table table-sm">
                            <tbody>
                                <tr class="table-primary">
                                    <td>Total de Items</td>
                                    <td>0</td>
                                    <td>Total</td>
                                    <td style="width: 5%; text-align: right;">0.00</td>
                                </tr>
                                <tr class="table-primary">
                                    <td>Descuento</td>
                                    <td>0</td>
                                    <td>Impuesto</td>
                                    <td style="width: 5%; text-align: right;">0.00</td>
                                </tr>
                                <tr class="table-success">
                                    <td colspan="2"><b>Total a pagar</b></td>
                                    <td colspan="2" style="width: 5%; text-align: right;"><b>0.00</b></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="mb-3">
                        <div class="row">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-danger btn-sm btn-block">Cancelar</button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-success btn-sm btn-block">Pagar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8 item-list"
              <div class="slimScrollDiv" style="position: relative; overflow-y: auto; width: auto; height: 530px;">
              <div class="items" style="overflow: auto; width: auto; height: 100%;">
                  <div style="text-align: center;">
                    <div class="" id="addProductos">

                    </div>
                      </div>
                  </div>
              </div>
          </div>
      <!--  <div class="col-md-8 item-list"
            <div class="slimScrollDiv" style="position: relative; overflow-y: auto; width: auto; height: 530px;">
            <div class="items" style="overflow: auto; width: auto; height: 100%;">
                <div style="text-align: center;">
                        <?php
/*
                            $brands = $pos->getBrandsList();
                            foreach($brands as $brand)
                            {
                                echo '<button class="btn btn-both btn-flat brand" data-id = "'.$brand->id.'" data-brand = "'.htmlspecialchars(json_encode($brand)).'">
                                <span class="bg-img">';
                                    echo $brand->mar_img == null ? '<img src="http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/default_product.png" alt="'.$brand->marca_vehiculo.'" style="width: 100px; height: 100px;">' : '<img src="http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/'.$brand->mar_img.'" alt="'.$brand->marca_vehiculo.'" style="width: 100px; height: 100px;">';
                                echo '  </span>
                                    <span>
                                        <span>'.$brand->marca_vehiculo.'</span>
                                    </span>
                                </button>';
                            }*/
                        ?>
                    </div>
                </div>
            </div>
        </div>
      -->
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="newClientModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar cliente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="new_client_form">
        <div class="row">
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Nombres</label>
                  <input type="text" class="form-control" name="name">
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Apellidos</label>
                  <input type="text" class="form-control" name="last_name">
                </div>
            </div>
        </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Cédula de identidad</label>
                  <input type="text" class="form-control" name="id_card">
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Edad</label>
                  <input type="text" class="form-control" name="age">
                </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="bmd-label-floating">Género</label>
                <select name="gender" class="form-control">
                    <option value="">Seleccione</option>
                    <option value="fm">Femenino</option>
                    <option value="ms">Masculino</option>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Domicilio</label>
                  <input type="text" class="form-control" name="city">
                </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Dirección</label>
                  <input type="text" class="form-control" name="address">
                </div>
            </div>
          </div>
          <div class="row justify-content-center">
              <div class="col-md-2">
                 <button type="submit" class="btn btn-primary btn-block" id="save_client">Guardar</button>
              </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--
<div class="modal fade bd-example-modal-lg" id="productsModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Buscar productos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="carouselExampleInterval" class="carousel slide" data-ride="false">
            <div class="carousel-inner item-list">
                <div class="carousel-item active text-center">
                    <div class="spinner-border m-5" role="status" id="models_loading">
                        <span class="sr-only">Loading...</span>
                    </div>
                    <div class="slimScrollDiv hide" id="slimod" style="position: relative; overflow-y: auto; width: auto; height: 300px;">
                        <div class="items" style="overflow: auto; width: auto; height: 100%;">
                            <div style="text-align: center;" id="models_cont">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="spinner-border m-5" role="status" id="products_loading">
                        <span class="sr-only">Loading...</span>
                    </div>
                    <div class="slimScrollDiv hide" id="slimprod" style="position: relative; overflow-y: auto; width: auto; height: 300px;">
                        <div class="items" style="overflow: auto; width: auto; height: 100%;">
                            <div style="text-align: center;" id="product_cont">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
-->
<!-- Muestra los productos por el filtro-->

<div class="modal fade bd-example-modal-lg" id="productsModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Buscar productos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="carouselExampleInterval" class="carousel slide" data-ride="false">
            <div class="carousel-inner item-list">
                <div class="carousel-item">
                    <div class="spinner-border m-5" role="status" id="products_loading">
                        <span class="sr-only">Loading...</span>
                    </div>
                    <div class="slimScrollDiv hide" id="slimprod" style="position: relative; overflow-y: auto; width: auto; height: 300px;">
                        <div class="items" style="overflow: auto; width: auto; height: 100%;">
                            <div style="text-align: center;" id="product_cont">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal termina Aqui-->
<div class="modal fade bd-example-modal-lg buscar_pieza" id="BuscarPiezaVehiculo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Buscar Pieza de Vehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="buscar_piezaVehiculo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Marca Vehiculo</label>
                <select name="marca_vehiculo_id" data-placeholder="Tipo vehiculo" class="chosen-select" id="marca_vehiculo_buscar">
                    <?php $mar->getMarcavehiculo(); ?>
                </select>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Modelo vehiculo</label>
                <select name="modelo_vehiculo_id" data-placeholder="Tipo vehiculo" class="form-control" id="tipo_vehiculo_buscar">
                    <!-- <option value=""></option> -->
                    <?php //$mod->getModelovehiculo(); ?>
                </select>
              </div>
            </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Año Vehiculo</label>
                  <select name="anio_vehiculo_id" data-placeholder="Año vehiculo" class="form-control" id="anio_vehiculo_buscar">
                      <!-- <option value=""></option> -->
                      <?php //$mod->getModelovehiculo(); ?>
                  </select>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Tamaño del Motor</label>
                  <select name="tamanio_motor" data-placeholder="Año vehiculo" class="form-control" id="tam_motor_buscar">
                      <!-- <option value=""></option> -->
                      <?php //$mod->getModelovehiculo(); ?>
                  </select>
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Numero del Motor</label>
                  <input type="text" name="num_motor" placeholder="Numero del Motor" class="form-control" id="num_motor_buscar">
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Numero del Chasis</label>
                  <input type="text" name="num_chasis" placeholder="Numero del Chasis" class="form-control" id="num_chasis_buscar">

                </div>
              </div>
            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Clasificación Pieza</label>
                <select name="clasificacion_pieza_buscar" data-placeholder="Tipo vehiculo" class="chosen-select" id="clasificacion_pieza_buscar">
                    <!-- <option value=""></option> -->
                    <?php $cla->getClasificacionPieza(); ?>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Nombre pieza</label>
                  <select class="form-control" name="pie_nombre_buscar" id="pie_nombre_buscar">

                  </select>
                <!--  <input type="text" class="form-control" name="pie_nombre" id="pie_nombre_buscar"> -->
                </div>
            </div>


          </div>
          <input type="hidden" id="id_buscar" name="id">
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary buscar_pieza" id="buscar_" >Buscar</button>
          </div>
        </form>
      </div>

    </div>
  </div>
</div>

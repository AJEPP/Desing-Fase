
<?php

use Ajepp\Controllers\compraPiezasController as compra;
use Ajepp\Utils\compra as pieza;
$numero = new pieza();
$com = new compra();
 ?>
<div class="container-fluid">
    <h3 class="text-dark mb-4">PIEZAS DE VEHICULO  EN BODEGA</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE PIEZAS DE VEHICULO</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addpiezaVehiculoModal" data-toggle="modal" data-target=".addCompra"><i class="fas fa-plus"></i> Nuevo piezaVehiculo</button>
              </div>

            </div>

            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="piezasCompra_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Num. Modelo Pieza</th>
                            <th>Num-Serie</th>
                            <th>Precio Compra</th>
                            <th>Precio Venta</th>
                            <th>Fecha de Ingreso</th>
                            <th>Detalles</th>
                            <th>Cantidad Existencia</th>
                            <th>Aciones</th>
                            <th>Enviar Tienda</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $com->getComprasPiezas(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg edit_modal" id="EditpiezaCompraModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar Compra Pieza</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="edit_compraPieza">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Numero de Serie</label>
                <input type="text" name="num_serie" data-placeholder="Serie" id="num_serie" class="form-control">
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Detalle</label>
                <textarea name="detalle_pieza" data-placeholder="Detalle"  id="detalle_pieza" cols="20" rows="2" class="form-control">
                </textarea>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Precio Compra (C$)</label>
                  <input type="number" step="0.01"class="form-control" name="compra_precio" id="compra_precio">
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Precio Venta (C$)</label>
                  <input type="number" step="0.01" class="form-control" name="venta_precio" id="venta_precio">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Cantidad</label>
                  <input type="number" class="form-control" name="cantidad_pieza" id="cantidad_pieza">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Fecha de Ingreso</label>
                  <input type="text" class="form-control" name="fecha_compra" id="fecha_compra">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Modelo Actual</label>
                  <input type="text" class="form-control" name="modelo_compra" id="modelo_compra" readonly="readonly">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Modelo Nuevo Modelo</label>
                <select name="modelo_compra_nuevo" data-placeholder="Cantidad Enviar" id="modelo_compra_nuevo" class="chosen-select">
                    <?php $numero->getPiezasModelos(); ?>
                </select>
              </div>
            </div>

          </div>
          <input type="hidden" id="id_compra" name="id_compra">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="update_CompraPieza">Guardar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg buscar_pieza" id="EnviarTiendaModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Enviar Pieza a Tienda</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="enviar_PiezaTienda">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Numero Serie</label>
                <input name="numero_serie" data-placeholder="Numero de Serie" class="form-control" id="numero_serie" readonly>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Detalle Pieza</label>
                <textarea name="detalles_b" data-placeholder="Detalles" class="form-control" id="detalles_pieza_bodega" cols="10" rows="2"></textarea>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Precion de Venta</label>
                <input name="precio_tienda" data-placeholder="Precio Venta" class="form-control" id="precio_tienda">
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Precion de Compra</label>
                <input name="precio_bodega" data-placeholder="Precio Compra" class="form-control" id="precio_bodega">
              </div>
            </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Cantidad en Bodega</label>
                  <input name="cantidad_bodega" data-placeholder="Cantidad" class="form-control" id="cantidad_bodega" readonly="readonly" type="number">
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Modelo de Items</label>
                  <input name="cantidad_enviar" placeholder="Cantidad Enviar" class="form-control" id="cantidad_enviar" type="number">
                </div>
              </div>


          </div>
          <input type="hidden" id="enviar_id" name="enviar_id">
          <input type="hidden" id="num_modelo_enviar" name="num_modelo_enviar">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="enviar_pieza">Enviar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bd-example-modal-lg addCompra" id="addCompraBodega" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar Compra Bodega</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="add_compraBodega">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Numero Serie</label>
                <input name="numero_serie_compra" data-placeholder="Numero de Serie" class="form-control" id="numero_serie_compra">
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Detalle Pieza</label>
                <textarea name="detalles_compra" data-placeholder="Detalles" class="form-control" id="detalles_compra" cols="10" rows="2"></textarea>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Precio de Venta</label>
                <input name="precio_tienda_compra" data-placeholder="Precio Venta" class="form-control" id="precio_tienda_compra">
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Precio de Compra</label>
                <input name="precio_bodega_compra" data-placeholder="Precio Compra" class="form-control" id="precio_bodega_compra">
              </div>
            </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Cantidad</label>
                  <input name="cantidad_bodega_compra" data-placeholder="Cantidad" class="form-control" id="cantidad_bodega_compra" type="number">
                </div>
              </div>

              <div class="col-md-6">
                <div class="form-group">
                <label class="bmd-label-floating">Modelo</label>
                  <select name="compra_pieza_modelo" data-placeholder="Cantidad Enviar" id="compra_pieza_modelo" class="chosen-select">
                      <?php $numero->getPiezasModelos(); ?>
                  </select>
                </div>
              </div>


          </div>
        </form>
      </div>
      <div class="modal-footer">
        <!--Autos Compatibles con la pieza-->
            <div class="mr-auto">
              <span>Esta Pieza Sera <b>Compatible</b> con los siguientes Vehiculos</span><br>
              <div id="autos_compatible" class="justify-content-center"></div>
            </div>
        <!-- End of Row-->
          <button type="button" class="btn btn-primary" id="add_compra">Guardar Compra</button>
    </div>
    </div>
  </div>
</div>

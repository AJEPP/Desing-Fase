<?php
   /**
   *
   * @About:      piezaVehiculo module
   * @File:       piezaVehiculo.php
   * @Date:       2020-03-25T19:26:04
   * @Version:    $Rev:$ 1.0
   * @Developer:   Jose Daniel quijano
   **/

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
    <h3 class="text-dark mb-4">PIEZAS DE VEHICULO</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE PIEZAS DE VEHICULO</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">

              <div class="col-md-4 text-left">
                <button class="btn btn-info" id="buscarpiezaVehiculoModal" data-toggle="modal" data-target=".buscar_pieza"><i class="fas fa-plus"></i> Buscar Pieza</button>
              </div>

              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addpiezaVehiculoModal" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Nuevo piezaVehiculo</button>
              </div>

            </div>

            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="piezaVehiculo_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Modelo vehiculo</th>
                            <th>Clasificación pieza</th>
                            <th>Nombre de pieza</th>
                            <th>Descripcion de pieza</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $ctr->getpiezasVehiculos(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="addPiezaVehiculo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar pieza Vehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="new_piezaVehiculo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Modelo vehiculo</label>
                <select name="modelo_vehiculo_id" data-placeholder="Tipo vehiculo" class="chosen-select">
                    <option value="">Seleccione</option>
                    <?php $mod->getModelovehiculo(); ?>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Clasificación Pieza</label>
                <select name="clasificacion_pieza_id" data-placeholder="Tipo vehiculo" class="chosen-select">
                    <option value="">Seleccione</option>
                    <?php $cla->getClasificacionPieza(); ?>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Nombre pieza</label>
                  <input type="text" class="form-control" name="pie_nombre">
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Descripcion de pieza</label>
                  <input type="text" class="form-control" name="pie_descripcion">
                </div>
            </div>

          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save_piezaVehiculo">Guardar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg edit_modal" id="EditpiezaVehiculoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar piezaVehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="edit_piezaVehiculo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Modelo vehiculo</label>
                <select name="modelo_vehiculo_id" data-placeholder="Tipo vehiculo" class="chosen-select" id="tipo_vehiculo_id">
                    <!-- <option value=""></option> -->
                    <?php $mod->getModelovehiculo(); ?>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Clasificación Pieza</label>
                <select name="clasificacion_pieza_id" data-placeholder="Tipo vehiculo" class="chosen-select" id="clasificacion_pieza_id">
                    <!-- <option value=""></option> -->
                    <?php $cla->getClasificacionPieza(); ?>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Nombre pieza</label>
                  <input type="text" class="form-control" name="pie_nombre" id="pie_nombre">
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Descripcion de pieza</label>
                  <input type="text" class="form-control" name="pie_descripcion" id="pie_descripcion">
                </div>
            </div>

          </div>
          <input type="hidden" id="id" name="id">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="update_piezaVehiculo">Guardar</button>
      </div>
    </div>
  </div>
</div>

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
                <label class="bmd-label-floating">Tamaño de Motor</label>
                  <select name="motor_vehiculo_id" data-placeholder="Motor del vehiculo" class="form-control" id="motor_vehiculo_buscar">
                      <!-- <option value=""></option> -->
                      <?php //$mod->getModelovehiculo(); ?>
                  </select>
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
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="buscar_piezaVehiculo">Buscar</button>
      </div>
    </div>
  </div>
</div>

<?php
   /**
   *
   * @About:      modeloVehiculo module
   * @File:       modeloVehiculo.php
   * @Date:       2020-03-25T19:26:04
   * @Version:    $Rev:$ 1.0
   * @Developer:   Jose Daniel quijano
   **/

    use Ajepp\Utils\marcaVehiculo as marca;
    use Ajepp\Controllers\modeloVehiculoController as controller;
    use Ajepp\Models\modeloVehiculoModel as usmd;

    $mar = new marca();
    $ctr = new controller();
    $depar = new usmd();

?>


<div class="container-fluid">
    <h3 class="text-dark mb-4">MODELO VEHICULO</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE MODELO VEHICULO</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addmodeloVehiculoModal" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Nuevo modeloVehiculo</button>
              </div>
            </div>
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="modeloVehiculo_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Marca</th>
                            <th>Modelo vehiculo</th>
                            <th>Año</th>
                            <th>Procedencia</th>
                            <th>Cuerpo</th>
                            <th>Tamaño Motor</th>
                            <th>Fin Producción</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $ctr->getmodeloVehiculos(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="addmodeloVehiculo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar modelo Vehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="new_modeloVehiculo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Marca del Vehiculo</label>
                <select name="marca_vehiculo_id" data-placeholder="Tipo vehiculo" class="chosen-select">
                    <!-- <option value=""></option> -->
                    <?php $mar->getMarcaVehiculo(); ?>
                </select>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Modelo Vehiculo</label>
                  <input type="text" class="form-control" name="mod_vehiculo">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Año</label>
                  <input type="text" class="form-control" name="mod_anio">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Procedencia</label>
                  <input type="text" class="form-control" name="procedencia">
                </div>
            </div>

          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save_modeloVehiculo">Guardar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="EditmodeloVehiculoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar modeloVehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="edit_modeloVehiculo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Marca del Vehiculo</label>
                <select name="marca_vehiculo_id" id="marca_vehiculo_id" data-placeholder="Tipo vehiculo" class="chosen-select">
                    <!-- <option value=""></option> -->
                    <?php $mar->getMarcaVehiculo(); ?>
                </select>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Modelo Vehiculo</label>
                  <input type="text" class="form-control" name="mod_vehiculo" id="mod_vehiculo">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Año</label>
                  <input type="text" class="form-control" name="mod_anio" id="mod_anio">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Procedencia</label>
                  <input type="text" class="form-control" name="procedencia" id="procedencia">
                </div>
            </div>

          </div>
          <input type="hidden" id="id" name="id">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="update_modeloVehiculo">Guardar</button>
      </div>
    </div>
  </div>
</div>

<?php
   /**
   *
   * @About:      tipoVehiculo module
   * @File:       tipoVehiculo.php
   * @Date:       2020-03-25T19:26:04
   * @Version:    $Rev:$ 1.0
   * @Developer:   Jose Daniel quijano 
   **/
    
    
    use Ajepp\Controllers\tipoVehiculoController as controller;
    use Ajepp\Models\tipovehiculoModel as usmd;
   
    
    $ctr = new controller();
    $depar = new usmd();

?>


<div class="container-fluid">
    <h3 class="text-dark mb-4">TIPO DE VEHICULO</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE TIPO DE VEHICULO</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addTipovehiculoModal" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Nueva Tipo de vehiculo</button>
              </div>
            </div>
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="tipoVehiculo_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tipo de vehiculo</th>
                            <th>Clasificación de vehiculo</th>
                            <th>Imagen</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $ctr->gettipoVehiculos(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="addTipovehiculo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar Tipo Vehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="new_tipoVehiculo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Tipo Vehiculo</label>
                  <input type="text" class="form-control" name="tipo_vehiculo">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Clasificación Vehiculo</label>
                  <input type="text" class="form-control" name="clasificacion_vehiculo">
                </div>
            </div>
            
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save_tipoVehiculo">Guardar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="EditTipovehiculoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar tipoVehiculo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="edit_tipoVehiculo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Tipo Vehiculo</label>
                  <input type="text" class="form-control" name="tipo_vehiculo" id="tipo_vehiculo">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Clasificación Vehiculo</label>
                  <input type="text" class="form-control" name="clasificacion_vehiculo" id="clasificacion_vehiculo">
                </div>
            </div>
            
          </div>
          <input type="hidden" id="id" name="id">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="update_tipoVehiculo">Guardar</button>
      </div>
    </div>
  </div>
</div>
<?php
   /**
   *
   * @About:      facultad module
   * @File:       facultad.php
   * @Date:       2020-03-25T19:26:04
   * @Version:    $Rev:$ 1.0
   * @Developer:  Marlon Anthony Bendliss Chávez. (anthonybendliss7@gmail.com)
   **/
    
    use Ajepp\Utils\departamento as depa;    
    use Ajepp\Controllers\cargoController as controller;
    use Ajepp\Models\cargoModel as usmd;
   
    $dep = new depa();
    $ctr = new controller();
    $users = new usmd();

?>


<div class="container-fluid">
    <h3 class="text-dark mb-4">CARGO</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE CARGO</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addCargoModal" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Nueva Facultad</button>
              </div>
            </div>
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="cargo_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Departamento</th>
                            <th>Nombre del cargo</th>
                            <th>Pago del cargo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $ctr->getcargos(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="addCargo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar cargo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="new_cargo">
          <div class="row justify-content-center">
            
            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Departamento</label>
                <select name="departamento_ajepp_id" data-placeholder="Tipo vehiculo" class="chosen-select">
                    <option value="">Seleccione</option>
                    <?php $dep->getDepartamento(); ?>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Nombre del cargo</label>
                  <input type="text" class="form-control" name="car_nombre">
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Pago cargo</label>
                  <input type="text" class="form-control" name="pago_cargo">
                </div>
            </div>
            
            
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save_cargo">Guardar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bd-example-modal-lg" id="EditCargoModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar cargo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="edit_cargo">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Departamento</label>
                <select name="departamento_ajepp_id" data-placeholder="Tipo vehiculo" class="chosen-select" id="departamento_ajepp_id">
                    <!-- <option value=""></option> -->
                    <?php $tip->getTipovehiculo(); ?>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Nombre del cargo</label>
                  <input type="text" class="form-control" name="car_nombre" id="car_nombre">
                </div>
            </div>
            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Pago cargo</label>
                  <input type="text" class="form-control" name="pago_cargo" id="pago_cargo">
                </div>
            </div>
            
            
          </div>
          <input type="hidden" id="id" name="id">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="update_cargo">Guardar</button>
      </div>
    </div>
  </div>
</div>
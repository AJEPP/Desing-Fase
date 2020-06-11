<?php
   /**
   *
   * @About:      facultad module
   * @File:       facultad.php
   * @Date:       2020-03-25T19:26:04
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/
    
    use Ajepp\Utils\tipoVehiculo as tipo;    
    use Ajepp\Controllers\marcaController as controller;
    use Ajepp\Models\marcaModel as usmd;
   
    $tip = new tipo();
    $ctr = new controller();
    $users = new usmd();

?>


<div class="container-fluid">
    <h3 class="text-dark mb-4">MARCA</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE MARCA</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addMarcaModal" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Nueva marca</button>
              </div>
            </div>
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="marca_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Marca Vehiculo</th>
                            <th>Imagen</th>
                            <th>Tipo de vehiculo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $ctr->getmarcas(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="addMarca" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar Marca</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="new_marca">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Marca vehículo</label>
                  <input type="text" class="form-control" name="marca_vehiculo">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
                <label class="bmd-label-floating">Tipo de vehículo</label>
                <select name="tipo_vehiculo_id" data-placeholder="Tipo vehiculo" class="chosen-select">
                    <option value="">Seleccione</option>
                    <?php $tip->getTipovehiculo(); ?>
                </select>
              </div>
            </div>
            
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save_marca">Guardar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bd-example-modal-lg" id="EditMarcaModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar Marca</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="edit_marca">
          <div class="row justify-content-center">

            <div class="col-md-6">
              <div class="form-group bmd-form-group">
                  <label class="bmd-label-floating">Marca Vehiculo</label>
                  <input type="text" class="form-control" name="marca_vehiculo" id="marca_vehiculo">
                </div>
            </div>

            <div class="col-md-6">
              <div class="form-group">
              <label class="bmd-label-floating">Tipo vehiculo</label>
                <select name="tipo_vehiculo_id" data-placeholder="Tipo vehiculo" class="chosen-select" id="tipo_vehiculo_id">
                    <!-- <option value=""></option> -->
                    <?php $tip->getTipovehiculo(); ?>
                </select>
              </div>
            </div>
            
          </div>
          <input type="hidden" id="id" name="id">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="update_marca">Guardar</button>
      </div>
    </div>
  </div>
</div>
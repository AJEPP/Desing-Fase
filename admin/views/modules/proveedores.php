<?php
   /**
   *
   * @About:      Providers view
   * @File:       proveedores.php
   * @Date:       2020-06-14T10:57:47
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   use Ajepp\Controllers\proveedoresController as ctrl;

   $ctr = new ctrl();
?>

<div class="container-fluid">
    <h3 class="text-dark mb-4">Proveedores</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">Lista de proveedores</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addMarcaModal" data-toggle="modal" data-target="#newProviderModal"><i class="fas fa-plus"></i> Nuevo proveedor</button>
              </div>
            </div>
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="marca_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Correo</th>
                            <th>Teléfono</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php echo $ctr->getProviders(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="newProviderModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar proveedor</h5>
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
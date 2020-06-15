<?php
   /**
   *
   * @About:      proveedores module
   * @File:       proveedores.php
   * @Date:       2020-03-25T19:26:04
   * @Version:    $Rev:$ 1.0
   * @Developer:   Jose Daniel quijano 
   **/
    
    
    use Ajepp\Controllers\proveedoresController as controller;
    use Ajepp\Models\proveedoresModel as usmd;
   
    
    $ctr = new controller();
    $depar = new usmd();

?>


<div class="container-fluid">
    <h3 class="text-dark mb-4">proveedores</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE proveedores</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addProveedoresModal" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Nuevo proveedor</button>
              </div>
            </div>
            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="proveedores_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                          <th>#</th>
                          <th>Nombres</th>
                          <th>Apellidos</th>
                          <th>Edad</th>
                          <th>Genero</th>
                          <th>Nacionalidad</th>
                          <th>Dirección</th>
                          <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $ctr->getproveedoress(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="addProveedoresModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar departamento</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="new_proveedores">
          <div class="row">
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Nombres</label>
                      <input type="text" class="form-control" name="pro_nombre">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Apellidos</label>
                      <input type="text" class="form-control" name="pro_apellido">
                  </div>
              </div>
          </div>
          <div class="row">
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Edad</label>
                      <input type="text" class="form-control" name="pro_edad">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="bmd-label-floating">Género</label>
                      <select name="pro_genero" class="form-control">
                          <option value="">Seleccione</option>
                          <option value="fm">Femenino</option>
                          <option value="ms">Masculino</option>
                      </select>
                  </div>
              </div>
          </div>
          <div class="row">
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Nacionalidad</label>
                      <input type="text" class="form-control" name="pro_nacionalidad">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Dirección</label>
                      <input type="text" class="form-control" name="pro_dirreccion">
                  </div>
              </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save_proveedores">Guardar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="EditProveedoresModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Editar departamento</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;" id="edit_proveedores">
          <div class="row">
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Nombres</label>
                      <input type="text" class="form-control" name="pro_nombre" id="pro_nombre">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Apellidos</label>
                      <input type="text" class="form-control" name="pro_apellido" id="pro_apellido">
                  </div>
              </div>
          </div>
          <div class="row">
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Edad</label>
                      <input type="text" class="form-control" name="pro_edad" id="pro_edad">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group">
                      <label class="bmd-label-floating">Género</label>
                      <select name="pro_genero" id="pro_genero" class="form-control">
                          <option value="">Seleccione</option>
                          <option value="fm">Femenino</option>
                          <option value="ms">Masculino</option>
                      </select>
                  </div>
              </div>
          </div>
          <div class="row">
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Nacionalidad</label>
                      <input type="text" class="form-control" name="pro_nacionalidad" id="pro_nacionalidad">
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Dirección</label>
                      <input type="text" class="form-control" name="pro_dirreccion" id="pro_dirreccion">
                  </div>
              </div>
          </div>
          <input type="hidden" id="id" name="id_prov">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="update_proveedores">Guardar</button>
      </div>
    </div>
  </div>
</div>
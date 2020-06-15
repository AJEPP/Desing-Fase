<?php
   /**
   *
   * @About:      Usuarios module
   * @File:       usuarios.php
   * @Date:       2020-06-08T22:58:06
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

    use Ajepp\Utils\cargo as carg;
    use Ajepp\Utils\personal as perso;
    // use Ajepp\Controllers\userController as controller;
    // use Ajepp\Models\userModel as usmd;

    $per = new perso();
    $car = new carg();
    // $ctr = new controller();
    // $users = new usmd();
?>

<div class="container-fluid">
    <h3 class="text-dark mb-4">Usuarios</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">Lista de usuarios</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addcargoModal" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fas fa-plus"></i> Nuevo usuario</button>
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
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" id="addWineModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar persona</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="bs-stepper" id="stepper-inv">
          <div class="bs-stepper-header">
            <div class="step" data-target="#invs-l-1">
              <button type="button" class="step-trigger" role="tab" aria-controls="after-finish-part" id="after-finish-part-trigger">
                <span class="bs-stepper-circle">1</span>
                <span class="bs-stepper-label">Personal</span>
               </button>
            </div>
            <div class="line"></div>
            <div class="step" data-target="#invs-l-2">
              <button type="button" class="step-trigger" role="tab" aria-controls="after-finish-part" id="after-finish-part-trigger">
                <span class="bs-stepper-circle">2</span>
                <span class="bs-stepper-label">Contacto y Login</span>
               </button>
            </div>
            <div class="line"></div>
            <div class="step" data-target="#invs-l-3">
            <button type="button" class="step-trigger" role="tab" aria-controls="finish-part" id="finish-part-trigger">
                <span class="bs-stepper-circle">3</span>
                <span class="bs-stepper-label">Cargo personal</span>
               </button>
            </div>
          </div>
          <div class="bs-stepper-content">
            <div id="invs-l-1" class="content">
              <form onsubmit="return false;" id="new_personal">
                
                <div class="row mt-4">
                  <div class="col-md-6">
                    <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Identificacion</label>
                      <input type="text" class="form-control" name="per_identificación"/>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Nombre</label>
                      <input type="text" class="form-control" name="per_nombre"/>
                    </div>
                  </div>
                </div>
                <div class="row mt-4">
                  <div class="col-md-6">
                    <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Apellido</label>
                      <input type="text" class="form-control" name="per_apellido"/>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Edad</label>
                      <input type="text" class="form-control" name="per_edad"/>
                    </div>
                  </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="bmd-label-floating">Genero</label>
                            <select name="per_genero" data-placeholder="Tipo vehiculo" class="chosen-select">
                                <option value="s">Seleccione</option>
                                <option value="masculino">Masculino</option>
                                <option value="femenino">Femenino</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                    <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Domicilio</label>
                      <input type="text" class="form-control" name="per_docimicilio"/>
                    </div>
                  </div>
                </div>
                <div class="row mt-4 justify-content-center">
                  <div class="col-md-6">
                    <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Dirección</label>
                      <input type="text" class="form-control" name="per_direccion"/>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group bmd-form-group">
                      <label class="bmd-label-floating">Personal ajepp</label>
                      <textarea class="form-control" name="personal_ajeppcol" rows="3"></textarea>
                    </div>
                  </div>
                </div>
              </form>
              <div class="row justify-content-end pt-4">
                  <div class="col-md-4 text-right">
                      <button class="btn btn-primary go_next" id="go_next">Continuar</button>
                  </div>
              </div>
            </div>
            <div id="invs-l-2" class="content">
              
                <form onsubmit="return false;">
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="form-group bmd-form-group">
                            <label class="bmd-label-floating">Email</label>
                            <input type="text" class="form-control" name="per_email"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group bmd-form-group">
                            <label class="bmd-label-floating">Celular</label>
                            <input type="text" class="form-control" name="per_celular"/>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="form-group bmd-form-group">
                            <label class="bmd-label-floating">Telefono</label>
                            <input type="text" class="form-control" name="per_telefono"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group bmd-form-group">
                            <label class="bmd-label-floating">Twitter</label>
                            <input type="text" class="form-control" name="per_twiter"/>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                         <div class="col-md-6">
                            <div class="form-group">
                                <label class="bmd-label-floating">personal</label>
                                <select name="personal_ajepp_id" data-placeholder="persona" class="chosen-select">
                                    <option value="">Seleccione</option>
                                    <?php $per->getPersonal(); ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group bmd-form-group">
                            <label class="bmd-label-floating">Usuario</label>
                            <input type="text" class="form-control" name="usuario"/>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4 justify-content-center">
                        <div class="col-md-6">
                            <div class="form-group bmd-form-group">
                            <label class="bmd-label-floating">Contraseña</label>
                            <input type="text" class="form-control" name="contrasenia"/>
                            </div>
                        </div>
                    </div>  
                </form>

                <div class="row justify-content-between pt-4">
                    <div class="col-md-2">
                        <button class="btn btn-primary go_prev">Anterior</button>
                    </div>
                    <div class="col-md-4 text-right">
                        <button class="btn btn-primary go_next">Continuar</button>
                    </div>
                </div>
            </div>
            <div id="invs-l-3" class="content">
                <form onsubmit="return false;">
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="form-group bmd-form-group">
                            <label class="bmd-label-floating">Salario</label>
                            <input type="text" class="form-control" name="per_salario"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="bmd-label-floating">Cargo</label>
                                <select name="cargo_ajepp_id" data-placeholder="cargo" class="chosen-select">
                                    <option value="">Seleccione</option>
                                    <?php $car->getCargo(); ?>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                    
                    <div class="row mt-4 justify-content-center">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="bmd-label-floating">personal</label>
                                <select name="personal_ajepp_id" data-placeholder="persona" class="chosen-select">
                                    <option value="">Seleccione</option>
                                    <?php $per->getPersonal(); ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                </form>
                <div class="row justify-content-between pt-4">
                  <div class="col-md-2">
                      <button class="btn btn-primary go_prev">Anterior</button>
                  </div>
                  <div class="col-md-4 text-right">
                      <button class="btn btn-primary">Finalizar</button>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="save_wine">Guardar</button>
      </div> -->
    </div>
  </div>
</div>
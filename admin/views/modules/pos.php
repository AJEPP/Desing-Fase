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
?>

<div class="container-fluid">
    <!-- <h3 class="text-dark mb-4">Ventas</h3> -->
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
        <div class="col-md-8" id="item-list">
            <div class="slimScrollDiv" style="position: relative; overflow-y: auto; width: auto; height: 530px;">
            <div class="items" style="overflow: auto; width: auto; height: 100%;">
                <div style="text-align: center;">
                        <?php 

                            $prods = $pos->getProductsList();
                            foreach($prods as $prod)
                            {
                                echo '<button class="btn btn-both btn-flat product" data-store = "'.$prod->in_store.'" data-were = "'.$prod->in_were.'" data-id = "'.$prod->id.'" data-prod = "'.htmlspecialchars(json_encode($prod)).'">
                                <span class="bg-img">';
                                    echo $prod->pie_img == null ? '<img src="http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/default_product.png" alt="'.$prod->pie_nombre.'" style="width: 100px; height: 100px;">' : '<img src="http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/'.$prod->pie_img.'" alt="'.$prod->pie_nombre.'" style="width: 100px; height: 100px;">';
                                echo '  </span>
                                    <span>  
                                        <span>'.$prod->pie_nombre.'</span>
                                    </span>
                                </button>';
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
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
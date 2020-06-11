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

    $pos = new ctrl();
?>

<div class="container-fluid">
    <!-- <h3 class="text-dark mb-4">Ventas</h3> -->
    <div class="row">
        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body">
                    <div class="input-group input-group-sm mb-3">
                        <input type="text" class="form-control" placeholder="Cliente">
                        <div class="input-group-append">
                            <button class="btn btn-success" type="submit"><i class="fas fa-plus"></i></button>
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
                                    <th style="width: 5%; text-align: right;"><a href="#" class="text-secondary"><i class="fas fa-trash"></i></a></th>
                                </tr>
                            </thead>
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
            <div class="slimScrollDiv" style="position: relative; overflow-y: auto; width: auto; height: 465px;">
            <div class="items" style="overflow: hidden; width: auto; height: 465px;">
                <div style="text-align: center;">
                        <?php 

                            $prods = $pos->getProductsList();
                            $cont = 1;
                            foreach($prods as $prod)
                            {
                                if($cont != 19)
                                {
                                    echo '<button class="btn btn-both btn-flat product">
                                        <span class="bg-img">';
                                            echo $prod->pie_img == null ? '<img src="http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/default_product.png" alt="'.$prod->pie_nombre.'" style="width: 100px; height: 100px;">' : '<img src="http://'.$_SERVER['SERVER_NAME'].'/views/assets/img/'.$prod->pie_img.'" alt="'.$prod->pie_nombre.'" style="width: 100px; height: 100px;">';
                                    echo '  </span>
                                        <span>  
                                            <span>'.$prod->pie_nombre.'</span>
                                        </span>
                                    </button>';

                                    $cont++;
                                }
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
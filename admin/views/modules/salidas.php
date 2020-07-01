<div class="container-fluid">
    <h3 class="text-dark mb-4">PIEZAS DE VEHICULO  EN BODEGA</h3>
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">LISTA DE PIEZAS DE VEHICULO</p>
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
              <div class="col-md-4 text-right">
                <button class="btn btn-info" id="addpiezaVehiculoModal" data-toggle="modal" data-target=".addCompra"><i class="fas fa-plus"></i> Nuevo piezaVehiculo</button>
              </div>

            </div>

            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                <table class="table dataTable my-0" id="piezasCompra_table" style="width:100%; padding: 20px;">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Num. Modelo Pieza</th>
                            <th>Num-Serie</th>
                            <th>Precio Compra</th>
                            <th>Precio Venta</th>
                            <th>Fecha de Ingreso</th>
                            <th>Detalles</th>
                            <th>Cantidad Existencia</th>
                            <th>Aciones</th>
                            <th>Enviar Tienda</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $com->getComprasPiezas(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

$(document).ready(function() {
    $('#piezaVehiculo_table').DataTable({
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
            "sInfoEmpty": "<b>Mostrando registros del 0 al 0 de un total de 0</b>",
            "sInfoFiltered": "(filtrado de un total de MAX registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }

        }

    });


    $(document).on('click', '#save_piezaVehiculo', function() {

        var data = $("#new_piezaVehiculo").serialize();


        $.post('models/requests/piezasVehiculo.php', { type: 'new_piezaVehiculo', data: data }, function(data) {

            $("#addPiezaVehiculo").modal('hide');
            $.notify({
                icon: "check",
                message: "Correcto! <b> pieza creado</b>."
            }, {
                type: 'success',
                timer: 1000,
                placement: {
                    from: 'top',
                    align: 'center'
                }
            });

            setTimeout(function() {
                location.reload();
            }, 2000);

            console.log(data);
        });
    });

    $(document).on('click', '.edit', function() {

        // id = $(this).serialize('id');

        $.post('models/requests/piezasVehiculo.php', { type: 'get_piezasVehiculo', id: $(this).data('id') }, function(data) {
            // console.log($(this).data('id'));
            var pieza = data;
            console.log(data);
            $("#modelo_vehiculo_id").val(pieza.data.modelo_vehiculo_id);
            $("#clasificacion_pieza_id").val(pieza.data.clasificacion_pieza_id);
            $("#pie_nombre").val(pieza.data.pie_nombre);
            $("#pie_descripcion").val(pieza.data.pie_descripcion);
            $("#id").val(pieza.data.id);

            $("#EditpiezaVehiculoModal").modal('show');
        }, 'json');
    });

    $(document).on('click', '#update_piezaVehiculo', function() {

        var pieza = $("#edit_piezaVehiculo").serialize();

        $.post('models/requests/piezasVehiculo.php', { type: 'edit_piezaVehiculo', data: pieza }, function(data) {

            $("#EditpiezaVehiculoModal").modal('hide');

            $.notify({
                icon: "check",
                message: "Correcto! <b> su pieza fue actualizada</b>."
            }, {
                type: 'success',
                timer: 1000,
                placement: {
                    from: 'top',
                    align: 'center'
                }
            });

            setTimeout(function() {
                location.reload();
            }, 2000);
            // console.log(data);
        });
    });

    $(document).on('click', '.delete', function() {

        var con = confirm("En realidad desea eliminar esta pieza?");

        if (con == true) {
            $.post('models/requests/piezasVehiculo.php', { type: 'delete_piezaVehiculo', id: $(this).data('id') }, function(data) {

                $.notify({
                    icon: "fas fa-times",
                    message: "Correcto! <b> su pieza fue eliminado</b>."
                }, {
                    type: 'danger',
                    timer: 1000,
                    placement: {
                        from: 'top',
                        align: 'center'
                    }
                });

                setTimeout(function() {
                    location.reload();
                }, 2000);
                // console.log(data);

            });
        }
    });

    $('.chosen-select').chosen({
        allow_single_deselect: true,
        width: '100%',
        disable_search_threshold: 10
    });

    $.validator.setDefaults({
        ignore: ":hidden:not(.chosen-select)"
    });

$(document).on('change', '#marca_vehiculo_buscar', function(){

  var id = $(this).val();
  var list = '<option value="0">Select Model</option>';
  $("#tipo_vehiculo_buscar").empty();
  $("#anio_vehiculo_buscar").empty();
  $("#motor_vehiculo_buscar").empty();
  $.post('models/requests/modeloVehiculo.php', { type: 'get_modeloVehiculoNombre', id: id}, function(datos) {
    var modelos = JSON.parse(datos);
    $.each(modelos.data, function(key, value){
      list += '<option value="'+value.name+'">'+value.name+'</option>';

    });
    $("#tipo_vehiculo_buscar").append(list);

});
});

$(document).on('change', '#tipo_vehiculo_buscar', function(){

  var id = $(this).val();

  var list ='<option value="0">Select Año</option>';
  $("#anio_vehiculo_buscar").empty();
  $("#motor_vehiculo_buscar").empty();
  $.post('models/requests/modeloVehiculo.php', { type: 'get_modeloVehiculoAnio', id: id }, function(datos) {
    var modelos = JSON.parse(datos);
    var fecha;
    $.each(modelos.data, function(key, value){
      fecha = value.inicio +"-"+value.termina;
      list += '<option value="'+fecha+'">'+fecha+'</option>';

    });
    $("#anio_vehiculo_buscar").append(list);

});
});

$(document).on('change', '#anio_vehiculo_buscar', function(){

  var fechas = $(this).val();
  var auto_modelo = $("#tipo_vehiculo_buscar").val();
  var marca = $("#marca_vehiculo_buscar").val();

  var list ='<option value="0">Select Motor</option>';
  $("#motor_vehiculo_buscar").empty();
  $.post('models/requests/modeloVehiculo.php', { type: 'get_modeloVehiculoMotor', fechas: fechas, modelo:auto_modelo, marca:marca}, function(datos) {
    var modelos = JSON.parse(datos);

    $.each(modelos.data, function(key, value){

        list += '<option value="'+value.motor+'">'+value.motor+'</option>';

    });
    $("#motor_vehiculo_buscar").append(list);

});
});

$(document).on('change', '#clasificacion_pieza_buscar', function(){

  var cla_pieza = $(this).val();
  var auto_modelo = $("#tipo_vehiculo_buscar").val();
  var marca = $("#marca_vehiculo_buscar").val();
  var motor = $("#motor_vehiculo_buscar").val();
  var fechas= $("#anio_vehiculo_buscar").val();

  //alert(marca +" "+auto_modelo +" " +fechas +" "+pieza+" "+ motor);

  var list ='<option value="0">Select Pieza</option>';
  $("#pie_nombre_buscar").empty();
  $.post('models/requests/piezasVehiculo.php', { type: 'get_piezasVehiculoFiltro', marca: marca, modelo:auto_modelo, fechas:fechas, motor:motor, clasific: cla_pieza}, function(datos) {
    var piezas= JSON.parse(datos);
  $.each(piezas.data, function(key, value){

        list += '<option value="'+value.pieza+'">'+value.pieza+'</option>';

    });
    $("#pie_nombre_buscar").append(list);

});
});

$(document).on('click', '#buscar_', function(){
  $("#addProductos").empty();

  var cla_pieza = $("#clasificacion_pieza_buscar").val(); //Entero
  var auto_modelo = $("#tipo_vehiculo_buscar").val(); //Texto
  var marca = $("#marca_vehiculo_buscar").val(); //Entero
  var motor = $("#motor_vehiculo_buscar").val(); //Text
  var fechas= $("#anio_vehiculo_buscar").val(); //Text dos fechas separa por '-' inicio-final
  var pieza_nom = $('#pie_nombre_buscar').val();


  $.post('models/requests/piezasVehiculo.php', { type: 'get_piezasVehiculoEspeci', marca: marca, modelo:auto_modelo, fechas:fechas, motor:motor, clasific: cla_pieza, nombre:pieza_nom}, function(datos) {
    var piezas= JSON.parse(datos);
    $.each(piezas.data, function(key, value){
      //console.log(value);
          //list += '<option value="'+value.pieza+'">'+value.pieza+'</option>';
          //$("#product_cont").append('<button class="btn btn-both btn-flat product" data-store = "' + data.products[i].in_store + '" data-were = "' + data.products[i].in_were + '" data-id = "' + data.products[i].id + '" data-prod = "' + data.products[i].prod + '"> <span class="bg-img"><img src="' + data.products[i].pie_img + '" alt="' + data.products[i].pie_nombre + '" style="width: 100px; height: 100px;"></span><span><span>' + data.products[i].pie_nombre + '</span></span></button>');
          $("#addProductos").append('<button class="btn btn-both btn-flat product" data-store = "' + 10+ '" data-were = "' + 10 + '" data-id = "' +10 + '" data-prod = "' + value.pieza + '"> <span class="bg-img"><img src="' + + '" alt="' + value.pieza + '" style="width: 100px; height: 100px;"></span><span><span>' + value.descripcion + '</span></span></button>');
      });
      //$("#pie_nombre_buscar").append(list);
  });
  $('#BuscarPiezaVehiculo').modal('hide');

  $("#tipo_vehiculo_buscar").empty();
  $("#anio_vehiculo_buscar").empty();
  $("#motor_vehiculo_buscar").empty();
  $("#pie_nombre_buscar").empty();

  //$("#addProductos").append('<button class="btn btn-both btn-flat product" data-store = "1" data-were = "we" data-id = "f" data-prod = "e"> <span class="bg-img"><img src="t" alt="t" style="width: 100px; height: 100px;"></span><span><span>Carrap</span></span></button>');
});
});

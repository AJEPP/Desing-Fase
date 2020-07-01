$(document).ready(function() {
    $('#piezasCompra_table').DataTable({
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

  $(document).on('click', '.edit_compra', function(){

    $.post('models/requests/compra.php', {type:'getCompraPieza', id:$(this).data('id')}, function(data){
      var compra = data;

      $('#num_serie').val(compra.data.pie_serie);
      $('#venta_precio').val(compra.data.pie_precio_venta);
      $('#compra_precio').val(compra.data.pie_precio_compra);
      $('#fecha_compra').val(compra.data.pie_fecha_ingreso);
      $('#detalle_pieza').val(compra.data.pie_detalle);
      $('#cantidad_pieza').val(compra.data.pie_cantidad);
      $('#modelo_compra').val(compra.data.num_modelo_pieza);
      $('#id_compra').val(compra.data.id);
    }, 'json');
    $("#EditpiezaCompraModal").modal("show");
  });

  $(document).on('click', '#update_CompraPieza', function(){
    var data = $('#edit_compraPieza').serialize();
    //console.log(data);
    $.post('models/requests/compra.php', {type:'updateCompraPieza', compra:data}, function(data){
      console.log(data);
    $("#EditpiezaCompraModal").modal('hide');
      $.notify({
          icon: "check",
          message: "Correcto! <b> Compra Actualizada </b>."
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
    });
  });

  $(document).on('click','.delete_compra',function(){
    var con = confirm("En realidad desea eliminar esta pieza?");

    if(con == true){
    $.post('models/requests/compra.php', {type:'deleteCompra', id:$(this).data('id')}, function(datos){
      var data = datos;
      console.log(data);
      $("#EditpiezaCompraModal").modal('hide');
        $.notify({
            icon: "check",
            message: "Correcto! <b> Compra Elimada </b>."
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

    }, 'json');
  }
  });

  $(document).on('click', '.pieza_enviar', function(){

    $.post('models/requests/compra.php', {type:'getCompraPieza', id:$(this).data('id')}, function(data){
      var compra = data;
      $('#cantidad_enviar').empty();
      $('#numero_serie').val(compra.data.pie_serie);
      $('#precio_tienda').val(compra.data.pie_precio_venta);
      $('#precio_bodega').val(compra.data.pie_precio_compra);
      //$('#fecha_compr').val(compra.data.pie_fecha_ingreso);
      $('#detalles_pieza_bodega').val(compra.data.pie_detalle);
      $('#cantidad_bodega').val(compra.data.pie_cantidad);
      $('#enviar_id').val(compra.data.id);
      $('#num_modelo_enviar').val(compra.data.num_modelo_pieza);
    }, 'json');

    $("#EnviarTiendaModal").modal("show");
  });

  $(document).on('click', '#enviar_pieza', function(){
    var datos = $('#enviar_PiezaTienda').serialize();
    console.log(datos);
    var enviar = $('#cantidad_enviar').val();
    var bodega = $('#cantidad_bodega').val();
    if( enviar > bodega){
      $.notify({
          icon: "error",
          message: "Error <b> Cantidad a Enviar Excede Existencia </b>."
      }, {
          type: 'danger',
          timer: 1500,
          placement: {
              from: 'top',
              align: 'center'
          }
      });

    }
    else{
      $.post('models/requests/compra.php', {type:'enviarPiezaTienda', datos:datos}, function(data){
        console.log(data);

       $("#EditpiezaCompraModal").modal('hide');
          $.notify({
              icon: "check",
              message: "Correcto! <b> Enviado a Tienda </b>."
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

      });
    }
    $('#cantidad_enviar').empty();
  });

  $('.chosen-select').chosen({
      allow_single_deselect: true,
      width: '100%',
      disable_search_threshold: 10
  });

$(document).on('click','#add_compra', function(){
  var data = $('#add_compraBodega').serialize();

  $.post('models/requests/compra.php', {type:'addCompraBodega', data:data}, function(datos){
    //console.log(datos);

    $("#EditpiezaCompraModal").modal('hide');
       $.notify({
           icon: "check",
           message: "Correcto! <b> Compra Guardado </b>."
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

  });
console.log(data);
});

$(document).on('change', '#compra_pieza_modelo', function(){
  var model = $(this).val();
  if(model != 0)
  {
    var autos ='';
    $.post('models/requests/compra.php', {type:'getAutosCompatibles', model:model}, function(data){
      var datos = data;
      //$.each(datos.data)
    },'json');

  }
});
});

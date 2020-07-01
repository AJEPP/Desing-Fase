$(document).ready(function() {
    $('#tipoVehiculo_table').DataTable({
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

    $(document).on('click', '#save_tipoVehiculo', function() {

        var data = $("#new_tipoVehiculo").serialize();


        $.post('models/requests/tipoVehiculo.php', { type: 'new_tipoVehiculo', data: data }, function(data) {

            $("#addtipoVehiculo").modal('hide');
            $.notify({
                icon: "check",
                message: "Correcto! <b> tipoVehiculo creado</b>."
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

    $(document).on('click', '.editPieza', function() {

        // id = $(this).serialize('id');

        $.post('models/requests/tipoVehiculo.php', { type: 'get_tipoVehiculo', id: $(this).data('id') }, function(data) {
            // console.log($(this).data('id'));
            var tipoVehiculo = data;
            console.log(data);
            $("#tipo_vehiculo").val(tipoVehiculo.data.tipo_vehiculo);
            $("#clasificacion_vehiculo").val(tipoVehiculo.data.clasificacion_vehiculo);
            $("#id").val(tipoVehiculo.data.id);

            $("#EditTipovehiculoModal").modal('show');
        }, 'json');
    });

    $(document).on('click', '#update_tipoVehiculo', function() {

        var tipoVehiculo = $("#edit_tipoVehiculo").serialize();

        $.post('models/requests/tipoVehiculo.php', { type: 'edit_tipoVehiculo', data: tipoVehiculo }, function(data) {

            $("#EditTipovehiculoModel").modal('hide');

            $.notify({
                icon: "check",
                message: "Correcto! <b> su tipoVehiculo fue actualizada</b>."
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

    $(document).on('click', '.deletePieza', function() {

        var con = confirm("En realidad desea eliminar este tipoVehiculo?");

        if (con == true) {
            $.post('models/requests/tipoVehiculo.php', { type: 'delete_tipoVehiculo', id: $(this).data('id') }, function(data) {

                $.notify({
                    icon: "fas fa-times",
                    message: "Correcto! <b> su tipo Vehiculo fue eliminado</b>."
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
});

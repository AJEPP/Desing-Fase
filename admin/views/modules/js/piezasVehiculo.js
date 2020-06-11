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
});
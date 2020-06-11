$(document).ready(function() {
    $('#modeloVehiculo_table').DataTable({
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

    $(document).on('click', '#save_modeloVehiculo', function() {

        var data = $("#new_modeloVehiculo").serialize();


        $.post('models/requests/modeloVehiculo.php', { type: 'new_modeloVehiculo', data: data }, function(data) {

            $("#addmodeloVehiculo").modal('hide');
            $.notify({
                icon: "check",
                message: "Correcto! <b> modeloVehiculo creado</b>."
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

    $(document).on('click', '.edit', function() {

        // id = $(this).serialize('id');

        $.post('models/requests/modeloVehiculo.php', { type: 'get_modeloVehiculo', id: $(this).data('id') }, function(data) {
            // console.log($(this).data('id'));
            var modeloVehiculo = data;
            console.log(data);
            $("#marca_vehiculo_id").val(modeloVehiculo.data.marca_vehiculo_id);
            $("#mod_vehiculo").val(modeloVehiculo.data.mod_vehiculo);
            $("#mod_anio").val(modeloVehiculo.data.mod_anio);
            $("#procedencia").val(modeloVehiculo.data.procedencia);
            $("#id").val(modeloVehiculo.data.id);

            $("#EditmodeloVehiculoModal").modal('show');
        }, 'json');
    });

    $(document).on('click', '#update_modeloVehiculo', function() {

        var modeloVehiculo = $("#edit_modeloVehiculo").serialize();

        $.post('models/requests/modeloVehiculo.php', { type: 'edit_modeloVehiculo', data: modeloVehiculo }, function(data) {

            $("#EditmodeloVehiculoModel").modal('hide');

            $.notify({
                icon: "check",
                message: "Correcto! <b> su modeloVehiculo fue actualizada</b>."
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

        var con = confirm("En realidad desea eliminar esta modeloVehiculo?");

        if (con == true) {
            $.post('models/requests/modeloVehiculo.php', { type: 'delete_modeloVehiculo', id: $(this).data('id') }, function(data) {

                $.notify({
                    icon: "fas fa-times",
                    message: "Correcto! <b> su modeloVehiculo fue eliminado</b>."
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
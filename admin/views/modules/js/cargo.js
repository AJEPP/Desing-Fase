$(document).ready(function() {

    $('#cargo_table').DataTable({
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


    $(document).on('click', '#save_cargo', function() {

        var data = $("#new_cargo").serialize();


        $.post('models/requests/cargo.php', { type: 'new_cargo', data: data }, function(data) {

            $("#addcargoModal").modal('hide');
            $.notify({
                icon: "check",
                message: "Correcto! <b> cargo creada</b>."
            }, {
                type: 'success',
                timer: 1000,
                icon_type: 'fas fa-check',
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

        $.post('models/requests/cargo.php', { type: 'get_cargo', id: $(this).data('id') }, function(data) {
            // console.log($(this).data('id'));
            var cargo = data;
            console.log(data);
            $("#departamento_ajepp_id	").val(cargo.data.departamento_ajepp_id);
            $("#car_nombre").val(cargo.data.car_nombre);
            $("#pago_cargo").val(cargo.data.pago_cargo);
            $("#id").val(cargo.data.id);
            $("#EditCargoModel").modal('show');
        }, 'json');
    });

    $(document).on('click', '#update_cargo', function() {

        var cargo = $("#edit_cargo").serialize();

        $.post('models/requests/cargo.php', { type: 'edit_cargo', data: cargo }, function(data) {

            $("#EditCargoModal").modal('hide');

            $.notify({
                message: "Correcto! <b> su cargo fue actualizada</b>."
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
            //console.log(data);
        });
    });

    $(document).on('click', '.delete', function() {

        var con = confirm("En realidad desea eliminar esta cargo?");

        if (con == true) {
            $.post('models/requests/cargo.php', { type: 'delete_cargo', id: $(this).data('id') }, function(data) {

                $.notify({
                    message: "Correcto! <b> su cargo fue eliminado</b>."
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
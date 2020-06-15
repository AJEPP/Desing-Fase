$(document).ready(function() {
    $('#proveedores_table').DataTable({
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

    $(document).on('click', '#save_proveedores', function() {

        var data = $("#new_proveedores").serialize();


        $.post('models/requests/proveedores.php', { type: 'new_proveedores', data: data }, function(data) {

            $("#addproveedores").modal('hide');
            $.notify({
                icon: "check",
                message: "Correcto! <b> proveedores creado</b>."
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

        $.post('models/requests/proveedores.php', { type: 'get_proveedores', id: $(this).data('id') }, function(data) {
            // console.log($(this).data('id'));

            var proveedores = data;
            console.log(data);
            $("#pro_nombre").val(proveedores.data.pro_nombre);
            $("#pro_apellido").val(proveedores.data.pro_apellido);
            $("#pro_edad").val(proveedores.data.pro_edad);
            $("#pro_genero").val(proveedores.data.pro_genero);
            $("#pro_nacionalidad").val(proveedores.data.pro_nacionalidad);
            $("#pro_dirreccion").val(proveedores.data.pro_dirreccion);
            $("#id").val(proveedores.data.id_prov);
            $("#EditProveedoresModal").modal('show');
        }, 'json');
    });

    $(document).on('click', '#update_proveedores', function() {

        var proveedores = $("#edit_proveedores").serialize();

        $.post('models/requests/proveedores.php', { type: 'edit_proveedores', data: proveedores }, function(data) {

            $("#EditproveedoresModel").modal('hide');

            $.notify({
                icon: "check",
                message: "Correcto! <b> su proveedor fue actualizada</b>."
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

        var con = confirm("En realidad desea eliminar esta proveedores?");

        if (con == true) {
            $.post('models/requests/proveedores.php', { type: 'delete_proveedores', id: $(this).data('id') }, function(data) {

                $.notify({
                    icon: "fas fa-times",
                    message: "Correcto! <b> su proveedor fue eliminado</b>."
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
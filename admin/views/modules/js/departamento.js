$(document).ready(function() {
    $('#departamento_table').DataTable({
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

    $(document).on('click', '#save_departamento', function() {

        var data = $("#new_departamento").serialize();


        $.post('models/requests/departamento.php', { type: 'new_departamento', data: data }, function(data) {

            $("#addDepartamento").modal('hide');
            $.notify({
                icon: "check",
                message: "Correcto! <b> departamento creado</b>."
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

        $.post('models/requests/departamento.php', { type: 'get_departamento', id: $(this).data('id') }, function(data) {
            // console.log($(this).data('id'));
            var departamento = data;
            console.log(data);
            $("#dep_nombre").val(departamento.data.dep_nombre);
            $("#dep_locacion").val(departamento.data.dep_locacion);
            $("#id").val(departamento.data.id);

            $("#EditDepartamentoModal").modal('show');
        }, 'json');
    });

    $(document).on('click', '#update_departamento', function() {

        var departamento = $("#edit_departamento").serialize();

        $.post('models/requests/departamento.php', { type: 'edit_departamento', data: departamento }, function(data) {

            $("#EditDepartamentoModel").modal('hide');

            $.notify({
                icon: "check",
                message: "Correcto! <b> su departamento fue actualizada</b>."
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

        var con = confirm("En realidad desea eliminar esta departamento?");

        if (con == true) {
            $.post('models/requests/departamento.php', { type: 'delete_departamento', id: $(this).data('id') }, function(data) {

                $.notify({
                    icon: "fas fa-times",
                    message: "Correcto! <b> su departamento fue eliminado</b>."
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
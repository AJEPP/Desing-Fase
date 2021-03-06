$.validator.setDefaults({
    ignore: ":hidden:not(.chosen-select)"
});


$(document).ready(function() 
{

    $("#new_marca").validate(
    {
        onsubmit: false,
        errorClass: "invalid",
        submitHandler: function (form)
        {
            //sendData();
        },
        rules:
        {
            marca_vehiculo: "required",
            tipo_vehiculo_id: "required"
        },
        messages:
        {
            marca_vehiculo: "Ingresa la marca",
            tipo_vehiculo_id: "Selecciona el tipo de vehículo"
        },
        errorElement: "div",
        errorPlacement: function (error, element)
        {
            error.removeClass("error");
            error.css({'color': 'red'});
            element.addClass("is-invalid");

            if(element.prop("type") == "select-one")
            {
                error.insertAfter($(element).parent('.form-group'));
            }
            else
            {
                error.insertAfter(element);
            }
        },
        success: function(label, element)
        {
            $(element).parent('.form-group').prepend(label);
        },
        highlight: function(element, errorClass, validClass)
        {
            $(element).addClass("is-invalid").removeClass("is-valid");
        },
        unhighlight: function(element, errorClass, validClass)
        {
            $(element).addClass("is-valid").removeClass("is-invalid");
        }
    });

    $('#marca_table').DataTable({
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

    $("#save_marca").click(function (e) { 
        e.preventDefault();
        
        var form = $("#new_marca");

        var validator = form.validate();

        validator.form();

        if(form.valid())
        {
            sendData();
        }
    });

    $(document).on('click', '.edit', function() {

        // id = $(this).serialize('id');

        $.post('models/requests/marca.php', { type: 'get_marca', id: $(this).data('id') }, function(data) {
            // console.log($(this).data('id'));
            var marca = data;
            console.log(data);
            $("#marca_vehiculo").val(marca.data.marca_vehiculo);
            $("#tipo_vehiculo_id").val(marca.data.tipo_vehiculo_id);
            $("#id").val(marca.data.id);
            $("#EditMarcaModel").modal('show');
        }, 'json');
    });

    $(document).on('click', '#update_marca', function() {

        var marca = $("#edit_marca").serialize();

        $.post('models/requests/marca.php', { type: 'edit_marca', data: marca }, function(data) {

            $("#EditMarcaModal").modal('hide');

            $.notify({
                message: "Correcto! <b> su marca fue actualizada</b>."
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

        var con = confirm("En realidad desea eliminar esta marca?");

        if (con == true) {
            $.post('models/requests/marca.php', { type: 'delete_marca', id: $(this).data('id') }, function(data) {

                $.notify({
                    message: "Correcto! <b> su marca fue eliminado</b>."
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

});

function sendData()
{
    var data = $("#new_marca").serialize();

    $.post('models/requests/marca.php', { type: 'new_marca', data: data }, function(data) {

        //$("#addMarcaModal").modal('hide');
        $.notify({
            icon: "check",
            message: "Correcto! <b> marca creada</b>."
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
}
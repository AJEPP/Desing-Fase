$.validator.setDefaults({
    ignore: ":hidden:not(.chosen-select)"
});

$(document).ready(function() {
    var stepperEl = document.getElementById('stepper-inv');
    var stepper = new Stepper(stepperEl, {
        linear: false,
        animation: true,
    });

    stepperEl.addEventListener('show.bs-stepper', function(event) {
        console.warn(event.detail);
    });

    $(".go_next").click(function(e) {
        e.preventDefault();
        stepper.next();
        var form = $("#new_personal");

        var validator = form.validate();

        validator.form();

        if (form.valid()) {
            alert("no tiene nada");
        }
    });

    $(".go_prev").click(function(e) {
        e.preventDefault();
        stepper.previous();
    });

    $('.chosen-select').chosen({
        allow_single_deselect: true,
        width: '100%',
        disable_search_threshold: 10
    });



    $("#new_personal").validate({
        onsubmit: false,
        errorClass: "invalid",
        submitHandler: function(form) {
            //sendData();
        },
        rules: {
            pre_identificacion: "required",
            per_nombre: "required",
            per_apellido: "required",
            per_edad: "required",
            per_genero: "required",
            per_domicilio: "required",
            per_direccion: "required",
            personal_ajeppcol: "required"
        },
        messages: {
            pre_identificacion: "Ingrese la identificación",
            per_nombre: "Ingrese el nombre",
            per_apellido: "Ingrese el apellido",
            per_edad: "Ingrese la edad",
            per_genero: "Ingrese el genero",
            per_domicilio: "Ingrese el domicilio",
            per_direccion: "Ingrese la direccion",
            personal_ajeppcol: "Ingrese el personal"
        },
        errorElement: "div",
        errorPlacement: function(error, element) {
            error.removeClass("error");
            error.css({ 'color': 'red' });
            element.addClass("is-invalid");

            if (element.prop("type") == "select-one") {
                error.insertAfter($(element).parent('.form-group'));
            } else {
                error.insertAfter(element);
            }
        },
        success: function(label, element) {
            $(element).parent('.form-group').prepend(label);
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass("is-invalid").removeClass("is-valid");
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).addClass("is-valid").removeClass("is-invalid");
        }
    });

    // $(".go_next").click(function(e) {
    //     e.preventDefault();

    //     var form = $("#new_personal");

    //     var validator = form.validate();

    //     validator.form();

    //     if (form.valid()) {
    //         alert("no tiene nada");
    //     }
    // });
});
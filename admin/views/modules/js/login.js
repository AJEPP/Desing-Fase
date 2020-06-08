$(document).ready(function () 
{
    $("#login_form").submit(function (e) 
    { 
        e.preventDefault();

        $("#loading").removeClass('hide');
        var form = $(this).serialize();

        $.post("models/requests/login.php", {data: form},
            function (data) 
            {
                $("#loading").addClass('hide');
                console.log(data);

                if(data.login == "ok")
                {
                    $.notify({
                        icon: "check",
                        message: "Bienvenido <b>"+ data.name +"</b>."
                      }, {
                        type: 'success',
                        timer: 1000,
                        placement: {
                          from: 'top',
                          align: 'center'
                        }
                      });

                      setTimeout(() => 
                      {
                          location.href = 'dashboard';
                      }, 1200);
                }
                else
                {
                    if(data.message == "contrasenia")
                    {
                        $.notify({
                            icon: "add_alert",
                            message: "<b>Error!</b> Contraseña equivocada."
                      
                          }, {
                            type: 'warning',
                            timer: 1000,
                            placement: {
                              from: 'top',
                              align: 'center'
                            }
                          });
                    }
                    else
                    {
                        $.notify({
                            icon: "add_alert",
                            message: "<b>Error!</b> Usuario no registrado."
                      
                          }, {
                            type: 'danger',
                            timer: 1000,
                            placement: {
                              from: 'top',
                              align: 'center'
                            }
                          });
                    }
                }
            },
            "json"
        );
    });    
});
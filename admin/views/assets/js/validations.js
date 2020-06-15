 /*
    * Project: Ajepp
    * Description: General forms validation function
    * Author: José Daniel Quijano (jose.quijano55@gmail.com)
    * Version: 1.0
    * Date: 2020-06-12T16:01:34
*/
$.validator.setDefaults({
    ignore: ":hidden:not(.chosen-select)"
});

$.jqValidation = function(formEl, options)
{
    $(formEl).validate(
        {
            submitHandler: function (form) 
            {
                options.onSubmit();
            },
            rules: options.rules,
            messages: options.messages,
            errorElement: 'div',
            errorClass: "invalid",
            errorPlacement: function (error, element)
            {
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
}

function notifySave(message, type, icon)
{
    $.notify({
        icon: icon,
        message: message
      }, {
        type: type,
        timer: 1000,
        placement: {
          from: 'top',
          align: 'center'
        }
      });

      if(type == "success")
      {
        setTimeout(() => 
        {
           location.reload();
        }, 1200);
      }  /**/
}
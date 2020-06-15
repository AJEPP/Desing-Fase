$(document).ready(function () 
{
  $('.chosen-select').chosen({
    allow_single_deselect: true,
    width: '80%'
  });

  $.post("models/requests/pos.php", {type: 'initial_data'},
    function (data) 
    {
      console.log(data);
      $.jqAutocomplete("#product", {
        data: data.products,
        objectFilter: 'pie_nombre',
        onSelected: function(data)
        {
          $("#product").val('');
          addProduct(data);
        }
      });
    },
    "json"
  );

  $("#new_client").click(function (e) 
  { 
    e.preventDefault();
    $.jqValidation("#new_client_form", {
      onSubmit: function()
      {
          saveClient();
      },
      rules: {
        name: "required",
        last_name: "required",
        id_card: "required",
        age: "required",
        gender: "required",
        city: "required",
        address: "required"
      },
      messages:
      {
        name: "Ingresa el nombre",
        last_name: "Ingresa el apellido",
        id_card: "Ingresa la cédula",
        age: "Ingresa la edad",
        gender: "Ingresa el género",
        city: "Ingresa la ciudad",
        address: "Ingresa la dicrección"
      }
    });
    $("#newClientModal").modal('show');
  });

  $(document).on('click', '.del_prod', function () 
  {
    $(this).parent('td').parent('tr').remove();
    calculateSale();
  });

  $(document).on('click', '.product', function () 
  {
      var data = $(this).data('prod');

      addProduct(data);
  });

});

function saveClient()
{
  var data = $("#new_client_form").serialize();

  $.post("models/requests/pos.php", {type: 'save_client', data: data},
    function (data) 
    {
      console.log(data);
      $("#client").chosen("destroy");
        $("#client").html(data.clients);

        
        $('#client').chosen({
          allow_single_deselect: true,
          width: '80%'
        });

        $.notify({
          icon: "check",
          message: "Correcto! <b> cliente creado</b>."
          }, {
          type: 'success',
          timer: 1000,
          icon_type: 'fas fa-check',
          placement: {
              from: 'top',
              align: 'center'
          }
      });

      $("#newClientModal").modal('hide');
      $('#new_client_form')[0].reset();
    },
    "json"
  );
}

function addProduct(data)
{
  $("#product_list").append('<tr><td>' + data.pie_nombre + '</td><td>100.00</td><td><input type="number" class="pq" value= "1"></td><td></td><td><a class ="text-secondary del_prod" href = "#"><i class ="fas fa-trash"><i></a></td></tr>');
}

function calculateSale()
{

}
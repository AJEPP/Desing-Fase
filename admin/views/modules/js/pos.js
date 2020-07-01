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
        objectFilter: 'filter',
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
    $("#productsModal").modal('hide');
      var data = $(this).data('prod');

      addProduct(data);
  });

  $(document).on('click', '.brand' ,function ()
  {
    $("#productsModal").modal('show');

    $.post("models/requests/pos.php", {type: 'get_models', brand: $(this).data('id')},
      function (data)
      {
        console.log(data);
        $("#models_cont").html('');

        if(data.models.length > 0)
        {
          for(var i = 0; i < data.models.length; i++)
          {
            $("#models_cont").append('<button class="btn btn-both btn-flat model" data-id="'+ data.models[i].id +'"><span class="bg-img"><img src="'+ data.models[i].mod_img +'" alt="'+ data.models[i].mod_vehiculo +'" style="width: 100px; height: 100px;"></span><span> <span>'+ data.models[i].mod_vehiculo +'</span></span></button>');
          }
        }
        $("#models_loading").addClass('hide');
        $("#slimod").removeClass('hide');
      },
      "json"
    );
  });

  $(document).on('click', '.model' ,function ()
  {
    $("#productsModal").modal('show');

    $.post("models/requests/pos.php", {type: 'get_products_by_model', model: $(this).data('id')},
      function (data)
      {
        console.log(data);
        $("#product_cont").html('');

        if(data.products.length > 0)
        {
          for(var i = 0; i < data.products.length; i++)
          {
            $("#product_cont").append('<button class="btn btn-both btn-flat product" data-store = "' + data.products[i].in_store + '" data-were = "' + data.products[i].in_were + '" data-id = "' + data.products[i].id + '" data-prod = "' + data.products[i].prod + '"> <span class="bg-img"><img src="' + data.products[i].pie_img + '" alt="' + data.products[i].pie_nombre + '" style="width: 100px; height: 100px;"></span><span><span>' + data.products[i].pie_nombre + '</span></span></button>');
          }
        }
        $("#products_loading").addClass('hide');
        $("#slimprod").removeClass('hide');
        $("#carouselExampleInterval").carousel('next');
        $("#carouselExampleInterval").carousel('pause');
      },
      "json"
    );
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
  console.log(data);
  $("#product_list").append('<tr><td>' + data.nombre + '</td><td><input type="number" class="pp" value= "1"></td><td><input type="number" class="pq" value= "1"></td><td></td><td><a class ="text-secondary del_prod" href = "#"><i class ="fas fa-trash"><i></a></td></tr>');
}

function calculateSale()
{

}

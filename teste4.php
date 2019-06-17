<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="js/jquery-3.4.0.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        $("#form").submit(function(){
          var idade = $("#idade").val();
          //
          if (idade == "") {

          } else {
            $.ajax({
              url: 'processo.php',
              data: {idade : idade},
              type: 'GET',
              dataType: 'json',
              success: function(retorno){
                  $(".resultado").html('');
                  $(".resultado").html(retorno.ano);

              },
              error: function(){
                alert("Houve um erro!");
              }
            });
          }
          //
          return false;
        });
      });
    </script>
  </head>
  <body>
    <form class="" action="" method="" id="form">
      <input type="text" name="idade" value="" id="idade">
      <input type="submit" name="" value="Enviar">
    </form>
    <span class="resuldado"></span>
  </body>
</html>

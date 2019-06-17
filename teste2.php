<?php include 'parts/head.php'; ?>

<form action="" method="POST">        
    <label>Categoria:</label>
    <select name="id_categoria" id="id_categoria">
        <option value="">Escolha a Categoria</option>
        <?php
        $resultado_cat = $db->query("SELECT * FROM evento ORDER BY nome");
        while ($row_cat = mysqli_fetch_assoc($resultado_cat)) {
            echo '<option value="' . $row_cat['id'] . '">' . $row_cat['nome'] . '</option>';
        }
        ?>
    </select><br><br>

    <label>Subcategoria:</label>
    <span class="carregando">Aguarde, carregando...</span>
    <select name="id_sub_categoria" id="id_sub_categoria">
        <option value="">Escolha a Subcategoria</option>
    </select><br><br>

    <input type="submit" value="Pesquisar">

</form>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script type="text/javascript">
    $(function(){
        $('#id_categoria').change(function(){
            if( $(this).val() ) {
                $('#id_sub_categoria').hide();
                $('.carregando').show();
                $.getJSON('sub_categorias.php?search=',{id_categoria: $(this).val(), ajax: 'true'}, function(j){
                    var options = '<option value="">Escolha Subcategoria</option>';	
                    for (var i = 0; i < j.length; i++) {
                        options += '<option value="' + j[i].id + '">' + j[i].nome + '</option>';
                    }	
                    $('#id_sub_categoria').html(options).show();
                    $('.carregando').hide();
                });
            } else {
                $('#id_sub_categoria').html('<option value="">– Escolha Subcategoria –</option>');
            }
        });
    });
</script>

<?php include 'parts/footer.php'; ?>
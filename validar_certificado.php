<?php include 'parts/head.php'; ?>

<div class="container">

    <div class="py-1">
        <img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>Validação de certificado online</h2>
    </div>
    <br>
    <div class="row">
        <div class="col-md-12 order-md-1">
            <form class="form-horizontal" action="validar_certificado.php" method="post"  id="contact_form">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="codigo">Código de Verificação no certificado</label>
                        <input type="text" class="search-query form-control" id="codigo" name="codigo">
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="emitir">Verificar Autenticidade</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-12 order-md-1">
                <?php
                if (isset($_POST['emitir'])) {
                    ?>
                    <div class="resultadoForm">
                        <input type="hidden" name="participante_id" id="txtstart"/>
                        <table class="table">
                            <thead>
                                <tr>
                                    <td>CPF</td>
                                    <td>Nome</td>
                                    <td>Curso</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <?php
                            $conn = conectaDB();
                            $sql = "select * from validacao where codigo like '" . $_POST['codigo'] . "'";
                            $result = $conn->query($sql);

                            if (count($result)) {
                                foreach ($result as $res) {
                                    ?>
                                    <tr>
                                        <td><?php echo $res['cpf']; ?></td>
                                        <td><?php echo $res['nome']; ?></td>
                                        <td><?php echo $res['curso']; ?></td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

<!-- ****** Simples função de colocar mascara em javascript ****** -->
<script>  function formatar(mascara, documento){   
    var i = documento.value.length;
    var saida = mascara.substring(0,1);
    var texto = mascara.substring(i);
    if (texto.substring(0,1) != saida){documento.value += texto.substring(0,1);}
}
</script>

<!-- ****** Validando o formulário (inclusive o CPF) ****** -->
<script>
$(document).ready(function() {
    $('#contact_form').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nome: {
                validators: {
                    stringLength: {
                        min: 2
                    },
                    notEmpty: {
                        message: 'Insira o seu nome'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Insira o seu e-mail'
                    },
                    emailAddress: {
                        message: 'E-mail incorreto'
                    }
                }
            },
            cpf: {
                validators: {
                    callback: {
                        message: 'CPF Invalido',
                        callback: function(value) {
                            //retira mascara e nao numeros       
                            cpf = value.replace(/[^\d]+/g, '');
                            if (cpf == '') return false;

                            if (cpf.length != 11) return false;

                            // testa se os 11 digitos são iguais, que não pode.
                            var valido = 0;
                            for (i = 1; i < 11; i++) {
                                if (cpf.charAt(0) != cpf.charAt(i)) valido = 1;
                            }
                            if (valido == 0) return false;

                            //  calculo primeira parte  
                            aux = 0;
                            for (i = 0; i < 9; i++)
                                aux += parseInt(cpf.charAt(i)) * (10 - i);
                            check = 11 - (aux % 11);
                            if (check == 10 || check == 11)
                                check = 0;
                            if (check != parseInt(cpf.charAt(9)))
                                return false;

                            //calculo segunda parte  
                            aux = 0;
                            for (i = 0; i < 10; i++)
                                aux += parseInt(cpf.charAt(i)) * (11 - i);
                            check = 11 - (aux % 11);
                            if (check == 10 || check == 11)
                                check = 0;
                            if (check != parseInt(cpf.charAt(10)))
                                return false;
                            return true;


                        }
                    }
                }
            }
        }
    })

});
</script>
</body>
</html>

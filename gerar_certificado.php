<?php include 'parts/head.php'; ?>

<div class="container">

    <div class="py-1">
        <img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>Gere seu certificado online</h2>
    </div>
    <br>
    <div class="row">
        <div class="row">
            <div class="col-md-12 mb-3">
                <?php
                if (isset($_POST['emitir'])) {
                    ?>
                    <div class="resultadoForm">
                        <input type="hidden" name="participante_id" id="txtstart"/>
                        <table class="table">
                            <thead>
                                <tr>
                                    <td>EVENTO</td>
                                    <td>CURSO</td>
                                    <td>LOCAL</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <?php
                            $conn = conectaDB();
                            $sql = "select p.id, p.cpf, c.id as id_curso, c.nome as curso, e.nome as evento, (select i.nome from instituicao i where i.id=e.instituicao_id) as local from participante p 
                                    join participante_tem_curso ptc on p.id=ptc.participante_id 
                                    join curso c on c.id=ptc.curso_id
                                    join evento e on e.id=ptc.evento_id where p.cpf like '" . $_POST['cpf'] . "' order by p.nome";
                            $result = $conn->query($sql);

                            if (count($result)) {
                                foreach ($result as $res) {
                                    ?>
                                    <tr>
                                        <td><?php echo $res['evento']; ?></td>
                                        <td><?php echo $res['curso']; ?></td>
                                        <td><?php echo $res['local']; ?></td>
                                        <td>
                                            <a href="gerar_certificado/emitir.php?gerar=<?php echo $res['cpf']; ?>&curso=<?php echo $res['curso']; ?>&id=<?php echo $res['id']; ?>&id_curso=<?php echo $res['id_curso']; ?>" target="_blank" class="btn btn-info">Emitir</a>
                                        </td>
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
        <div class="col-md-12 order-md-1">
            <form class="form-horizontal" action="gerar_certificado.php" method="post"  id="contact_form">
                <div class="row">
                    <div class="col-md-4 mb-3">
                    </div>

<!--                    <div class="col-md-4 mb-3">
                        <label for="nome">Evento</label>
                        <select class="custom-select d-block w-100" id="layout" name="id_evento" required>
                            <option value="">Escolha...</option>
                            <?php
//                            $conn = conectaDB();
//                            $sql = "SELECT * FROM evento";
//                            $result = $conn->query($sql);
//
//                            if (count($result)) {
//                                foreach ($result as $res) {
                                    ?>
                                    <option value="<?php echo $res['id']; ?>"><?php echo $res['nome']; ?></option>

                                    <?php
//                                }
//                            }
                            ?>
                        </select>
                        <div class="invalid-feedback">
                            Please provide a valid state.
                        </div>
                    </div>-->

                    <div class="col-md-4 mb-3">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="cpf">CPF</label>
                        <input type="text" class="search-query form-control" id="cpf" name="cpf" placeholder="Buscar por CPF" maxlength="14" onkeypress="formatar('###.###.###-##', this);">
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>

                    <div class="col-md-4 mb-3">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="emitir">Gerar Certificado</button>
                    </div>

                    <div class="col-md-4 mb-3">
                    </div>
                </div>
            </form>
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

<?php include 'parts/head.php'; ?>

<div class="container">
    <div class="py-1">
        <img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>Cadastro de Certificados</h2>
    </div>
    <br/>
    <div class="row">
        <div class="col-md-12 order-md-1">
            <form class="needs-validation" action="server/server.php" method="POST" enctype="multipart/form-data" novalidate>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="input-default-wrapper mt-3">
                            <label for="file">Layout do Cerfificado</label><br/>
                            <input type="file" name="layout" id="file-with-current" class="input-default-js">
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <div class="input-default-wrapper mt-3">
                            <label for="file">Assinatura Eletrônica</label><br/>
                            <input type="file" name="ass" id="file-with-current" class="input-default-js">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="evento">Evento</label>
                        <select class="custom-select d-block w-100" id="layout" name="id_evento" required>
                            <option value="">Escolha...</option>
                            <?php
                            $conn = conectaDB();
                            $sql = "SELECT * FROM evento order by nome";
                            $result = $conn->query($sql);

                            if (count($result)) {
                                foreach ($result as $res) {
                                    ?>
                                    <option value="<?php echo $res['id']; ?>"><?php echo $res['nome']; ?></option>

                                    <?php
                                }
                            }
                            ?>
                        </select>
                        <div class="invalid-feedback">
                            Please provide a valid state.
                        </div>
                    </div>
                </div>

                <hr class="mb-4">

                <button class="btn btn-primary btn-lg btn-block" type="submit" name="certificado">Confirmar Cadastro</button>
            </form>
        </div>
    </div>

    <?php include 'parts/footer.php'; ?>

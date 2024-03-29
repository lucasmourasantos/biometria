<?php include 'parts/head.php'; ?>

<div class="container">
    <div class="py-1 text-center">
        <img class="d-block mx-auto mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>Cadastro de Instituição.</h2>
    </div>

    <div class="row">
        <div class="col-md-12 order-md-1">
            <form class="needs-validation" action="server/server.php" method="POST" novalidate>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <label for="nome">Nome </label>
                        <input type="text" class="form-control" id="firstName" name="nome" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                </div>
                <br>
                <button class="btn btn-primary btn-lg btn-block" type="submit" name="instituicao">Confirmar</button>
            </form>
        </div>
    </div>

    <?php include 'parts/footer.php'; ?>

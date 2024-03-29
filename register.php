
<?php include('server.php'); ?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="imagens/Logo Certifico Resumida.png">

        <title>Signin</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">
    </head>

    <body class="text-center">
        <form class="form-signin" method="post" action="server.php">
            <!--Mostrar validação de erros-->
            <?php //include('errors.php'); ?>

            <img class="mb-4" src="imagens/Logo Certifico Resumida.png" alt="" width="72" height="72">

            <h1 class="h3 mb-3 font-weight-normal">Cadastro</h1>

            <label for="inputNome" class="sr-only">Nome</label>
            <input type="text" id="inputNome" name="username" class="form-control" placeholder="Nome de usuário" required autofocus>

            <label for="inputEmail" class="sr-only">Email</label>
            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email" required>

            <label for="inputPassword" class="sr-only">Senha</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Senha" name="password_1" required>

            <label for="inputPassword" class="sr-only">Confirmar a senha</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Repetir a senha" name="password_2" required>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Me lembre
                </label>
            </div>

            <button class="btn btn-lg btn-primary btn-block" type="submit" name="register">Cadastrar</button>

            <p class="mt-3 mb-1">Já é membro? <a href="login.php">Fazer login <a/></p>

            <p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>

        </form>
    </body>
</html>

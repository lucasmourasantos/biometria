<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Escola</title>
</head>
<body>
    <div class="resultadoForm">
        <table>
            <thead>
            <tr>
                <td>ID</td>
                <td>NOME</td>
                <td>NOTA</td>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <form name="formEscola" id="formEscola" method="post" action="controllerEscola.php">
        <input type="text" name="busca" id="busca"><br>
        <input type="submit" value="Pesquisar">
    </form>

    <script src="js/zepto.min.js"></script>
    <script src="javascript.min.js"></script>
</body>
</html>

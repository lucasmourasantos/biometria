<?php

include('conecta.php');

$conn = conectaDB();

$campo = $_POST['cpf'];

$stmt = $conn->prepare("select * from participante where cpf = ?");
$stmt->bind_param("1", $campo);
$stmt->execute();
$stmt->bind_result($cpf, $nome);

echo "
    <table>
        <thead>
        <tr>
            <td>CPF</td>
            <td>Nome</td>
        </tr>
        </thead>

        <tbody>
        ";

while ($sql->fetch()) {

    echo "
        <tr>
            <td>$cpf</td>
            <td>$nome</td>
        </tr>
        ";
}

echo "
        </tbody>
    </table>
";








//include 'Pesquisa.php';
//
//$busca = filter_input(INPUT_POST, 'cpf', FILTER_SANITIZE_SPECIAL_CHARS);
//$pesquisa = new Pesquisa();
//$retorno = $pesquisaDB($busca);
//echo json_decode($retorno);
?>

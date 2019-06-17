<?php

include ("server/conexao.php");

function pesquisaDB($busca) {
    $crud = $this->conectaDB()->prepare("select * from participante where cpf = :cpf");
    $crud->bindValue(':cpf', $busca);
    $crud->execute();

    echo json_decode($busca);

    return $f = $crud->fetch(PDO::FETCH_ASSOC);
}

?>

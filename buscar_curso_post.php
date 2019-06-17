<?php

include_once("server/conexao.php");
$conn = conectaDB();

$id_evento = $_REQUEST['id_evento'];

$result_curso = "SELECT * FROM curso WHERE evento_id=$id_evento ORDER BY nome";
$stmt = $conn->prepare($result_curso);
$stmt->execute();

$resultado = $stmt->fetchAll();

    foreach ($resultado as $row) {
        $resultado_curso[] = array(
            'id' => $row['id'],
            'nome' => $row['nome'],
            'turno' => $row['turno']
        );
    }

echo(json_encode($resultado_curso));

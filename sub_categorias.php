<?php

include_once("server/server.php");

$id_categoria = $_REQUEST['id_categoria'];

$resultado_sub_cat = $db->query("SELECT * FROM curso WHERE evento_id=$id_categoria ORDER BY nome");

while ($row_sub_cat = mysqli_fetch_assoc($resultado_sub_cat)) {
    $resultao_sub_cat[] = array(
        'id' => $row_sub_cat['id'],
        'nome' => utf8_encode($row_sub_cat['nome']),
    );
}

echo(json_encode($resultao_sub_cat));

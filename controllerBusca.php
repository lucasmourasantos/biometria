<?php
include "ClassPesquisaCPF.php";

//$busca=filter_input(INPUT_POST,'busca',FILTER_SANITIZE_SPECIAL_CHARS);
$busca=filter_input(INPUT_POST,'cpf',FILTER_SANITIZE_STRING);
$pesquisa=new ClassPesquisa();
$retorno=$pesquisa->pesquisaDb($busca);
echo json_encode($retorno);


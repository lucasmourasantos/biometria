<?php
include("ClassConexaoBusca.php");

class ClassPesquisa extends ClassConexao{

    public function pesquisaDb($busca)
    {
      
//        $buscaLike='%'.$busca.'%';
        $crud=$this->conectaDB()->prepare("select * from participante where cpf = :cpf");
        $crud->bindValue(':cpf',$busca);
        $crud->execute();
        return $f=$crud->fetchAll();
    }
}

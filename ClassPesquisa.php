<?php
include("ClassConexao.php");

class ClassPesquisa extends ClassConexao{

    public function pesquisaDb($busca)
    {
      
//        $buscaLike='%'.$busca.'%';
        $crud=$this->conectaDB()->prepare("select * from boletim where nota = :nota");
        $crud->bindValue(':nota',$busca);
        $crud->execute();
        return $f=$crud->fetchAll();
    }
}

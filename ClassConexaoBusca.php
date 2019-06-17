<?php
abstract class ClassConexao{

    protected function conectaDB()
    {
        try{
            $con=new PDO("mysql:host=localhost;dbname=fingerprint","root","");
            return $con;
        }catch (PDOException $erro){
            return $erro->getMessage();
        }
    }
}

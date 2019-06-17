<?php

include 'conexao.php';

$conn = conectaDB();

if (isset($_POST['save'])) {
    $nome = $_POST['nome'];
    $sexo = $_POST['sexo'];
    $rg = $_POST['rg'];
    $cpf = $_POST['cpf'];
    $data_nasc = $_POST['data_nasc'];
    $cep = $_POST['cep'];
    $rua = $_POST['rua'];
    $bairro = $_POST['bairro'];
    $cidade = $_POST['cidade'];
    $estado = $_POST['uf'];
    $fone = $_POST['fone'];

    $sql = "INSERT INTO participante (nome, sexo, rg, cpf, data_nasc, cep, rua, bairro, cidade, estado, fone)
             VALUES(:nome, :sexo, :rg, :cpf, :data_nasc, :cep, :rua, :bairro, :cidade, :estado, :fone)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':sexo', $sexo);
    $stmt->bindParam(':rg', $rg);
    $stmt->bindParam(':cpf', $cpf);
    $stmt->bindParam(':data_nasc', $data_nasc);
    $stmt->bindParam(':cep', $cep);
    $stmt->bindParam(':rua', $rua);
    $stmt->bindParam(':bairro', $bairro);
    $stmt->bindParam(':cidade', $cidade);
    $stmt->bindParam(':estado', $estado);
    $stmt->bindParam(':fone', $fone);

    $result = $stmt->execute();

    if (!$result) {
        var_dump($stmt->errorInfo());
        exit();
    }

    //$_SESSION['message'] = "Record has been saved!";
    //$_SESSION['msg_type'] = "success";
    header('Location: ../cad-participante.php');
}

if (isset($_POST['instituicao'])) {
    $nome = $_POST['nome'];

    $sql = "INSERT INTO instituicao (nome) VALUES(:nome)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':nome', $nome);

    $result = $stmt->execute();

    if (!$result) {
        var_dump($stmt->errorInfo());
        exit();
    }
    //$_SESSION['message'] = "Record has been saved!";
    //$_SESSION['msg_type'] = "success";
    header('Location: ../cad-instituicao.php');
}

if (isset($_POST['evento'])) {
    $instituicao_id = $_POST['id'];
    $nome = $_POST['nome'];

    $sql = "INSERT INTO evento (instituicao_id, nome) VALUES(:instituicao_id, :nome)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':instituicao_id', $instituicao_id);
    $stmt->bindParam(':nome', $nome);

    $result = $stmt->execute();

    if (!$result) {
        var_dump($stmt->errorInfo());
        exit();
    }
    //$_SESSION['message'] = "Record has been saved!";
    //$_SESSION['msg_type'] = "success";
    header('Location: ../cad-evento.php');
}

if (isset($_POST['inscricao'])) {
    $participante_id = $_POST['participante_id'];
    $curso_id = $_POST['id_curso'];
    $evento_id = $_POST['id_evento'];

    $sql = "INSERT INTO participante_tem_curso (participante_id, curso_id, evento_id) VALUES(:participante_id, :curso_id, :evento_id)";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':participante_id', $participante_id);
    $stmt->bindParam(':curso_id', $curso_id);
    $stmt->bindParam(':evento_id', $evento_id);

    $result = $stmt->execute();

    if (!$result) {
        var_dump($stmt->errorInfo());
        exit();
    }
    //$_SESSION['message'] = "Record has been saved!";
    //$_SESSION['msg_type'] = "success";
    header('Location: ../cad-inscricao.php');
}

if (isset($_POST['curso'])) {
    $evento_id = $_POST['id_evento'];
    $nome = $_POST['nome'];
    $ministrante = $_POST['ministrante'];
    $ch = $_POST['ch'];
    $ch_min = $_POST['ch_min'];
    $inicio = $_POST['inicio'];
    $fim = $_POST['fim'];
    $turno = $_POST['turno'];

    $sql = "INSERT INTO curso (evento_id, nome, ministrante, ch, ch_min, inicio, fim, turno) 
            VALUES(:evento_id, :nome, :ministrante, :ch, :ch_min, :inicio, :fim, :turno)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':evento_id', $evento_id);
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':ministrante', $ministrante);
    $stmt->bindParam(':ch', $ch);
    $stmt->bindParam(':ch_min', $ch_min);
    $stmt->bindParam(':inicio', $inicio);
    $stmt->bindParam(':fim', $fim);
    $stmt->bindParam(':turno', $turno);

    $result = $stmt->execute();

    if (!$result) {
        var_dump($stmt->errorInfo());
        exit();
    }
    //$_SESSION['message'] = "Record has been saved!";
    //$_SESSION['msg_type'] = "success";
    header('Location: ../cad-curso.php');
}

if (isset($_POST['certificado'])) {
    $evento_id = $_POST['id_evento'];

    $extensao1 = strtolower(substr($_FILES['layout']['name'], -4)); // -4 pra pegar os últimos caracteries, ou seja, o formato da imagem
    $layout = md5(time()) . $extensao1; //Define um novo nome para o arquivo
    $diretorio = "../gerar_certificado/layout_ass/";

    move_uploaded_file($_FILES['layout']['tmp_name'], $diretorio . $layout); //Efetua o upload

    $extensao2 = strtolower(substr($_FILES['ass']['name'], -4)); // -4 pra pegar os últimos caracteries, ou seja, o formato da imagem
    $ass = md5(time() + 1) . $extensao2; //Define um novo nome para o arquivo

    move_uploaded_file($_FILES['ass']['tmp_name'], $diretorio . $ass); //Efetua o upload

    $sql = "INSERT INTO certificado (evento_id, layout, ass) VALUES(:evento_id, :layout, :ass)";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':evento_id', $evento_id);
    $stmt->bindParam(':layout', $layout);
    $stmt->bindParam(':ass', $ass);

    $result = $stmt->execute();

    if (!$result) {
        var_dump($stmt->errorInfo());
        exit();
    }
    //$_SESSION['message'] = "Record has been saved!";
    //$_SESSION['msg_type'] = "success";
    header('Location: ../cad-certificado.php');
}
?>
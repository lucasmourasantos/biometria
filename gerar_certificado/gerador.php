<?php

setlocale(LC_ALL, 'pt_BR', 'pt_BR.iso-8859-1', 'pt_BR.utf-8', 'portuguese');
date_default_timezone_set('America/Sao_Paulo');
require('fpdf/alphapdf.php');
//require('PHPMailer/class.phpmailer.php');
// --------- Variáveis do Formulário ----- //
//$email    = $_POST['email'];
$nome = $_POST['nome'];
$cpf = $_POST['cpf'];

// --------- Variáveis que podem vir de um banco de dados por exemplo ----- //
$empresa = "Instituto Federal de Educação, Ciência e Tecnologia do Piauí";
$evento = "SINFO";
$tipo = "Participante";
$curso = "Workshop Segurança da Informação";
$data_ini = "19/02/2019";
$data_fim = "21/02/2019";
$carga_h = "8 horas";
$codigo = "sP2gY8";


$texto2 = utf8_decode("Certificamos que " . $nome . " participou como " . $tipo . " do(a) " . $evento . 
                        " na data de " . $data_ini . " a " . $data_fim . ". Local: " . $empresa . 
                        ". Carga horária total: " . $carga_h . ". \nCódido de verificação online: " . $codigo . ".");
$texto3 = utf8_decode("Picos-PI, " . utf8_encode(strftime('%d de %B de %Y', strtotime(date('Y-m-d')))));


$pdf = new AlphaPDF();

// Orientação Landing Page ///
$pdf->AddPage('L');

$pdf->SetLineWidth(1.5);


// desenha a imagem do certificado
$pdf->Image('layout/cert_1.png', 0, 0, 298);

// opacidade total
$pdf->SetAlpha(1);

// Mostrar texto no topo
//$pdf->SetFont('Arial', '', 15); // Tipo de fonte e tamanho
//$pdf->SetXY(87,46); //Parte chata onde tem que ficar ajustando a posição X e Y
//$pdf->MultiCell(120, 10, $texto1, '', 'C', 0); // Tamanho width e height e posição

// Mostrar o nome
//$pdf->SetFont('Arial', '', 30); // Tipo de fonte e tamanho
//$pdf->SetXY(20,86); //Parte chata onde tem que ficar ajustando a posição X e Y
//$pdf->MultiCell(265, 10, $nome, '', 'C', 0); // Tamanho width e height e posição

// Mostrar o corpo
$pdf->SetFont('Arial', '', 15); // Tipo de fonte e tamanho
$pdf->SetXY(18, 100); //Parte chata onde tem que ficar ajustando a posição X e Y
$pdf->MultiCell(265, 10, $texto2, '', 'J', 0); // Tamanho width e height e posição

// Mostrar a data no final
$pdf->SetFont('Arial', '', 15); // Tipo de fonte e tamanho
$pdf->SetXY(32, 152); //Parte chata onde tem que ficar ajustando a posição X e Y
$pdf->MultiCell(165, 10, $texto3, '', 'L', 0); // Tamanho width e height e posição

// Mostrar a data no final
$pdf->SetFont('Arial', '', 15); // Tipo de fonte e tamanho
$pdf->SetXY(32, 172); //Parte chata onde tem que ficar ajustando a posição X e Y
$pdf->MultiCell(165, 10, "### Assinatura ###", '', 'L', 0); // Tamanho width e height e posição

$pdfdoc = $pdf->Output('', 'S');



// ******** Agora vai enviar o e-mail pro usuário contendo o anexo
// ******** e também mostrar na tela para caso o e-mail não chegar
//$subject = 'Seu Certificado do Workshop';
//$messageBody = "Olá $nome<br><br>É com grande prazer que entregamos o seu certificado.<br>Ele está em anexo nesse e-mail.<br><br>Atenciosamente,<br>Lincoln Borges<br><a href='http://www.lnborges.com.br'>http://www.lnborges.com.br</a>";
//$mail = new PHPMailer();
//$mail->SetFrom("certificado@lnborges.com.br", "Certificado");
//$mail->Subject    = $subject;
//$mail->MsgHTML(utf8_decode($messageBody));	
//$mail->AddAddress($email); 
//$mail->addStringAttachment($pdfdoc, 'certificado.pdf');
//$mail->Send();

$certificado = "../arquivos/$cpf.pdf"; //atribui a variável $certificado com o caminho e o nome do arquivo que será salvo (vai usar o CPF digitado pelo usuário como nome de arquivo)
$pdf->Output($certificado, 'F'); //Salva o certificado no servidor (verifique se a pasta "arquivos" tem a permissão necessária)
// Utilizando esse script provavelmente o certificado ficara salvo em www.seusite.com.br/gerar_certificado/arquivos/999.999.999-99.pdf (o 999 representa o CPF digitado pelo usuário)

$pdf->Output(); // Mostrar o certificado na tela do navegador
?>

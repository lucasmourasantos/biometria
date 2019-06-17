<?php

require('fpdf.php');
require('../dtSis/dbaSis.php');

function troca_caracteres($texto) {

    $entrada = array('&aacute;', '&eacute;', '&iacute;', '&oacute;', '&uacute;', '&atilde;', '&otilde;', '&acirc;', '&ecirc;', '&icirc;', '&ocirc;', '&ucirc;', '&ccedil;', '&Aacute;', '&Eacute;', '&Iacute;', '&Oacute;', '&Uacute;', '&Atilde;', '&Otilde;', '&Acirc;', '&Ecirc;', '&Icirc;', '&Ocirc;', '&Ucirc;', '&Ccedil;', '&agrave;', '&Agrave;');

    $saida = array('á', 'é', 'í', 'ó', 'ú', 'ã', 'õ', 'â', 'ê', 'î', 'ô', 'û', 'ç', 'Á', 'É', 'Í', 'Ó', 'Ú', 'Ã', 'Õ', 'Â', 'Ê', 'Î', 'Ô', 'Û', 'Ç', 'à', 'À');

    $result = str_replace($entrada, $saida, $texto);

    return utf8_decode($result);
}

function getQuantHora($hora_i,$hora_f) {
    $hora_min = explode(':', $hora_i);
    $hora_max = explode(':', $hora_f);
    $hora_min = mktime($hora_min[0], $hora_min[1], $hora_min[2]);
    $hora_max = mktime($hora_max[0], $hora_max[1], $hora_max[2]);
    $media = ($hora_max - $hora_min) / (60 ^ 2);
    return $media = abs($media / 60);
}

function getMinMax($data, $id) {
    $ponto = array();
    $readPonto = exeSQL("select * from tbponto where idAluno='$id' and data='$data'");
    foreach ($readPonto as $value) {
        $ponto[] = $value['hora'];
    }
    $min = min($ponto);
    $max = max($ponto);

    return $min . '#' . $max . '#' . $data;
}

function MinMax($MinMax) {
    $array = array();
    $array['min'] = min($MinMax);
    $array['max'] = max($MinMax);
    return $array;
}

class PDF extends FPDF {

// Page header
    function Header() {
        // Logo
        //$this->Image('logo.png',20,10,30);
        // Arial bold 15
        $this->SetFont('courier', '', 11);
        // Move to the right
        $this->Line(10, 10, 200, 10);
        $this->Cell(0.5);
        // Title
        $this->Cell(185, 5, troca_caracteres('Uso Exclusivo de: Cópia de Demonstração'), 0, 1, 'L');
        $this->Cell(185, 5, troca_caracteres('UNIVERSIDADE RAIMUNDO SÁ'), 0, 1, 'L');
        $this->Cell(185, 5, troca_caracteres('BATIDA DE PONTO'), 0, 1, 'L');

        $this->Line(10, 26, 200, 26);
        // Line break
        $this->Ln(5);
    }

// Page footer
    function Footer() {
        // Position at 1.5 cm from bottom
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // Page number
        $this->Cell(0, 10, troca_caracteres('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

}

// Instanciation of inherited class
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();

$pdf->SetFont('courier', '', 11);

$matricula = $_GET['matricula'];
$read = read('participante');
// Mostrar texto no topo
$pdf->SetFont('courier', '', 11); // Tipo de fonte e tamanho
$pdf->SetXY(18,26); //Parte chata onde tem que ficar ajustando a posição X e Y
$pdf->MultiCell(120, 10, "Tecto a ser exibido", '', 'C', 0); // Tamanho width e height e posição

$pdf->SetFont('courier', '', 11); // Tipo de fonte e tamanho
$pdf->SetXY(18,36); //Parte chata onde tem que ficar ajustando a posição X e Y
$pdf->MultiCell(120, 10, "Tecto 2 a ser exibido", '', 'C', 0); // Tamanho width e height e posição

$pdf->Cell(18, 5, 'CPF', 0, 0, 'C');
$pdf->Cell(22, 5, 'Nome', 0, 0, 'C');
//$pdf->Cell(28, 5, 'Qtd. Horas', 0, 0, 'C');
//$pdf->Cell(22, 5, 'Status', 0, 1, 'C');
$pdf->Cell(18, 5,'---------------' , 0, 0, 'C');
$pdf->Cell(22, 5, '-------------------------------------------', 0, 0, 'C');
//$pdf->Cell(28, 5, '-----------', 0, 0, 'C');
//$pdf->Cell(22, 5, '---------', 0, 1, 'C');

if ($read) {
    foreach ($read as $key) {

//        $dia1 = explode('#', getMinMax('2014-05-21', $key['id']));
//        $dia2 = explode('#', getMinMax('2014-05-22', $key['id']));
//        $dia3 = explode('#', getMinMax('2014-05-23', $key['id']));
//
//        $qtHora1 = number_format(getQuantHora($dia1[0], $dia1[1]));
//        $qtHora2 = number_format(getQuantHora($dia2[0], $dia2[1]));
//        $qtHora3 = number_format(getQuantHora($dia3[0], $dia3[1]));
//        
//        $horas = ($qtHora1 + $qtHora2 + $qtHora3);
        
        $pdf->Cell(28, 5, $key['cpf'], 0, 0, 'C');
        $pdf->Cell(132, 5,$key['nome'], 0, 0, 'L');
//        $pdf->Cell(28, 5, "horas", 0, 0, 'C');
//        $pdf->Cell(22, 5, "horas", 0, 1, 'C');
    }
}

$pdf->Cell(28, 5,'----------' , 0, 0, 'C');
$pdf->Cell(112, 5, '-----------------------------------------------', 0, 0, 'C');
//$pdf->Cell(28, 5, '-----------', 0, 0, 'C');
//$pdf->Cell(22, 5, '---------', 0, 1, 'C');

$pdf->Output();
?>
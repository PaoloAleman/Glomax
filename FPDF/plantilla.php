<?php


/**
 * Plantilla para encabezado y pie de página
 *
 * Fecha: 17/01/2023
 * Autor: Marco Robles
 * Web:   https://github.com/mroblesdev
 */

require 'FPDF/fpdf.php';

class PDF extends FPDF
{
    // Cabecera de página
    function Header()
    {
        global $nombreGrado;
        global $tituloReporte;
        // Logo
        while(!isset($this->headerImpreso)){
            $this->Image("public/iconos/logo.jpeg", 10, 5, 15);

            // Arial bold 15
            $this->SetFont("Arial", "B", 12);

            // Título
            $this->Cell(25);
            $this->Cell(140, 5, mb_convert_encoding($tituloReporte, 'ISO-8859-1', 'UTF-8'), 0, 0, "C");

            //Fecha
            $this->SetFont("Arial", "", 12);
            $this->Cell(25, 5, "Fecha: " . date("d/m/Y"), 0, 1, "C");
            $this->SetFont("Arial", "", 20);

            $this->Cell(0, 10, "Lista de vestidos" . $nombreGrado, 0, 1, "C");

            // Salto de línea
            $this->Ln(10);
            $this->headerImpreso = true;

        }


    }

    // Pie de página
    function Footer()
    {
        // Posición: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // Número de página
        $this->Cell(0, 10, 'Pagina ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}
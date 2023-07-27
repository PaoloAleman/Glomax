<?php

class VestidoModel
{
    private $database;
    private $pdf;

    public function __construct($database,$pdf){
        $this->database=$database;
        $this->pdf=$pdf;
    }

    public function getVestidos(){
       if(isset($_POST["buscar"])){
           $vestido=$_POST["vestidoBuscado"];
           $sql="SELECT nombre, entrada, salida, saldoTotalMercaderia,
                    precio, saldoTotal, DATE_FORMAT(fechaPago,'%d-%m-%Y') as fechaPago
                FROM vestido
                WHERE nombre='$vestido'
                ORDER BY id";
           return $this->database->query($sql);
       }else{
           return $this->getVestidosSinFiltro();
       }
    }

    public function getVestidosSinFiltro(){
        $sql="SELECT nombre, entrada, salida, saldoTotalMercaderia,
                    precio, saldoTotal, DATE_FORMAT(fechaPago,'%d-%m-%Y') as fechaPago
                FROM vestido
                ORDER BY id";
        return $this->database->query($sql);
    }

    public function getNombresVestidos(){
        $sql="SELECT nombre
                FROM vestido
                ORDER BY nombre";
        return $this->database->query($sql);
    }

    public function getDetallePorVestido($vestido){
        if(isset($_POST["filtrar"])){
            $sql="SELECT *
                FROM vestidosDetalle
                WHERE nombre_vestido='$vestido'". $this->filtrarPor();
            return $this->database->query($sql);
        }else {
            $sql = "SELECT *
                FROM vestidosDetalle
                WHERE nombre_vestido='$vestido'";
            return $this->database->query($sql);
        }
    }

    public function getNombreVestidoDetalle($vestido){
        $sql="SELECT nombre
                FROM vestido
                WHERE nombre='$vestido'";
        return $this->database->query($sql)->fetch_assoc()["nombre"];
    }

    public function getTotalesPorVestido($vestido){
        if(isset($_POST["filtrar"])){
            $sql="SELECT sum(cantidadE) as totalEntrada, sum(cantidadS) as totalSalida,
                sum(totalStock) as totalStock, sum(saldoTotal) as saldoTotal
                FROM vestidosDetalle
                WHERE nombre_vestido='$vestido'".$this->filtrarPor();
            return $this->database->query($sql);
        }else{
            $sql = "SELECT SUM(cantidadE) as totalEntrada, SUM(cantidadS) as totalSalida,
                SUM(totalStock) as totalStock, SUM(saldoTotal) as saldoTotal
                FROM vestidosDetalle
                WHERE nombre_vestido='$vestido'";
            return $this->database->query($sql);
        }
    }

    public function ponerEnCero(){
        $sql="UPDATE vestidosDetalle SET totalStock=cantidadE-cantidadS, saldoTotal=0";
        $this->database->query($sql);
    }

    public function filtrarPor(){
        $condiciones[]="";
            if(isset($_POST["talles"])){
                $condiciones[]="and talle_vestido='".$_POST["talles"]."'";
            }

            if(isset($_POST["colores"])){
                $condiciones[]="and color_vestido='".$_POST["colores"]."'";
            }
       return implode("",$condiciones);
    }

    public function getTalles(){
        $sql="SELECT DISTINCT talle_vestido
                FROM vestidosDetalle
                ORDER BY talle_vestido";
        return $this->database->query($sql);
    }
    public function getColores(){
        $sql="SELECT DISTINCT color_vestido
                FROM vestidosDetalle
                ORDER BY color_vestido";
        return $this->database->query($sql);
    }

    public function getVestidosDetalles(){
        $sql = "SELECT nombre_vestido, talle_vestido, color_vestido
                FROM vestidosDetalle
                WHERE cantidadE>cantidadS";
        $vestidos=$this->database->query($sql);
        $arrayAsociativo = array();
        while ($fila = mysqli_fetch_assoc($vestidos)) {
            $arrayAsociativo[] = $fila;
        }
        return $arrayAsociativo;
    }

    public function getVestidosDetallesSinFiltros(){
        $sql = "SELECT nombre_vestido, talle_vestido, color_vestido
                FROM vestidosDetalle";
        $vestidos=$this->database->query($sql);
        $arrayAsociativo = array();
        while ($fila = mysqli_fetch_assoc($vestidos)) {
            $arrayAsociativo[] = $fila;
        }
        return $arrayAsociativo;
    }

    public function getTotales(){
        if(isset($_POST["buscar"])){
            $vestido=$_POST["vestidoBuscado"];
            $sql="SELECT entrada as totalEntrada, salida as totalSalida,
                saldoTotalMercaderia as totalStock, saldoTotal as totalSaldo
                FROM vestido
                WHERE nombre='$vestido'";
            return $this->database->query($sql);
        }else{
            $sql="SELECT SUM(entrada) as totalEntrada, SUM(salida) as totalSalida,
                SUM(saldoTotalMercaderia) as totalStock, SUM(saldoTotal) as totalSaldo
                FROM vestido";
            return $this->database->query($sql);
        }
    }

    public function realizarPago(){
        if(isset($_POST["pagarTodo"])){
            $datos=$this->getTotales()->fetch_assoc();
            $cantSalidas=$datos["totalSalida"];
            $saldoPagado=$datos["totalSaldo"];
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $fecha=date("Y-m-d");
            $sql="INSERT INTO historialPagos(cantidadSalidas,saldoPagado,fechaPagada)
                    VALUES ('$cantSalidas','$saldoPagado','$fecha')";
            $this->database->query($sql);
            $sql="UPDATE vestido
                    SET entrada=entrada-salida, salida=0, saldoTotalMercaderia=entrada, saldoTotal=0, fechaPago='$fecha'";
            $this->database->query($sql);
            $sql="UPDATE vestidosDetalle
                    SET cantidadE=cantidadE-cantidadS, cantidadS=0, totalStock=cantidadE, saldoTotal=0 ";
            $this->database->query($sql);
        }
    }

    public function getHistorialDePagos(){
        $sql="SELECT cantidadSalidas, saldoPagado, DATE_FORMAT(fechaPagada,'%d-%m-%Y') as fechaPagada
                FROM historialPagos";
        return $this->database->query($sql);
    }

    public function cambiarPrecio(){
        if(isset($_POST["cambiarPrecio"])){
            $vestido=$_POST["nombre"];
            $precio=$_POST["precio"];
            $sql="UPDATE vestido
                    SET precio='$precio'
                        WHERE nombre='$vestido'";
            $this->database->query($sql);
        }
    }

    public function generarPDF($vestidos){
        if (isset($_POST["pagarTodo"])) {
            date_default_timezone_set("America/Argentina/Buenos_Aires");
            $fechaActual=date("Y-m-d");
            $fechaPago=$this->getUltimaFechaDePago();
            $tituloReporte = "Lista de vestidos ($fechaPago / $fechaActual)";
            $this->darDatosDefault($tituloReporte);
            $this->pdf->SetMargins(5, 10, 10);
            $this->pdf->SetFont("Arial","",14);
            $this->pdf->Cell(40, 5, "Total de ventas: ". $this->getTotalesVestidosPagados(), 0, 1, "C");
            $this->pdf->Cell(40, 5, "", 0, 1, "C");
            $this->pdf->SetFont("Arial","",14);
            $this->pdf->SetFillColor(173,216,230);
            $this->pdf->Cell(20, 7, mb_convert_encoding("Número", 'ISO-8859-1', 'UTF-8'), 1, 0, "C",true);
            $this->pdf->Cell(65, 7, "Nombre", 1, 0, "C",true);
            $this->pdf->Cell(20, 7, "Talle", 1, 0, "C",true);
            $this->pdf->Cell(40, 7, "Color", 1, 0, "C",true);
            $this->pdf->Cell(25, 7, "Cantidad", 1, 0, "C",true);
            $this->pdf->Cell(35, 7, "Fecha", 1, 1, "C",true);
            $i=1;
            foreach ($vestidos as $vestido){
                $this->pdf->Cell(20, 7, $i++, 1, 0, "C");
                $this->pdf->Cell(65, 7, $vestido[1], 1, 0, "C");
                $this->pdf->Cell(20, 7, $vestido[2], 1, 0, "C");
                $this->pdf->Cell(40, 7, $vestido[3], 1, 0, "C");
                $this->pdf->Cell(25, 7, $vestido[5], 1, 0, "C");
                $this->pdf->Cell(35, 7, $vestido[6], 1, 1, "C");
            }

            $this->pdf->Output('D', $tituloReporte . '.pdf');
        }
    }

    public function getVestidosPagados(){
        $fechaPago=$this->getUltimaFechaDePago();
        date_default_timezone_set("America/Argentina/Buenos_Aires");
        $fechaActual=date('Y-m-d');
        $sql="SELECT id, nombre_vestido, talle_vestido, color_vestido, tipo,
                    cantidad, DATE_FORMAT(fecha,'%d-%m-%Y') as fecha
                FROM registros
                WHERE tipo='Salida' and fecha between '$fechaPago' and '$fechaActual'
                ORDER BY fecha, nombre_vestido,talle_vestido,color_vestido";
        return $this->database->query($sql);
    }
    public function getTotalesVestidosPagados(){
        $fechaPago=$this->getUltimaFechaDePago();
        date_default_timezone_set("America/Argentina/Buenos_Aires");
        $fechaActual=date('Y-m-d');
        $sql="SELECT count(id) as cantidad
                FROM registros
                WHERE tipo='Salida' and fecha between '$fechaPago' and '$fechaActual'";
        return $this->database->query($sql)->fetch_assoc()["cantidad"];
    }

    public function getUltimaFechaDePago(){
        date_default_timezone_set("America/Argentina/Buenos_Aires");
        $fechaActual=date('Y-m-d');
        $sql="SELECT fechaPagada
                FROM historialPagos
                    WHERE fechaPagada!='$fechaActual'
                    ORDER BY fechaPagada DESC LIMIT 1 ";
        return $this->database->query($sql)->fetch_assoc()["fechaPagada"];
    }

    public function darDatosDefault($tituloReporte){
        $this->pdf->SetTitle($tituloReporte);
        $this->pdf->SetAuthor('Glomax');
        $this->pdf->AliasNbPages();
        $this->pdf->AddPage();
        $this->pdf->SetFont("Arial", "B", 9);

        $this->pdf->SetFont("Arial", "", 9);
    }


}
<?php

class VestidoModel
{
    private $database;

    public function __construct($database){
        $this->database=$database;
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
        $sql="SELECT SUM(cantidadE) as totalEntrada, SUM(cantidadS) as totalSalida,
                SUM(totalStock) as totalStock
                FROM vestidosDetalle";
        return $this->database->query($sql);
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
        $sql="SELECT SUM(entrada) as totalEntrada, SUM(salida) as totalSalida,
                SUM(saldoTotalMercaderia) as totalStock, SUM(saldoTotal) as totalSaldo
                FROM vestido";
        return $this->database->query($sql);
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


}
<?php

class RegistroModel{

    private $database;

    public function __construct($database){
        $this->database=$database;
    }

    public function agregarSalida(){
        if(isset($_POST["agregarSalida"])){
            $vestido=$_POST["vestido"];
            $cantidad=$_POST["cantidad"];
            $talle=$_POST["talles"];
            $color=$_POST["colores"];
            $stock= $this->obtenerStockDelVestido($vestido,$talle,$color);
            $precio=$this->obtenerPrecioDelVestido($vestido);
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $fecha=date("Y-m-d");
            if($stock>$cantidad){
                $sql="INSERT INTO registros(nombre_vestido,talle_vestido,color_vestido,tipo,cantidad,fecha)
                            VALUES('$vestido','$talle','$color','Salida','$cantidad','$fecha')";
                $this->database->query($sql);
                $sql="UPDATE vestidosDetalle
                        SET cantidadS=cantidadS+'$cantidad', totalStock=cantidadE-cantidadS, saldoTotal=cantidadS*'$precio'
                        WHERE nombre_vestido='$vestido' and color_vestido='$color' and talle_vestido='$talle'";
                $this->database->query($sql);
                $sql="UPDATE vestido
                        SET salida=salida+'$cantidad', saldoTotalMercaderia=entrada-salida, saldoTotal=salida*precio
                        WHERE nombre='$vestido'";
                $this->database->query($sql);
            }else{
                $alerta=[
                    "mensaje"=>"No hay stock"
                ];
                return $alerta;
            }
        }
    }

    public function obtenerStockDelVestido($vestido, $talle, $color){
        $sql="SELECT totalStock
                FROM vestidosDetalle
                    WHERE nombre_vestido='$vestido' and talle_vestido='$talle' and color_vestido='$color'";
        return $this->database->query($sql)->fetch_assoc()["totalStock"];
    }

    public function obtenerPrecioDelVestido($nombre){
        $sql="SELECT precio
                FROM vestido
                WHERE nombre='$nombre'";
        return $this->database->query($sql)->fetch_assoc()["precio"];
    }

    public function getHistorialSalidas(){
        $sql="SELECT id, nombre_vestido, talle_vestido, color_vestido, tipo,
                    cantidad, DATE_FORMAT(fecha,'%d-%m-%Y') as fecha
                FROM registros
                    WHERE tipo='Salida'";
        return $this->database->query($sql);
    }
    public function getHistorialEntradas(){
        $sql="SELECT id, nombre_vestido, talle_vestido, color_vestido, tipo,
                    cantidad, DATE_FORMAT(fecha,'%d-%m-%Y') as fecha
                FROM registros
                    WHERE tipo='Entrada'";
        return $this->database->query($sql);
    }

    public function agregarEntrada(){
        if(isset($_POST["agregarEntrada"])){
            $vestido=$_POST["vestido"];
            $cantidad=$_POST["cantidad"];
            $talle=$_POST["talles"];
            $color=$_POST["colores"];
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $fecha=date("Y-m-d");
            $sql="INSERT INTO registros(nombre_vestido,talle_vestido,color_vestido,tipo,cantidad,fecha)
                        VALUES('$vestido','$talle','$color','Entrada','$cantidad','$fecha')";
            $this->database->query($sql);
            $sql="UPDATE vestidosDetalle
                    SET cantidadE=cantidadE+'$cantidad', totalStock=cantidadE-cantidadS
                    WHERE nombre_vestido='$vestido' and color_vestido='$color' and talle_vestido='$talle'";
            $this->database->query($sql);
            $sql="UPDATE vestido
                    SET entrada=entrada+'$cantidad', saldoTotalMercaderia=entrada-salida
                    WHERE nombre='$vestido'";
            $this->database->query($sql);
        }
    }

    public function eliminarRegistro(){
        if(isset($_POST["idVestido"])){
            $id=$_POST["idVestido"];
            $registro=$this->getRegistro($id);
            $nombreVestido=$registro["nombre_vestido"];
            $talleVestido=$registro["talle_vestido"];
            $colorVestido=$registro["color_vestido"];
            $cantidadVestido=$registro["cantidad"];
            $tipoVestido=$registro["tipo"];
            $precio=$this->obtenerPrecioDelVestido($nombreVestido);
            if($tipoVestido=="Salida"){
                $sql="UPDATE vestidosDetalle 
                        SET cantidadS=cantidadS-'$cantidadVestido', cantidadE=cantidadE+'$cantidadVestido',
                            totalStock=cantidadE-cantidadS, saldoTotal=cantidadS*'$precio'
                        WHERE nombre_vestido='$nombreVestido' and color_vestido='$colorVestido' and talle_vestido='$talleVestido'";
                $this->database->query($sql);
                $sql="UPDATE vestido
                        SET salida=salida-'$cantidadVestido', entrada=entrada+'$cantidadVestido',
                            saldoTotalMercaderia=entrada-salida, saldoTotal=salida*precio
                        WHERE nombre='$nombreVestido'";
                $this->database->query($sql);
                $sql="DELETE FROM registros WHERE id='$id'";
                $this->database->query($sql);
            }else{
                $sql="UPDATE vestidosDetalle 
                        SET cantidadE=cantidadE-'$cantidadVestido', totalStock=cantidadE-cantidadS
                        WHERE nombre_vestido='$nombreVestido' and color_vestido='$colorVestido' and talle_vestido='$talleVestido'";
                $this->database->query($sql);
                $sql="UPDATE vestido
                        SET entrada=entrada-'$cantidadVestido', saldoTotalMercaderia=entrada-salida
                        WHERE nombre='$nombreVestido'";
                $this->database->query($sql);
                $sql="DELETE FROM registros WHERE id='$id'";
                $this->database->query($sql);
            }
        }
    }

    public function getRegistro($id){
        $sql="SELECT *
                FROM registros
                    WHERE id='$id'";
        return $this->database->query($sql)->fetch_assoc();
    }

}
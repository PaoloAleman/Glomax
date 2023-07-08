<?php

class VestidoModel{

    private $database;

    public function __construct($database){
        $this->database = $database;
    }

    public function listarVestidos(){
        $sql2="SELECT DATE_FORMAT(v.fechaPago,'%d-%m-%Y') as fechaPago,
                v.nombre as nombre, v.entrada as entrada, v.salida as salida, v.saldoTotalMercaderia as saldoTotalMercaderia,
                v.precio as precio, v.saldoTotal as saldoTotal, v.estado as estado, v.id as id
                FROM vestido v 
                ORDER BY id";
        return $this->database->query($sql2);
    }

    public function salidaVestidos(){
        if(isset($_POST["salidaVestidos"])){
            $cantidad=$_POST["cantidad"];
            $nombre=$_POST["nombre"];
            $color=$_POST["color"];
            $talle=$_POST["talle"];
            $sql="UPDATE acciones 
                    SET cantidadS=cantidadS+'$cantidad' 
                    WHERE nombre_vestido='$nombre' AND color_vestido='$color' AND talle_vestido='$talle'";
            $this->database->query($sql);
            $sql2="UPDATE vestido SET salida=salida+'$cantidad' WHERE nombre='$nombre'";
            $this->database->query($sql2);
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $fechaActual = date('Y-m-d');
            $sql3="INSERT INTO fecha(nombre_vestido, color_vestido, talle_vestido, tipo, cantidad,fecha) 
                        VALUES('$nombre','$color','$talle','Salida', $cantidad,'$fechaActual')";
            $this->database->query($sql3);
            $this->actualizarSaldoMercaderia();
        }
    }

    public function devolucionVestidos(){
        if(isset($_POST["devolucionVestidos"])){
            $cantidad=$_POST["cantidad"];
            $nombre=$_POST["nombre"];
            $color=$_POST["color"];
            $talle=$_POST["talle"];
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $fechaActual = date('Y-m-d');
            $sql="INSERT INTO fecha(nombre_vestido, color_vestido, talle_vestido, tipo, cantidad,fecha) 
                        VALUES('$nombre','$color','$talle','Devolucion', $cantidad,'$fechaActual')";
            return $this->database->query($sql);
        }
    }

    public function entradaVestidos(){
        if(isset($_POST["entradaVestidos"])){
            $cantidad=$_POST["cantidad"];
            $nombre=$_POST["nombre"];
            $color=$_POST["color"];
            $talle=$_POST["talle"];
            $sql="UPDATE acciones 
                    SET cantidadE=cantidadE+'$cantidad' 
                    WHERE nombre_vestido='$nombre' AND color_vestido='$color' AND talle_vestido='$talle'";
            $this->database->query($sql);
            $sql2="UPDATE vestido SET entrada=entrada+'$cantidad' WHERE nombre='$nombre'";
            $this->database->query($sql2);
            date_default_timezone_set('America/Argentina/Buenos_Aires');
            $fechaActual = date('Y-m-d');
            $sql3="INSERT INTO fecha(nombre_vestido, color_vestido, talle_vestido, tipo, cantidad,fecha) 
                        VALUES('$nombre','$color','$talle','Entrada', $cantidad,'$fechaActual')";
            $this->database->query($sql3);
            $this->actualizarSaldoMercaderia();

        }
    }

    public function listarVestidosPorTalle(){
        $sql="SELECT * FROM acciones ORDER BY nombre_vestido,talle_vestido,color_vestido";
        return $this->database->query($sql);
    }

    public function actualizarEstado(){
        if(isset($_POST["cambiarEstado"])){
            $nombre=$_POST["nombre"];
            $estado=$_POST["estado"];
            $sql="UPDATE vestido SET estado='$estado' WHERE nombre='$nombre'";
            $this->database->query($sql);
        }elseif(isset($_POST["cambiarTodos"])){
            $estado=$_POST["estado"];
            $sql="UPDATE vestido SET estado='$estado'";
            $this->database->query($sql);
        }
        date_default_timezone_set('America/Argentina/Buenos_Aires');
        $fecha=date("Y-m-d");
        $datos=$this->obtenerTotales();
        $saldoPagado=$datos["saldoTotal"];
        $cantidadSalidas=$datos["salidaTotal"];
        if($estado=='Pagado'){
            $sql2= "INSERT INTO historialPagos(cantidadSalidas,saldoPagado,fechaPagada) values('$cantidadSalidas','$saldoPagado','$fecha')";
            $this->database->query($sql2);
            $sql1="UPDATE vestido SET saldoTotal=0, fechaPago='$fecha', entrada=entrada-salida, salida=0 WHERE estado='Pagado' or estado='pagado'";
            $this->database->query($sql1);
            $sql3="UPDATE vestido SET estado='No pagado' WHERE estado='Pagado' or estado='pagado'";
            $this->database->query($sql3);
        }else{
            $sql1="UPDATE vestido SET saldoTotal=salida*precio WHERE estado='No pagado'";
            $this->database->query($sql1);
        }
    }

    public function actualizarPrecio(){
        if(isset($_POST["cambiarPrecio"])){
            $nombre=$_POST["nombre"];
            $precio=$_POST["precio"];
            $sql="UPDATE vestido SET precio='$precio' WHERE nombre='$nombre'";
            $this->database->query($sql);
        }
    }

    public function actualizarFechaPago(){
        if(isset($_POST["cambiarFecha"])){
            $nombre=$_POST["nombre"];
            $fecha=$_POST["fecha"];
            $sql="UPDATE vestido SET fechaPago='$fecha' WHERE nombre='$nombre'";
            $this->database->query($sql);
        }
        if(isset($_POST["cambiarTodas"])){
            $fecha=$_POST["fecha"];
            $sql="UPDATE vestido SET fechaPago='$fecha'";
            $this->database->query($sql);
        }
    }

    public function buscarVestido($nombre){
        $sql="SELECT DATE_FORMAT(v.fechaPago,'%d-%m-%Y') as fechaPago,
                v.nombre as nombre, v.entrada as entrada, v.salida as salida, v.saldoTotalMercaderia as saldoTotalMercaderia,
                v.precio as precio, v.saldoTotal as saldoTotal, v.estado as estado, v.id as id
                FROM vestido v
                WHERE nombre='$nombre'";
        return $this->database->query($sql);
    }

    public function buscarVestidoPorTalle($nombre){
        $sql="SELECT * FROM acciones WHERE nombre_vestido='$nombre'";
        return $this->database->query($sql);
    }

    public function listarDatos(){
        $sql="SELECT f.nombre_vestido as nombre_vestido, f.color_vestido as color_vestido,
                f.talle_vestido as talle_vestido, f.tipo as tipo, f.cantidad as cantidad,
                DATE_FORMAT(f.fecha,'%d-%m-%Y') as fecha, f.id as id
                FROM fecha f
                ORDER BY f.fecha DESC";
        return $this->database->query($sql);
    }

    public function buscarVestidoPorFecha($nombre){
        $sql="SELECT f.nombre_vestido as nombre_vestido, f.color_vestido as color_vestido,
                f.talle_vestido as talle_vestido, f.tipo as tipo, f.cantidad as cantidad,
                f.id as id,DATE_FORMAT(f.fecha,'%d-%m-%Y') as fecha 
                FROM fecha f WHERE f.nombre_vestido='$nombre'";
        return $this->database->query($sql);
    }

    public function getUltimoID(){
        $sql="SELECT id
                FROM vestido
                ORDER BY id DESC LIMIT 1";
        return $this->database->query($sql)->fetch_assoc()["id"];
    }

    public function agregarVestido()
    {
        if (isset($_POST["agregarVestido"])) {
            $nombre = $_POST["nombre"];
            $precio = $_POST["precio"];
            $estado = $_POST["estado"];
            $fechaPago = $_POST["fechaPago"];
            $nuevoID = $this->getUltimoID() + 1;
            $sql = "INSERT INTO vestido(id, nombre,entrada, salida, saldoTotalMercaderia, precio, saldoTotal, estado, fechaPago)
                VALUES ('$nuevoID','$nombre',0,0,0,'$precio',0*'$precio','$estado','$fechaPago')";
            $this->database->query($sql);
        }
    }

        public function agregarTalle(){
            if (isset($_POST["agregarTalle"])) {
                $nombre = $_POST["nombre"];
                $talle = $_POST["talle"];
                $color = $_POST["color"];
                $sql = "INSERT INTO acciones(nombre_vestido, color_vestido, talle_vestido, cantidadS,cantidadE)
                    VALUES ('$nombre','$color','$talle',0,0)";
                $this->database->query($sql);
            }
        }

        public function eliminarVestido(){
            if(isset($_POST["eliminar"])){
                $nombre=$_POST["nombre"];
                $sql2="DELETE FROM acciones WHERE nombre_vestido='$nombre'";
                $this->database->query($sql2);
                $sql="DELETE FROM vestido WHERE nombre='$nombre'";
                $this->database->query($sql);
            }
        }

       /*
        public function cambiarColor(){
                $sql="UPDATE acciones SET color_vestido='Gris claro' WHERE color_vestido='Gris'";
                $this->database->query($sql);
        }*/

    public function eliminarSalida(){
        if (isset($_POST["eliminarSalida"])) {
            $id=$_POST["eliminarSalida"];
            $datos=$this->obtenerDatosAPartirDelID($id);
            $nombre=$datos["nombreVestido"];
            $color=$datos["colorVestido"];
            $talle=$datos["talleVestido"];
            $tipo=$datos["tipoVestido"];
            $cantidad=$datos["cantidad"];
            $sql="DELETE FROM fecha WHERE id='$id'";
            $this->database->query($sql);
            if($tipo=='Salida'){
                $sql1="UPDATE acciones 
                    SET cantidadS=cantidadS-'$cantidad'
                    WHERE nombre_vestido='$nombre' AND color_vestido='$color' AND talle_vestido='$talle'";
                $this->database->query($sql1);
                $sql2="UPDATE vestido SET salida=salida-'$cantidad', entrada=entrada+'$cantidad' WHERE nombre='$nombre'";
                $this->database->query($sql2);
            }elseif ($tipo=='Entrada'){
                $sql1="UPDATE acciones 
                    SET cantidadE=cantidadE-'$cantidad'
                    WHERE nombre_vestido='$nombre' AND color_vestido='$color' AND talle_vestido='$talle'";
                $this->database->query($sql1);
                $sql2="UPDATE vestido SET entrada=entrada-'$cantidad' WHERE nombre='$nombre'";
                $this->database->query($sql2);
            }

        }
    }

    public function obtenerDatosAPartirDelID($id){
        $sql="SELECT f.nombre_vestido as nombreVestido, f.color_vestido as colorVestido,
                f.talle_vestido as talleVestido, f.tipo as tipoVestido, f.cantidad as cantidad
                FROM fecha f
                WHERE f.id='$id'";
        return $this->database->query($sql)->fetch_assoc();
    }

    public function actualizarSaldoMercaderia(){
        $sql="UPDATE vestido SET saldoTotalMercaderia=entrada-salida";
        $this->database->query($sql);
        $sql2="UPDATE vestido SET saldoTotal=salida*precio";
        $this->database->query($sql2);
    }

    public function obtenerTotales(){
        $sql="SELECT sum(saldoTotal) as saldoTotal, sum(saldoTotalMercaderia) as saldoTM,
                    sum(entrada) as entradaTotal, sum(salida) as salidaTotal
                FROM vestido ";
        return $this->database->query($sql)->fetch_assoc();
    }

    public function obtenerHistorialDePagos(){
        $sql="SELECT DATE_FORMAT(fechaPagada,'%d-%m-%Y') as fechaPagada,
                cantidadSalidas, saldoPagado
                FROM historialPagos
                ORDER BY fechaPagada";
        return $this->database->query($sql);
    }

    public function obtenerTotalesAcciones(){
        $sql="SELECT sum(cantidadE) as cantidadE, sum(cantidadS) as cantidadS 
            FROM acciones";
        return $this->database->query($sql);
    }

}
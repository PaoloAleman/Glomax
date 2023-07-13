<?php

class CreacionModel
{
    private $database;

    public function __construct($database){
        $this->database=$database;
    }
    public function crearVestido(){
        if(isset($_POST["crearVestido"])){
            $nombre=$_POST["nombre"];
            $precio=$_POST["precio"];
            $fecha=$this->obtenerFechaPago();
            $sql="INSERT INTO vestido(nombre,entrada,salida,saldoTotalMercaderia,precio,saldoTotal,estado,fechaPago)
                   VALUES ('$nombre',0,0,0,'$precio',0,'No pagado','$fecha')";
            $this->database->query($sql);
        }
    }

    public function crearTalle(){
        if(isset($_POST["crearTalle"])){
            $nombre=$_POST["nombre"];
            $talle=$_POST["talle"];
            $color=$_POST["color"];
            if(!$this->verificarQueELTalleNoExiste($nombre,$talle,$color)){
                $sql="INSERT INTO vestidosDetalle(nombre_vestido, color_vestido, talle_vestido,cantidadS, cantidadE, totalStock, saldoTotal)
                        VALUES('$nombre','$color','$talle',0,0,0,0)";
                $this->database->query($sql);
            }else{
                $alerta=[
                    "mensaje"=>"El talle ya existe"
                ];
                return $alerta;
            }
        }
    }

    public function verificarQueELTalleNoExiste($nombre,$talle,$color){
        foreach($this->getVestidosDetallesSinFiltros() as $vestido){
            if($nombre==$vestido["nombre_vestido"] && $talle==$vestido["talle_vestido"] && $color==$vestido["color_vestido"]){
                return true;
            }
        }
        return false;
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

    public function obtenerFechaPago(){
        $sql="SELECT fechaPago
                FROM vestido
                WHERE nombre='Vestido corto Dhara'";
        return $this->database->query($sql)->fetch_assoc()["fechaPago"];
    }

}
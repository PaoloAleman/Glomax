<?php

class FlexModel
{
    private $database;

    public function __construct($database){
        $this->database=$database;
    }

    public function agregarEnvio(){
        if(isset($_POST["agregarEnvio"])){
            $dia=$this->obtenerDíaActual()[date("l")];
            $receptor=$_POST["receptor"];
            $destino=$_POST["destino"];
            $cuenta=$_POST["cuenta"];
            $esCaba=$_POST["esCaba"];
            date_default_timezone_set("America/Argentina/Buenos_Aires");
            $fecha=date("Y-m-d");
            if($esCaba=="CABA"){
                $sql="INSERT INTO flex(fecha,dia,receptor,destino,cuenta,es_caba,precio,tipo) 
                        VALUES('$fecha','$dia','$receptor','$destino','$cuenta','$esCaba',2800.0,'Envío')";
            }else{
                $sql="INSERT INTO flex(fecha,dia,receptor,destino,cuenta,es_caba,precio,tipo) 
                        VALUES('$fecha','$dia','$receptor','$destino','$cuenta','$esCaba',3000.0,'Envío')";
            }
            $this->database->query($sql);
        }
    }

    public function agregarDevolucion(){
        if(isset($_POST["agregarDevolucion"])){
            $dia=$this->obtenerDíaActual()[date("l")];
            $receptor=$_POST["receptor"];
            $destino=$_POST["destino"];
            $cuenta=$_POST["cuenta"];
            $esCaba=$_POST["esCaba"];
            date_default_timezone_set("America/Argentina/Buenos_Aires");
            $fecha=date("Y-m-d");
            if($esCaba=="CABA"){
                $sql="INSERT INTO flex(fecha,dia,receptor,destino,cuenta,es_caba,precio,tipo) 
                        VALUES('$fecha','$dia','$receptor','$destino','$cuenta','$esCaba',2800.0,'Devolución')";
            }else{
                $sql="INSERT INTO flex(fecha,dia,receptor,destino,cuenta,es_caba,precio,tipo) 
                        VALUES('$fecha','$dia','$receptor','$destino','$cuenta','$esCaba',3000.0,'Devolución')";
            }
            $this->database->query($sql);
        }
    }

    public function getEnvios(){
        if(isset($_POST["filtrar"])){
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,tipo
                FROM flex
                    WHERE ".$this->filtrarPor()."
                    ORDER BY id DESC";
        }else{
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,tipo
                FROM flex
                    ORDER BY id DESC";
        }
        return $this->database->query($sql);

    }

    public function getTotales(){
        if(isset($_POST["filtrar"])){
            $sql="SELECT SUM(precio) as saldoTotal,
                    (SELECT count(id) FROM flex WHERE tipo='Envío' and ". $this->filtrarPor().") as cantEnvios,
                        (SELECT count(id) FROM flex WHERE tipo='Devolución' and ".$this->filtrarPor().") as cantDevoluciones
                        FROM flex
                            WHERE ".$this->filtrarPor();
        }else{
            $sql="SELECT SUM(precio) as saldoTotal,
                    (SELECT count(id) FROM flex WHERE tipo='Envío') as cantEnvios,
                        (SELECT count(id) FROM flex WHERE tipo='Devolución') as cantDevoluciones
                        FROM flex";
        }
        return $this->database->query($sql)->fetch_assoc();
    }

    public function filtrarPor(){
        $condiciones[]="";
        if(isset($_POST["fechaInicio"]) && isset($_POST["fechaFinal"])){
            $condiciones[]=" fecha between '".$_POST["fechaInicio"]."' and '".$_POST["fechaFinal"]."'";
        }

        if(isset($_POST["destino"])){
            $condiciones[]=" and destino='".$_POST["destino"]."'";
        }

        if(isset($_POST["receptor"])){
            $condiciones[]=" and receptor='".$_POST["receptor"]."'";
        }

        if(isset($_POST["cuenta"])){
            $condiciones[]=" and cuenta='".$_POST["cuenta"]."'";
        }

        if(isset($_POST["esCaba"])){
            $condiciones[]=" and es_caba='".$_POST["esCaba"]."'";
        }

        if(isset($_POST["tipo"])){
            $condiciones[]=" and tipo='".$_POST["tipo"]."'";
        }

        return implode("",$condiciones);
    }

    public function getDestinos(){
        $sql="SELECT DISTINCT destino
                FROM flex";
        return $this->database->query($sql);
    }

    public function getReceptores(){
        $sql="SELECT DISTINCT receptor
                FROM flex";
        return $this->database->query($sql);
    }

    public function obtenerDíaActual(){
        $dias=[
            'Monday' => 'Lunes',
            'Tuesday' => 'Martes',
            'Wednesday' => 'Miércoles',
            'Thursday' => 'Jueves',
            'Friday' => 'Viernes',
            'Saturday' => 'Sábado',
            'Sunday' => 'Domingo'
        ];
        return $dias;
    }

    public function getFechaInicio(){
        $sql="SELECT fecha
                FROM flex
                    ORDER BY fecha LIMIT 1";
        return $this->database->query($sql)->fetch_assoc()["fecha"];
    }
}
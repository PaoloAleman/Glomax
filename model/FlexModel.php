<?php

class FlexModel
{
    private $database;

    public function __construct($database){
        $this->database=$database;
    }

    public function agregarEnvio(){
        if(isset($_POST["agregarEnvio"])){
            $receptor=$_POST["receptor"];
            $destino=$_POST["destino"];
            $cuenta=$_POST["cuenta"];
            $esCaba=$_POST["esCaba"];
            $fecha=$_POST["fecha"];
            $dia=$this->obtenerDíaActual()[date("l",strtotime($fecha))];
            if($esCaba=="CABA"){
                $sql="INSERT INTO flex(fecha,dia,receptor,destino,cuenta,es_caba,precio,tipo) 
                        VALUES('$fecha','$dia','$receptor','$destino','$cuenta','$esCaba',2800.0,'Envío')";
            }else{
                $sql="INSERT INTO flex(fecha,dia,receptor,destino,cuenta,es_caba,precio,tipo) 
                        VALUES('$fecha','$dia','$receptor','$destino','$cuenta','$esCaba',3000.0,'Envío')";
            }
            $this->database->query($sql);
            $alerta=[
                "mensaje"=>"¡Envío agregado correctamente!"
            ];
        }
        return $alerta ?? null;
    }

    public function getEnvioPorID($id){
        $sql="SELECT *
                FROM flex
                    WHERE id='$id'";
        return $this->database->query($sql);
    }

    public function editarEnvio($id){
        if(isset($_POST["editarEnvio"])){
            $receptor=$_POST["receptor"];
            $destino=$_POST["destino"];
            $fecha=$_POST["fecha"];
            $dia=$this->obtenerDíaActual()[date("l",strtotime($fecha))];
            $cuenta=$_POST["cuenta"];
            $esCaba=$_POST["esCaba"];
            $precio=$_POST["precio"];
            $tipo=$_POST["tipo"];
            $devuelto=$_POST["devuelto"];
            $sql="UPDATE flex
                    SET receptor='$receptor',destino='$destino', fecha='$fecha', dia='$dia',
                            cuenta='$cuenta', es_caba='$esCaba', precio='$precio', tipo='$tipo',
                                fecha_cancelacion='$fecha',devuelto='$devuelto'
                        WHERE id='$id'";
            $this->database->query($sql);
            return true;
        }else{
            return false;
        }
    }
    /*
     * Teresa Rivero 4/1. Fecha cancelación:4/1
Ayelen. Gonzalez Catan 2/1
Teresa Elsa Rivero 4/1
Cancelados: Otra casilla donde dice "Pedir paquete" y otra que dice "Entregado"
Javier Martínez 9/1
Karina Mureato 12/1
Marcelo P Alegre 19/1
Gabriela Troncoso 23/1*/

    public function getEnvios(){
        if(isset($_POST["filtrar"])){
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,id
                FROM flex
                    WHERE tipo='Envío' and ".$this->filtrarPor()."
                    ORDER BY id DESC";
        }else{
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,tipo,id,fecha_cancelacion
                FROM flex
                    where tipo='Envío'
                    ORDER BY id DESC";
        }
        return $this->database->query($sql);
    }
    public function getEnviosCancelados(){
        if(isset($_POST["filtrar"])){
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,devuelto,id,DATE_FORMAT(fecha_cancelacion,'%d-%m')
                FROM flex
                    WHERE tipo='Cancelado' and ".$this->filtrarPor()."
                    ORDER BY id DESC";
        }else{
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,devuelto,id,DATE_FORMAT(fecha_cancelacion,'%d-%m') as fecha_cancelacion
                FROM flex
                    WHERE tipo='Cancelado'
                    ORDER BY id DESC";
        }
        return $this->database->query($sql);
    }

    public function getFecha(){
        if(isset($_POST["agregarEnvio"]) || isset($_POST["agregarEnvio"])){
            return $_POST["fecha"];
        }
    }

    public function getTotales(){
        if(isset($_POST["filtrar"])){
            $sql="SELECT (SELECT sum(precio) FROM flex WHERE tipo='Envío' and ".$this->filtrarPor().") as saldoTotal,
                    (SELECT count(id) FROM flex WHERE tipo='Envío' and ". $this->filtrarPor().") as cantEnvios,
                        (SELECT count(id) FROM flex WHERE tipo='Cancelado' and ".$this->filtrarPor().") as cantCancelaciones
                        FROM flex
                            WHERE ".$this->filtrarPor();
        }else{
            $sql="SELECT (SELECT sum(precio) FROM flex WHERE tipo='Envío') as saldoTotal,
                    (SELECT count(id) FROM flex WHERE tipo='Envío') as cantEnvios,
                        (SELECT count(id) FROM flex WHERE tipo='Cancelado') as cantCancelaciones
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
        return $this->database->query($sql)->fetch_assoc()["fecha"] ?? null;
    }

}
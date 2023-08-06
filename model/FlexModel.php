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
        }else{
            $alerta=[
                "mensaje"=>"¡No se pudo agregar este envío!"
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
            if(strtolower($tipo)=="cancelado"){
                $sql="UPDATE flex
                        SET receptor='$receptor',destino='$destino', fecha='$fecha', dia='$dia',
                                cuenta='$cuenta', es_caba='$esCaba', precio='$precio'*-1, tipo='$tipo'
                                WHERE id='$id'";
            }else{
                $sql="UPDATE flex
                        SET receptor='$receptor',destino='$destino', fecha='$fecha', dia='$dia',
                                cuenta='$cuenta', es_caba='$esCaba', precio='$precio', tipo='$tipo'
                                WHERE id='$id'";
            }
            $this->database->query($sql);
            return true;
        }else{
            return false;
        }
    }

    public function getEnvios(){
        if(isset($_POST["filtrar"])){
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,tipo,id
                FROM flex
                    WHERE ".$this->filtrarPor()."
                    ORDER BY id DESC";
        }else{
            $sql="SELECT DATE_FORMAT(fecha,'%d-%m') as fecha,dia,receptor,
                    destino,cuenta,es_caba,tipo,id
                FROM flex
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
            $sql="SELECT SUM(precio) as saldoTotal,
                    (SELECT count(id) FROM flex WHERE tipo='Envío' and ". $this->filtrarPor().") as cantEnvios,
                        (SELECT count(id) FROM flex WHERE tipo='Cancelado' and ".$this->filtrarPor().") as cantCancelaciones
                        FROM flex
                            WHERE ".$this->filtrarPor();
        }else{
            $sql="SELECT SUM(precio) as saldoTotal,
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
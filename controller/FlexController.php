<?php

class FlexController
{
    private $flexModel;
    private $renderer;

    public function __construct($flexModel, $renderer){
        $this->flexModel=$flexModel;
        $this->renderer=$renderer;
    }

    public function agregarEnvio(){

        $data=[
            "fecha"=>$this->flexModel->getFecha(),
            "alert"=>$this->flexModel->agregarEnvio()
        ];
        $this->renderer->render("agregarEnvio",$data);
    }

    public function editarEnvio(){
        if(!isset($_SESSION["idEnvio"])){
           $_SESSION["idEnvio"]=$_GET["idEnvio"];
        }

        if($this->flexModel->editarEnvio($_SESSION["idEnvio"])){
            header("Location:/flex/listaEnviosCancelados");
            exit();
        }

        $data=[
            "vestido"=>$this->flexModel->getEnvioPorID($_GET["idEnvio"] ?? null)
        ];
        $this->renderer->render("cancelarEnvio",$data);
    }

    public function listaEnvios(){
        unset($_SESSION["idEnvio"]);
        $this->flexModel->generarPDF();
        $data=[
            "envios"=>$this->flexModel->getEnvios(),
            "totales"=>$this->flexModel->getTotales(),
            "destinos"=>$this->flexModel->getDestinos(),
            "receptores"=>$this->flexModel->getReceptores(),
            "fechaInicio"=>$this->flexModel->getFechaInicio(),
            "fechaFinal"=>date("Y-m-d")
        ];
        $this->renderer->render("listaEnvios",$data);
    }

    public function listaEnviosCancelados(){
        unset($_SESSION["idEnvio"]);
        $data=[
            "envios"=>$this->flexModel->getEnviosCancelados(),
            "totales"=>$this->flexModel->getTotales(),
            "destinos"=>$this->flexModel->getDestinos(),
            "receptores"=>$this->flexModel->getReceptores(),
            "fechaInicio"=>$this->flexModel->getFechaInicio(),
            "fechaFinal"=>date("Y-m-d")
        ];
        $this->renderer->render("listaEnviosCancelados",$data);
    }
}
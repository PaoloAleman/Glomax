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
        $this->flexModel->agregarEnvio();
        $data=[
            "fecha"=>$this->flexModel->getFecha()
        ];
        $this->renderer->render("agregarEnvio",$data);
    }

    public function editarEnvio(){
        if(!isset($_SESSION["idEnvio"])){
           $_SESSION["idEnvio"]=$_GET["idEnvio"];
        }
        if($this->flexModel->editarEnvio($_SESSION["idEnvio"])){
            header("Location:/flex/listaEnvios");
            exit();
        }
        $data=[
            "vestido"=>$this->flexModel->getEnvioPorID($_GET["idEnvio"] ?? null)
        ];
        $this->renderer->render("cancelarEnvio",$data);
    }

    public function listaEnvios(){
        unset($_SESSION["idEnvio"]);
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
}
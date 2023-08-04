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
        $this->renderer->render("agregarEnvio");
    }

    public function agregarDevolucion(){
        $this->flexModel->agregarDevolucion();
        $this->renderer->render("agregarDevolucion");
    }

    public function listaEnvios(){
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
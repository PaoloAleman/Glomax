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

    public function agregarDevolucion(){
        $this->flexModel->agregarDevolucion();
        $data=[
            "fecha"=>$this->flexModel->getFecha()
        ];
        $this->renderer->render("agregarDevolucion",$data);
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
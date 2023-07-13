<?php

class CreacionController{
    private $creacionModel;
    private $renderer;
    public function __construct($creacionModel, $renderer){
        $this->creacionModel=$creacionModel;
        $this->renderer=$renderer;
    }

    public function crearVestido(){
        $this->creacionModel->crearVestido();
        $this->renderer->render("crearVestido");
    }

    public function crearTalle(){
        $data=[
            "alerta"=>$this->creacionModel->crearTalle()
        ];
        $this->renderer->render("crearTalle",$data);
    }
}
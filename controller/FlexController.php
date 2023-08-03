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
}
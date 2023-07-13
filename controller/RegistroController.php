<?php

class RegistroController
{
    private $registroModel;
    private $renderer;

    public function __construct($registroModel, $renderer){
        $this->registroModel=$registroModel;
        $this->renderer=$renderer;
    }

    public function agregarSalida(){
        $data=[
            "alert"=>$this->registroModel->agregarSalida()
        ];
        $this->renderer->render("agregarSalida",$data);
    }

    public function agregarEntrada(){
        $this->registroModel->agregarEntrada();
        $this->renderer->render("agregarEntrada");
    }

    public function historialSalidas(){
        $this->registroModel->eliminarRegistro();
        $data=[
            "historial"=>$this->registroModel->getHistorialSalidas(),
            "tipo"=>"Salidas"
        ];
        $this->renderer->render("historialSalidas",$data);
    }

    public function historialEntradas(){
        var_dump($this->registroModel->getRegistro(1));
        $this->registroModel->eliminarRegistro();
        $data=[
            "historial"=>$this->registroModel->getHistorialEntradas(),
            "tipo"=>"Entradas"
        ];
        $this->renderer->render("historialEntradas",$data);
    }
}
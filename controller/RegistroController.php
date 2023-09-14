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

    public function realizarDevolucion(){
        $data=[
            "alert"=>$this->registroModel->realizarDevolucion()
        ];
        $this->renderer->render("realizarDevolucion",$data);
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
        $this->registroModel->eliminarRegistro();
        $data=[
            "historial"=>$this->registroModel->getHistorialEntradas(),
            "tipo"=>"Entradas"
        ];
        $this->renderer->render("historialEntradas",$data);
    }

    public function historialDevoluciones(){
        $this->registroModel->eliminarRegistro();
        $data=[
            "historial"=>$this->registroModel->getHistorialDevoluciones(),
            "tipo"=>"Devoluciones"
        ];
        $this->renderer->render("historialDevoluciones",$data);
    }
}
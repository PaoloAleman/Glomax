<?php

class VestidoController{

    private $vestidoModel;
    private $renderer;

    public function __construct($vestidoModel, $view) {
        $this->vestidoModel = $vestidoModel;
        $this->renderer= $view;
    }

    public function listarVestidos(){
        if(isset($_POST["buscarVestido"])){
            $nombre=$_POST["nombre"];
            $data = [
                "vestidos" => $this->vestidoModel->buscarVestido($nombre),
                "vestidos2" => $this->vestidoModel->listarVestidos(),
                "totales"=>$this->vestidoModel->obtenerTotales()
            ];
        }else {
            $data = [
                "vestidos" => $this->vestidoModel->listarVestidos(),
                "vestidos2" => $this->vestidoModel->listarVestidos(),
                "totales"=>$this->vestidoModel->obtenerTotales()
            ];
        }
        $this->renderer->render('vestidos', $data);
    }

    public function salidaVestidos(){
        $this->vestidoModel->salidaVestidos();
        $data=[
            "vestidos"=>$this->vestidoModel->listarVestidos()
        ];
        $this->renderer->render('salida',$data);
    }

    public function entradaVestidos(){
        $this->vestidoModel->entradaVestidos();
        $data=[
            "vestidos"=>$this->vestidoModel->listarVestidos()
        ];
        $this->renderer->render('entrada',$data);
    }

    public function porTalle(){
        if(isset($_POST["buscarVestido"])){
            $nombre=$_POST["nombre"];
            $data = [
                "vestidos" => $this->vestidoModel->buscarVestidoPorTalle($nombre),
                "vestidos2"=>$this->vestidoModel->listarVestidos()

            ];
        }else {
            $data = [
                "vestidos" => $this->vestidoModel->listarVestidosPorTalle(),
                "vestidos2"=>$this->vestidoModel->listarVestidos()
            ];
        }
        $this->renderer->render('porTalle',$data);
    }

    public function estado(){
        $this->vestidoModel->actualizarEstado();
        $data=[
            "vestidos"=>$this->vestidoModel->listarVestidos()
        ];
        $this->renderer->render('estado',$data);
    }

    public function actualizarPrecio(){
        $this->vestidoModel->actualizarPrecio();
        $data=[
            "vestidos"=>$this->vestidoModel->listarVestidos()
        ];
        $this->renderer->render('precios',$data);
    }

    public function actualizarFechaPago(){
        $this->vestidoModel->actualizarFechaPago();
        $data=[
            "vestidos"=>$this->vestidoModel->listarVestidos()
        ];
        $this->renderer->render('fechaPago',$data);
    }

    public function verPorFecha(){
        $this->vestidoModel->eliminarSalida();
        if(isset($_POST["buscarFecha"])){
            $nombre=$_POST["nombre"];
            $data = [
                "datos" => $this->vestidoModel->buscarVestidoPorFecha($nombre),
                "vestidos2" => $this->vestidoModel->listarVestidos()
            ];
        }else {
            $data = [
                "datos" => $this->vestidoModel->listarDatos(),
                "vestidos2" => $this->vestidoModel->listarVestidos()
            ];
        }
        $this->renderer->render('porFecha',$data);
    }

    public function agregarVestido(){
        $this->vestidoModel->agregarVestido();
        $this->renderer->render('agregarVestido');
    }

     public function agregarTalle(){
        $this->vestidoModel->agregarTalle();
         $data=[
             "vestidos"=>$this->vestidoModel->listarVestidos()
         ];
        $this->renderer->render('agregarTalle',$data);
    }

    public function eliminarVestido(){
        $this->vestidoModel->eliminarVestido();
        $data=[
            "vestidos"=>$this->vestidoModel->listarVestidos()
        ];
        $this->renderer->render('eliminar',$data);
    }




}
<?php

class VestidoController{

    private $vestidoModel;
    private $renderer;

    public function __construct($vestidoModel,$renderer){
        $this->vestidoModel=$vestidoModel;
        $this->renderer=$renderer;
    }

    public function listarVestidos(){
        $data=[
            "vestidos"=>$this->vestidoModel->getVestidos(),
            "vestidosSelect"=>$this->vestidoModel->getVestidosSinFiltro(),
            "totales"=>$this->vestidoModel->getTotales()
        ];
    $this->renderer->render("listaVestidos",$data);
    }

    public function datos(){
        $data=[
            "talles"=>$this->vestidoModel->getTalles()->fetch_all(),
            "colores"=>$this->vestidoModel->getColores()->fetch_all(),
            "vestidosSelect"=>$this->vestidoModel->getNombresVestidos()->fetch_all()
        ];
        echo json_encode($data);
    }

    public function detalle(){
        if(isset($_GET["nombreVestido"])){
            $_SESSION["nombreVestido"]=$_GET["nombreVestido"];
        }
        unset($_GET["nombreVestido"]);
        if(isset($_POST["vestidoBuscado"])){
            $_SESSION["nombreVestido"]=$_POST["vestidoBuscado"];
        }
        $data=[
            "detalle"=>$this->vestidoModel->getDetallePorVestido($_SESSION["nombreVestido"]),
            "nombreVestido"=>$this->vestidoModel->getNombreVestidoDetalle($_SESSION["nombreVestido"]),
            "totales"=>$this->vestidoModel->getTotalesPorVestido($_SESSION["nombreVestido"])
        ];
        $this->renderer->render("detalle",$data);
    }

    public function filtro(){
        $jsonData = file_get_contents('php://input');
        $datos = json_decode($jsonData, true);
    }

}
<?php
include_once ("./controller/VestidoController.php");
include_once ("./controller/RegistroController.php");
include_once ("./controller/CreacionController.php");
include_once ("./controller/FlexController.php");
include_once ("./controller/LobbyController.php");

include_once ("./model/VestidoModel.php");
include_once ("./model/RegistroModel.php");
include_once ("./model/CreacionModel.php");
include_once ("./model/FlexModel.php");

include_once ("./helpers/MustacheRender.php");
include_once ("./helpers/MySqlDatabase.php");
include_once ("./helpers/Router.php");
include_once ("./helpers/Logger.php");

include_once('third-party/mustache/src/Mustache/Autoloader.php');

include_once ('FPDF/plantilla.php');
class Configuration {
    private $configFile = 'config/config.ini';

    public function __construct(){
    }

    public function getPhpMailer(){
        $phpMailer= new PHPMailer(true);
        $phpMailer->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption

        return $phpMailer;
    }

    public function getVestidoController(){
        return new VestidoController(new VestidoModel($this->getDatabase(), new PDF("P", "mm", "letter")),$this->getRenderer());
    }
    public function getRegistroController(){
        return new RegistroController(new RegistroModel($this->getDatabase()),$this->getRenderer());
    }
    public function getCreacionController(){
        return new CreacionController(new CreacionModel($this->getDatabase()),$this->getRenderer());
    }

    public function getFlexController(){
        return new FlexController(new FlexModel($this->getDatabase()),$this->getRenderer());
    }

    public function getLobbyController(){
        return new LobbyController($this->getRenderer());
    }

    private function getArrayConfig() {
        return parse_ini_file($this->configFile);
    }

    private function getRenderer() {
        return new MustacheRender('view/partial');
    }

    public function getDatabase() {
        $config = $this->getArrayConfig();
        return new MySqlDatabase(
            $config['servername'],
            $config['username'],
            $config['password'],
            $config['database']);
    }

    public function getRouter() {
        return new Router(
            $this,
            "getUserController",
            "login");
    }
}
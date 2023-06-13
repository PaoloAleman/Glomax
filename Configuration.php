<?php
include_once ("./controller/VestidoController.php");

include_once ("./model/VestidoModel.php");

include_once ("./helpers/MustacheRender.php");
include_once ("./helpers/MySqlDatabase.php");
include_once ("./helpers/Router.php");
include_once ("./helpers/Logger.php");

include_once('third-party/mustache/src/Mustache/Autoloader.php');

class Configuration {
    private $configFile = 'config/config.ini';

    public function __construct()
    {
    }

    public function getPhpMailer(){
        $phpMailer= new PHPMailer(true);
        $phpMailer->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption

        return $phpMailer;
    }


    public function getVestidoController(){
        return new VestidoController(new VestidoModel($this->getDatabase()),$this->getRenderer());
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
<?php
session_start();

include_once('Configuration.php');
$configuration = new Configuration();
$router = $configuration->getRouter();

$module = $_GET['module'] ?? 'vestido';
$method = $_GET['action'] ?? 'listarVestidos';

$router->route($module, $method);




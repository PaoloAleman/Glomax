<?php
session_start();

include_once('Configuration.php');
$configuration = new Configuration();
$router = $configuration->getRouter();

$module = $_GET['module'] ?? 'lobby';
$method = $_GET['action'] ?? 'interno';

$router->route($module, $method);




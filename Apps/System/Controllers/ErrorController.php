<?php
namespace System\Controllers;
use Phalcon\Mvc\Router;

class ErrorController {
    public function error404Action()
    {
        echo '<a style="font-size:1000px">404</a>';
//        $router = new Router();
//        $router->handle();

//        echo 'Controller:'.$router->getControllerName().PHP_EOL;
//        echo 'Action:'.$router->getActionName().PHP_EOL;
    }
}
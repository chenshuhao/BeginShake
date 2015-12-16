<?php

use Phalcon\Mvc\Router;

$router = new Router();

//路由


$router->add(
    '/',
    array(
        'namespace' => 'Index\Controllers',
        'controller' => 'Index',
        'action' => 'index'
    )
);

$router->add(
    '/(index|Index)/:controller/:action/:params',
    array(
        'namespace' => 'Index\Controllers',
        'controller' => 2,
        'action' => 3,
        'params' => 4
    )
);

$router->add(
    '/(App|app)/:controller/:action/:params',
    array(
        'namespace' => 'App\Controllers',
        'controller' => 2,
        'action' => 3,
        'params' => 4
    )
);

$router->add(
    '/(Agent|agent)/:controller/:action/:params',
    array(
        'namespace' => 'Agent\Controllers',
        'controller' => 2,
        'action' => 3,
        'params' => 4
    )
);


$router->notFound(
    array(
        "namespace"  => 'System\Controllers',
        "controller" => "Error",
        "action"     => "error404"
    )
);

$router->setDefaults(
    array(
        'namespace' => 'Index\Controllers',
        'controller' => 'Index',
        'action'     => 'index'
    )
);

return $router;
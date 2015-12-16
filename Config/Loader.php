<?php

use Phalcon\Loader;

$loader = new Loader();

$loader->registerNamespaces(array(
    'Index' => ROOT_DIR.'/Apps/Index',
    'Admin' => ROOT_DIR.'/Apps/Admin',
    'Agent' => ROOT_DIR.'/Apps/Agent',
    'System' => ROOT_DIR.'/Apps/System',
    'App' => ROOT_DIR.'/Apps/App',
    'Api' => ROOT_DIR.'/Api'
));

$loader->registerDirs(
    array(
        ROOT_DIR.'/Apps',
        ROOT_DIR.'/Api'
    ),
    true
);

$loader->register();


<?php
/**
 * Created by PhpStorm.
 * User: ChenShuHao
 * Date: 2015/12/3
 * Time: 12:51
 */

//加载全局配置信息
require 'Const.php';
require 'ErrorCode.php';
require 'DBConfig.php';
require 'Loader.php';
require 'InitFunction.php';
require 'Functions.php';


use Phalcon\Db\Adapter\Pdo\Mysql as PdoMysql;
use Phalcon\Logger\Adapter\File as LoggerFile;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Cache\Multiple;
use Phalcon\Cache\Backend\Apc as ApcCache;
use Phalcon\Cache\Backend\File as FileCache;
use Phalcon\Cache\Frontend\Data as DataFrontend;
use Phalcon\Logger;
use Phalcon\Events\Manager as EventsManager;



$di = new Phalcon\DI\FactoryDefault();

//mysql
$di->set("db", function () use ($mysql_config) {

    $connection = new PdoMysql(
        array(
            "host" => $mysql_config['host'],
            "username" => $mysql_config['username'],
            "password" => $mysql_config['password'],
            "dbname" => $mysql_config['dbname'],
            "options"  => array(
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'UTF8'",
                PDO::ATTR_CASE               => PDO::CASE_LOWER
            )
        )
    );

    $eventsManager = new EventsManager();

    $logger = new LoggerFile(getLogFilePath(DB_LOOGER_DIR,DB_LOG_SIZE,'db_logs_'));

    $eventsManager->attach('db', function ($event, $connection) use ($logger) {
        if ($event->getType() == 'beforeQuery') {
            $logger->log($connection->getSQLStatement(), Logger::INFO);
        }
    });
    $connection->setEventsManager($eventsManager);

    return $connection;
});

// Logger
$di->set('logger', function () {
    return new LoggerFile(getLogFilePath(LOOGER_DIR,LOG_SIZE,'logs_'));
});

//Router
$di->set('router', function () {
    $router = require __DIR__ . '/Route.php';
    return $router;
});

//view
$di->set('voltService', function ($view, $di) {
    $volt = new Volt($view, $di);
    $volt->setOptions(
        array(
            "compiledPath" => ROOT_DIR . "/Caches/ViewsCache/",
            "compiledExtension" => ".view_cache"
        )
    );

    return $volt;
});

$di->set('view', function () {
    $view = new View();
    $view->setViewsDir(ROOT_DIR . '/Views/');
    $view->registerEngines(
        array(
            ".volt" => 'voltService'
        )
    );

    return $view;
});

$di->setShared('session', function () {
    $session = new Phalcon\Session\Adapter\Files();
    $session->start();
    return $session;
});

//wechat
$di->set('access_token_cache', function () {
    return new Multiple(
        array(
            new FileCache(
                new DataFrontend(
                    array(
                        "lifetime" => WECHAT_CACHE_DEFAULT_LIFETIME
                    )
                ),
                array(
                    "prefix" => 'cache',
                    "cacheDir" => ROOT_DIR . '/Caches/AccessTokenCache/'
                )
            )
        )
    );
});


//
$di->set('wechat', function () {
    return new \Api\Wechat\Wechat();
}, true);




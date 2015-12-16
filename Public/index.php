<?php
    //摇起来  2015年12月3日 12:49:52
    //奠基

use Phalcon\Mvc\Application;


try{
    require '../vendor/autoload.php';//加载Composer
    require '../Config/Services.php';//加载服务
    $application = new Application($di);
    echo $application->handle()->getContent();
}catch (\Exception $e){
    echo 'Exception:'.$e->getMessage();
}



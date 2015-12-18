<?php

class BaseController extends \Phalcon\Mvc\Controller
{
    public function initialize()
    {

        $this->setViewDir(); //设置模版所在文件夹
    }

    protected function setViewDir()
    {
        $namespace = $this->router->getNameSpaceName();
        $controller = $this->router->getControllerName();
        if(!$namespace) return false;

        $dir = explode('\\',$namespace);
        $this->view->setViewsDir(ROOT_DIR.DIRECTORY_SEPARATOR.'Views'.DIRECTORY_SEPARATOR.$dir[0].DIRECTORY_SEPARATOR);
        return true;
    }
}
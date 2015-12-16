<?php
    namespace Index\Controllers;
    use \Phalcon\Mvc\Controller;

    class BaseController extends Controller{
        public $services;

        public function initialize()
        {
//            //配置微信信息
//            $service = $this->di;
////            if($service['wechat']->init('wxbe76e300837daa75','c8b8822b147b84c178b0c6195a78ff9a')->getAccessToken()){
//            if($service['wechat']->init('wx37bd32740aa7ea94','919d981e86e0b24e27aa9bd14bc9865e')->getAccessToken()){
//                var_dump($service['wechat']->test());
//            }
//
////            echo $service['wechat']->access_token;

        }
    }
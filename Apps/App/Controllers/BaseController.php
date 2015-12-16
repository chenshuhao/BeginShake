<?php
    namespace App\Controllers;

    class BaseController extends \BaseController
    {
        public function initialize(){
            parent::initialize();

            //初始化微信
//            $this->di['wechat']->init('wx37bd32740aa7ea94','919d981e86e0b24e27aa9bd14bc9865e')->getAccessToken();
            $this->di['wechat']->init('wx3591746ed2cb11ed','641f549613e5987c6be4c210f0462c10')->getAccessToken();

        }
    }
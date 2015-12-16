<?php
namespace App\Controllers;

class SystemController extends \BaseController{

    public function getTokenAction()
    {
        $token_name = $this->request->get('token_name');
        if(!$token_name){
            $token_name = 'form_token';
        }
        $form_token = md5(uniqid(microtime(true)*1000).uniqid());

        $this->session->set($token_name, $form_token);

        logLog('[IP:'.$_SERVER['REMOTE_ADDR'].']['.$token_name.':'.$form_token.']');

        returnJSON(array('err'=>1,'data'=>$form_token));

    }

}
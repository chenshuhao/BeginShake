<?php

/*
 *  全局函数库
 *  2015年12月4日 20:07:58
 *
 */


function logDebug($message)
{
    $debug = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 0);
    if (is_array($debug)) {
        $file = $debug[0]['file'];
        $line = $debug[0]['line'];
        $class = isset($debug[1]['class']) ? $debug[1]['class'] : null;
        $function = isset($debug[1]['function']) ? $debug[1]['function'] : null;

        $debug_info = '[File Path:' . $file . '][Line:' . $line . ']';
        if ($class) $debug_info .= '[Class:' . $class . ']';
        if ($function) $debug_info .= '[function:' . $function . ']';

        $message = $debug_info . $message;

        global $di;

        $di->get('logger')->debug($message);


    } else {
        new \Exception('Service debug ERROR');
    }
}

function logWarning($message)
{
    $warn = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 0);
    if (is_array($warn)) {
        $file = $warn[0]['file'];
        $line = $warn[0]['line'];
        $class = isset($warn[1]['class']) ? $warn[1]['class'] : null;
        $function = isset($warn[1]['function']) ? $warn[1]['function'] : null;

        $warn_info = '[File Path:' . $file . '][Line:' . $line . ']';
        if ($class) $warn_info .= '[Class:' . $class . ']';
        if ($function) $warn_info .= '[function:' . $function . ']';

        $message = $warn_info . $message;

        global $di;

        $di->get('logger')->warning($message);


    } else {
        new \Exception('Service wran ERROR');
    }
}

function logError($message)
{
    $err = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 0);
    if (is_array($err)) {
        $file = $err[0]['file'];
        $line = $err[0]['line'];
        $class = isset($err[1]['class']) ? $err[1]['class'] : null;
        $function = isset($err[1]['function']) ? $err[1]['function'] : null;

        $err_info = '[File Path:' . $file . '][Line:' . $line . ']';
        if ($class) $err_info .= '[Class:' . $class . ']';
        if ($function) $err_info .= '[function:' . $function . ']';

        $message = $err_info . $message;

        global $di;

        $di->get('logger')->error($message);


    } else {
        new \Exception('Service error ERROR');
    }
}

function logLog($message)
{
    $log = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 0);
    if (is_array($log)) {
        $file = $log[0]['file'];
        $line = $log[0]['line'];
        $class = isset($log[1]['class']) ? $log[1]['class'] : null;
        $function = isset($log[1]['function']) ? $log[1]['function'] : null;

        $log_info = '[File Path:' . $file . '][Line:' . $line . ']';
        if ($class) $log_info .= '[Class:' . $class . ']';
        if ($function) $log_info .= '[function:' . $function . ']';

        $message = $log_info . $message;

        global $di;

        $di->get('logger')->log($message);


    } else {
        new \Exception('Service error ERROR');
    }
}


function uploads($upload_dir, $size = 2097152, $type = array('jpg', 'png'))
{
    $request = new \Phalcon\Http\Request;

    if (true != $request->isPost()) return false;
    if ($request->hasFiles()) {

        $upload_dir = trim($upload_dir, '/\\') . DIRECTORY_SEPARATOR . date('Y-m-d');
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 777, true);
        }

        $php_post_max_size = (int)ini_get('post_max_size') * 1024 * 1024;
        $php_upload_max_filesize = (int)ini_get('upload_max_filesize') * 1024 * 1024;

        if ($php_post_max_size < $size) {
            logWarning('PHP php_post_max_size < uploads\'s Size');
            throw new \Exception('php.ini php_post_max_size 上传文件大小未设置');
        }
        if ($php_upload_max_filesize < $size) {
            logWarning('PHP php_upload_max_filesize < uploads\'s Size');
            throw new \Exception('php.ini php_upload_max_filesize 上传文件大小未设置');
        }

        foreach ($request->getUploadedFiles() as $file) {

            if($file->getError() != 0 ) continue;

            if (!in_array($file->getExtension(), $type)) {
                $upload_errors[] = array('error'=>UPLOADS_ERROR_10001,'key'=>$file->getKey());
                break;
            }

            if ($file->getSize() > $size) {
                $upload_errors[] = array('error'=>UPLOADS_ERROR_10002,'key'=>$file->getKey());
                break;
            }

            $file_name = uniqid() . time() . mt_rand(10000, 999999) . '.' . $file->getExtension();

            if ($file->moveTo($upload_dir . DIRECTORY_SEPARATOR . $file_name)) {
                $files[$file->getKey()] = $upload_dir . DIRECTORY_SEPARATOR . $file_name;
            }

        }

        if(isset($upload_errors)){
            if(isset($files)){
                foreach($files as $val){
                    if(!unlink(ROOT_DIR.DIRECTORY_SEPARATOR.$val)) logWarning('delete upload file error ::'.$val);
                }
            }

            return $upload_errors;
        }

        if (isset($files) && is_array($files) && count($files) > 0) return $files;
    }
    return false;
}

function returnJSON($message)
{
    ob_clean();
    header('Content-type:application/json;charset=utf-8');
    echo json_encode($message);
    return;
}


function checkFormToken($token_value,$key = 'form_token',$di=null)
{
    if(!$di){
        global $di;
        $di = $di->session;
    }
    if ($di->session->has($key)) {
        $session_form_token = $di->session->get($key);
        $di->session->remove($key);
        if($session_form_token == $token_value){
            return true;
        }
        return false;
    }else{
        return false;
    }
}
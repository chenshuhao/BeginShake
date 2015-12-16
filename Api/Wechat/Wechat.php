<?php
/**
 * Created by PhpStorm.
 * User: ChenShuHao
 * Date: 2015/12/3
 * Time: 15:30
 * Not WechatOpen
 * This Wechat Other Appid APPsecret
 */

namespace Api\Wechat;

require 'WechatConst.php';

class Wechat
{
    public $cache;
    protected $appid;
    protected $appsecret;

    public $access_token = null;


    /**
     * Wechat constructor.
     */
    public function __construct()
    {
        global $di;
        if (!isset($di['access_token_cache'])) throw new \Exception("Service access_token_cache not found");
        $this->cache = $di['access_token_cache'];
    }

    //init methods

    /**
     * @param $appid
     * @param $appsecret
     * @return bool
     */
    public function init($appid = null, $appsecret = null)
    {
        if (!$appid || !$appsecret) return false;

        $this->appid = $appid;
        $this->appsecret = $appsecret;

        if ($appid != $this->appid || $appsecret != $this->appsecret) return false;

        return $this;
    }

    /**
     * @param $result
     * @param array $cache array( //二维数组
     *                              array($key,$prefix,$time), //需要缓存微信返回的键 , 系统标识前缀 ，缓存时间（可为空）
     *                              array($key2,$prefix2,$time2)
     *                          )
     * @return bool
     */
    public function resultHandle($result, $cache = array())
    {
        $body = $result->body;
        if (is_object($body)) {
            if (!property_exists($body, 'errcode') || 0 == $body->errcode) {
                foreach ($body as $key => $val) {
                    $this->$key = $val;

                    foreach ($cache as $v) {
                        if ($v[0] == $key) {
                            if (isset($v[2]) && is_numeric($v[2])) {
                                $this->setCacheToWechat($v[1], $v[0], $val, $v[2]);
                            } elseif (isset($v[2]) && property_exists($body, $v[2]) && is_numeric($body->$v[2])) {
                                $this->setCacheToWechat($v[1], $v[0], $val, $body->$v[2]);
                            } else {
                                $this->setCacheToWechat($v[1], $v[0], $val);
                            }

                        }
                    }
                }
                return true;
            } else {
                logError('[errcode:' . $body->errcode . '][errmsg:' . $body->errmsg . ']');
                return false;
            }
        }
        logError('[Result Body not Object On Time' . date('Y-m-d H:i:s') . ']');
        return false;
    }

    public function getCacheToWechat($prefix, $key)
    {
        if (!$prefix || !$key) return false;

        global $di;
        $getCacheValue = $this->cache->get($prefix . '_' . $key);
        if ($getCacheValue) {
            $this->$key = $getCacheValue;
            return true;
        }
        return false;
    }

    public function setCacheToWechat($prefix, $key, $data, $lifetime = WECHAT_CACHE_DEFAULT_LIFETIME)
    {
        if (!$prefix || !$key) return false;

        global $di;
        $setCacheValue = $this->cache->save($prefix . '_' . $key, $data, $lifetime);
        if ($setCacheValue) return true;
        return false;
    }

    /**
     * @return bool
     */
    protected function checkAppidAndAppsecret()
    {
        if (!$this->appid || !$this->appsecret) return false;

        return true;
    }

    //methods
    //获取accesstoken
    public function getAccessToken()
    {
        if (!$this->checkAppidAndAppsecret()) return false;

        //如果已经赋值  直接调用 不用读取缓存
        if ($this->access_token) return $this;
        // Read Cache
        if ($this->getCacheToWechat($this->appid, 'access_token')) return $this;

        //Cache Not Found  Get form Wechat server
        $url = GETACCESSTOKEN_URL . "appid={$this->appid}&secret={$this->appsecret}";
        $result = \Httpful\Request::get($url)
            ->expectsJson()
            ->send();

        // Handle result
        if ($this->resultHandle($result, array(array('access_token', $this->appid, 'expires_in')))) return $this;
        return false;
    }

    // 素材图片
    // 永久  temporary
    // 临时  permanent
    public function mediaImageUploads($data = array(), $type = 'permanent')
    {

        if (!$this->access_token) return false;

        $temporary_url = TEMPORARY_URL . $this->access_token . "&type=image";
        $permanent_url = PERMANENT_URL . $this->access_token;

//        $data =  array(
//            'media'=> ROOT_DIR.DIRECTORY_SEPARATOR.'test.jpg'
//        );

        $url = $type . '_url';
        $result = \Httpful\Request::post($$url)
            ->withStrictSSL()
            ->expectsJson()
            ->attach($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //摇一摇相关接口----------------------------------------------------------
    //申请设备
    public function regDevices($data)
    {
        if (!$this->access_token) return false;

        $result = \Httpful\Request::post(REG_DEVICES_URL . $this->access_token)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //获取设备 通过applyid
    public function getDevicesByApplyId()
    {
        if (!$this->access_token) return false;

        $result = \Httpful\Request::post(GET_DEVICES_BY_APPLYID_URL . $this->access_token)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //门店-----------------------------------------------------------
    public function createPoiLogo($data)
    {
        if (!$this->access_token) return false;
        //        $data =  array(
        //            'media'=> ROOT_DIR.DIRECTORY_SEPARATOR.'test.jpg'
        //        );

        $result = \Httpful\Request::post(CREATE_POI_LOGO_URL . $this->access_token)
            ->withStrictSSL()
            ->expectsJson()
            ->attach($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;

    }

    //json $data

    public function addPoi($data)
    {
        if (!$this->access_token) return false;

        $result = \Httpful\Request::post(ADD_POI_URL . $this->access_token)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;

    }

    public function updataPoiInfo($data)
    {
        if (!$this->access_token) return false;

        $result = \Httpful\Request::post(UPDATA_POI_URL . $this->access_token)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;

    }

    public function deletePoi($data)
    {
        if (!$this->access_token) return false;

        $result = \Httpful\Request::post(DELETE_POI_URL . $this->access_token)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;

    }

    //卡券---------------------------------------------------------------
    //卡券logo
    public function cardLogo($data)
    {

        if (!$this->access_token) return false;

        $card_logo_url = CARD_LOGO_URL . $this->access_token;

        $result = \Httpful\Request::post($card_logo_url)
            ->withStrictSSL()
            ->expectsJson()
            ->attach($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //创建卡卷
    public function cardCreate($data = array())
    {
        if(!$this->access_token) return false;

        $card_create_url = CARD_CREATE_URL . $this->access_token;
        $result = \Httpful\Request::post($card_create_url)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //更改卡券
    public function cardUpdate($data = array())
    {
        if(!$this->access_token) return false;

        $card_update_url = CARD_UPDATE_URL . $this->access_token;
        $result = \Httpful\Request::post($card_update_url)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //查看卡券详情
    public function cardGet($data = array())
    {
        if(!$this->access_token) return false;

        $card_get_url = CARD_GET_URL . $this->access_token;
        $result = \Httpful\Request::post($card_get_url)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //查询Code接口
    public function cardCodeGet($data = array())
    {
        if(!$this->access_token) return false;

        $card_code_url = CARD_CODE_URL . $this->access_token;
        $result = \Httpful\Request::post($card_code_url)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //核销Code接口
    public function cardCodeConsume($data = array())
    {
        if(!$this->access_token) return false;

        $card_code_consume_url = CARD_CODE_CONSUME_URL . $this->access_token;
        $result = \Httpful\Request::post($card_code_consume_url)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

    //创建卡券二维码接口
    public function cardQrcodeCreate($data = array())
    {
        if(!$this->access_token) return false;

        $card_qrcode_create_url = CARD_QRCODE_CREATE_URL . $this->access_token;
        $result = \Httpful\Request::post($card_qrcode_create_url)
            ->withStrictSSL()
            ->expectsJson()
            ->body($data)
            ->send();

        if ($this->resultHandle($result)) return $this;
        return false;
    }

}
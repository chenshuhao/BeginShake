<?php

const GETACCESSTOKEN_URL = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&';     //appid=APPID&secret=APPSECRET'; //获取access_token
const TEMPORARY_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token="; //.$this->access_token."&type=image"; //临时素材
const PERMANENT_URL = 'https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=';//..$this->access_token;  //永久素材
//摇一摇周边
const REG_DEVICES_URL = 'https://api.weixin.qq.com/shakearound/device/applyid?access_token='; //申请设备
const GET_DEVICES_BY_APPLYID_URL = 'https://api.weixin.qq.com/shakearound/device/search?access_token=';
//门店
const CREATE_POI_LOGO_URL = 'https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=';
const ADD_POI_URL = 'http://api.weixin.qq.com/cgi-bin/poi/addpoi?access_token=';
const UPDATA_POI_URL = 'https://api.weixin.qq.com/cgi-bin/poi/updatepoi?access_token=';
const DELETE_POI_URL = 'https://api.weixin.qq.com/cgi-bin/poi/delpoi?access_token=';

//卡券
const CARD_CREATE_URL = 'https://api.weixin.qq.com/card/create?access_token=';
const CARD_LOGO_URL = 'https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=';
const CARD_UPDATE_URL = 'https://api.weixin.qq.com/card/update?access_token=';
const CARD_GET_URL = 'https://api.weixin.qq.com/card/get?access_token=';
const CARD_CODE_URL = 'https://api.weixin.qq.com/card/code/get?access_token=';
const CARD_CODE_CONSUME_URL = 'https://api.weixin.qq.com/card/code/consume?access_token=';
const CARD_QRCODE_CREATE_URL = 'https://api.weixin.qq.com/card/qrcode/create?access_token=';
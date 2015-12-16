<?php
namespace App\Controllers;
class CardController extends BaseController
{
    //首页 显示卡券列表
    public function indexAction()
    {
        $card = new \App\Models\Card;
        $card = $card->cardList();
        $this->view->card = $card;
    }

    //创建卡券页面
    public function addAction()
    {

    }

    //创建卡券
    public function cardSaveAction()
    {

        $card = new \App\Models\Card;
        //上传图片
        $logo = uploads('Uploads');
        if (@$logo[0]['error'] || $logo == false) {
            if (empty($logo[0]['error'])) {
                echo '上传图片不能为空';
            }
            return $logo[0]['error'];
        } else {
            //从微信接口获取logo_url
            $logo_data = $this->di['wechat']->cardLogo($logo);
            $logo_url = $logo_data->url;
            if (!empty($logo_url)) {
                //处理所有post过来的数据
                $card_data = $this->createDataAction($logo_url);
                //提交数据 创建卡券 返回值是card_id
                $card_return = $this->di['wechat']->cardCreate($card_data[0]);
                $card_id = $card_return->card_id;
                if (!empty($card_id)) {
                    $data['create_time'] = time();
                    $data['card_id'] = $card_id;
                    $data = array_merge($data, $card_data[1]);
                    $r = $card->saveData($data);
                    var_dump($r);
                } else {
                    echo "创建失败";
                }
            } else {
                echo '图片未上传成功';
            }
        }

    }

    //更新卡券页面
    public function updateAction()
    {
        $card = new \App\Models\Card;
        $id = $_GET['id'];
        $card_info = $card->findCard($id);
        $this->view->card_info = $card_info;
    }

    //更新卡券
    public function cardUpdateAction()
    {
        $card = new \App\Models\Card;

        $data1['card_id'] = $this->request->getPost('card_id');
        $id = $this->request->getPost('id');
        $card_info = $card->findCard($id);
        $logo = uploads('Uploads');
        if ($logo == false) {
            $data3['logo_url'] = $card_info->logo_url;
        } elseif ($logo[0]['error']) {
            return $logo[0]['error'];
        } else {
            $logo_data = $this->di['wechat']->cardLogo($logo);
            $data3['logo_url'] = $logo_data->url;
        }
        $data3['notice'] = $this->request->getPost('notice');
        $data3['description'] = $this->request->getPost('description');
        $data3['color'] = $this->request->getPost('color');
        $data3['service_phone'] = $this->request->getPost('service_phone');
        $data3['code_type'] = $this->request->getPost('code_type');
        $data3['can_share'] = $this->request->getPost('can_share') == 'true' ? true : false;
        $data3['can_give_friend'] = $this->request->getPost('can_give_friend') == 'true' ? true : false;
        $data3['date_info'] = array('type' => 'DATE_TYPE_FIX_TIME_RANGE', 'begin_timestamp' => (int)strtotime($this->request->getPost('begin_timestamp')), 'end_timestamp' => (int)strtotime($this->request->getPost('end_timestamp')));

        $card_type = strtolower($this->request->getPost('card_type'));
        $data1[$card_type]['base_info'] = $data3;
        $card_info = $this->di['wechat']->cardUpdate(json_encode($data1, JSON_UNESCAPED_UNICODE));
        //print_r($card_info);
        if ($card_info) {
            $base['card_id'] = $data1['card_id'];
            $get_card_info = $this->di['wechat']->cardGet(json_encode($base, JSON_UNESCAPED_UNICODE));
            $data3['status'] = $get_card_info->card->groupon->base_info->status;
            $res = $card->saveData($data3);
            if ($res) {
                echo '修改成功';
            } else {
                echo '保存数据库失败，请刷新数据';
            }
        }
        $this->view->disable();
    }

    //删除卡卷
    public function cardDeleteAction()
    {
        $card = new \App\Models\Card;
        $id = $_GET['id'];
        $res = $card->deleteCard($id);
        if ($res) {
            echo '删除成功';
        } else {
            echo "删除失败";
        }
        $this->view->disable();
    }

    //处理创建数据 返回2个数组
    public function createDataAction($logo_url)
    {

        $data1['card_type'] = $this->request->getPost('card_type');
        $base['logo_url'] = $logo_url;
        $base['brand_name'] = $this->request->getPost('brand_name');
        $base['code_type'] = $this->request->getPost('code_type');
        $base['title'] = $this->request->getPost('title');
        $base['sub_title'] = $this->request->getPost('sub_title');
        $base['color'] = $this->request->getPost('color');
        $base['notice'] = $this->request->getPost('notice');
        $base['description'] = $this->request->getPost('description');
        $base['sku'] = array('quantity' => (int)$this->request->getPost('quantity'));
        $base['date_info'] = array('type' => 'DATE_TYPE_FIX_TIME_RANGE', 'begin_timestamp' => (int)$this->request->getPost('begin_timestamp'), 'end_timestamp' => (int)$this->request->getPost('end_timestamp'));
        $base['get_limit'] = (int)($this->request->getPost('get_limit') ? $this->request->getPost('get_limit') : 50);
        $base['service_phone'] = $this->request->getPost('service_phone');
        $base['can_share'] = $this->request->getPost('can_share') == 'true' ? true : false;
        $base['can_give_friend'] = $this->request->getPost('can_give_friend') == 'true' ? true : false;
        //子商户id
        //$base['sub_merchant_info'] = array('merchant_id' => 1);

        if ($this->request->getPost('card_type') == 'GROUPON') $baseadd['deal_detail'] = $this->request->getPost('deal_detail');
        if ($this->request->getPost('card_type') == 'CASH') $baseadd['least_cost'] = (int)$this->request->getPost('least_cost');
        if ($this->request->getPost('card_type') == 'CASH') $baseadd['reduce_cost'] = (int)$this->request->getPost('reduce_cost');
        if ($this->request->getPost('card_type') == 'DISCOUNT') $baseadd['discount'] = (int)$this->request->getPost('discount');
        if ($this->request->getPost('card_type') == 'GIFT') $basadde['gift'] = $this->request->getPost('gift');
        if ($this->request->getPost('card_type') == 'GENERAL_COUPON') $baseadd['default_detail'] = $this->request->getPost('default_detailda');

        $data3['base_info'] = $base;

        $data2[strtolower($this->request->getPost('card_type'))] = array_merge($data3, $baseadd);
        $data = array_merge($data1, $data2);

        $card_data['card'] = $data;

        $data1['create_time'] = time();
        $data0 = array_merge($data1, $base, $baseadd);
        foreach ($data0 as &$v) {
            if (is_array($v)) {
                $v = json_encode($v);
            }
        }
        return array(json_encode($card_data, JSON_UNESCAPED_UNICODE), $data0);
        $this->view->disable();
    }

    //同步数据 预留未写
    public function pullCard()
    {

    }
}
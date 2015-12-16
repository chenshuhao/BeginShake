<?php
namespace App\Controllers;

class PoiController extends BaseController
{
    public function getPoiListDataAction()
    {
        $pois = new \App\Models\Pois();

        $list = $pois->getList();

        $data = array();
        //数据列表
        foreach ($list->items as $item) {
            $data[] = array(
                'id'            => $item->id,
                'business_name' => $item->business_name,
                'branch_name'   => $item->branch_name,
                'province'      => $item->province,
                'city'          => $item->city,
                'district'      => $item->district,
                'address'       => $item->address,
                'status'        => $item->status
            );
        }

        $pagecon = array(
            'before'  => $list->before,
            'next'    => $list->next,
            'last'    => $list->last,
            'current' => $list->current
        );

        returnJSON(array('data' => $data, 'page' => $pagecon));
        return;
    }

    public function doAddAction()
    {
        $data['offset_type'] = 1;
        $data['business_name'] = $this->request->getPost('business_name');
        $data['branch_name'] = $this->request->getPost('branch_name');
        $data['province'] = $this->request->getPost('province');
        $data['city'] = $this->request->getPost('city');
        $data['district'] = $this->request->getPost('district');
        $data['address'] = $this->request->getPost('address');
        $data['telephone'] = $this->request->getPost('telephone');
        $data['categories'] = array(
            $this->request->getPost('categories') . ',' . $this->request->getPost('categories_1')
        );
        $data['longitude'] = (float)$this->request->getPost('longitude');
        $data['latitude'] = (float)$this->request->getPost('latitude');
        $data['recommend'] = $this->request->getPost('recommend');
        $data['special'] = $this->request->getPost('special');
        $data['introduction'] = $this->request->getPost('introduction');
        $data['open_time'] = $this->request->getPost('open_time');
        $data['avg_price'] = (int)$this->request->getPost('avg_price');


        $photo_list = $this->request->getPost('photo_list');
        if (is_array($photo_list) && count($photo_list) > 0) {
            foreach ($photo_list as $val) {
                $data['photo_list'][] = array(
                    'photo_url' => $val
                );
            }
        }

        $pois = new \App\Models\Pois();
        if ($pois->createRowData($data)) {
            $data['sid'] = $pois->id;
            $post_wechat['business']['base_info'] = $data;

            if (!$this->di['wechat']->addPoi(json_encode($post_wechat, JSON_UNESCAPED_UNICODE))) {
                $pois->delete();
            }
        }

    }

    public function doUpdataPoiInfoAction()
    {
        $id = $this->request->get('poi_id');
        if (!$id) return;

        $data['telephone'] = $this->request->getPost('telephone');
        $data['recommend'] = $this->request->getPost('recommend');
        $data['special'] = $this->request->getPost('special');
        $data['introduction'] = $this->request->getPost('introduction');
        $data['open_time'] = $this->request->getPost('open_time');
        $data['avg_price'] = $this->request->getPost('avg_price');

        $photo_list = $this->request->getPost('photo_list');
        if (is_array($photo_list) && count($photo_list) > 0) {
            foreach ($photo_list as $val) {
                $data['photo_list'][] = array(
                    'photo_url' => $val
                );
            }
        }


        $pois = new \App\Models\Pois();

        if ($poi_id = $pois->updataPoiInfo($id, $data)) {
            $data['poi_id'] = $poi_id;
            $data['business ']['base_info'] = $data;
            if ($this->di['wechat']->updataPoiInfo(json_encode($data, JSON_UNESCAPED_UNICODE))) {
//                更新成功
            }
        }
    }

    public function CreatePoiImageAction()
    {
        //只接受文件流
        $img = uploads('temp/poi/');
        logDebug(json_encode($img));
        if (is_array($img) && !isset($img[0]['error']) && FALSE != $img) {
            $this->di['wechat']->createPoiLogo($img);
            foreach ($img as $val) {
                unlink(ROOT_DIR . DIRECTORY_SEPARATOR . 'Public' . DIRECTORY_SEPARATOR . $val);
            }
            returnJSON(array('err' => '1', 'wechat_url' => $this->di['wechat']->url));
            return;
        }
        returnJSON(array('err' => '0', 'errmsg' => $img[0]['error']));
        return;
    }


    public function deletePoiByIdAction()
    {
        $id = $this->request->get('poi_id');
        if (!$id && !is_numeric($id)) return;

        $pois = new \App\Models\Pois();
        $info = $pois->getPoiInfoById($id);
        if ($info) {
            if ($this->di['wechat']->deletePoi(json_encode(array('poi_id' => $info['poi_id']), JSON_UNESCAPED_UNICODE))) {
                //删除成功
            }
        }

    }
}
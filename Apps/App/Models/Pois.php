<?php
namespace App\Models;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class Pois extends \Phalcon\Mvc\Model
{
    public $merchantId;

    public function createRowData($data)
    {
        if (!is_array($data)) return false;

        $data['merchant_id'] = 1;
        $data['categories'] = json_encode($data['categories'], JSON_UNESCAPED_UNICODE);
        if(is_array($data['photo_list']) && count($data['photo_list']) > 0) {
            $data['photo_list'] = json_encode($data['photo_list']);
        }
        if (false == $this->create($data)) {
            logWarning('error:' . json_encode($this->getMessages()) . ' data:' . json_encode($data));
            return false;
        }
        return true;
    }

    public function getList()
    {
        if(self::count() == 0) return false;

        $paginator   = new PaginatorModel(
            array(
                "data"  => self::findBymerchantId(1),
                "limit" => 10,
                "page"  => @(int) $_GET["page"]
            )
        );

        return $paginator->getPaginate();
    }

    public function getPoiInfoById($id)
    {
        $one_result = self::findById($id);

        foreach($one_result as $val){
            $poi_info = array(
                'id'=>$val->id,
                'merchant_id'=>$val->merchant_id,
                'poi_id'=>$val->poi_id,
                'business_name'=>$val->business_name,
                'branch_name'=>$val->branch_name,
                'province'=>$val->province,
                'city'=>$val->city,
                'district'=>$val->district,
                'address'=>$val->address,
                'telephone'=>$val->telephone,
                'categories'=>$val->categories,
                'longitude'=>$val->longitude,
                'latitude'=>$val->latitude,
                'photo_list'=>$val->photo_list,
                'special'=>$val->special,
                'open_time'=>$val->open_time,
                'avg_price'=>$val->avg_price,
                'introduction'=>$val->introduction,
                'recommend'=>$val->recommend,
                'status'=>$val->status
            );
        }

        if(isset($poi_info)) return $poi_info;
        return false;
    }

    public function updataPoiInfo($id,$data)
    {
        if(!$id || !is_numeric($id)) return false;

        $poi_info = self::findFirst($id);

        if(isset($data['photo_list'])) $data['photo_list'] = json_encode($data['photo_list']);

        if($poi_info->save($data,
                array(
                    'telephone',
                    'recommend',
                    'special',
                    'introduction',
                    'open_time',
                    'avg_price',
                    'photo_list'
                )))
        {
            return $poi_info->poi_id;
        }else{
            logWarning('error:' . json_encode($this->getMessages()) . ' data:' . json_encode($data));
            return false;
        }
        return false;
    }
}
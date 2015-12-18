<?php
namespace App\Controllers;

class PageController extends \BaseController
{
    //门店
    public function poiListAction()
    {
    }

    public function poiAddAction()
    {
    }

    public function poiDetailsAction()
    {
        $poi_id = $this->request->get('poi_id');
        if (!$poi_id) return;

        $pois = new \App\Models\Pois();
        $info = $pois->getPoiInfoById($poi_id);

        $this->view->setVar('info', $info);
    }

    public function poiUpdataAction()
    {
        $poi_id = $this->request->get('poi_id');
        if (!$poi_id) return;

        $pois = new \App\Models\Pois();

        $info = $pois->getPoiInfoById($poi_id);

        $this->view->setVar('info', $info);
    }



}
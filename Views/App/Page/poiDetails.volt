{% extends '/extends/index.volt' %}


{% block title %}
商户管理系统
{% endblock %}

{% block head %}
<!-- 集成下级head -->
{% endblock %}


{% block nav_title %}
<h3 class="text-r pr-20">门店管理</h3>
<ul class="text-r " >
    <li class="pt-5 pt-5 pb-5 pr-20 active" ng-click="location('/App/page/poiList')"><h5 class="lh-16">门店列表 <span class="iconfont icon-dianpu"></span></h5></li>
    <li class="pt-5 pt-5 pb-5 pr-20" ng-click="location('/App/page/poiAdd')" ><h5 class="lh-16">添加门店 <span class="iconfont icon-qita"></span></h5></li>
</ul>
{% endblock %}


{% block content %}
<h2>门店详情</h2>
<div class="line"></div>
<div class="height20"></div>
<table class="table ">
    <tr>
        <td class="text-r col-2">门店名称:</td>
        <td class="text-l col-10">{{ info['business_name'] }}</td>
    </tr>
    <tr>
        <td class="text-r col-2">分店名称:</td>
        <td class="text-l col-10">{{ info['branch_name'] ? info['branch_name'] : '无' }}</td>
    </tr>
    <tr>
        <td class="text-r col-2">门店地址:</td>
        <td class="text-l col-10">{{ info['province'] }}{{ info['city'] }}{{ info['district'] }}{{ info['address'] }}</td>
    </tr>
    <tr>
        <td class="text-r col-2">门店电话:</td>
        <td class="text-l col-10">{{ info['telephone'] }}</td>
    </tr>
    <tr>
        <td class="text-r col-2">门店分类:</td>
        <td class="text-l col-10"><?php echo json_decode($info['categories'],1)[0]?></td>
    </tr>
    <tr>
        <td class="text-r col-2" style="height:250px">门店位置:</td>
        <td class="text-l col-10"> <div style="width:500px;height:233px" id="container"></div></td>
    </tr>
    <?php if($info['photo_list']):?>
    <tr>
        <td class="text-r col-2">门店图片:</td>
        <td class="text-l col-10">
            <?php
                $photo_list = json_decode($info['photo_list'],1);
                foreach($photo_list as $val){
            ?>
            <img src="<?php echo $val['photo_url']?>" alt="" style="width: 100px;height:100px;">
            <?php } ?>
        </td>
    </tr>
    <?php endif;?>
    <tr>
        <td class="text-r col-2">特色服务:</td>
        <td class="text-l col-10">{{ info['special'] ? info['special'] : '无'}}</td>
    </tr>
    <tr>
        <td class="text-r col-2">营业时间:</td>
        <td class="text-l col-10">{{ info['open_time'] ? info['open_time'] : '无' }}</td>
    </tr>
    <tr>
        <td class="text-r col-2">人均消费:</td>
        <td class="text-l col-10">{{ info['avg_price'] ? info['avg_price'] : '无' }}</td>
    </tr>
    <tr>
        <td class="text-r col-2">商户简介:</td>
        <td class="text-l col-10">{{ info['introduction'] ? info['introduction'] : '无' }}</td>
    </tr>
    <tr>
        <td class="text-r col-2">推荐品:</td>
        <td class="text-l col-10">{{ info['recommend'] ? info['recommend'] : '无' }}</td>
    </tr>

</table>
{% endblock %}


{% block footer_script %}
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script>
    function init() {
        var  center = new qq.maps.LatLng({{ info['latitude'] }}, {{ info['longitude'] }});
        var map = new qq.maps.Map(document.getElementById("container"), {
            // 设置地图中心
            center: center,
            zoom:16
        });
        var marker = new qq.maps.Marker({
            //设置Marker的位置坐标
            position: center,
            //设置显示Marker的地图
            map: map
        });
    }
    init();
</script>
{% endblock %}
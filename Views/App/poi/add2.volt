{% extends '/extends/index.volt' %}

{% block title %}
商户管理系统
{% endblock %}

{% block head %}
<!-- 集成下级head -->
{% endblock %}

{% block nav_left %}
<ul>
    <li>管理</li>
    <li>管理</li>
    <li>管理</li>
    <li>管理</li>
    <li>管理</li>
</ul>
{% endblock %}

{% block nav_title %}
123
{% endblock %}


{% block content %}
<h2>添加门店</h2>

<form action="/App/Poi/doAdd" enctype="multipart/form-data" method="post">


    <div class="row">
        <label class="form-label col-2">邮箱：</label>
        <div class="formControls col-5">
            <input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">
        </div>
        <div class="col-5"> </div>
    </div>
    <div class="row">
        <label class="form-label col-2">邮箱：</label>
        <div class="formControls col-5">
            <input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">
        </div>
        <div class="col-5"> </div>
    </div>

    <!--<div class="form-group">-->
        <!--<label for="business_name">门店名称</label>-->
        <!--<input type="text" class="form-control col-xm" id="business_name" name="business_name" placeholder="">-->
        <!--<p class="help-block">仅为商户名，如：国美、 麦当劳，不应包含地区、地址、分店名等信息，错误示例：北京国美</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="branch_name">分店名称</label>-->
        <!--<input type="text" class="form-control" id="branch_name" name="branch_name" placeholder="">-->
        <!--<p class="help-block">若没有,可不填！不应包含地区信息，不应与门店名有重复，错误示例：北京王府井店</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="province">省份</label>-->
        <!--<input type="text" class="form-control" id="province" name="province" placeholder="">-->
        <!--<p class="help-block">	门店所在的省份（直辖市填城市名,如：北京市）</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="city">城市</label>-->
        <!--<input type="text" class="form-control" id="city" name="city" placeholder="">-->
        <!--<p class="help-block">	门店所在的城市</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="district">地区</label>-->
        <!--<input type="text" class="form-control" id="district" name="district" placeholder="">-->
        <!--<p class="help-block">	门店所在地区</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="address">详细地址</label>-->
        <!--<input type="text" class="form-control" id="address" name="address" placeholder="">-->
        <!--<p class="help-block">门店所在的详细街道地址（不要填写省市信息）</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="telephone">门店电话</label>-->
        <!--<input type="text" class="form-control" id="telephone" name="telephone" placeholder="">-->
        <!--<p class="help-block">门店的电话（纯数字，区号、分机号均由“-”隔开）</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="categories">门店的类型</label>-->
        <!--<input type="text" class="form-control" id="categories" name="categories" placeholder="">-->
        <!--<p class="help-block">	门店的类型（不同级分类用“,”隔开，如：美食，川菜，火锅。详细分类参见附件：微信门店类目</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="longitude">门店所在地理位置的经度</label>-->
        <!--<input type="text" class="form-control" id="longitude" name="longitude" placeholder="">-->
        <!--<p class="help-block">门店所在地理位置的经度</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="latitude">门店所在地理位置的纬度</label>-->
        <!--<input type="text" class="form-control" id="latitude" name="latitude" placeholder="">-->
        <!--<p class="help-block">门店所在地理位置的纬度（经纬度均为火星坐标，最好选用腾讯地图标记的坐标）</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="photo_list">图片列表</label>-->
        <!--<p class="help-block">url 形式，可以有多张图片，尺寸为</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="special">特色服务</label>-->
        <!--<input type="text" class="form-control" id="special" name="special" placeholder="">-->
        <!--<p class="help-block">如免费wifi，免费停车，送货上门等商户能提供的特色功能或服务</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="open_time">营业时间</label>-->
        <!--<input type="text" class="form-control" id="open_time" name="open_time" placeholder="">-->
        <!--<p class="help-block">营业时间，24 小时制表示，用“-”连接，如 8:00-20:00</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="avg_price">营业时间</label>-->
        <!--<input type="text" class="form-control" id="avg_price" name="avg_price" placeholder="">-->
        <!--<p class="help-block">人均价格，大于0 的整数</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="introduction">	商户简介</label>-->
        <!--<input type="text" class="form-control" id="introduction" name="introduction" placeholder="">-->
        <!--<p class="help-block">主要介绍商户信息等</p>-->
    <!--</div>-->
    <!--<div class="form-group">-->
        <!--<label for="recommend">推荐品</label>-->
        <!--<input type="text" class="form-control" id="recommend" name="recommend" placeholder="">-->
        <!--<p class="help-block">餐厅可为推荐菜；酒店为推荐套房；景点为推荐游玩景点等，针对自己行业的推荐内容</p>-->
    <!--</div>-->

    <button type="submit" class="btn btn-default">创建门店</button>
</form>

{% endblock %}
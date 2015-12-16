{% extends '/extends/index.volt' %}

{% block title %}
商户管理系统
{% endblock %}

{% block head %}
<!--引入CSS-->
<link rel="stylesheet" type="text/css" href="/static/webuploader/webuploader.css">
<link rel="stylesheet" type="text/css" href="/static/webuploader/css/div1.css">

<!--<script type="text/javascript" src="/static/webuploader/jquery.js"></script>-->
<!--<script type="text/javascript" src="/static/webuploader/webuploader.js"></script>-->

{% endblock %}

{% block nav_left %}

{% endblock %}

{% block nav_title %}
<h3 class="text-r pr-20">门店管理</h3>
<ul class="text-r " >
    <li class="pt-5 pt-5 pb-5 pr-20 " ng-click="location('/App/page/poiList')"><h5 class="lh-16">门店列表 <span class="iconfont icon-dianpu"></span></h5></li>
    <li class="pt-5 pt-5 pb-5 pr-20 active" ng-click="location('/App/page/poiAdd')" ><h5 class="lh-16">添加门店 <span class="iconfont icon-qita"></span></h5></li>
</ul>
{% endblock %}


{% block content %}
<section class="Hui-container">
    <div class="Hui-wraper">
        <h2>添加门店</h2>
        <div class="line"></div>
        <form action="/App/Poi/doAdd" method="post" class="form form-horizontal responsive" id="demoform">
            <div class="row cl">
                <label class="form-label col-2">门店名称 <span style="color:red">*</span>：</label>
                <div class="formControls col-5">
                    <input type="text" class="input-text" placeholder="如：国美、麦当劳，不应包含地区、地址、分店名等信息" name="business_name" id="business_name" datatype="*1-16" nullmsg="门店名称不能为空！">
                </div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">分店名称：</label>
                <div class="formControls col-5">
                    <input type="text" class="input-text" placeholder="分店名称" name="branch_name" id="branch_name" >
                </div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">所在地区<span style="color:red">*</span>：</label>
                <div id="province"></div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">详细地址<span style="color:red">*</span>：</label>
                <div class="formControls col-5">
                    <input type="text" class="input-text" placeholder="门店所在的详细街道地址（不要填写省市信息）" name="address" id="address" datatype="*4-255" nullmsg="详细地址不合法">
                </div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">门店电话<span style="color:red">*</span>：</label>
                <div class="formControls col-5">
                    <input type="text" class="input-text" placeholder="门店的电话（纯数字，区号、分机号均由“-”隔开）" name="telephone" id="telephone" datatype="*" nullmsg="电话不能为空">
                </div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">类目<span style="color:red">*</span>：</label>
                <div id="wechatCategory"></div>
                <div class="col-5"> </div>
            </div>
            <div>
                <div class="row cl">
                    <label class="form-label col-2">请选择门店位置<span style="color:red">*</span>：</label>
                    <span>未选择:选择您商户的位置单击即可</span>
                    <div style="width:500px;height:250px" id="container"></div>
                    <div class="formControls col-5">
                        <input type="hidden" name="longitude" id="longitude" value="" datatype='*' nullmsg='请选择门店位置'>
                        <input type="hidden" name="latitude" id="latitude" value="" datatype='*' nullmsg='请选择门店位置'>
                    </div>
                    <div class="col-5"> </div>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">门店图片：</label>
                <div class="formControls col-5">
                    <div id="fileList" class="uploader-list"></div>
                    <div id="filePicker">选择图片</div>
                </div>
                <div id="poiImageList">

                </div>
                <div class="col-5"></div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">特色服务：</label>
                <div class="formControls col-5">
                    <input type="text" class="input-text" placeholder="如免费wifi，免费停车，送货上门等商户能提供的特色功能或服务" name="special" id="special" >
                </div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">营业时间：</label>
                <div class="formControls col-5">
                    <input type="text" class="input-text" placeholder="营业时间，24 小时制表示，用“-”连接，如 8:00-20:00" name="open_time" id="open_time" >
                </div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">商户简介：</label>
                <div class="formControls col-5">
                    <textarea class="textarea" name="introduction" id="introduction" cols="30" rows="10"></textarea>
                </div>
                <div class="col-5"> </div>
            </div>
            <div class="row cl">
                <label class="form-label col-2">推荐品：</label>
                <div class="formControls col-5">
                    <input type="text" class="input-text" placeholder="餐厅可为推荐菜；酒店为推荐套房；景点为推荐游玩景点等，针对自己行业的推荐内容" name="recommend" id="recommend" >
                </div>
                <div class="col-5"> </div>
            </div>


            <div class="row cl">
                <div class="col-10 col-offset-2">
                    <input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;创建门店&nbsp;&nbsp;">
                </div>
            </div>
        </form>
    </div>
</section>
{% endblock %}


{% block footer_script %}
<script type="text/javascript" src="/H-ui/lib/jquery.provincesCity/jquery.provincesCity.js"></script>
<script type="text/javascript" src="/H-ui/lib/jquery.provincesCity/provincesData.js"></script>
<script type="text/javascript" src="/H-ui/lib/jquery.provincesCity/jquery.provicesWechat.js"></script>
<script type="text/javascript" src="/H-ui/lib/jquery.provincesCity/wechatData.js"></script>

<script type="text/javascript" src="/static/webuploader/webuploader.js"></script>

<script>
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
        $("#demoform").Validform({
            tiptype:2
        });

        $("#province").ProvinceCity();
        $('#wechatCategory').ProvinceWechat();
    });

</script>
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script>
    function init() {
        var map = new qq.maps.Map(document.getElementById("container"), {
            // 设置地图中心
            center: new qq.maps.LatLng(39.916527, 116.397128),
            zoom:10
        });
        //设置Point与坐标的互相转换
        qq.maps.event.addListener(map, 'click', function(event) {
            var point = map.getProjection().fromLatLngToPoint(event.latLng);
            var po_str =  map.getProjection().fromPointToLatLng(point, true);
            $('#latitude').val(po_str.lat);
            $('#longitude').val(po_str.lng);
            $('#container').prev().html('坐标为：'+po_str.lat+','+po_str.lng);
        });

        //获取城市列表接口设置中心点
        citylocation = new qq.maps.CityService({
            complete : function(result){
                map.setCenter(result.detail.latLng);
            }
        });
        //调用searchLocalCity();方法    根据用户IP查询城市信息。
        citylocation.searchLocalCity();

    }
    init();
</script>

<script type="text/javascript">
    // 初始化Web Uploader
    var uploader = WebUploader.create({

        auto: true,

        // 文件接收服务端。
        server: '/App/Poi/CreatePoiImage',

        pick: '#filePicker',

        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });

    uploader.on( 'fileQueued', function( file ) {
        var $li = $(
                        '<div id="' + file.id + '" class="file-item thumbnail">' +
                        '<img>' +
                        '<div class="info">' + file.name + '</div>' +
                        '</div>'
                ),
                $img = $li.find('img');


        // $list为容器jQuery实例
        $('#fileList').append( $li );

        // 创建缩略图
        // 如果为非图片文件，可以不用调用此方法。
        // thumbnailWidth x thumbnailHeight 为 100 x 100
        var	thumbnailWidth =100;
        var thumbnailHeight = 100;
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, thumbnailWidth, thumbnailHeight );
    });

    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
                $percent = $li.find('.progress span');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<p class="progress"><span></span></p>')
                    .appendTo( $li )
                    .find('span');
        }

        $percent.css( 'width', percentage * 100 + '%' );
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file ) {
        $( '#'+file.id ).addClass('upload-state-done');
    });

    // 文件上传失败，显示上传出错。
    uploader.on( 'uploadError', function( file ) {
        var $li = $( '#'+file.id ),
                $error = $li.find('div.error');

        // 避免重复创建
        if ( !$error.length ) {
            $error = $('<div class="error"></div>').appendTo( $li );
        }

        $error.text('上传失败');
    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').remove();
    });

    uploader.on('uploadAccept',function(obj,ret){
        console.dir(obj)
        console.dir(ret)
        if(ret.err == '1'){
            $('#poiImageList').append('<input type="hidden" name="photo_list[]" value="'+ret.wechat_url+'" />')
        }else if(ret.err == '0'){
            var $li = $( '#'+obj.file.id ),
                $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error"></div>').appendTo( $li );
            }

            $error.text(ret.errmsg);
        }

    })

</script>
{% endblock %}
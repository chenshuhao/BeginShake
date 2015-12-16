{% extends '/extends/index.volt' %}


{% block title %}
商户管理系统
{% endblock %}

{% block head %}
<!-- 集成下级head -->
<link rel="stylesheet" type="text/css" href="/static/webuploader/webuploader.css">
<link rel="stylesheet" type="text/css" href="/static/webuploader/css/div1.css">
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
<form action="/App/Poi/doUpdataPoiInfo?poi_id={{ info['id'] }}" method="post" id="demoform">
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
        <td class="text-l col-5">
            <div class="formControls col-5">
                <input type="text" class="input-text" placeholder="门店的电话（纯数字，区号、分机号均由“-”隔开）" value="{{ info['telephone'] }}" name="telephone" id="telephone" datatype="*" nullmsg="电话不能为空">
            </div>
            <div class="col-5"> </div>
        </td>
    </tr>
    <tr>
        <td class="text-r col-2">门店分类:</td>
        <td class="text-l col-10"><?php echo json_decode($info['categories'],1)[0]?></td>
    </tr>
    <tr>
        <td class="text-r col-2" style="height:250px">门店位置:</td>
        <td class="text-l col-10"> <div style="width:500px;height:233px" id="container"></div></td>
    </tr>
    <tr>
        <td class="text-r col-2" >门店图片:</td>
        <td class="text-l col-10">
            <div class="formControls col-5">
                <div id="fileList" class="uploader-list"></div>
                <div id="filePicker">选择图片</div>
            </div>
            <div id="poiImageList">

            </div>
            <div class="col-5"></div>
        </td>
    </tr>
    <tr>
        <td class="text-r col-2">特色服务:</td>
        <td class="text-l col-10">
            <div class="formControls col-5">
                <input type="text" class="input-text"  value="{{ info['special']}}" name="special" id="special" datatype="*" nullmsg="电话不能为空">
            </div>
            <div class="col-5"> </div>
        </td>
    </tr>
    <tr>
        <td class="text-r col-2">营业时间:</td>
        <td class="text-l col-10">
            <div class="formControls col-5">
                <input type="text" class="input-text"  value="{{ info['open_time']}}" name="open_time" id="open_time" datatype="*" nullmsg="电话不能为空">
            </div>
            <div class="col-5"> </div>
        </td>
    </tr>
    <tr>
        <td class="text-r col-2">人均消费:</td>
        <td class="text-l col-10">
            <div class="formControls col-5">
                <input type="text" class="input-text"  value="{{ info['avg_price']}}" name="avg_price" id="avg_price" datatype="*" nullmsg="电话不能为空">
            </div>
            <div class="col-5"> </div>
        </td>
        </td>
    </tr>
    <tr>
        <td class="text-r col-2">商户简介:</td>
        <td class="text-l col-10">
            <div class="formControls col-5">
                <input type="text" class="input-text"  value="{{ info['introduction']}}" name="introduction" id="introduction" datatype="*" nullmsg="电话不能为空">
            </div>
            <div class="col-5"> </div>
        </td>
    </tr>
    <tr>
        <td class="text-r col-2">推荐品:</td>
        <td class="text-l col-10">
            <div class="formControls col-5">
                <input type="text" class="input-text"  value="{{ info['recommend']}}" name="recommend" id="recommend" datatype="*" nullmsg="电话不能为空">
            </div>
            <div class="col-5"> </div>
        </td>
    </tr>

</table>
    <div class="row cl">
        <div class="col-10 col-offset-2">
            <input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;更新门店信息&nbsp;&nbsp;">
        </div>
    </div>
</form>
{% endblock %}


{% block footer_script %}
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
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
    });

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

    function initPhotoList()
    {
        var photo_list = {{ info['photo_list']}};
        console.dir(photo_list);

        for(i in photo_list){
            var $li = $(
                            '<div class="file-item thumbnail">' +
                            '<img width="100px" height="100px">' +
                            '<div class="info">已上传</div>' +
                            '</div>'
                    ),
                    $img = $li.find('img');
            $img.attr('src',photo_list[i].photo_url);
            $('#fileList').append($li)
            $('#poiImageList').append('<input type="hidden" name="photo_list[]" value="'+photo_list[i].photo_url+'" />')
        }


    }

    window.onload = initPhotoList()

</script>
{% endblock %}
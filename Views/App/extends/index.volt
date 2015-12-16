<!DOCTYPE HTML>
<html lang="zh-cn" ng-app="WebView">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/H-ui/lib/html5.js"></script>
    <script type="text/javascript" src="/H-ui/lib/respond.min.js"></script>
    <script type="text/javascript" src="/H-ui/lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="/H-ui/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="/H-ui/static/h-ui/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/H-ui/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="/H-ui/lib/bootstrap-Switch/bootstrapSwitch.css" rel="stylesheet" type="text/css" />
    <link href="/H-ui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="/App/css/merchant.css" rel="stylesheet" type="text/css" />
    <link href="/App/css/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/H-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <script type="text/javascript" src="/angularJS/angular.min.js" ></script>

    <title>{% block title %}  {% endblock %}</title>
    {% block head %}
        <!-- 集成下级head -->
    {% endblock %}
  </head>
  <body ng-controller="Extends">
    <div class="head">
           <div class="head-logo f-l">
               <img src="/App/img/logo.png" alt="微信新营销">
               <span class="label label-success radius">BETA</span>
           </div>
            <div class="head-number f-r pr-20">
                <span class="iconfont icon-my"></span>
                <span>管理员</span>
                <span class="label label-success radius">10</span>
                <span>注销</span>
            </div>
    </div>
    <div class="con-left">
    	<div class="nav-left">
            <ul>
                <li class="li">
                    <span class="iconfont icon-information"></span>
                    <b>账户概况</b>
                </li>
                <li class="li">
                    <span class="iconfont icon-app"></span>
                    <b>应用中心</b>
                </li>
                <li class="li">
                    <span class="iconfont icon-marketing"></span>
                    <b>数据统计</b>
                </li>
                <li class="li">
                    <span class="iconfont icon-transactions"></span>
                    <b>财务报表</b>
                </li>
                <li class="nav-left-active" ng-click="location('/App/page/poiList')">
                    <span class="iconfont icon-gongzuoliuchengtu"></span>
                    <b>门店管理</b>
                </li>
                <li class="li">
                    <span class="iconfont icon-member"></span>
                    <b>账户管理</b>
                </li>
                <li class="li">
                    <span class="iconfont icon-wangzhanshezhi"></span>
                    <b>授权设置</b>
                </li>
            </ul>
            {% block nav_left %}

            {% endblock %}
    	</div>
    	<div class="nav-title">
    		{% block nav_title %}

            {% endblock %}
    	</div>
    </div>
    <div class="con-right">
    	<div class="app-con">
            {% block content %}

            {% endblock %}
        </div>
    </div>
    <div class="footer">
            123
    </div>
  </body>

<script type="text/javascript" src="/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/H-ui/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="/H-ui/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/H-ui/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/H-ui/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="/H-ui/lib/bootstrap-Switch/bootstrapSwitch.js"></script>
<script type="text/javascript" src="/H-ui/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="/H-ui/lib/Validform/5.3.2/passwordStrength-min.js"></script>
<script type="text/javascript" src="/H-ui/static/h-ui/js/H-ui.js"></script>

<script>
    var WebView = angular.module('WebView',[]);
    WebView.controller('Extends',function($scope){
        $scope.location = function(http_url)
        {
            window.location.href = http_url
        }
    })
</script>
{% block footer_script %}

{% endblock %}
</html>
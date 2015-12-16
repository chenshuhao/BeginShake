{% extends '/extends/index.volt' %}


{% block title %}
商户管理系统
{% endblock %}

{% block head %}
<!-- 集成下级head -->
{% endblock %}

{% block nav_left %}

{% endblock %}

{% block nav_title %}
<h3 class="text-r pr-20">门店管理</h3>
<ul class="text-r " >
    <li class="pt-5 pt-5 pb-5 pr-20 active" ng-click="location('/App/page/poiList')"><h5 class="lh-16">门店列表 <span class="iconfont icon-dianpu"></span></h5></li>
    <li class="pt-5 pt-5 pb-5 pr-20" ng-click="location('/App/page/poiAdd')" ><h5 class="lh-16">添加门店 <span class="iconfont icon-qita"></span></h5></li>
</ul>
{% endblock %}


{% block content %}
   <div ng-controller="PoiList">
       <h2>
           门店列表
           {{ link_to("App/Page/poiAdd", "添加门店" ,"class":"btn btn-warning radius",'style':'margin:10px' )}}
       </h2>
       <div class="prettyprint linenums">
            审核中的门店是无法修改和删除的<br />
       </div>
       <div class="mt-25"></div>

       <table class="table table-border table-bg table-hover">
           <thead>
           <tr>
               <th>门店名称</th>
               <th>地址</th>
               <th>状态</th>
               <th>操作</th>
           </tr>
           </thead>
           <tbody>
           <tr ng-repeat="row in PoiListData">
               <td ng-bind="row.business_name+ (row.branch_name ? '('+row.branch_name+')': '')"></td>
               <td ng-bind="row.province+row.city+row.district+row.address"></td>
               <td ng-bind="row.status == 1 ? '正常' : '审核中'" ></td>
               <td>
                   <button ng-click="location('/App/Page/poiDetails?poi_id='+row.id)" class="btn btn-secondary radius">详情</button>
                   <button ng-click="location('/App/Page/poiUpdata?poi_id='+row.id)" ng-class="row.status == 0 ? 'btn disabled radius' : 'btn btn-warning radiu'" ng-disabled="!row.status" >修改</button>
                   <button ng-click="deletePoi(row.id,this)" ng-class="row.status == 0 ? 'btn disabled radius' : 'btn btn-danger radius'" ng-disabled="!row.status" >删除</button>
               </td>
           </tr>
           <tr ng-show="PoiListData.length == 0">
                <td colspan="4" style="text-align:center">暂无数据</td>
           </tr>
           </tbody>
       </table>

       <div class="page-container">
           <a ng-click="changePage(PoiListPage.current-1>0?PoiListPage.current-1:1)" class="btn btn-default radius size-MINI">上一页</a>
           <a ng-repeat="i in PageListButton" ng-click="changePage(i)" ng-class="i==PoiListPage.current ? 'btn disabled radius' : 'btn btn-default radius size-MINI'" ng-bind="i"> </a>
           <a ng-click="changePage(PoiListPage.current+1<PoiListPage.last?PoiListPage.current+1:PoiListPage.last)" class="btn btn-default radius size-MINI">下一页</a>
       </div>



   </div>


{% endblock %}

{% block footer_script %}
<script>
    WebView.controller('PoiList',function($scope,$http){
        $scope.PoiListData = '';
        $scope.PoiListPage = '';
        $scope.PageListButton = [];
        $scope.IsShowInfo = false;
        $scope.ShowInfo = function()
        {
            $scope.IsShowInfo = true;
        }
        $scope.location = function(http_url)
        {
            window.location.href = http_url
        }

        $scope.changePage = function(page)
        {
            init(page)
        }
        $scope.deletePoi = function(id,ele)
        {
            $http.get('/App/poi/deletePoiById?poi_id='+id).success(function(res,status,element){
                console.dir(ele,row.setShow =false)
            })
        }
        function init(page){
            if(page == 'undefined') page = 1
            $http.get('/App/poi/getPoiListData?page='+page).success(function(data){
                console.dir(data);
                $scope.PoiListData = data.data;
                $scope.PoiListPage = data.page;

                var start = $scope.PoiListPage.current -5 < 1  ? 1 : $scope.PoiListPage.current -5 ;
                var end   = $scope.PoiListPage.current + 5 > $scope.PoiListPage.last  ?  $scope.PoiListPage.last  : $scope.PoiListPage.current + 5 ;
                if($scope.PoiListPage.current < 5 && $scope.PoiListPage.last >= 10 ) end =10;
                var incy = 0;
                $scope.PageListButton =[];
                for(var i=start;i <= end;i++){
                    $scope.PageListButton[incy] = i;
                    incy++;
                }
             }).error(function(){
                console.dir('error');
            })
        }
        init();
    })
//
//    WebView.controller('FormUpdata',function($scope,$http){
//        $scope.FormToken = '';
//        $scope.getFormToken = function(){
//            getToken();
//        }
//        function getToken(){
//            $http.get('/App/System/getToken').success(function(token){
//                $scope.FormToken = token.data;
//            }).error()
//        }
//    })

//    WebView.controller('SeePoiInfo',function($scope,$http){
//
//    })
</script>
{% endblock %}
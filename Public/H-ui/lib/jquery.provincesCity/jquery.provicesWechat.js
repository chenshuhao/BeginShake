$.fn.ProvinceWechat = function(){
    var _self = this;
    //定义3个默认值
    _self.data("categories",["请选择", ""]);
    _self.data("categories1",["请选择", ""]);
    //插入3个空的下拉框
    _self.append("<select class='select' style='width:13.33%' name='categories' datatype='*' nullmsg='!'></select>");
    _self.append("<select class='select' style='width:13.33%' name='categories_1' datatype='*' nullmsg='!'></select>");
    //分别获取3个下拉框
    var $sel1 = _self.find("select").eq(0);
    var $sel2 = _self.find("select").eq(1);
    //默认省级下拉
    if(_self.data("categories")){
        $sel1.append("<option value='"+_self.data("categories")[1]+"'>"+_self.data("categories")[0]+"</option>");
    }
    $.each( WeChatData_1 , function(index,data){
        $sel1.append("<option value='"+data+"'>"+data+"</option>");
    });
    //默认的1级城市下拉
    if(_self.data("categories1")){
        $sel2.append("<option value='"+_self.data("categories1")[1]+"'>"+_self.data("categories1")[0]+"</option>");
    }
    //省级联动 控制
    var index1 = "" ;
    $sel1.change(function(){
        //清空其它2个下拉框
        $sel2[0].options.length=0;
        index1 = this.selectedIndex;
        if(index1==0){	//当选择的为 “请选择” 时
            if(_self.data("categories1")){
                $sel2.append("<option value='"+_self.data("categories1")[1]+"'>"+_self.data("categories1")[0]+"</option>");
            }
        }else{
            $.each( WeChatData_2[index1-1] , function(index,data){
                $sel2.append("<option value='"+data+"'>"+data+"</option>");
            });
        }
    }).change();
    return _self;
};
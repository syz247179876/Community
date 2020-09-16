<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!--<script type="text/javascript" src="/static/xiyuan/lib/loading/okLoading.js"></script>-->
    <!--<link rel="stylesheet" href="https://javakeshe.oss-cn-beijing.aliyuncs.com/x-admin.css">-->
    <!--<link rel="stylesheet" href="https://javakeshe.oss-cn-beijing.aliyuncs.com/layui.css">-->
    <link rel="stylesheet" href="static/css/x-admin.css">
</head>
<style>
    .show_list{display: block;}
    .hide_lits{display: none;}

</style>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-logo-box">
                <a class="logo" href="" title="logo">后台管理系统</a>
                <div class="larry-side-menu">
                    <i class=" layui-icon iconfont" aria-hidden="true">&#xe83c;</i>
                </div>
            </div>
            <ul class="layui-nav layui-layout-left layui-ygyd-menu" style="position:absolute; left:250px;">
            </ul>
            <ul class="layui-nav" lay-filter="">
                <li class="layui-nav-item" id="time" style="margin-right: 50px;font-size: 20px;color: #2fb9d4;font-family: 'yjsz'"></li>
                <li class="layui-nav-item">
                    <a href="" title="系统公告">
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="" title="消息">
                        <i class="layui-icon" style="top: 1px;">&#xe63a;</i>
                    </a>
                </li>
                <li class="layui-nav-item"><img src="https://django-blog-syz.oss-cn-shanghai.aliyuncs.com/u%3D2142033892%2C1299498349%26fm%3D26%26gp%3D0.jpg" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                <li class="layui-nav-item"> <a href="javascript:;">${sessionScope.resident.username}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd><a href="javascript:;" onclick="member_show('${sessionScope.resident.username}','/member_show','10001','360','400')">个人信息</a></dd>
                        <dd><a href="/test/login_out">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item x-index"><a href="#">${sessionScope.resident.identity}</a></li>
            </ul>
        </div>
    </div>

    <!--左侧导航区域-->
    <div class="layui-side layui-bg-black x-side show_list" style="left:0px;" id="table1">
        <div style="height: 130px; width: 220px; ">
            <a class="img" title="我的头像" style="display: block;width: 80px;height: 80px;margin: 10px auto 10px;">
                <img src="https://django-blog-syz.oss-cn-shanghai.aliyuncs.com/u%3D2142033892%2C1299498349%26fm%3D26%26gp%3D0.jpg" class="userAvatar" style="display: block;width: 100%;height: 100%;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;border: 4px solid #44576b;box-sizing: border-box;">
            </a>
            <p style=" display: block;width: 100%;height: 25px;color: #ffffff;text-align: center;font-size: 12px;white-space: nowrap;line-height: 25px;overflow: hidden;">
                你好！<span class="userName">${sessionScope.resident.username}</span>, 欢迎回来
            </p>
        </div>
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="side">
                <li class="layui-nav-item"> <a class="javascript:;" href="javascript:;"> <i class="layui-icon iconfont" style="top: 3px;">&#xe60b;</i><cite>公告管理</cite> </a>
                    <dl class="layui-nav-child">
                        <dd class="">
                        <dd class=""> <a href="javascript:;" _href="/test/notice-list">
                        <cite>
                        <c:if test="${sessionScope.resident.identity != '居民'}">发布公告</c:if>
                        <c:if test="${sessionScope.resident.identity == '居民'}">查看公告</c:if>
                            </cite>
                    </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"> <a class="javascript:;" href="javascript:;"> <i class="layui-icon iconfont" style="top: 3px;">&#xe60f;</i><cite>会议管理</cite> </a>
                    <dl class="layui-nav-child">
                        <dd class=""> <a href="javascript:;" _href="/test/conference-list">
                                <cite>
                                    <c:if test="${sessionScope.resident.identity != '居民'}">举行会议</c:if>
                                    <c:if test="${sessionScope.resident.identity == '居民'}">查看会议</c:if>
                                </cite>
                        </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="/test/view-vote"> <cite>会议投票情况</cite> </a> </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"> <a class="javascript:;" href="javascript:;"> <i class="layui-icon iconfont" style="top: 3px;">&#xe60f;</i><cite>服务管理</cite> </a>
                    <dl class="layui-nav-child">
                        <dd class=""> <a href="javascript:;" _href="/test/entr-services"><cite>社区服务</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="/test/entr-accepted-services"><cite>已接收的服务</cite> </a> </dd>
                    </dl>
                </li>

                <li class="layui-nav-item" style="height: 30px; text-align: center"> </li>
            </ul>
        </div>
    </div>

    <div class="layui-side layui-bg-black x-side hide_lits " style="left:0px;" id="table2">
        <div style="height: 130px; width: 220px; " class="head-img">
            <a class="img" title="我的头像" style="display: block;width: 80px;height: 80px;margin: 10px auto 10px;">
                <img src="./images/logo.png" class="userAvatar" style="display: block;width: 100%;height: 100%;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;border: 4px solid #44576b;box-sizing: border-box;">
            </a>
            <p style=" display: block;width: 100%;height: 25px;color: #ffffff;text-align: center;font-size: 12px;white-space: nowrap;line-height: 25px;overflow: hidden;">
                你好！<span class="userName">${sessionScope.resident.username}</span>, 欢迎回来
            </p>
        </div>
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="side">


                <li class="layui-nav-item"> <a class="javascript:;" href="javascript:;"> <i class="layui-icon iconfont" style="top: 3px;">&#xe625;</i><cite>会员管理</cite> </a>
                    <dl class="layui-nav-child">
                        <dd class=""> <a href="javascript:;" _href="member-list.html"> <cite>会员列表</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./member-del.html"> <cite>删除会员</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./member-level.html"> <cite>等级管理</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./member-kiss.html"> <cite>积分管理</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./member-view.html"> <cite>浏览记录</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./member-view.html"> <cite>分享记录</cite> </a> </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"> <a class="javascript:;" href="javascript:;"> <i class="layui-icon" style="top: 3px;">&#xe613;</i><cite>管理员管理</cite> </a>
                    <dl class="layui-nav-child">
                        <dd class=""> <a href="javascript:;" _href="./admin-list.html"> <cite>管理员列表</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./admin-role.html"> <cite>角色管理</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./admin-cate.html"> <cite>权限分类</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./admin-rule.html"> <cite>权限管理</cite> </a> </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"> <a class="javascript:;" href="javascript:;"> <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>系统统计</cite> </a>
                    <dl class="layui-nav-child">
                        <dd class=""> <a href="javascript:;" _href="./echart.html"> <cite>统计报表</cite> </a> </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"> <a class="javascript:;" href="javascript:;"> <i class="layui-icon" style="top: 3px;">&#xe614;</i><cite>系统设置</cite> </a>
                    <dl class="layui-nav-child">
                        <dd class=""> <a href="javascript:;" _href="./sys-set.html"> <cite>系统设置</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./sys-data.html"> <cite>数字字典</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./sys-shield.html"> <cite>屏蔽词</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./sys-log.html"> <cite>系统日志</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./sys-link.html"> <cite>友情链接</cite> </a> </dd>
                        <dd class=""> <a href="javascript:;" _href="./sys-qq.html"> <cite>第三方登录</cite> </a> </dd>
                    </dl>
                </li>
                <li class="layui-nav-item" style="height: 30px; text-align: center"> </li>
            </ul>
        </div>
    </div>


    <div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true" style="left: 220px;border-left: solid 2px #2299ee;">
        <ul class="layui-tab-title">
            <li class="layui-this"> 我的桌面 <i class="layui-icon layui-unselect layui-tab-close">?</i> </li>
        </ul>
        <div class="layui-tab-content site-demo site-demo-body">
            <div class="layui-tab-item layui-show">
                <iframe frameborder="0" src="/test/welcome" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
    <div class="site-mobile-shade"> </div>

</div>

<script type="text/javascript" src="static/lib/layui/layui.js"></script>
<script type="text/javascript" src="static/js/x-layui.js" charset="utf-8"></script>
<script type="text/javascript" src="static/js/x-admin.js"></script>
<script type="text/javascript" src="static/js/jquery.min.js" ></script>

<script>
    $(".daohang").click(function(){
        var table = $(this).attr("ids");
        var ids = $(".show_list").attr("id");
        $("#"+ids+"").addClass("hide_lits");
        $("#"+ids+"").removeClass("show_list");
        $(""+table+"").removeClass("hide_lits");
        $(""+table+"").addClass("show_list");
    })


</script>
<script>
    layui.use(['laydate','element','laypage','layer'], function(){
        var $ = layui.jquery;//jquery
        var laydate = layui.laydate;//日期插件
        var lement = layui.element();//面包导航
        var laypage = layui.laypage;//分页
        var layer = layui.layer;//弹出层
    });

    function member_show(title,url,id,w,h){
        x_admin_show(title,url,w,h);
    }
</script>
<script>
    //顶部时间
    function getTime(){
        var myDate = new Date();
        var myYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
        var myMonth = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
        var myToday = myDate.getDate(); //获取当前日(1-31)
        var myDay = myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
        var myHour = myDate.getHours(); //获取当前小时数(0-23)
        var myMinute = myDate.getMinutes(); //获取当前分钟数(0-59)
        var mySecond = myDate.getSeconds(); //获取当前秒数(0-59)
        var week = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
        var nowTime;

        nowTime = myYear+'-'+fillZero(myMonth)+'-'+fillZero(myToday)+'&nbsp;&nbsp;'+fillZero(myHour)+':'+fillZero(myMinute)+':'+fillZero(mySecond)+'&nbsp;&nbsp;'+week[myDay]+'&nbsp;&nbsp;';
        //console.log(nowTime);
        $('#time').html(nowTime);
    };
    function fillZero(str){
        var realNum;
        if(str<10){
            realNum	= '0'+str;
        }else{
            realNum	= str;
        }
        return realNum;
    }
    setInterval(getTime,1000);
</script>
</body>
</html>
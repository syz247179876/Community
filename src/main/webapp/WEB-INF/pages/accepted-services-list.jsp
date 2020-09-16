<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/5/22
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>
        后台管理系统
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/css/x-admin.css" media="all">
    <link rel="stylesheet" href="static/css/layui.css" media="all">
</head>
<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>活动管理</cite></a>
              <a><cite>发布活动</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <form class="layui-form x-center" action="" style="width:800px">
        <div class="layui-form-pane" style="margin-top: 15px;">
            <div class="layui-form-item">
                <label class="layui-form-label">日期范围</label>
                <div class="layui-input-inline">
                    <input class="layui-input" placeholder="开始日" id="LAY_demorange_s">
                </div>
                <div class="layui-input-inline">
                    <input class="layui-input" placeholder="截止日" id="LAY_demorange_e">
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width:80px">
                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                </div>
            </div>
        </div>
    </form>
    <xblock><button class="layui-btn layui-btn-danger" onclick="service_add('发布服务','/test/add-services','800','600');"><i class="layui-icon">&#xe608;</i>发布服务</button><span class="x-right" style="line-height:40px">共有数据：<span class="layui-badge">${sessionScope.total_record_conferences}</span> 条</span></xblock>
    <table class="layui-table" id="services" lay-filter="operation_row">

    </table>

    <script type="text/html" id="baroperation">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">保存修改</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="lend">借出</a>
    </script>
</div>

<script src="static/js/layui2.0/layui.js" charset="utf-8"></script>
<script src="static/js/x-layui.js" charset="utf-8"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>


    function service_add(title, url, w, h) {
        x_admin_show(title, url, w, h);
    }

    function service_delete(sid){
        $.ajax({
            type:'DELETE',
            url:'/test/service-delete',
            data:JSON.stringify({'sid':sid}),
            dataType:'json',
            beforeSend: function(req){
                req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
            },
            success:function (data) {
                if (data.code === 99) {
                    layer.msg('删除成功!', {icon: 1, time: 1000, closeBtn: 0});
                }
                else if (data.code === -99){
                    layer.msg('删除失败!',{icon:2,time:1200,closeBtn:0});
                }
            },
            error:function () {
                layer.msg('服务器无响应!',{icon:2,time:1200,closeBtn:0});
            }
        });
    }

    function service_lend(sid){
        let url = '/test/service-lend';
        let data = JSON.stringify({"sid":sid});
        $.ajax({
            type:'PUT',
            url:url,
            data:data,
            beforeSend:function(req){
                req.setRequestHeader('Content-Type','application/json');
            },
            success:function(data){
                if(data.code === 100) {
                    layer.msg('借出成功,请等待发布者联系您', {icon: 1, time: 1000, closeBtn: 0});
                }
                else if(data.code === -100) {
                    layer.msg('借出异常', {icon: 2, time: 1200, closeBtn: 0});
                }
            },
            error:function () {
                layer.msg('服务器无响应', {icon: 2, time: 1200, closeBtn: 0});
            }
        })
    }

    layui.use(['laydate','element','laypage','layer','table'], function() {
        let $ = layui.jquery;//jquery
        let laydate = layui.laydate;//日期插件
        let lement = layui.element;//面包导航
        let laypage = layui.laypage;//分页
        let layer = layui.layer;//弹出层
        let table = layui.table;
        //以上模块根据需要引入
        //以上模块根据需要引入
        //执行一个 table 实例

        table.render({
            elem: '#services'
            , height: 500
            , url: '/test/service-accepted-show' //数据接口
            , title: '服务'
            , id:'service_table'
            , page: true //开启分页
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'sid', title: '服务编号',  width:50 ,sort: true, fixed: 'left', totalRowText: '合计：'}
                , {field: 'username',title: '发布者'}
                , {field: 'project_name',title: '社区服务项目类型'}
                , {field: 'project_content',title: '服务内容',sort: true}
                , {field: 'public_time', title: '服务发布时间',sort: true}
                , {field: 'recipient_username', title: '服务接收者',sort: true}
                , {field: 'recipient_phone', title: '服务接收者联系方式',sort: true}
            ]]
        });
    });
</script>

</body>
</html>

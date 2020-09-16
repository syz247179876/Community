<%--
  Created by IntelliJ IDEA.
  User: 司云中
  Date: 2020/5/21
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="static/css/x-admin.css">
    <link rel="stylesheet" href="static/css/layui.css">
</head>
<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>投票管理</cite></a>
              <a><cite>投票详情</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">

        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show">
                <div class="layui-form layui-form-pane">
                    <input type="hidden" name="id" value=""/>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width:150px;">
                            <span></span>当前问题：
                        </label>
                        <div class="layui-input-block">
                            <h3 class="content">${requestScope.content}</h3>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width:200px;">
                            <span></span>选择同意人数：
                        </label>
                        <div class="layui-input-block">
                            <label class="layui-form-label">${requestScope.praise}人</label>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width:200px;">
                            <span></span>选择反对人数：
                        </label>
                        <div class="layui-input-block">
                            <label class="layui-form-label" >${requestScope.oppose}人</label>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width:200px;">
                            <span></span>选择弃权人数：
                        </label>
                        <div class="layui-input-block">
                            <label class="layui-form-label">${requestScope.abandon}人</label>
                        </div>
                    </div>
                    <div class="layui-form-item" style="text-align: center">
                        <button class="layui-btn layui-btn-radius layui-btn-warm"  id="watch_vote_detail">
                            <a href="/test/display-resident-voted?cur_pid=${requestScope.pid}">查看投票名单</a>
                        </button>
                    </div>
                </div>
                <div style="height:100px;"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="static/js/layui2.0/layui.js"></script>
<script type="text/javascript" src="static/js/x-layui.js" charset="utf-8"></script>
<script type="text/javascript">
</script>
<script>
    layui.use(['element','layer','form','laydate'], function(){
        let $ = layui.jquery;//jquery
        let element = layui.element;//面包导航
        let layer = layui.layer;//弹出层
        let form = layui.form;
        let laydate = layui.laydate;

        let today = new Date();  //当前日期

        var start = laydate.render({
            elem:'#starttime',
            type: 'datetime',
            min:today.toLocaleString(),  //转化当前时间格式
            done:function () {
                end.config.min = {
                    year: today.year,
                    month: today.month,
                    date: today.date,
                }; //开始日选好后，重置结束日的最小日期
            }
        });
        let end = laydate.render({
            elem:'#endtime',
            type: 'datetime',
            min:today.toLocaleString(),  //转化当前时间格式
            done: function () {
                start.config.max = {
                    year: today.year,
                    month: today.month,
                    date: today.date,
                }; //结束日选好后，重置开始日的最大日期
            }
        });



    })
</script>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 司云中
  Date: 2020/5/20
  Time: 21:20
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
              <a><cite>会议管理</cite></a>
              <a><cite>添加会议</cite></a>
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
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>会议类型
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="type" autocomplete="off" placeholder="10汉字以内"
                                   class="layui-input" lay-verify="required" value="">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>会议标题
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="thesis" autocomplete="off" placeholder="15汉字以内"
                                   class="layui-input" lay-verify="required" value="" id="thesis">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>会议地点
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="location" autocomplete="off" placeholder="15汉字以内"
                                   class="layui-input" lay-verify="required" value="" id="location">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>会议关键点
                        </label>
                            <div class="layui-input-block">
                                <select name="modules" lay-verify="required" lay-search="" id="district" lay-filter="district">
                                    <option value="">直接选择或搜索选择</option>
                                    <option value="居民区1">居民区1</option>
                                    <option value="居民区2">居民区2</option>
                                    <option value="居民区3">居民区3</option>
                                    <option value="居民区4">居民区4</option>
                                    <option value="居民区5">居民区5</option>
                                    <option value="居民区6">居民区6</option>
                                    <option value="居民区7">居民区7</option>
                                    <option value="居民区8">居民区8</option>
                                    <option value="居民区9">居民区9</option>
                                    <option value="居民区10">居民区10</option>
                                    <option value="居民区11">居民区11</option>
                                    <option value="居民区12">居民区12</option>
                                    <option value="居民区13">居民区13</option>
                                    <option value="居民区14">居民区14</option>
                                    <option value="居民区15">居民区15</option>
                                    <option value="居民区16">居民区16</option>
                                    <option value="居民区17">居民区17</option>
                                    <option value="居民区18">居民区18</option>
                                    <option value="居民区19">居民区19</option>
                                    <option value="居民区20">居民区20</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                        <label class="layui-form-label" for="starttime">开始时间</label>
                        <div class="layui-input-block">
                            <input type="text" name="starttime" id="starttime" autocomplete="off" class="layui-input">
                        </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label" for="endtime">结束时间</label>
                            <div class="layui-input-block">
                                <input type="text" name="endtime" id="endtime" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn" id="save">
                            保存
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

        //监听submit提交
        $("#save").click(function(data){
            layer.load(0,{time:10000});
            let location = $("#location").val();
            let thesis = $("#thesis").val();
            let district = $("#district").val();
            let starttime = $("#starttime").val();
            let endtime =  $("#endtime").val();
            if(thesis === ''){
                layer.msg("会议名不能为空！",{icon:7,time:1200,closeBtn:0})
            }
            else if(location === ''){
                layer.msg("公告地点不能为空！",{icon:7,time:2000,closeBtn:0});
            }
            else if(district === ''){
                layer.msg("会议对象不能为空！",{icon:7,time:2000,closeBtn:0});
            }
            else {
                let data = JSON.stringify({
                    "rid":"${sessionScope.resident.rid}",
                    "thesis": thesis,
                    "location": location,
                    "starttime":starttime,
                    "endtime":endtime,
                    "district":district
                });
                let url = '/test/conference-add';
                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    beforeSend: function (req) {
                        req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
                    },
                    success: function (data) {
                        if (data.code === 56) {
                            layer.closeAll('loading');
                            setTimeout(function () {
                                window.parent.location.reload();  //刷新本窗口
                                let index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }, 1500);
                            layer.msg('添加会议成功', {icon: 1, time: 1000, closeBtn: 0});
                        } else if (data.code === -56) {
                            layer.msg('服务器无响应', {icon: 2, time: 1200, closeBtn: 0});
                            layer.closeAll('loading');
                        }
                    },
                    error: function () {
                        layer.msg('服务器无响应', {icon: 2, time: 1200, closeBtn: 0});
                        layer.closeAll('loading');
                    }
                });
            }
        });

    })
</script>


</body>
</html>

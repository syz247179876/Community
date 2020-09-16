<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/5/22
  Time: 19:49
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
                            <span class='x-red'>*</span>服务项目类型
                        </label>
                        <div class="layui-input-block">
                            <select id="implement_type" lay-verify="required">
                                <option value="">请选择服务项目类型</option>
                                <option value="便民维修工具">便民维修工具</option>
                                <option value="生活器具">生活器具</option>
                                <option value="交通工具">交通工具</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>服务需求
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="project_content" autocomplete="off" placeholder="例如我需求一个拖车"
                                   class="layui-input" lay-verify="required" value="">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn" id="save">
                            发布
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



        //监听submit提交
        $("#save").click(function(data){
            let date = new Date();
            let minutes = date.getMinutes();
            minutes = minutes>9?minutes:'0'+minutes;
            let month = date.getMonth();
            month = month>9?month:'0'+month;
            let day = date.getDate();
            day = day>9?day:'0'+day;
            let second = date.getSeconds();
            second = second >9?second:'0'+second;
            let hour = date.getHours();
            hour = hour >9?hour:'0'+hour;
            let public_time = date.getFullYear() + '-'+month+'-'+day + ' ' + hour + ':' + minutes + ':' + second;


            let implement_type = $("#implement_type").val();
            let project_content = $("input[name='project_content']").val();
            alert(project_content);
            if(implement_type === ''){
                layer.msg("服务项目类型不能为空！",{icon:7,time:1500,closeBtn:0})
            }
            else if(project_content === ''){
                layer.msg("服务需求内容不能为空！",{icon:7,time:1500,closeBtn:0});
            }
            else {
                layer.load(0,{time:10000});
                let data = JSON.stringify({
                    "project_name": implement_type,
                    "project_content": project_content,
                    "public_time":public_time,
                    "rid":${sessionScope.resident.rid}
                });
                let url = '/test/service-add';
                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    beforeSend: function (req) {
                        req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
                    },
                    success: function (data) {
                        if (data.code === 97) {
                            layer.closeAll('loading');
                            setTimeout(function () {
                                window.parent.location.reload();  //刷新父窗口
                                let index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }, 1500);
                            layer.msg('发布服务项目成功', {icon: 1, time: 1000, closeBtn: 0});
                        } else if (data.code === -97) {
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


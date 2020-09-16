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
              <a><cite>公告管理</cite></a>
              <a><cite>基本设置</cite></a>
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
                            <span class='x-red'>*</span>公告类型
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="type" autocomplete="off" placeholder="10汉字以内"
                                   class="layui-input" lay-verify="required" value="">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>公告标题
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="title" autocomplete="off" placeholder="15汉字以内"
                                   class="layui-input" lay-verify="required" value="">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="status" title="发布" checked="checked">
                            <input type="radio" name="status" title="起草" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>公告内容
                        </label>
                        <div class="layui-input-block">
                            <textarea  id="content" placeholder="请填写公告内容" name="content" rows="15" cols="50"></textarea>
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
<script type="text/javascript">
</script>
<script>
    layui.use(['element','layer','form'], function(){
        let $ = layui.jquery;//jquery
        let element = layui.element;//面包导航
        let layer = layui.layer;//弹出层
        let form = layui.form;

        //监听submit提交
        $("#save").click(function(data){
            layer.load(0,{time:10000});
            let type = $("input[name='type']").val();
            let title = $("input[name='title']").val();
            let content = $("textarea[name='content']").val();
            if(title === ''){
                layer.msg("公告类型不能为空！",{icon:7,time:1200,closeBtn:0})
            }
            else if(content === ''){
                layer.msg("公告标题不能为空！",{icon:7,time:2000,closeBtn:0});
            }
            else if(content === ''){
                layer.msg("公告内容不能为空！",{icon:7,time:2000,closeBtn:0});
            }
            else {
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
                let data = JSON.stringify({
                    "author":"${sessionScope.resident.username}",
                    "identity":"${sessionScope.resident.identity}",
                    "title": title,
                    "notice_type": type,
                    "content": content,
                    "starttime": date.getFullYear() + '-'+month+'-'+day + ' ' + hour + ':' + minutes + ':' + second
                });
                let url = '/test/notice_append_api';
                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    beforeSend: function (req) {
                        req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
                    },
                    success: function (data) {
                        if (data.code === 35) {
                            layer.closeAll('loading');
                            setTimeout(function () {
                                window.parent.location.reload();  //刷新本窗口
                                let index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }, 1500);
                            layer.msg('添加公告成功', {icon: 1, time: 1000, closeBtn: 0});
                        } else if (data.code === -35) {
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
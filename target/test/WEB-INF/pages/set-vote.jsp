<%--
  Created by IntelliJ IDEA.
  User: 司云中
  Date: 2020/5/20
  Time: 22:58
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
              <a><cite>设置投票选项</cite></a>
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
                            <span class='x-red'>*</span>设置投票问题
                        </label>
                        <div class="layui-input-block">
                            <textarea name="vote-problem" placeholder="请输入问题内容，要求具备让居民支持与反对的决策！,问题不超过30个字" class="layui-textarea" id="vote-problem"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn" id="save">
                            添加
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

        $("#save").click(function(data){
            let vote_problem = $("#vote-problem").val();
            if(vote_problem === ''){
                layer.msg("问题内容不能为空！",{icon:7,time:1200,closeBtn:0})
            }
            else {
                layer.load(0,{time:10000});
                let data = JSON.stringify({
                    "cid":"${requestScope.cur_cid}",
                    "content":vote_problem,
                });
                let url = '/test/problem-add';
                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    beforeSend: function (req) {
                        req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
                    },
                    success: function (data) {
                        if (data.code === 86) {
                            layer.closeAll('loading');
                            setTimeout(function () {
                                window.parent.location.reload();  //刷新本窗口
                                let index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }, 1500);
                            layer.msg('添加投票问题成功！', {icon: 1, time: 1000, closeBtn: 0});
                        } else if (data.code === -86) {
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

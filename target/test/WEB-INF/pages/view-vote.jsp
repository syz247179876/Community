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
              <a><cite>投票</cite></a>
              <a><cite>查看投票情况</cite></a>
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
    <xblock><span class="x-right" style="line-height:40px">共有数据：<span class="layui-badge">${sessionScope.total_record_conferences}</span> 条</span></xblock>
    <table class="layui-table" id="vote" lay-filter="operation_row">

    </table>

    <c:if test="${sessionScope.resident.identity != '居民'}">
        <script type="text/html" id="baroperation">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看投票情况</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="vote">投票</a>
        </script>
    </c:if>
    <c:if test="${sessionScope.resident.identity == '居民'}">
        <script type="text/html" id="baroperation">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看投票情况</a>
            <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="vote">投票</a>
        </script>
    </c:if>
</div>
<script src="static/js/layui2.0/layui.js" charset="utf-8"></script>
<script src="static/js/x-layui.js" charset="utf-8"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>

    function problem_vote(title, url, w, h) {
        x_admin_show(title, url, w, h);
    }
    function check_time(starttime,endtime) {
        let start_time = new Date(starttime);
        let end_time = new Date(endtime);
        let now = new Date();
        return start_time < now && now < end_time;
    }

    function problem_delete(pid){
        $.ajax({
            type:'DELETE',
            url:'/test/problem-delete',
            data:JSON.stringify({'pid':pid}),
            dataType:'json',
            beforeSend: function(req){
                req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
            },
            success:function (data) {
                if (data.code === 87) {
                    layer.msg('删除成功!', {icon: 1, time: 1000, closeBtn: 0});
                }
                else if (data.code === -87){
                    layer.msg('删除失败!',{icon:2,time:1200,closeBtn:0});
                }
            },
            error:function () {
                layer.msg('服务器无响应!',{icon:2,time:1200,closeBtn:0});
            }
        });
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

        $(function () {
            table.render({
                elem: '#vote'
                , height: 500
                , url: '/test/problem-show' //数据接口
                , title: '投票'
                , id:'vote_table'
                , where: {rid: ${sessionScope.resident.rid}}
                , page: true //开启分页
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'pid', title: '问题编号',  width:100 ,sort: true, fixed: 'left', totalRowText: '合计：'}
                    , {field: 'cid',title: '会议编号',sort: true}
                    , {field: 'thesis',title: '会议名',}
                    , {field: 'content',title: '投票问题',}
                    , {field: 'starttime', title: '投票开始时间',sort: true}
                    , {field: 'endtime', title: '投票结束时间',sort: true}
                    , {fixed: 'right', width: 200, align: 'center', toolbar: '#baroperation'}
                ]]
            });
        })


        //监听行工具事件
        table.on('tool(operation_row)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            let data = obj.data; //获得当前行数据，json对象
            let layEvent = obj.event;  //获取click对应的lay-event
            let checkStatus = table.checkStatus('conference_table'); //获取表格所有选中行的数据
            if(layEvent === 'detail'){
                problem_vote('查看投票情况','/test/vote-result?cur_pid='+data.pid+'&cur_content='+data.content,'800','600');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    problem_delete(data.pid);
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            }
            else if(layEvent === 'vote'){
                if (check_time(data.starttime,data.endtime)){
                    problem_vote('进行投票','/test/start-vote?&cur_cid='+data.cid+'&cur_pid='+data.pid+'&cur_content='+data.content+'&cur_starttime='+data.starttime+'&cur_endtime='+data.endtime,'800','600');
                }
                else{
                    layer.msg("现在不是投票时间！",{icon:7,time:1200,closeBtn:0});
                }
            }
        });
    });
</script>

</body>
</html>
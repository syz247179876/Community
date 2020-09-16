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
              <a><cite>会议管理</cite></a>
              <a><cite>会议列表</cite></a>
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
            <xblock>
                <c:if test="${sessionScope.resident.identity != '居民'}">
                    <button class="layui-btn layui-btn-danger" onclick="conference_add('发布会议','/test/conference-add','800','600');"><i class="layui-icon">&#xe608;</i>添加</button>
                </c:if>
                    <span class="x-right" style="line-height:40px">共有数据：<span class="layui-badge">${sessionScope.total_record_conferences}</span> 条</span></xblock>
            <table class="layui-table" id="conferences" lay-filter="operation_row">

            </table>

            <c:if test="${sessionScope.resident.identity != '居民'}">
                <script type="text/html" id="baroperation">
                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="set_vote">设置投票</a>
                </script>
            </c:if>
            <c:if test="${sessionScope.resident.identity == '居民'}">
                <script type="text/html" id="baroperation">
                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                </script>
            </c:if>
        </div>
        <script src="static/js/layui2.0/layui.js" charset="utf-8"></script>
        <script src="static/js/x-layui.js" charset="utf-8"></script>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <script>

            function conference_add(title, url, w, h) {
                x_admin_show(title, url, w, h);
            }

            function conference_delete(cid){
                $.ajax({
                    type:'DELETE',
                    url:'/test/conference-delete',
                    data:JSON.stringify({'cid':cid}),
                    dataType:'json',
                    beforeSend: function(req){
                        req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
                    },
                    success:function (data) {
                        if (data.code === 58) {
                            layer.msg('删除成功!', {icon: 1, time: 1000, closeBtn: 0});
                        }
                        else if (data.code === -58){
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


                table.render({
                    elem: '#conferences'
                    , height: 500
                    , url: '/test/conference-show' //数据接口
                    , title: '公告表'
                    , id:'conference_table'
                    , page: true //开启分页
<%--                    <c:if test="${sessionScope.resident.identity != '居民'}">--%>
<%--                    , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档--%>
<%--                    </c:if>--%>
                    , cols: [[ //表头
                        {type: 'checkbox', fixed: 'left'}
                        , {field: 'cid', title: '会议编号',  width:50 ,sort: true, fixed: 'left', totalRowText: '合计：'}
                        , {field: 'username',title: '发布者'}
                        , {field: 'identity',title: '发布者身份',sort: true}
                        , {field: 'thesis', title: '会议关键点' }
                        , {field: 'location', title: '会议地点',sort: true}
                        , {field: 'starttime', title: '会议其实时间',sort: true}
                        , {field: 'endtime', title: '会议结束时间',  sort: true}
                        , {field: 'district',title: '会议对象'}
                        , {fixed: 'right', width: 180, align: 'center', toolbar: '#baroperation'}
                    ]]
                });

                // 监听工具头操作
                // table.on('toolbar(operation_row)', function(obj){
                //     let layEvent = obj.event;  //获取click对应的lay-event
                //     let checkStatus = table.checkStatus('conference_table'); //获取表格所有选中行的数据
                //     switch(layEvent){
                //         case 'add':
                //             conference_add('发布会议','/conference-add','800','600');
                //             break;
                //         case 'delete':
                //             if(checkStatus.data.length === 0){
                //                 layer.msg('请选择一行');
                //             } else {
                //                 //alert(checkStatus.data['cid']);  //有问题
                //                 conference_delete(checkStatus.cid)
                //             }
                //             break;
                //     }
                // });

                //监听行工具事件
                table.on('tool(operation_row)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    let data = obj.data; //获得当前行数据，json对象
                    let layEvent = obj.event;  //获取click对应的lay-event
                    let checkStatus = table.checkStatus('conference_table'); //获取表格所有选中行的数据
                    if(layEvent === 'detail'){
                        layer.msg('查看操作');
                    } else if(layEvent === 'del'){
                        layer.confirm('真的删除行么', function(index){
                            conference_delete(data.cid)
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);

                            //向服务端发送删除指令
                        });
                    }
                    else if(layEvent === 'set_vote'){
                        conference_add('设置投票','/test/set-vote?cur_cid='+data.cid,'800','600');
                    }
                });
            });
            </script>
            
    </body>
</html>
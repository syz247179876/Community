<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>
        文章类型
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
              <a><cite>公告管理</cite></a>
              <a><cite>公告列表</cite></a>
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
                <!--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button>-->
                <c:if test="${sessionScope.resident.identity != '居民'}">
                <button class="layui-btn" onclick="member_add('添加公告','/test/notice-add','800','600');"><i class="layui-icon">&#xe608;</i>添加</button>
                </c:if>
        <span class="x-right" style="line-height:40px">共有数据：<span class="layui-badge"> ${sessionScope.total_record}</span> 条</span></xblock>
    <table class="layui-table" id="notices" lay-filter="operation_row">

    </table>
    <c:if test="${sessionScope.resident.username == '司云中'}">
    <script type="text/html" id="baroperation">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    </c:if>
    <c:if test="${sessionScope.resident.identity != '司云中'}">
        <script type="text/html" id="baroperation">
            <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        </script>
    </c:if>
</div>
<script src="static/js/layui2.0/layui.js" charset="utf-8"></script>
<script src="static/js/x-layui.js" charset="utf-8"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<script>

    /*用户-添加*/
    function member_add(title, url, w, h) {
        x_admin_show(title, url, w, h);
    }


    // 用户-编辑
    function member_edit(title, url, id, w, h) {
        x_admin_show(title, url, w, h);
    }

    /*密码-修改*/
    function member_password(title, url, id, w, h) {
        x_admin_show(title, url, w, h);
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', {icon: 3, title: '提示信息'}, function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
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
            elem: '#notices'
            , height: 650
            , url: '/test/notice-list-show' //数据接口
            , title: '会议'
            , id:'notices_table'
            , page: true //开启分页
<%--            <c:if test="${sessionScope.resident.identity != '居民'}">--%>
<%--            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档--%>
<%--            </c:if>--%>
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'nid', title: 'ID',  width:50 ,sort: true, fixed: 'left', totalRowText: '合计：'}
                , {field: 'author',title: '发布者'}
                , {field: 'identity',title: '发布者身份',sort: true}
                , {field: 'title', title: '公告标题' }
                , {field: 'notice_type', title: '公告类型',sort: true }
                , {field: 'starttime', title: '发布公告时间',  sort: true}
                , {field: 'content', title: '公告内容' }
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#baroperation'}
            ]]
        });

        // 监听工具头操作
        // table.on('toolbar(operation_row)', function(obj){
        //     let data = obj.data; //获得当前行数据,js对象
        //     let layEvent = obj.event;  //获取click对应的lay-event
        //     let checkStatus = table.checkStatus('notices_table'); //获取表格所有选中行的数据
        //     switch(layEvent){
        //         case 'add':
        //             member_add('添加公告','/test/notice-add','800','600');
        //             break;
        //         case 'update':
        //             if(checkStatus.data.length === 0){
        //                 layer.msg('请选择一行');
        //             } else if(checkStatus.data.length > 1){
        //                 layer.msg('只能同时编辑一个');
        //             } else {
        //                 layer.msg('编辑 [id]：'+ checkStatus.data[0].id);
        //             }
        //             break;
        //         case 'delete':
        //             if(checkStatus.data.length === 0){
        //                 layer.msg('请选择一行');
        //             } else {
        //                 layer.msg('删除');
        //             }
        //             break;
        //     }
        // });

        //监听行工具事件
        table.on('tool(operation_row)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            let data = obj.data; //获得当前行数据，json对象
            let layEvent = obj.event;  //获取click对应的lay-event
            let checkStatus = table.checkStatus('notices_table'); //获取表格所有选中行的数据
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        type:'POST',
                        url:'/test/notice-delete-api',
                        data:JSON.stringify({'nid':data.nid}),
                        dataType:'json',
                        beforeSend: function(req){
                            req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
                        },
                        success:function (data) {
                            if (data.code === 34) {
                                layer.msg('删除成功!', {icon: 1, time: 1000, closeBtn: 0});
                            }
                            else if (data.code === -34){
                                layer.msg('删除失败!',{icon:2,time:1200,closeBtn:0});
                            }
                        },
                        error:function () {
                            layer.msg('服务器无响应!',{icon:2,time:1200,closeBtn:0});
                        }
                    });
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                layer.msg('编辑操作');
            }
        });

    });



</script>

</body>
</html>
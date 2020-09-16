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
        <link rel="stylesheet" href="static/lib/layui/css/layui.css">
    </head>
    
    <body>
        <div class="x-body">
            <blockquote class="layui-elem-quote">
                <img src="https://django-blog-syz.oss-cn-shanghai.aliyuncs.com/u%3D2142033892%2C1299498349%26fm%3D26%26gp%3D0.jpg" class="layui-circle" style="width:50px;float:left">
                <dl style="margin-left:80px; color:#019688">
                <dt><span >司云中</span></dt>
              </dl>
            </blockquote>
            <div class="pd-20">
              <table  class="layui-table" lay-skin="line">
                <tbody>
                  <tr>
                    <th  width="80">性别：</th>
                    <td>${sessionScope.resident.sex}</td>
                  </tr>
                  <tr>
                    <th>地址：</th>
                    <td>${sessionScope.resident.residence}</td>
                  </tr>
                  <tr>
                    <th>生日:</th>
                    <td>${sessionScope.resident.birthday}</td>
                  </tr>
                  <tr>
                      <th>身份:</th>
                      <td>${sessionScope.resident.identity}</td>
                  </tr>
                </tbody>
              </table>
            </div>
        </div>
        <script src="static/lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="static/js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                let $ = layui.jquery;
              let form = layui.form()
              let layer = layui.layer;

            });
        </script>
        
    </body>

</html>
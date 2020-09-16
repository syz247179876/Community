<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>云社区登录界面</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <link rel="stylesheet" href="static/css/style.default.css" id="theme-stylesheet">
  </head>
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>欢迎登录</h1>
                  </div>
                  <p>云社区管理系统</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <div  class="form-validate" id="loginFrom">
                    <div class="form-group">
                      <input id="login-username" type="text" name="userName" required data-msg="请输入用户名" placeholder="用户名"  class="input-material">
                    </div>
                    <div class="form-group">
                      <input id="login-password" type="password" name="passWord" required data-msg="请输入密码" placeholder="密码" class="input-material">
                    </div>
                    <button id="login" class="btn btn-primary">登录</button>
                    <div style="margin-top: -40px;"> 
                    	<!-- <input type="checkbox"  id="check1"/>&nbsp;<span>记住密码</span>
                    	<input type="checkbox" id="check2"/>&nbsp;<span>自动登录</span> -->
											<div class="custom-control custom-checkbox " style="float: right;">
											    <input type="checkbox" class="custom-control-input" id="check1" >
											    <label class="custom-control-label" for="check1">记住用户名&nbsp;&nbsp;</label>
											</div> 
                    </div>
                  </div>
                  <br />
                  <small>没有账号?</small><a href="/test/register" class="signup">&nbsp;注册</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="https://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
    <!--<script src="vendor/jquery-validation/jquery.validate.min.js"></script>-->
    <script type="text/javascript" src="static/js/layui2.0/layui.js"></script>
    <script>

      layui.use('layer',function () {
        let layer = layui.layer;
        let $ = layui.jquery;
        $(function () {

          $("#login").click(function () {
            let username = $("#login-username").val().trim();
            let password = $("#login-password").val().trim();
            if (username === '' || password === ''){
              layer.msg('请输入用户名或密码',{icon:7, time:1200,closeBtn:0});
            }
            else{
              layer.load(0,{time:10000});
              let url = "/test/login_api";
              let data = JSON.stringify({"id_card":username,"password":password});
              $.ajax({
                type:'POST',
                url:url,
                data:data,
                beforeSend: function(req){
                  req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题415
                },
                success: function (data) {
                  if (data.code === 12){
                    layer.msg('登录成功,正在跳转',{icon:1,time:1000,closeBtn:0});
                    setTimeout(function () {
                      window.location.href = '/test/index';
                    },1200);
                  }
                  else if(data.code === -12){
                    console.info(data.password);
                    layer.msg('用户名或密码不正确',{icon:2,time:1200,closeBtn:0});
                  }
                },
                error: function () {
                  layer.msg('服务器无响应!',{icon:2,time:1200,closeBtn:0});
                }
              });
              layer.closeAll('loading');
            }
          })
        });
      });

    </script>
  </body>
</html>
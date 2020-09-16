<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>云社区注册界面</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <link rel="stylesheet" href="static/css/style.default.css">
    <link rel="stylesheet" href="static/css/layui.css">
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
                    <h1>欢迎注册</h1>
                  </div>
                  <p>云社区管理系统</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form class="layui-form">
                  <div class="layui-form-item">
                    <label class="layui-form-label">身份</label>
                    <div class="layui-input-block">
                      <input type="radio" name="identity" value="居民" title="居民" lay-filter="identity">
                      <input type="radio" name="identity" value="居委会委员" title="居委会委员" lay-filter="identity">
                      <input type="radio" name="identity" value="物业管理人员" title="物业管理人员" lay-filter="identity">
                        <input type="radio" name="identity" value="社区管理人员" title="社区管理人员" lay-filter="identity">
                    </div>
                  </div>
                  <div class="layui-form-item">
                      <label class="layui-form-label">居民区</label>
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
                          <optiondistrict value="居民区16">居民区16</optiondistrict>
                          <option value="居民区17">居民区17</option>
                          <option value="居民区18">居民区18</option>
                          <option value="居民区19">居民区19</option>
                          <option value="居民区20">居民区20</option>
                        </select>
                      </div>
                    </div>
                    <div class="layui-form-item">
                      <label class="layui-form-label">联系方式</label>
                        <div class="layui-input-block">
                          <input type="text" lay-verify="required" id="phone" class="layui-input" required placeholder="请输入联系方式，方便参与活动">
                        </div>
                    </div>

                  </form>
                  <div class="layui-upload uploads" style="text-align: center">
                    <label>身份证正面</label>
                    <div class="layui-upload-list">
                      <img class="upload_idcard" id="face">
                    </div>
                  </div>

                    <div class="form-group">
                      <button id="verified" type="button" name="registerSubmit" class="btn btn-primary">注册</button>
                    </div>
                  <small>已有账号?</small><a href="/test/login" class="signup">&nbsp;登录</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="https://www.jq22.com/jquery/bootstrap-4.2.1.js"></script>
    <script type="text/javascript" src="static/js/layui2.0/layui.js"></script>
    <script>


    		layui.use(['upload','form'],function () {
    		  let $ = layui.jquery;
    		  let upload = layui.upload;
    		  let layer = layui.layer;
    		  let form = layui.form;

    		  let regex = /^1[3455678]\d{9}$/; // re

              $(function(){
              //身份证件正面上传
                $("#face").hover(function () {
                  layer.tips('<h3>身份证识别要求：</h3><br>' +
                          '1.上传证件应清晰，确保窗口内肉眼可以看见文字。<br>' +
                          '2.上传证件大小在2M以内。<br>' +
                          '3.上传证件图片类型为JGP,PNG,JEPG等常见格式。<br>' +
                          '<b style="color: red">4.默认用户名将设定为您的姓名。</b></br>' +
                          '<b style="color: red">5.默认登录密码将设定为您的身份证后六位。</b>', '#face', {
                    tips: 2,
                    time:10000,
                  });
                });
                let identity = '';
                let data = '';
                let district = '';
                let phone = '';
                let encryption = '';
                form.on('radio(identity)',function (data) {
                  if (data.value !== '居民' ) {
                    layer.prompt({
                      formType:2,
                      value:'填写角色注册密钥',
                      title:'密钥'
                    },function (value, index, elem) {
                      encryption = value;
                      layer.close(index);
                    });
                  }else{
                    encryption = "0";
                  }
                  identity = data.value;
                });

                $("#verified").click(function () {
                  district = $("#district").val();
                  phone = $("#phone").val();
                  if (identity === ''){
                    layer.msg('请选择注册身份!', {icon: 7, time: 1200, closeBtn: 0});
                  }
                  else if(district === ''){
                    layer.msg('请选择所在居民区!', {icon: 7, time: 1200, closeBtn: 0});
                  }
                  else if(!regex.test(phone)){
                    layer.msg('请填入正确的手机号!', {icon: 7, time: 1200, closeBtn: 0});
                  }
                });

                  upload.render({
                    elem: '#face'
                    , accept: 'images'
                    , auto: false
                    , size: 5000
                    , drag: true
                    , exts: 'jpg|png|jpeg'
                    , bindAction: '#verified'
                    , field: 'image'
                    , url: '/test/register_api' //改成您自己的上传接口
                    , choose: function (obj) {
                      //预读本地文件示例，不支持ie8
                      obj.preview(function (index, file, result) {
                        $('#face').prop('src', result); //图片链接（base64)
                      });
                    }
                    , before: function (obj) {
                      this.data = {"identity":identity,"district":district,"phone":phone,"encryption":encryption};
                      layer.load(0, {time: 10000});
                    }
                    , done: function (res) {
                      //如果上传失败
                      if (res.code === 20) {
                        layer.msg('认证成功,即将跳转', {icon: 1, time: 1000, closeBtn: 0});
                        layer.closeAll('loading');
                        setTimeout(function () {
                          window.location.href = '/test/login';
                        }, 1200);
                      }
                      else if (res.code === -21) {
                        layer.msg('密钥不正确，请联系管理员司云中获取!', {icon: 2, time: 1200, closeBtn: 0});
                        layer.closeAll('loading');
                        setTimeout(function () {
                          location.replace(location.href);
                        }, 1500);

                      }else if (res.code === -22) {
                        layer.msg('图像识别失败!', {icon: 2, time: 1200, closeBtn: 0});
                        layer.closeAll('loading');
                        setTimeout(function () {
                          location.replace(location.href);
                        }, 1500);
                      }
                      else if (res.code === -23) {
                          layer.msg('用户已注册!', {icon: 2, time: 1200, closeBtn: 0});
                        layer.closeAll('loading');
                        setTimeout(function () {
                          location.replace(location.href);
                        }, 1500);
                      }
                      $('#face').removeAttr('src');
                      //上传成功
                    }
                    , error: function () {
                      //演示失败状态，并实现重传
                      layer.msg('服务器无响应!', {icon: 2, time: 1200, closeBtn: 0});
                      window.location.href.reload();
                      layer.closeAll('loading');
                    }
                  });
            });
    	})
    </script>
  </body>
</html>
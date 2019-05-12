<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/index.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-4" style="margin-left: 35%">
            <h2 class="form-signin-heading">用户登陆</h2>
            <label for="account" class="sr-only">账号</label>
            <input  id="account" style="margin-top: 15px" class="form-control" placeholder="账号" required autofocus>
            <label for="password" class="sr-only">密码</label>
            <input type="password" style="margin-top: 15px" id="password" class="form-control" placeholder="密码" required>
            <button class="btn btn-lg btn-primary btn-block" style="margin-top: 15px"  onclick="doLogin()">登陆</button>
            <button class="btn btn-lg btn-primary btn-block" style="margin-top: 15px"  onclick="doRegister()">注册</button>
        </div>
    </div>
</div> <!-- /container -->
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script>
    var basePath = '${pageContext.request.contextPath}';
    function doLogin() {
        var account = $('#account').val();
        var password = $('#password').val();
        if(account == null || account === ''){
            alert("请输入账号！");
            return;
        }
        if(password == null || password === ''){
            alert("请输入密码！");
            return;
        }
        $.ajax({
            url: basePath + '/user/doLogin.do',
            type:'post',
            data:{
                account: account,
                password: password
            },
            dataType:'json',
            success:function (result) {
                if(!result.success){
                    alert("登录失败，请检查用户名密码！");
                }else{
                    if(result.data == null){
                        alert("登录失败，请检查用户名密码！");
                    }else{
                        window.location.href=basePath +"/index.jsp";
                    }
                }
            }
        })
    }
    
    function doRegister() {
        window.location.href=basePath +"/jsp/register.jsp";
    }

</script>
</body>

</html>
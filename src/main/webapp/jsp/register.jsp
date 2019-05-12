<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/index.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-4" style="margin-left: 35%">
            <h2 class="form-signin-heading">用户注册</h2>
            <label for="name" class="sr-only">真实姓名</label>
            <input  id="name" style="margin-top: 15px" class="form-control" placeholder="真实姓名" required autofocus>
            <label class="radio-inline" style="margin-top: 15px">
                <input type="radio" name="userRole" id="student" value="student" checked> 学生
            </label>
            <label class="radio-inline" style="margin-top: 15px">
                <input type="radio" name="userRole" id="teacher"  value="teacher"> 教师
            </label>
            <label for="account" class="sr-only">账号</label>
            <input  id="account" style="margin-top: 15px" class="form-control" placeholder="账号" required autofocus>
            <label for="password" class="sr-only">密码</label>
            <input type="password" style="margin-top: 15px" id="password" class="form-control" placeholder="密码" required>
            <button class="btn btn-lg btn-primary btn-block" style="margin-top: 15px"  onclick="doRegister()">注册</button>
        </div>
    </div>
</div>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>

    var basePath = '${pageContext.request.contextPath}';
    function doRegister() {
        var name = $('#name').val();
        var account = $('#account').val();
        var role = $("input[name='userRole']:checked").val();;
        var password = $('#password').val();
        if(name == null || name === ''){
            alert("请输入真实姓名！");
            return;
        }
        if(account == null || account === ''){
            alert("请输入账号！");
            return;
        }
        if(password == null || password === ''){
            alert("请输入密码！");
            return;
        }
        $.ajax({
            url: basePath + '/user/doRegister.do',
            type:'post',
            data:{
                name: name,
                role: role,
                account: account,
                password: password
            },
            dataType:'json',
            success:function (result) {
                if(!result.success){
                    alert(result.message);
                }else{
                    alert(result.message);
                    window.location.href=basePath + "/index.jsp";
                }
            }
        })
    }

</script>
</body>

</html>
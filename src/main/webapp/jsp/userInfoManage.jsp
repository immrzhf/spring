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
            <div class="col-lg-4">
            <label>姓名：</label>
            <span id="userName"></span>&nbsp;&nbsp;
            <label>性别：</label>
            <span id="userSex">无</span>&nbsp;&nbsp;
            <label>出生日期：</label>
            <span id="userBir">无</span><br/>
            <input  id="account" style="margin-top: 15px" class="form-control" placeholder="账号" required autofocus>
            <label for="password" class="sr-only">密码</label>
            <input type="password" style="margin-top: 15px" id="password" class="form-control" placeholder="密码" required>
            <button class="btn btn-lg btn-primary btn-block" style="margin-top: 15px"  onclick="doLogin()">登陆</button>
        </div>
    </div>
</div> <!-- /container -->
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script>
    var basePath = '${pageContext.request.contextPath}';
    var userId = '${sessionScope.userInfo.id}'; 
    $(function () {
        $.ajax({
            url: basePath + '/user/getUserXuejiById.do',
            data: {
                id : userId
            },
            dataType:'json',
            success:function (data) {
                if(data.success){
                    var userInfo = data.data;
                    $('#userName').html(userInfo.name);
                    if(userInfo.sex !== undefined){
                        $('#userSex').html(userInfo.sex);
                    }
                    if(userInfo.date !== undefined){
                        $('#userBir').html(userInfo.date);
                    }
                }
            }

        })
    })

</script>
</body>

</html>
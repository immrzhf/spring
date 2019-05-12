<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/index.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:$('#secondJsp').attr('src','jsp/login.jsp')">学籍管理系统</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="li-default" style="display: none" id="userManage">
                    <a href="javascript:$('#secondJsp').attr('src',userInfoManage.jsp)">学籍管理</a>
                </li>
                <li class="li-default" style="display: none" id="courseManage">
                    <a href="javascript:$('#secondJsp').attr('src','jsp/courseManage.jsp')">课程管理</a>
                </li>
                <li class="li-default" style="display: none" id="scoreManage">
                    <a href="javascript:$('#secondJsp').attr('src','jsp/scoreManage.jsp')">成绩管理</a>
                </li>
                <li class="li-default" style="display: none" id="payManage">
                    <a href="javascript:$('#secondJsp').attr('src','jsp/payManage.jsp')">交费管理</a>
                </li>
                <li class="li-default" style="display: none" id="rewardManage">
                    <a href="javascript:$('#secondJsp').attr('src','jsp/rewardManage.jsp')">奖惩情况</a>
                </li>
                <li class="li-default" style="display: none" id="userInfoManage">
                    <a href="javascript:$('#secondJsp').attr('src','jsp/userInfoManage.jsp')">学籍信息</a>
                </li>
                <li class="li-default" style="display: none" id="onlineSelection">
                    <a href="javascript:$('#secondJsp').attr('src','jsp/onlineSelection.jsp')">在线选课</a>
                </li>
                <li class="li-default" style="display: none" id="scoreQuery">
                    <a href="javascript:$('#secondJsp').attr('src','jsp/scoreQuery.jsp')">成绩查询</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span id="userHead">${sessionScope.userInfo.user_name}</span><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a onclick="doLoginOut()">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<iframe id="secondJsp" src="jsp/login.jsp" width="100%" height="100%"
        scrolling="auto" frameborder="0" name="main"
        onload="javascript:this.height=this.contentWindow.document.body.scrollHeight+30;"></iframe>

<script src="./js/jquery-3.4.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script>
    var userRole = '${sessionScope.userInfo.user_role}';
    if(userRole === 'student'){
        $('#secondJsp').attr("src","jsp/login.jsp");
        $('#userInfoManage').css("display","block").attr("class","li-default active");
        $('#onlineSelection').css("display","block");
        $('#scoreQuery').css("display","block");
        $('#userHead').append('(学生)');
    }else if(userRole === 'teacher'){
        $('#userInfoManage').css("display","block").attr("class","li-default active");
        $('#courseManage').css("display","block");
        $('#scoreManage').css("display","block");
        $('#payManage').css("display","block");
        $('#rewardManage').css("display","block");
        $('#userHead').append('(老师)');
    }else{
        window.location.href="jsp/login.jsp";
    }

    $('.li-default').click(function () {
        var getClass = $(this).attr('class');
        console.log(getClass);
        //判断当前样式
        if(getClass === 'li-default active'){
            $(this).removeClass('active')
        }else if(getClass === 'li-default'){
            //增加样式前先删除掉其它li标签的样式
            $(this).siblings('li').removeClass('active');
            $(this).addClass('li-default active');
        }
    });

    var basePath = '${pageContext.request.contextPath}';

    function doLoginOut() {
        $.ajax({
            url: ''
        })
    }

</script>
</body>

</html>
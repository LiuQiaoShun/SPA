<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <title>用户登录</title>
    <style type="text/css">
        #bj{
            width: 850px;
            height: 420px;
            border: 1px solid;
            position: relative;
            background-position;
            top: 80px;
            left: 250px;
        }
        #bj .left{
            width: 300px;
            height: 400px;
            position: absolute;
            top: 30px;
            left: 20px;
        }
        #bj .box{
            width: 280px;
            height: 50px;
            position: absolute;
            top: 55px;
            left: 460px;
        }
        #bj .form{
            width: 460px;
            height: 300px;
            position: absolute;
            top: 100px;
            left: 380px;
        }
        #bj .logo{
            position: absolute;
            top: 40px;
            left: 380px;
        }
        button{
            width: 80px;
        }
        #bj .btn-1{
            position: absolute;
            top: 240px;
            left: 80px;
        }
        #bj .btn-2{
            position: absolute;
            top: 240px;
            left: 200px;
        }
        #bj .input-1{
            position: absolute;
            top: 50px;
        }
        #bj .input-2{
            position: absolute;
            top: 120px;
        }
        #bj .input-3{
            position: absolute;
            top: 180px;
        }

    </style>
</head>

<body>
<div id="bj">
    <div class="left" >
        <img src = "/SPA/images/login.jpg">
    </div>
    <div class="logo">
        <img src ="/SPA/images/logo.png" style="width: 60px;height: 60px;">
    </div>
    <div class="box">
        <h2>用户管理系统登录</h2>
    </div>
    <div class="form">
        <form action="http://localhost:8080/SPA/userServlet" method="post" class="container">
            <hr>
            <input type="hidden" name="op" value="do_login">
            <div class="input-1">用户名:
                <input type="text" name="username" placeholder="请输入用户名..." style="width: 270px;height: 25px;background-color: #FAFEBC" required="required" pattern="\w{4,12}">
            </div>
            <div class="input-2">密&nbsp;&nbsp;&nbsp;码:
                <input type="password" name="password" style="width: 270px;height: 25px; background-color:#FAFEBC" required="required"  placeholder="请输入密码6到12位字符..." pattern="\w{6,12}">
            </div>
            <div class="input-3">
                <input type="checkbox" name="rePassword">记住密码
            </div>
            <p>
                <button id="btn" class="btn-1" type="submit">登录</button></a>
                <button class="btn-2" type="reset" >重置</button>
            </p>
        </form>
    </div>

</div>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var mess='${mess}'
    if(mess!=null&&mess!=''&&mess!=undefined&&mess!='undefined'){
        alert(mess)
    }
</script>
</body>
</html>

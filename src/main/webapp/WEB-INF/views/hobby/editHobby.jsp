<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户查询页面</title>
    <style type="text/css">
        body{
            margin: 0;
        }
        #box{
            width: 1365px;
            height: 100px;
            background-color: #8F8FBD;
            background-image: url(/SPA/images/logo.png);
            background-repeat: no-repeat;
            background-position: 20px;
            background-size: 80px;
            color: white;
            position: relative;
        }
        #box .word{
            position: absolute;
            font-size: 40px;
            top: 30px;
            right: 0;
            bottom: 0;
            left: 110px;
        }
        #box .word-1{
            position: absolute;
            font-size: 20px;
            top: 40px;
            right: 0;
            bottom: 0;
            left: 1250px;
        }
        #box-1{
            width: 200px;
            height: 540px;
            background-color: gray;
            background-image: url(/SPA/images/Ameng.jpg);
            background-repeat: no-repeat;
            background-position: 50px 370px;
            background-size: 80px;
            position: relative;
        }
        #box-1 .font-1{
            position: absolute;
            font-size: 30px;
            top: 20px;
            right: 40px;
            left:40px;
        }
        #box-1 .font-2{
            position: absolute;
            font-size: 30px;
            top: 70px;
            right: 40px;
            left:40px;
        }
        #box-1 .font-3{
            position: absolute;
            font-size: 30px;
            top: 120px;
            right: 40px;
            left:40px;
        }
        #box-1 .font-4{
            position: absolute;
            font-size: 20px;
            right: 40px;
            bottom: 25px;
            left:40px;
        }
        #box-1 .font-5{
            width: 1200px;
            height: 500px;
            position: absolute;
            font-weight: bold;
            font-size: 20px;
            top: 10px;
            left: 680px;
        }
        #box-1 .font-6{
            width: 1000px;
            height: 500px;
            position: absolute;
            font-size: 20px;
            top: 70px;
            left:250px;
        }
    </style>
</head>
<body>
<div id="box">
    <div class="word">用户管理系统</div>
    <div class="word-1">帮助 退出</div>
</div>
<div id="box-1">
    <div class="font-1"><a href="http://localhost:8080/SPA/user/list">用户管理</a></div>
    <div class="font-2"><a href="http://localhost:8080/SPA/user/action">职业管理</a></div>
    <div class="font-3"><a href="http://localhost:8080/SPA/user/hobby">爱好管理</a></div>
    <div class="font-4">当前用户登录</div>
    <div class="font-5">修改爱好信息</div>
    <div class="font-6">
        <form action="do_editHobby" method="post">
            <div class="form-group">
                <label for="id">编号:</label>
                <input style="height: 35px" value="${user.id }" type="hidden" name="id" class="form-control" id="id" required="required" pattern="[0-9]{4,}" placeholder="1001" readonly="readonly" >

                <label for="hobby">用户爱好:</label>
                <input style="height: 35px" value="${user.hobby}" type="text" name="hobby" class="form-control" id="hobby" required="required">
            </div>
            <hr>
            <p>
            <center>
                <button type="submit" class="btn" style="width: 75px;
                height: 35px;background-color: green">保存</button>&nbsp;
                <button type="reset" style="width: 75px;height: 35px;
                background-color: blue; ">重置</button> &nbsp;
                <button class="btn btn-primary" style="width: 75px;height: 35px;
                background-color: gray" onclick="history.go(-1)">返回</button>
            </center>
            </p>
        </form>
    </div>
</div>
</body>
</html>

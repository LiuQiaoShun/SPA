<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改页面</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
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
            height: 700px;
            background-color: gray;
            background-image: url(/SPA/images/Ameng.jpg);
            background-repeat: no-repeat;
            background-position: 50px 530px;
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
    <div class="font-5">修改用户信息</div>
    <div class="font-6">
        <form action="do_edit" method="post">

            <div class="form-group">
                <label for="id">id:</label>
                <input value="${user.id }" type="text" name="id" class="form-control" id="id" required="required" pattern="[0-9]{4,}" placeholder="1001" readonly="readonly" >

                <label for="username">username:</label>
                <input value="${user.username }" type="text" name="username" class="form-control" id="username" required="required">

                <label for="email">email:</label>
                <input value="${user.email}" type="email" name="email" class="form-control" id="email" required="required">

                <label for="birthday">birthday:</label>
                <input type="date" name="birthday" class="form-control" id="birthday" value='<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/>' required="required">

                <label for="vocation">vocation:</label>
                <input value="${user.vocation}" type="text" name="vocation" class="form-control" id="vocation" required="required">

                <label for="hobby">hobby:</label>
                <input value="${user.hobby}" type="text" name="hobby" class="form-control" id="hobby" required="required">

                <label for="createdate">createDate:</label>
                <input value="<fmt:formatDate value='${user.createdate }' pattern='yyyy-MM-dd'/>"  type="date" name="createdate" class="form-control" id="createdate" required="required">

            </div>
            <div class="form-group">
                <div class="radio">
                    <label >Gender:</label>
                    <label class="radio-inline"><input type="radio" ${user.gender?"checked='checked'":""} name="gender" value="男">Man</label>
                    <label class="radio-inline"><input type="radio" ${user.gender?"":"checked='checked'"} name="gender" value="女">Woman</label>
                </div>

            </div>
            <button type="submit" class="btn btn-primary">保存</button>
            <button type="reset" class="btn btn-primary">取消</button>
            <button type="button" class="btn btn-success" onclick="javascript:history.go(-1)">返回</button>
        </form>
    </div>
</div>
</body>
</html>

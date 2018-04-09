<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function upload() {
        //js file对象
        var file=$("#file")[0].files[0];

        //js form
        var form=new FormData();
        form.append("file",file);

        //jquery ajax
        var opt={
            url:"/SPA/user/do_upload",
            type:"post",
            contentType:false,
            processData:false,
            data:form,
            success:function (data) {
                var json=eval("("+data+")");
                $("#img").attr("src","/SPA/upload/"+json.url);
            }
        };
        $.ajax(opt);
    }
    $(function () {
        var $container=$('#container')
        $container.on('submit',function(){
            var password=$container.find('input[name="password"]')
            var Loginpwd=$container.find('input[name="Loginpwd"]')
            if(password.val()!==Loginpwd.val()){
                alert('密码和重复密码必须相同')
                return false
            }
        })
    })

</script>
<head>
    <title>用户新增页面</title>
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
            height: 760px;
            background-color: gray;
            background-image: url(/SPA/images/Ameng.jpg);
            background-repeat: no-repeat;
            background-position: 50px 570px;
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
            top: 55px;
            left:250px;
        }
        #box-1 .img{
            position: absolute;
            top:30px;
            left:610px;
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
    <div class="font-5">新增用户信息</div>
    <div class="font-6">
        <form action="do_save" method="post" id="container">
            <div class="img">
                <p>
                    <img id="img" src="" width="200px" height="200px">
                </p>
                <p>
                    <input type="file" name="file" id="file" style="width: 180px" required="required">
                </p>
                <p>
                    <input type="button" value="上传头像图片" onclick="upload()" style=" text-align: center; width: 200px;background-color: aqua" required="required">
                </p>
            </div>

            <div class="form-group">
                <label for="username">用户名称:</label>
                <input style="width: 475px;" type="text" name="username" class="form-control" id="username" placeholder="请输入您的用户名........." required="required" oninvalid="setCustomValidity('姓名必填')" oninput="setCustomValidity('')">

                <label for="password">登录密码:</label>
                <input style="width: 475px;" type="password" name="password" class="form-control" id="password"  placeholder="请输入您的用户密码........." pattern="\w{6,12}" required="required" oninvalid="setCustomValidity('密码6到12位字符')" oninput="setCustomValidity('')">

                <label for="Loginpwd">重复密码:</label>
                <input style="width: 475px;" type="password" name="Loginpwd" class="form-control" id="Loginpwd"  placeholder="请输入您的确认密码........." pattern="\w{6,12}" required="required" oninvalid="setCustomValidity('重复密码与密码必须相同')" oninput="setCustomValidity('')">

                <label for="email">电子邮箱:</label>
                <input style="width: 475px;" type="email" name="email" class="form-control" id="email" placeholder="请输入您的电子邮箱........." required="required">


                <label for="birthday">出生日期:</label>
                <input style="width: 475px;"  type="date" name="birthday" class="form-control" id="birthday" required="required" oninvalid="setCustomValidity('生日必填')" oninput="setCustomValidity('')">

                <div class="form-group">
                    <div class="radio">
                        <label >性&nbsp;&nbsp;别:</label>
                        <label class="radio-inline"><input type="radio" name="gender" value="男" required="required">男</label>
                        <label class="radio-inline"><input type="radio" name="gender" value="女" required="required">女</label>
                    </div>
                </div>

                <div class="form-group">
                    <label>职&nbsp;&nbsp;业：</label>
                    <select class="profession" style="width: 400px; height:25px;" name="vocation">
                        <option value="student">学生</option>
                        <option value="teacher">老师</option>
                        <option value="programmer">程序猿</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>爱&nbsp;&nbsp;好：</label>
                    <select  class="multiple" name="hobby" multiple="multiple" size="4" style="width: 400px;" required="required">
                        <option  value="书法">书法</option>
                        <option  value="运动">运动</option>
                        <option  value="乐器">乐器</option>
                        <option  value="编程">编程</option>
                    </select>
                </div>
                <hr/>
                <center>
                    <button type="submit" class="btn btn-primary">提交</button>
                    <button type="reset" class="btn btn-danger">重置</button>
                    <button type="button" class="btn btn-success" onclick="javascript:history.go(-1)">返回</button>
                </center>
                <div>
                    <center>Copyright&copy;2017轻实训版权所有</center>
                </div>
            </div>


        </form>
    </div>
</div>

</body>
</html>


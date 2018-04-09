<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户信息</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var mess='${mess}'
        if (mess!=''&&mess!=null&&mess!=undefined&&mess!='undefined'){
            alert(mess)
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xl-2 col-lg-2 col-md-10 col-sm-10">
            <nav class="navbar navbar-expand-sm">
                <ul class="nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="javascript:void();" id="navbardrop" data-toggle="dropdown">
                            用户模块
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="http://localhost:8080/SPA/userServlet?op=to_login" target="myifram">登录页面</a>
                            <a class="dropdown-item" href="http://localhost:8080/SPA/user/list" target="myifram">用户列表</a>
                            <a class="dropdown-item" href="http://localhost:8080/SPA/user/to_save" target="myifram">添加用户</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="h-100 col-xl-12 col-lg-12 col-md-12 col-sm-12">
            <iframe src="http://localhost:8080/SPA/user/list" name="myifram" scrolling="0" frameborder="0" class="h-100 w-100" ></iframe>
        </div>
    </div>
</div>
</body>
</html>
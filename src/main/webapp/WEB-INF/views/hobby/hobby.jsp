<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body{
            margin: 0;
        }
        #box{
            width: 1360px;
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
            background-position: 50px 350px;
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
            bottom: 40px;
            left:40px;
        }
        #box-1 .font-5{
            width: 1100px;
            height: 500px;
            position: absolute;
            font-size: 20px;
            top: 20px;
            left:250px;
        }
        td{
            width: 200px;
            height: 50px;
        }
        #box-1 .font-6{
            width: 450px;
            height: 20px;
            position: absolute;
            font-size: 10px;
            top: 470px;
            left: 1000px;
        }

        ul{
            list-style-type: none;
        }
        ul li{
            float: left;
            width: auto;
            margin: 0px 10px;
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
    <div class="font-5">
        <form action="#" method="post" id="form">
        <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}">
        <table class="table table-striped table-bordered table-hover ">
            <thead>
                <tr>
                    <a class="btn btn-primary" href="to_increase">新增爱好</a>
                </tr>
                <tr class="table-info">
                    <td>序号</td>
                    <td>爱好名称</td>
                    <td>创建时间</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageInfo.list}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.hobby}</td>
                        <td>
                            <fmt:formatDate value="${user.createdate}" pattern="yyy-MM-dd"/></td>
                        <td>
                            <a href="to_editHobby?id=${user.id}" class="btn btn-warning">编辑</a>
                            <a href="delete_hobby?id=${user.id}" class="btn btn-danger">删除</a>
                        </td>
                    </tr>
                </c:forEach>
           </tbody>
           <tfoot>
                <tr>
                    <td colspan="5">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="javascript:go(1)">首页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript:go(${pageInfo.prePage})">上一页</a>
                            </li>
                            <c:forEach  items="${pageInfo.navigatepageNums}" var="page">
                                <li class="page-item">
                                    <a  class="page-link" href="javascript:go(${page})">第${page}页</a>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="javascript:go(${pageInfo.nextPage})">下一页</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript:go(${pageInfo.pages})">末页</a>
                            </li>
                        </ul>
                    </td>
                </tr>
           </tfoot>
        </table>
    </div>
    </form>
    <div class="font-6">
        <p>共${pageInfo.pages}页 ${pageInfo.total}条记录</p>
    </div>
</div>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function go(page) {
        $("#pageNum").val(page)
        $("#form").attr("action","http://localhost:8080/SPA/user/hobby")
        $("#form").submit()
    }
</script>
</body>
</html>

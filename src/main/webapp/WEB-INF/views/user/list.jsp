<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            margin: 0;
        }
        #box{
            width: 1450px;
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
            height: 600px;
            background-color: gray;
            background-image: url(/SPA/images/Ameng.jpg);
            background-repeat: no-repeat;
            background-position: 50px 400px;
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
            width: 1200px;
            height: 500px;
            position: absolute;
            font-size: 20px;
            top: 20px;
            left:250px;
        }
        td{
             width: 300px;
             height: 40px;
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
        <table id="userInfo">
            <thead>
                <tr>
                    <td>
                        <a href="to_save" class="btn btn-primary">用户新增</a>
                    </td>
                    <td>
                        <button type="button" style="width: 100px;height: 40px;background-color: firebrick" onclick="batchDeletes()">批量删除</button>
                    </td>
                    <td>
                        <a href="download?filename=SPA.zip" class="btn btn-success">导出用户</a>
                    </td>

                    <td colspan="2">
                        <label for="username">用户名称:</label>
                        <input type="text" id="username" name="username" value="${user.username}">
                    </td>
                    <td>
                        <button onclick="go(1)" style="width: 70px;height: 35px;" class="btn btn-success">查询</button>
                    </td>
                    <td>
                        <button type="reset" style="width: 70px;height: 35px;" class="btn btn-warning">重置</button>
                    </td>
                </tr>
                <tr class="table-info">
                    <td>批量删除选项</td>
                    <td>用户名称</td>
                    <td>职业</td>
                    <td>邮箱</td>
                    <td>性别</td>
                    <td>生日</td>
                    <td>爱好</td>
                    <td>创建时间</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageInfo.list}" var="user">
                    <tr>
                        <td>
                            <input type="checkbox" id="subcheck" name="subcheck" value="${user.id}"/>
                        </td>
                        <td>${user.username}</td>
                        <td>${user.vocation}</td>
                        <td>${user.email}</td>
                        <td>${user.gender}</td>
                        <td>
                             <fmt:formatDate value="${user.birthday}" pattern="yyy-MM-dd"/>
                        </td>
                        <td>${user.hobby}</td>
                        <td>
                             <fmt:formatDate value="${user.createdate}" pattern="yyy-MM-dd"/>
                        </td>
                        <td colspan="5">
                            <div>
                                <a href="to_edit?id=${user.id}" class="btn btn-primary">编辑</a>
                                <a href="remove?id=${user.id}" class="btn btn-danger">删除</a>
                                <a href="to_update?id=${user.id}" class="btn btn-warning">修改密码</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
           </tbody>
           <tfoot>
                <tr>
                    <td colspan="10">
                        <ul>
                            <li>
                                <a class="page-link" href="javascript:go(1)">首页</a>
                            </li>
                            <li>
                                <a class="page-link" href="javascript:go(${pageInfo.prePage})">上一页</a>
                            </li>
                            <c:forEach  items="${pageInfo.navigatepageNums}" var="page">
                                <li>
                                    <a  class="page-link" href="javascript:go(${page})">第${page}页</a>
                                </li>
                            </c:forEach>
                            <li>
                                <a  class="page-link" href="javascript:go(${pageInfo.nextPage})">下一页</a>
                            </li>
                            <li>
                                <a  class="page-link" href="javascript:go(${pageInfo.pages})">末页</a>
                            </li>
                        </ul>
                    </td>
                </tr>
           </tfoot>
        </table>
        </form>
    </div>

</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function go(page) {
        $("#pageNum").val(page)
        $("#form").attr("action","http://localhost:8080/SPA/user/list")
        $("#form").submit()
    }

    function batchDeletes(){
        //判断至少写了一项
        var checkedNum = $("input[name='subcheck']:checked").length;
        if(checkedNum==0){
            alert("请至少选择一项!");
            return false;
        }
        if(confirm("确定删除所选项目?")){
            var checkedList = new Array();
            $("input[name='subcheck']:checked").each(function(){
                checkedList.push($(this).val());
            });
            $.ajax({
                type:"POST",
                url:"del",
                data:{"delitems":checkedList.toString()},
                datatype:"html",
                success:function(data){
                    $("[name='checkbox2']:checkbox").attr("checked",false);
                    location.reload();//页面刷新
                },
                error:function(data){
                    art.dialog.tips('删除失败!');
                }
            });
        }
    }
</script>
</body>
</html>

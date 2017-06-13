<%-- 
    Document   : login
    Created on : 2017-5-9, 21:21:11
    Author     : qiuyayun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>欢迎登录</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/lr.css">
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <!--头部-->
        <header class="bh">
            <div class="bh-wrap">
                <div class="bh-wrapLeft"><a href="">图书馆管理系统</a></div>
                <nav class="bh-wrapRight">
                    <a href="login.jsp">登录</a>|<a href="registration.jsp">注册</a>
                </nav>
            </div>
        </header>
        <!--主体-->
        <section class="bs">
            <div class="bs-img">
                <div class="bs-wrap">
                    <div class="bs-login">
                        <div class="login-hd" id="login-hd">
                            <div class="item action">用户登录</div>
                            <div class="item" >管理员登录</div>
                        </div>
                        <div class="login-bd" id="login-bd">
                            <%
                                if(session!=null && session.getAttribute("userName")!=null){
                                response.sendRedirect("Individual.jsp");
                                }else{
                            %>
                            <form action="LoginServlet" method="post" class="login-form account action">
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <input type="text" name="userName" placeholder="请输入用户名"/>
                                </div>
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-lock"></i>
                                    <input type="password" name="password" placeholder="请输入密码"/>
                                </div>
                                <div class="form-btn">
                                    <button type="submit">登录</button>
                                </div>
                            </form>
                            <%
                                 }
                            %>
                            <form action="AdminLoginServlet" method="post" class="login-form admin">
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <input type="text" name="userName" placeholder="请输入管理员名称" required="true"/>
                                </div>
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-lock"></i>
                                    <input type="password" name="password" placeholder="请输入密码" required="true"/>
                                </div>
                                <div class="form-btn">
                                    <button type="submit">管理员登录</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--底部-->
        <footer class="bt">
             <div class="bt-wrap">
                 <nav><a href="">关于系统</a>|<a href="">客户服务</a>|<a href="">相关法律</a><span><img src="images/foot.png" alt=""></span></nav>
             </div>
        </footer>

        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            //切换用户和管理员登录界面
            $(document).ready(function () {
                $("#login-hd .item").click(function () {
                    $(this).css({
                        background: " rgba(176,196,222,0.5)"
                    }).siblings().css({
                        background: "rgba(245,245,245,0.9)"
                    });
                    var index = $(this).index();
                    $("#login-bd form").eq(index).css("display", "block").siblings().css("display", "none");
                });
            });
        </script>
        </body>
</html>
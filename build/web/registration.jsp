<%-- 
    Document   : registration
    Created on : 2017-5-10, 8:39:24
    Author     : qiuyayun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/lr.css">
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <header class="bh">
            <div class="bh-wrap">
                <div class="bh-wrapLeft"><a href="">图书馆管理系统</a></div>
                <nav class="bh-wrapRight">
                    <a href="login.jsp">登录</a>|<a href="registration.jsp">注册</a>
                </nav>
            </div>
        </header>
        <section class="bs">
            <div class="bs-img">
                <div class="bs-wrap">
                    <div class="bs-register">
                        <div class="register-bd">
                            <form action="RegistrationServlet" method="post" class="register-form" id="registerForm">
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <input name="userName" type="text" required="true" placeholder="用户名"/>
                                </div>
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-lock"></i>
                                    <input name="password" type="password" required="true" placeholder="密码"/>
                                </div>
                                <div style="margin-bottom: 20px">
                                    性别:&nbsp;&nbsp;
                                    <input type="radio" name="gender" value="M"/>男&nbsp;&nbsp;
                                    <input type="radio" name="gender" value="F"/>女
                                </div>
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-credit-card"></i>
                                    <input type="text" name="identity" required="true" placeholder="身份证号码"/>
                                </div>
                                <div class="form-item">
                                    <i class="glyphicon glyphicon-home"></i>
                                    <input type="text" name="city" required="true" placeholder="城市"/>
                                </div>
                                <div class="form-item">
                                        <i class="glyphicon glyphicon-phone"></i>
                                        <input type="text" name="phone" required="true" placeholder="电话"/>
                                </div>
                                <div class="form-btn">
                                    <button type="submit">注册</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="bt">
            <div class="bt-wrap">
                <nav><a href="">关于系统</a>|<a href="">客户服务</a>|<a href="">相关法律</a><span><img src="images/knet.png" alt=""></span></nav>
            </div>
        </footer>

        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>

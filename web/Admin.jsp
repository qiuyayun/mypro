<%-- 
    Document   : Admin
    Created on : 2017-5-9, 22:01:54
    Author     : qiuyayun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head style="position:fixed;">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>欢迎管理员</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/part.css">
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="mainBox">
            <header>
                <div class="hd-wrap">
                    <div class="headLeft"><a href="">图书馆管理系统</a></div>
                    <div class="headRight">
                        <div class="user">
                            <i class="glyphicon glyphicon-user"></i>欢迎管理员
                            <a href="logout.jsp">注销</a>
                        </div>
                    </div>
                </div>
            </header>
            <div class="left">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="glyphicon glyphicon-book"></i>图书管理
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <ul>
                                    <li><a href="addBook.jsp" target="content"><i class="glyphicon glyphicon-plus"></i>添加图书</a></li>
                                    <li><a href="searchBook.jsp" target="content"><i class="glyphicon glyphicon-search"></i>查询图书</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="glyphicon glyphicon-user"></i>读者管理
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <ul>
                                    <li><a href="userList.jsp" target="content"><i class="glyphicon glyphicon-th-list"></i>读者信息</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <i class="glyphicon glyphicon-arrow-up"></i>借书管理
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <ul>
                                    <li><a href="borrowList.jsp" target="content"><i class="glyphicon glyphicon-th-list"></i>借还信息列表</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right" id="right">
                <iframe href="" name="content" frameborder="0" scrolling="yes" width="100%" height="100%"></iframe>
            </div>
        </div>

        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

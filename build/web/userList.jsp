<%-- 
    Document   : userList
    Created on : 2017-5-10, 7:26:17
    Author     : qiuyayun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/part.css">
        <style>
            html{
                overflow-x: hidden;
            }
            body{
                background-color: #fff;
            }
        </style>
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <form action="showUser.jsp" method="post" target="_self">
            <input type="text" placeholder="用户名"  required="true" name="username">
            <button type="submit">搜索</button>
            <button type="reset">重置</button> 
            &nbsp;&nbsp;&nbsp;&nbsp;<a href="Users.jsp" target="_self">所有用户</a>
        </form>        
    </body>
</html>

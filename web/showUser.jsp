<%-- 
    Document   : showUser
    Created on : 2017-5-10, 7:30:55
    Author     : qiuyayun
--%>
<%@page import="bean.UpdateFee"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
    ServletContext s = this.getServletContext();
    String url = s.getInitParameter("url");
    String username = s.getInitParameter("username");
    String password = s.getInitParameter("password");
    PreparedStatement ps;

    Class.forName(s.getInitParameter("driver"));// 动态加载mysql驱动
    Connection conn = DriverManager.getConnection(url, username, password);
    ResultSet rs;
    String userName = request.getParameter("username");

    new UpdateFee(userName);

    ps = conn.prepareStatement("select * from users where userName=?");
    ps.setString(1, userName);
    rs = ps.executeQuery();
    rs.next();
    String gender = rs.getString("gender");
    String pass = rs.getString("pass");
    String id = rs.getString("identity");
    String city = rs.getString("city");
    String phone = rs.getString("phone");
    String number = rs.getString("number");
    int VIP = rs.getInt("VIP");
%>
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
        </style>
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <table class="table-container">
            <thead>
            <th>用户名</th>
            <th>性别</th>
            <th>密码</th>
            <th>身份证号</th>
            <th>城市</th>
            <th>电话</th>
            <th>借阅量</th>
            <th>VIP</th>
            <th>删除</th>
            <th>修改</th>
        </thead>
        <tbody>
            <tr>
                <td><%=userName%></td>
                <td><%=gender%></td>
                <td><%=pass%></td>
                <td><%=id%></td>
                <td><%=city%></td>
                <td><%=phone%></td>
                <td><%=number%></td>
                <td>
                    <c:if test="<%=VIP==0%>">普通用户</c:if>
                    <c:if test="<%=VIP==1%>">VIP</c:if>
                </td>
                <td><a href="DMU.jsp?op=delete&user=<%=userName%>">删除</a></td>
                <td><a href="DMU.jsp?op=modify&user=<%=userName%>">修改</a></td>
            </tr>
        </tbody>
    </table>

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

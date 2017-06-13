<%-- 
    Document   : DMU
    Created on : 2017-5-10, 8:21:45
    Author     : qiuyayun
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
        </style>
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <%
            String op = (String) request.getParameter("op");
            String id = (String) request.getParameter("user");
            ServletContext s = this.getServletContext();
            String url = s.getInitParameter("url");
            String username = s.getInitParameter("username");
            String password = s.getInitParameter("password");
            PreparedStatement ps;
            Class.forName(s.getInitParameter("driver"));
            Connection conn = DriverManager.getConnection(url, username, password);
            if (op.equals("delete")) {
                ps = conn.prepareStatement("select * from Users where userName=?");
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                rs.next();
                if (rs.getInt("number") > 0) {
                    response.sendRedirect("error2.jsp");
                } else {

                    ps = conn.prepareStatement("Delete from users where userName=?");
                    ps.setString(1, id);
                    ps.execute();
                    response.sendRedirect("succeed.jsp");
                }
            } else {
        %>
        <form action="UpdateUserServlet" method="post">
            <input placeholder="用户名" required="true" type="text" name="userName" value="<%=id%>"/><br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="F"/>女<input type="radio" name="gender" value="M"/>男<br/>
            <input placeholder="密码" required="true" type="password" name="password"/><br/>
            <!--<input placeholder="身份证号码" required="true" type="text" name="identity"/><br/>-->
            <input placeholder="联系电话" required="true" type="text" name="phone"/>
            <button type="submit">修改</button>
            <button type="reset">重置</button>
        </form>
        <%
            }
        %>
    </body>
</html>


<%-- 
    Document   : DorM
    Created on : 2017-5-10, 8:26:58
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
           response.setContentType("text/html;charset=UTF-8");
           
           request.setCharacterEncoding("utf-8");
           
            String op = (String) request.getParameter("op");
            String id = (String) request.getParameter("id");
            ServletContext s = this.getServletContext();
            String url = s.getInitParameter("url");
            String username = s.getInitParameter("username");
            String password = s.getInitParameter("password");
            PreparedStatement ps;
            Class.forName(s.getInitParameter("driver"));
            Connection conn = DriverManager.getConnection(url, username, password);
            if (op.equals("delete")) {
                ps = conn.prepareStatement("select * from Books where id=?");
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                rs.next();
                if (rs.getInt("statu") == 1) {
                    response.sendRedirect("error2.jsp");

                } else {

                    ps = conn.prepareStatement("Delete from Books where id=?");
                    ps.setString(1, id);
                    ps.execute();
                    response.sendRedirect("succeed.jsp");
                }
            } else {
        %>
        <form action="UpdateServlet" mothed="post">
            <input type="text" placeholder="图书编号"  required="true" name="id" value="<%=id%>"/><br/>
            <input type="text" placeholder="书名" required="true" name="title"/><br/>
            <input type="text" placeholder="作者" required="true" name="author"/><br/>
            <input type="text" placeholder="价格" required="true" name="price"/><br/>
            <input type="text" placeholder="出版社" required="true" name="publisher"/><br/>
            <select name="class">
                <option value="小说">小说</option>
                <option value="心灵鸡汤">心灵鸡汤</option>
                <option value="杂志">杂志</option>
                <option value="散文">散文</option>
                <option value="科学">科学</option>
            </select>
            <button type="submit">更新</button>
            <button type="reset">重置</button>
        </form>
        <%
            }
        %>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

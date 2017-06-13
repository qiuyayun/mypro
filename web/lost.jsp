<%-- 
    Document   : lost
    Created on : 2017-5-10, 7:52:11
    Author     : qiuyayun
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <%
        String userName=request.getParameter("userName");
        String bookId=request.getParameter("bookId");
                ServletContext s=this.getServletContext();
             String url =s.getInitParameter("url");
             String username = s.getInitParameter("username") ;   
             String password = s.getInitParameter("password") ;
             PreparedStatement ps;
             //Statement st;
            Class.forName(s.getInitParameter("driver"));
            Connection conn = DriverManager.getConnection(url,username,password);
            ps=conn.prepareStatement("delete from borrowingBooks where Bookid=?");
            ps.setString(1, bookId);
            ps.execute();
            ps=conn.prepareStatement("delete from Books where id=?");
            ps.setString(1, bookId);
            ps.execute();
            ps=conn.prepareStatement("update users set number=number-1 where userName=?");
            ps.setString(1, userName);
            ps.execute();
            
        %>
        <script>alert("Succeed!");</script>
        <script>location.replace(document.referrer);</script>
    </body>
</html>


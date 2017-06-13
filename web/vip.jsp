<%-- 
    Document   : vip
    Created on : 2017-5-10, 8:38:32
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
            if(session!=null && session.getAttribute("userName")!=null){
                String userName=(String)session.getAttribute("userName");
                if(userName.equals(request.getParameter("userName"))){
        //String userName=(String)session.getAttribute("userName");
         ServletContext s=this.getServletContext();
             String url =s.getInitParameter("url");
             String username = s.getInitParameter("username") ;   
             String password = s.getInitParameter("password") ;
             PreparedStatement ps;
            Class.forName(s.getInitParameter("driver"));
            Connection conn = DriverManager.getConnection(url,username,password);
            ps=conn.prepareStatement("update users set VIP=1 where userName=?");
            ps.setString(1, userName);
            ps.execute();
        %>
                <script>alert("Succeed!");</script>
        <script>location.replace(document.referrer);</script>
        <%
            }else{
                out.println("<script>alert(\"Please login again!\");</script>");
                response.sendRedirect("logout.jsp");
                }
            }else{
                out.println("<script>alert(\"Please login again!\");</script>");
                response.sendRedirect("logout.jsp");
            }
        %>
    </body>
</html>


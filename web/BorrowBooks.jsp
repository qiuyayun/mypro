<%-- 
    Document   : BorrowBooks
    Created on : 2017-5-10, 8:03:28
    Author     : qiuyayun
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
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
        if(request.getParameter("user").equals(userName)){
        
        
        
       // int total=Integer.valueOf((String)session.getAttribute("total"));
        
        
        PreparedStatement ps=null;
                String bid=request.getParameter("id");
         ServletContext s=this.getServletContext();
             String url =s.getInitParameter("url");
             String username = s.getInitParameter("username") ;   
             String password = s.getInitParameter("password") ;
        Class.forName(s.getInitParameter("driver"));
            Connection conn = DriverManager.getConnection(url,username,password);
         ps=conn.prepareStatement("select * from Users where userName=?");
            ps.setString(1, userName);
            ResultSet rs2=ps.executeQuery();
            rs2.next();
            int total=4;
            if(rs2.getInt("VIP")==1)
                total=10;
          int number=rs2.getInt("number");
       // int number=Integer.valueOf((String)session.getAttribute("number"));
//        int number=(Integer)session.getAttribute("number");
//        System.out.println((Integer)session.getAttribute("number"));
        if(total>number){

             
            
            
            ps=conn.prepareStatement("select * from Books where id=?");
            ps.setString(1, bid);
            ResultSet rs=ps.executeQuery();
            rs.next();
            if(rs.getInt("statu")==1)
            {
                response.sendRedirect("error.jsp");

            }else{
            
//            ps=conn.prepareStatement("select * from Users where userName=?");
//            ps.setString(1, userName);
//            ResultSet rs2=ps.executeQuery();
//            rs2.next();
//            if(rs2.getInt("number")>=3)
            
            ps=conn.prepareStatement("insert into borrowingBooks values(?,?,?,?)");
            ps.setString(1,bid );
            ps.setString(2, userName);
            Date date=new Date();
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
            ps.setDate(3, sqlDate);
            ps.setFloat(4, 0);
            ps.execute();
            ps=conn.prepareStatement("update Books set statu=? where id=?");
            ps.setInt(1, 1);
            ps.setString(2, bid);
            ps.execute();
            ps=conn.prepareStatement("update users set number=number+1 where userName=?");
            ps.setString(1, userName);
            ps.execute();
           out.println("<script>alert(\"Succeed!\");</script>");
            response.sendRedirect("login.jsp");
            }
        }else{

            response.sendRedirect("error.jsp");
        }
        }else{
        response.sendRedirect("logout.jsp");
        }
        }else{
        %>
        <script>alert("Please login again!");</script>
        
        <%
            response.sendRedirect("login.jsp");
        }
        %>
    </body>
</html>
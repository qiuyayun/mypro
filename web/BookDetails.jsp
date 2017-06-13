<%-- 
    Document   : BookDetails
    Created on : 2017-5-10, 7:42:13
    Author     : qiuyayun
--%>
<%@page import="bean.UpdateFee"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
            body{
                background-color: #fff;
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
            <th>书本编号</th>
            <th>书名</th>
            <th>借出时间</th>
            <th>费用</th>
            <th>归还</th>
            <th>删除</th>
        </thead>
        <tbody>
            <%
                String user = request.getParameter("username");
                new UpdateFee(user);
                ServletContext s = this.getServletContext();
                String url = s.getInitParameter("url");
                String username = s.getInitParameter("username");
                String password = s.getInitParameter("password");
                PreparedStatement ps;
                Statement st;
                Class.forName(s.getInitParameter("driver"));
                Connection conn = DriverManager.getConnection(url, username, password);
                //st=conn.createStatement();
                ps = conn.prepareStatement("select * from Books a join borrowingBooks b on a.id=b.Bookid where b.userName=?");
                // ResultSet rs= st.executeQuery("select * from borrowingBooks");
                ps.setString(1, user);
                ResultSet rs = ps.executeQuery();
                // session.setAttribute("resultSet", rs);
                while (rs.next()) {
                    String Bookid = rs.getString(10);
                    String title = rs.getString(2);
                    String Date = rs.getString(12);
                    String Fee = rs.getString(13);
            %>
            <tr>
                <td><%=user%></td>
                <td><%=Bookid%></td>
                <td><%=title%></td>
                <td><%=Date%></td>
                <td><%=Fee%></td>
                <td><form action="return.jsp" method="post">
                        <input type="hidden" name="userName" value="<%=user%>"/> 
                        <input type="hidden" name="bookId" value="<%=Bookid%>"/> 
                        <input type="submit" value="Return"/>
                    </form></td>
                <td><form action="lost.jsp" method="post">
                        <input type="hidden" name="userName" value="<%=user%>"/> 
                        <input type="hidden" name="bookId" value="<%=Bookid%>"/>
                        <input type="submit" value="Lost"/>
                    </form></a></td>
            </tr>
            <%}%>
        </tbody>
    </table>
    
</body>
</html>

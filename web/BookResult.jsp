<%-- 
    Document   : BookResult
    Created on : 2017-5-10, 6:02:21
    Author     : qiuyayun
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!---->
<!DOCTYPE html>
<%
    response.setContentType("text/html;charset=UTF-8");
    response.setCharacterEncoding("utf-8");
    if (request.getParameter("role").equals("Admin")) {
        ServletContext s = this.getServletContext();
        String url = s.getInitParameter("url");
        String username = s.getInitParameter("username");
        String password = s.getInitParameter("password");
        PreparedStatement ps;

        Class.forName(s.getInitParameter("driver"));// 动态加载mysql驱动
        Connection conn = DriverManager.getConnection(url, username, password);
        ResultSet rs;
        String select = request.getParameter("select");
        String address;
        System.out.println("select: " + select);
        if (select.equals("id")) {
            String id = request.getParameter("id");
            address = "role=Admin&select=id&title=&author=&class=&id=" + id;
            ps = conn.prepareStatement("select * from Books where id=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
        } else if (select.equals("title")) {
            String title = new String(request.getParameter("title").getBytes("ISO8859-1"), "UTF-8");//解析转码
            //String title=request.getParameter("title");
            System.out.println(title);
            address = "role=Admin&select=title&id=&class=&author=&title=" + title;
            ps = conn.prepareStatement("select * from Books where title=?");
            System.out.println(title);
            ps.setString(1, title);
            rs = ps.executeQuery();
        } else if (select.equals("author")) {
            String author = new String(request.getParameter("author").getBytes("ISO8859-1"), "UTF-8");
            //String author=request.getParameter("author");
            address = "role=Admin&select=author&id=&title=&class=&author=" + author;
            ps = conn.prepareStatement("select * from Books where author=?");
            ps.setString(1, author);
            rs = ps.executeQuery();
        } else {
            String class_ = new String(request.getParameter("class").getBytes("ISO8859-1"), "UTF-8");
            //String class_=request.getParameter("class");
            System.out.println("class_: " + class_);
            address = "role=Admin&select=class&id=&author=&title=&class=" + class_;
            ps = conn.prepareStatement("select * from Books where class=?");
            ps.setString(1, class_);
            rs = ps.executeQuery();
        }
        //  ArrayList list=new ArrayList();
        //  while(rs.next()){
        //  list.add(new Books(rs.getString("id"),rs.getString("title"),rs.getString("author"),rs.getString("publisher"),rs.getString("in_date"),rs.getString("price"),rs.getInt("statu"),rs.getString("class")));
        //  }
        //  request.setAttribute("list", list);

        //  request.getRequestDispatcher("/BookResult.jsp?pageNo=0").forward(request, response);
//        int pageNo = Integer.valueOf(request.getParameter("pageNo"));
//        int n = 10;
//        //ArrayList list=(ArrayList)request.getAttribute("list");
//        
//        int total = rs.getRow();
//        //rs.absolute(1);
//        int p = total / n;
//        if (total % n > 0) {
//            p = p + 1;
//        }
//        int start = n * pageNo;
//        int end = start + 9;
        String pageNo = request.getParameter("pageNo");//页数

        int pn = Integer.parseInt(pageNo);
        System.out.println(pn);
        int start = pn - 1;//
        System.out.println("start 1:" + start);
        int totalPage = 0;
        if (rs.next()) {
            rs.last();//将游标移动到最后

            int total = rs.getRow();
            System.out.println("total row:" + total);
            rs.beforeFirst();
//System.out.println("total"+total);
            totalPage = total / 10;
            //System.out.println("totalPage"+totalPage);
            if (total % 10 > 0) {
                totalPage++;
            }

        }
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
            <th>编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>日期</th>
            <th>价格</th>
            <th>状态</th>
            <th>类别</th>
            <th>图片</th>
            <th>删除</th>
            <th>修改</th>
        </thead>
        <tbody>
            <%
                if (rs.next()) {
                    rs.absolute(start * 10 + 1);//光标定到某行
                    System.out.println("start: " + start);
                    int count = 0;
                    do {

                        if (count >= 9) {
                            count = 0;
                            break;
                        }
                        System.out.println("rs row:" + rs.getRow());
                        count++;
                        String id = rs.getString("id");
                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        String publisher = rs.getString("publisher");
                        String da = rs.getString("in_date");
                        String price = rs.getString("price");
                        int status = rs.getInt("statu");
                        String kind = rs.getString("class");
                        String img = rs.getString("pic");
            %>
            <tr>
                <td><%=id%></td>
                <td><%=title%></td>
                <td><%=author%></td>
                <td><%=publisher%></td>
                <td><%=da%></td>
                <td><%=price%></td>
                <td>
                    <c:if test="<%=status == 0%>">在库</c:if>
                    <c:if test="<%=status == 1%>">借出</c:if>
                    </td>
                    <td><%=kind%></td>
                <td><img style="width:140px;height:150px;padding: 5px;" src="picture/<%=img%>"></td>
                <td><a href="DorM.jsp?op=delete&id=<%=id%>">删除</a></td>
                <td><a href="DorM.jsp?op=modify&id=<%=id%>">修改</a></td>
            </tr>
            <%
                    } while (rs.next());
                }
            %>
        </tbody>
    </table>
    <%
        if (totalPage == pn) {
    %>
    下一页
    <%
    } else {
    %>
    <a  href="BookResult.jsp?<%=address%>&pageNo=<%=pn + 1%>">下一页</a>     
    <%
        }
        if (pn == 1) {
            out.println("上一页");
        } else {
    %>
    <a href="BookResult.jsp?<%=address%>&pageNo=<%=pn - 1%>">上一页</a>
    <%
        }
    %>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>
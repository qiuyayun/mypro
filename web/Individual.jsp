<%-- 
    Document   : Individual
    Created on : 2017-5-9, 21:45:06
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
        <title>欢迎用户</title>
        <script>
            function function1(){
                
                document.getElementById("id").disabled=false;//启用
                document.getElementById("title").disabled=true;//禁用
                document.getElementById("author").disabled=true;
            }
            
                        function function2(){
                
                document.getElementById("id").disabled=true;
                document.getElementById("title").disabled=false;
                document.getElementById("author").disabled=true;
            }
                        
                        function function3(){
                
                document.getElementById("id").disabled=true;
                document.getElementById("title").disabled=true;
                document.getElementById("author").disabled=false;
            }
        </script>
        <style>
            body{

                font-family: Calibri;
                color:black;

                background-repeat:no-repeat; 
                background-size: 1360px 700px

            }

        </style>
    </head>
    <body>
        <a href="logout.jsp">注销</a>
        <%
             response.setContentType("text/html;charset=UTF-8");


    response.setCharacterEncoding("utf-8");
            String userName = (String) session.getAttribute("userName");
            ServletContext s = this.getServletContext();
            String url = s.getInitParameter("url");
            String username = s.getInitParameter("username");
            String password = s.getInitParameter("password");
            PreparedStatement ps;
            Class.forName(s.getInitParameter("driver"));
            Connection conn = DriverManager.getConnection(url, username, password);
            ps = conn.prepareStatement("select * from users where userName=?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            rs.next();
            // String status=rs.getString("statu");
            int status = rs.getInt("VIP");
            if (status == 0) {
                out.println("<a href=vip.jsp?userName=" + userName + ">member</a>");
            } else {
                out.println("VIP");
            }
        %>
        <hr/>
        <div id="left" style="float:left">
            <fieldset style="width:300px">
                <legend><h1 style="font-family:  fantasy;">图书</h1></legend>

                <table>
                    <tr><th>图书编号</th><th>书名</th><th>借出时间</th><th>费用</th></tr>
                            <%
                                ps = conn.prepareStatement("select * from Books a join borrowingBooks b on a.id=b.Bookid where b.userName=?");
                                ps.setString(1, userName);
                                rs = ps.executeQuery();
                                while (rs.next()) {
                                    String bookid = rs.getString(1);
                                    String booktitle = rs.getString(2);
                                    String date = rs.getString(12);
                                    String Fee = rs.getString(13);
                            %>
                    <tr>
                        <td><%=bookid%></td><td><%=booktitle%></td><td><%=date%></td><td><%=Fee%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </fieldset>
            <fieldset style="width:300px">
                <legend><h1 style="font-family:  fantasy;">图书借阅</h1></legend>
                <form action="BookResult2.jsp" method="post">
                    <table>
                        <tr><td>选择:</td><td><input type="radio" name="select" value="id" checked="true" onchange="function1()"/>编号
                                <input type="radio" name="select" value="title" onchange="function2()"/>书名
                                <input type="radio" name="select" value="author"onclick="function3()"/>作者
                                <input type="radio" name="select" value="class"/>类别
                            </td></tr>
                        <tr><td>编号:</td><td><input id="id" type="text" name="id"/></td></tr>
                        <tr><td>书名:</td><td><input id="title" type="text" name="title" disabled="true"/></td></tr>
                        <tr><td>作者:</td><td><input id="author" type="text" name="author"disabled="true"/></td></tr>
                        <tr><td rowspan="2">类别:</td><td><input type="radio" name="class" value="小说"/>小说
                                <input type="radio" name="class" value="心灵鸡汤"/>心灵鸡汤
                            </td>
                        </tr>
                        <tr><td><input type="radio" name="class" value="杂志"/>杂志
                                <input type="radio" name="class" value="散文"/>散文<input type="radio" name="class" value="科学"/>科学 
                            </td></tr>
                        <tr>

                        <input type="hidden" name="user" value="<%=userName%>"/>
                        <input type="hidden" name="pageNo" value="1"/>
                        <td colspan="2"><input type="submit" value="查询" style="width:260px; height: 30px"/></td>
                        </tr>
                        <tr><td colspan="2"><input type="reset" value="重置" style="width:260px; height: 30px"/></td></tr>
                    </table>

                </form>
            </fieldset>
        </div>
        <div id="right">
            <fieldset>
                <legend><h1  style="font-family:  fantasy;">推荐图书</h1></legend>
                <div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/1.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>人民的名义</td></tr>
                                <tr><td>周梅森</td></tr>
                            </table>
                        </center>
                    </div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/2.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>巨人的陨落</td></tr>
                                <tr><td>肯·福莱特</td></tr>
                            </table>
                        </center>
                    </div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/3.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>岛上书店</td></tr>
                                <tr><td>加·文泽</td></tr>
                            </table>
                        </center>
                    </div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/4.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>摆渡人</td></tr>
                                <tr><td>加泽若</td></tr>
                            </table>
                        </center>
                    </div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/5.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>未来简史</td></tr>
                                <tr><td>尤瓦尔</td></tr>
                            </table>
                        </center>
                    </div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/6.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>万历十五年</td></tr>
                                <tr><td>黄仁宇</td></tr>
                            </table>
                        </center>
                    </div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/7.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>明朝那些事</td></tr>
                                <tr><td>当年明月</td></tr>
                            </table>
                        </center>
                    </div>
                    <div style="float: left; margin-left: 20px">
                        <center>
                            <img src="images/8.jpg" width="200px" height="250px"/>
                            <table>
                                <tr><td>海洋与文明</td></tr>
                                <tr><td>林肯·佩恩</td></tr>
                            </table>
                        </center>
                    </div>
                </div>
            </fieldset>
        </div>
    </body>
</html>


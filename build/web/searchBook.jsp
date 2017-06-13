<%-- 
    Document   : searchBook
    Created on : 2017-5-10, 5:52:05
    Author     : qiuyayun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

response.setContentType("text/html;charset=UTF-8");


    response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/part.css">
        <script>
                        function function1(){
                
                document.getElementById("id").disabled=false;
                document.getElementById("title").disabled=true;
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
            html{
                overflow-x: hidden;
            }
        </style>
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <form action="BookResult.jsp" method="post" target="_self">
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;选择:</td><td><input type="radio" name="select" value="id" onchange="function1()" checked/>编号
            <input type="radio" name="select" value="title" onchange="function2()"/>书名
            <input type="radio" name="select" value="author"onchange="function3()"/>作者
            <input type="radio" name="select" value="class" />类别<br/>
            <input type="text" id="id" placeholder="图书编号"  name="id"><br/>
            <input type="text" id="title" placeholder="书名" name="title" disabled="true"><br/>
            <input type="text" id="author" placeholder="作者"name="author" disabled="true"><br/>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="class" value="小说"/>小说
            <input type="radio" name="class" value="心灵鸡汤"/>心灵鸡汤
            <input type="radio" name="class" value="杂志"/>杂志
            <input type="radio" name="class" value="散文"/>散文
            <input type="radio" name="class" value="科学"/>科学
            <input type="hidden" name="pageNo" value="1"/>
            <input type="hidden" name="role" value="Admin"/>
            <button type="submit">搜索</button>
    </form>

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

<%-- 
    Document   : addBook
    Created on : 2017-5-9, 22:24:24
    Author     : qiuyayun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加图书</title>
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
        <form action="AddServlet" method="post" enctype="multipart/form-data"><!--不对字符进行编码-->
            <input type="text" placeholder="图书编号"  required="true" name="id"><br/>
            <input type="text" placeholder="书名" required="true" name="title"><br/>
            <input type="text" placeholder="作者" required="true" name="author"><br/>
            <input type="text" placeholder="价格" required="true" name="price"><br/>
            <input type="text" placeholder="出版社" required="true" name="publisher"><br/>
            <input type="file" name="image" required="true"/><br/><!--上传单个-->
            <select name="class">
                <option value="小说">小说</option>
                <option value="心灵鸡汤">心灵鸡汤</option>
                <option value="杂志">杂志</option>
                <option value="散文">散文</option>
                <option value="科学">科学</option>
            </select>
            <button type="submit">添加</button>
            <button type="reset">重置</button>
        </form>

        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
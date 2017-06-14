<%-- 
    Document   : error
    Created on : 2017/06/01, 17:00:30
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>エラーが発生しました</title>
        <link rel="stylesheet" href="error.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href="top.jsp">かごゆめ</a>
        </div>
        <div class="main">
        エラーが発生しました。以下の項目を確認してください。<br>
        <br>
        <p><%=request.getAttribute("error")%></p>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

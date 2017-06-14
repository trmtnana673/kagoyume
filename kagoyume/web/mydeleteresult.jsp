<%-- 
    Document   : mydeleteresult
    Created on : 2017/05/24, 17:43:20
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員情報削除完了</title>
        <link rel="stylesheet" href="mydeleteresult.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href="top.jsp">かごゆめ</a>
        </div>
        <div class="main">
        <p>削除しました</p>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

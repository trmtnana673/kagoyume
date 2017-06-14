<%-- 
    Document   : registrationcomplete
    Created on : 2017/05/24, 17:17:14
    Author     : nana
--%>

<%@page import="kagoyume.UserData"%>
<%@page import="kagoyume.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  UserData ud = (UserData)request.getAttribute("ud");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員登録完了</title>
        <link rel="stylesheet" href="registrationcomplete.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href=\"top.jsp\">かごゆめ</a>
        </div>
        <div class="main">
        <h3>会員登録完了</h3>
        ユーザー名：<%=ud.getName()%><br>
        パスワード：<%=ud.getPassword()%><br>
        メールアドレス：<%=ud.getEmail()%><br>
        住所：<%=ud.getAddress()%><br>
        <p>上記の内容で登録致しました。</p>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

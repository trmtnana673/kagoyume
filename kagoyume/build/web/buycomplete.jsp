<%-- 
    Document   : buycomplete
    Created on : 2017/05/24, 17:30:20
    Author     : nana
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  UserDataDTO udd = (UserDataDTO)hs.getAttribute("resultDTO");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　購入完了</title>
        <link rel="stylesheet" href="buycomplete.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href="top.jsp">かごゆめ</a>
            <div class="menu">
                <p class="user">ようこそ<%=udd.getName()%>さん！</p>
                <form action="Login" method="GET">
                    <input type="hidden" name="login" value="out">
                    <input type="submit" value="ログアウト">
                </form>
                <form action="Mydata" method="POST">
                    <input type="submit" value="会員情報">
                </form>
            </div>
        </div>
        <div class="main">
        <p>購入が完了しました</p>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

<%-- 
    Document   : myupdateresult
    Created on : 2017/05/24, 17:38:58
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  UserDataDTO newMyData = (UserDataDTO)hs.getAttribute("resultDTO");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員情報更新完了</title>
        <link rel="stylesheet" href="myupdateresult.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href="top.jsp">かごゆめ</a>
            <div class="menu">
                <p class="user">ようこそ<%=newMyData.getName()%>さん！</p>
                <form action="Login" method="GET">
                    <input type="hidden" name="login" value="out">
                    <input type="submit" value="ログアウト">
                </form>
                <form action="Cart" method="POST">
                    <input type="hidden" name="page" value="cart.jsp">
                    <input type="submit" value="カート">
                </form>
            </div>
        </div>
        <div class="main">
        ユーザー名：<%=newMyData.getName()%><br>
        パスワード：<%=newMyData.getPassword()%><br>
        メールアドレス：<%=newMyData.getEmail()%><br>
        住所：<%=newMyData.getAddress()%><br>
        <p>以上の内容で更新しました。</p>
        <form action="Mydata" method="POST">
            <input type="submit" value="会員情報に戻る">
        </form>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

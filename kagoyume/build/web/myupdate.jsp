<%-- 
    Document   : myupdate
    Created on : 2017/05/24, 17:36:55
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  UserDataDTO myDataDTO = (UserDataDTO)hs.getAttribute("myDataDTO");
  String loginName = "";
  UserDataDTO udd = (UserDataDTO)hs.getAttribute("resultDTO");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員情報更新</title>
        <link rel="stylesheet" href="myupdate.css">
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
                <form action="Cart" method="POST">
                    <input type="hidden" name="page" value="cart.jsp">
                    <input type="submit" value="カート">
                </form>
            </div>
        </div>
        <div class="main">
        <h3>会員情報更新</h3>
        <form action="MyupdateResult" method="POST">
            ユーザー名：<input type="text" name="name" size="30" value="<%=myDataDTO.getName()%>"><br>
            パスワード：<input type="text" name="password" size="30" value="<%=myDataDTO.getPassword()%>"><br>
            メールアドレス：<input type="email" name="email" size="30" value="<%=myDataDTO.getEmail()%>"><br>
            住所：<input type="text" name="address" size="30" value="<%=myDataDTO.getAddress()%>"><br>
            <input type="submit" value="更新">
        </form>
        <form action="Mydata">
            <input type="submit" value="会員情報に戻る">
        </form>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

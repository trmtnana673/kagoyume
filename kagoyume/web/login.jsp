<%-- 
    Document   : login
    Created on : 2017/05/24, 17:01:19
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  String msg = (String)hs.getAttribute("loginError");
  String logout = (String)request.getAttribute("logout");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　ログインページ</title>
        <link rel="stylesheet" href="login.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href=\"top.jsp\">かごゆめ</a>
        </div>
        <div class="main">
        <%if(logout==null || !logout.equals("out")){%>
        <h1>ログイン</h1>
        <form action="Login" method="POST">
            ユーザー名：<input type="text" size="30" name="name"><br>
            パスワード：<input type="text" size="30" name="password"><br>
            <input type="submit" value="ログイン"><br>
        </form>
        <form action="Registration" method="POST">
            <input type="submit" value="新規会員登録">
        </form>
            <%if(msg!=null){%>
               <%=msg%>
            <%}%>
        <%}else{%>
        <h1>ログアウトしました</h1>
        <%}%>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

<%-- 
    Document   : registrationconfirm
    Created on : 2017/05/24, 17:13:49
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  UserData ud = (UserData)hs.getAttribute("ud");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員登録確認</title>
        <link rel="stylesheet" href="registrationconfirm.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href=\"top.jsp\">かごゆめ</a>
        </div>
        <div class="main">
        <h3>登録情報確認</h3>
        <%if(ud.check().size()==0){%>
        ユーザー名：<%=ud.getName()%><br>
        パスワード：<%=ud.getPassword()%><br>
        メールアドレス：<%=ud.getEmail()%><br>
        住所：<%=ud.getAddress()%><br>
        <p>上記の内容で登録致します。よろしいですか？</p>
        <form action="Registrationcomplete" method="POST">
            <input type="submit" name="yes" value="登録">
        </form>
        <%}else{%>
        <p>入力が不完全です</p>
        <%=Helper.getInstance().chkInput(ud.check())%>
        <%}%>
        <form action="Registration" method="POST">
            <input type="hidden" name="mode" value="ReInput">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
    
</html>

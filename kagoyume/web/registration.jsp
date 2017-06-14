<%-- 
    Document   : registration
    Created on : 2017/05/24, 17:03:03
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  UserData ud = null;
  boolean reinput = false;
  if(request.getParameter("mode")!=null && request.getParameter("mode").equals("ReInput")){
      reinput = true;
      ud = (UserData)hs.getAttribute("ud");
  }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員登録</title>
        <link rel="stylesheet" href="registration.css">
    </head>
    <body>
        <div class="header">
            <a class="title" href=\"top.jsp\">かごゆめ</a>
        </div>
        <div class="main">
            <h3>会員登録</h3>
        <form action="Registrationcomfirm" method="POST">
            ユーザー名：<input type="text" name="name" size="30" value="<%if(reinput){out.println(ud.getName());}%>"><br>
            パスワード：<input type="text" name="password" size="30" value="<%if(reinput){out.println(ud.getPassword());}%>"><br>
            メールアドレス：<input type="email" name="email" size="30" value="<%if(reinput){out.println(ud.getEmail());}%>"><br>
            住所：<input type="text" name="address" size="30" value="<%if(reinput){out.println(ud.getAddress());}%>"><br>
            <input type="submit" value="登録確認画面へ">
        </form>
          <%=Helper.getInstance().home()%>  
        </div>
    </body>
</html>

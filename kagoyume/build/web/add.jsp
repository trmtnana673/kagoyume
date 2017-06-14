<%-- 
    Document   : add
    Created on : 2017/05/24, 16:57:47
    Author     : nana
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  String loginCheck = (String)hs.getAttribute("login");
  String loginName = "";
  boolean login = false;
  if(loginCheck!=null && loginCheck.equals("in")){
      login = true;
      UserDataDTO udd = (UserDataDTO)hs.getAttribute("resultDTO");
      loginName = udd.getName();
  }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　追加完了</title>
        <link rel="stylesheet" href="add.css">
    </head>
    <body>
        <div class="header">
            <%=Helper.getInstance().headerMenu(login,"top.jsp",loginName)%>
        </div>
        <div class="main">
            <h3>追加完了</h3>
            <p>カートに追加しました</p>
            <form action="search.jsp" method="POST">
                <input type="submit" value="検索結果に戻る">
            </form>
            <br>
            <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

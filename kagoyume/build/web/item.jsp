<%-- 
    Document   : item
    Created on : 2017/05/24, 16:55:14
    Author     : nana
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.ItemDataDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  ItemDataDetail idd = (ItemDataDetail)hs.getAttribute("detail");
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
        <title>かごゆめ　商品詳細</title>
        <link rel="stylesheet" href="item.css">
    </head>
    <body>
        <div class="header">
            <%=Helper.getInstance().headerMenu(login,"item.jsp",loginName)%>
        </div>
        <div class="main">
            <h3>商品詳細</h3>
        <div class="table">
        <table border="1">
            <tr>
               <td>商品コード</td>
               <td><%=idd.getCode()%></td>
            </tr>
            <tr>
                <td>商品名</td>
                <td><%=idd.getName()%></td>
            </tr>
            <tr>
                <td>URL</td>
                <td><a href="<%=idd.getItemURL()%>"><%=idd.getItemURL()%></a></td>
            </tr>
            <tr>
                <td>状態</td>
                <td><%=idd.getCondition()%></td>
            </tr>
            <tr>
                <td>説明</td>
                <td><%=idd.getHeadline()%></td>
            </tr>
            <tr>
                <td>価格</td>
                <td><%=idd.getPrice()%>円</td>
            </tr>
        </table>
        </div>
        <div class="image">
            <img src="<%=idd.getImage()%>">
        </div>
        <div class="form">
            <form action="Add" method="POST">
                <input type="submit" value="カートに追加する">
            </form>
            <form action="search.jsp" method="POST">
                <input type="submit" value="検索結果に戻る">
            </form>
            <%=Helper.getInstance().home()%>   
        </div>
        </div>
    </body>
</html>

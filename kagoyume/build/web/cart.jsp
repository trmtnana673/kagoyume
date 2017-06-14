<%-- 
    Document   : cart
    Created on : 2017/05/24, 17:19:52
    Author     : nana
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.ItemDataDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  ArrayList<ItemDataDetail> cartitem = (ArrayList)hs.getAttribute("cartitem");
  int itemTotal = 0;
  UserDataDTO udd = (UserDataDTO)hs.getAttribute("resultDTO");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　カート詳細</title>
        <link rel="stylesheet" href="cart.css">
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
        <h3>カート詳細</h3>
        <% if(cartitem.size()!=0){ %>
        <table border="1">
        <tr>
            <th>画像</th>
            <th>商品名</th>
            <th>価格</th>
        </tr>
        <%for(int i = 0; i < cartitem.size(); i++){%>
        <tr>
            <td><img src="<%=cartitem.get(i).getImage()%>"></td>
            <td><a href="Item?itemcode=<%=cartitem.get(i).getCode()%>"><%=cartitem.get(i).getName()%></a></td>
            <td><%=cartitem.get(i).getPrice()%>円</td>
            <td> <a href="/kagoyume/Cart?delete=<%=i%>">削除</a></td>
        </tr>
        <% itemTotal += Integer.parseInt(cartitem.get(i).getPrice()); %>
        <%}%>
        </table>
        <br>
          合計金額：<%=itemTotal%>円<br>
          <form action="Buyconfirm" method="POST">
            <input type="submit" value="購入する">
          </form>
        <%}else{%>
         <p>カートに商品はありません</p>
         <%}%>
         <div class="footer">
              <%=Helper.getInstance().home()%>
         </div>
        </div>
    </body>
</html>

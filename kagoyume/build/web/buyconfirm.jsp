<%-- 
    Document   : buyconfirm
    Created on : 2017/05/24, 17:23:18
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
  String msg = (String)hs.getAttribute("msg");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　購入確認</title>
        <link rel="stylesheet" href="buyconfirm.css">
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
            <h3>購入確認</h3>
            <%if(msg!=null){%>
            <p><%=msg%></p>
            <%}%>
        <table border="1">
        <% for(int i = 0; i < cartitem.size(); i++){ %>
        <tr>
            <th>商品名</th>
            <th>価格</th>
        </tr>
        <tr>
            <td><%=cartitem.get(i).getName()%></td>
            <td><%=cartitem.get(i).getPrice()%>円</td>
        </tr>
        </table>
        <% itemTotal += Integer.parseInt(cartitem.get(i).getPrice()); %>
        <% } %>
        <br>
        合計金額：<%=itemTotal%>円<br>
        <br>
        <form action="Buycomplete" method="POST">
             発送放送：
                <input type="radio" name="type" value="1">郵パック
                <input type="radio" name="type" value="2">宅配<br><br>
                <input type="hidden" name="total" value="<%=itemTotal%>">
            <input type="submit" value="上記の内容で購入する">
        </form>
        <form action="cart.jsp" method="POST">
            <input type="submit" value="カートに戻る">
        </form>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

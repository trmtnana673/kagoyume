<%-- 
    Document   : myhistory
    Created on : 2017/05/24, 17:35:48
    Author     : nana
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kagoyume.ItemDataDTO"%>
<%@page import="kagoyume.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  ArrayList<ItemDataDTO> itemList = (ArrayList)request.getAttribute("itemList");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
  HttpSession hs = request.getSession();
  UserDataDTO udd = (UserDataDTO)hs.getAttribute("resultDTO");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　購入履歴</title>
        <link rel="stylesheet" href="myhistory.css">
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
        <h3>購入履歴</h3>
        <%if(itemList.size()==0){%>
        <p>購入履歴はありません</p>
        <%}else{%>
        <table border="1">
        <tr>
            <th>商品コード</th>
            <th>発送方法</th>
            <th>購入日</th>
        </tr>
        <%for(int i = 0; i< itemList.size(); i++){ %>
        <tr>
            <td><%=itemList.get(i).getItemCode()%></td>
            <td><% if(itemList.get(i).getType()==1){out.print("郵パック");}if(itemList.get(i).getType()==2){out.print("宅配");} %></td>
            <td><%=sdf.format(itemList.get(i).getBuyDate())%></td>
        </tr>
         <% } %>
        </table>
         <%}%>
         <form action="Mydata" method="POST">
             <input type="submit" value="会員情報に戻る">
         </form>
         <%=Helper.getInstance().home()%>
         </div>
    </body>
</html>

<%-- 
    Document   : mydata
    Created on : 2017/05/24, 17:31:59
    Author     : nana
--%>

<%@page import="kagoyume.Helper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  UserDataDTO myDataDTO = (UserDataDTO)hs.getAttribute("myDataDTO");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM年dd日");
  UserDataDTO udd = (UserDataDTO)hs.getAttribute("resultDTO");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員情報閲覧</title>
        <link rel="stylesheet" href="mydata.css">
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
      　<h3>会員情報</h3>
        <table border="1">
            <tr>
                <td>ユーザー名</td>
                <td><%=myDataDTO.getName()%></td>
            </tr>
            <tr>
                <td>パスワード</td>
                <td><%=myDataDTO.getPassword()%></td>
            </tr>
            <tr>
                <td>メールアドレス</td>
                <td><%=myDataDTO.getEmail()%></td>
            </tr>
            <tr>
                <td>住所</td>
                <td><%=myDataDTO.getAddress()%></td>
            </tr>
            <tr>
                <td>登録日時</td>
                <td><%=sdf.format(myDataDTO.getNewDate())%></td>
            </tr>
            <tr>
                <td>総購入金額</td>
                <td><%=myDataDTO.getTotal()%>円</td>
            </tr>
        </table>
        <form action="Myhistory" method="POST">
            <input type="submit" value="購入履歴">
        </form>
        <form action="Myupdate" method="POST">
            <input type="submit" value="登録情報を更新する">
        </form>
        <form action="Mydelete" value="POST">
            <input type="submit" value="登録情報を削除する">
        </from>
        <br>
        <%=Helper.getInstance().home()%>
        </div>
    </body>
</html>

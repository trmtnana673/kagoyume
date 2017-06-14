<%-- 
    Document   : mydelete
    Created on : 2017/05/24, 17:40:04
    Author     : nana
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  UserDataDTO myDataDTO = (UserDataDTO)hs.getAttribute("myDataDTO");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
  UserDataDTO udd = (UserDataDTO)hs.getAttribute("resultDTO");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>かごゆめ　会員情報削除</title>
         <link rel="stylesheet" href="mydelete.css">
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
        <h3>会員情報削除</h3>
        <table boder="1">
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
        <p>このユーザーをマジで削除しますか？</p>
        <a href="/kagoyume/MydeleteResult">はい</a><br>
        <a href=top.jsp>いいえ</a><br>
        <br>
        <div class="footer">
        <%=Helper.getInstance().home()%>
        </div>
        </div>
    </body>
</html>

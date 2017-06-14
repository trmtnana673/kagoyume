<%-- 
    Document   : top
    Created on : 2017/05/24, 16:26:21
    Author     : nana
--%>

<%@page import="kagoyume.UserData"%>
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
        <title>かごゆめ　トップページ</title>
        <link rel="stylesheet" href="top.css">
    </head>
    <body>
        <div class="header">
            <%=Helper.getInstance().headerMenu(login,"top.jsp",loginName)%>
        </div>
        <div class="main">
        <h1>かごゆめへようこそ！</h1>
        <p>ショッピングサイトを使っている時、こんな経験ありませんか？<br>
           「あれいいな」「これいいな」「あっ、関連商品のこれもいい」「20%オフセールだって！？買わなきゃ！」...<br>
        <br>
           そしていざ『買い物かご』を開いたとき、その合計金額に愕然とします。<br>
           「こんなに買ってたのか・・・しょうがない。いくつか減らそう・・・」<br>
        <br>
           仕方がありません。無駄遣いは厳禁です。<br>
           でも、一度買うと決めたものを諦めるなんて、ストレスじゃあありませんか？<br>
           できればお金の事なんか考えずに好きなだけ買い物がしたい・・・。<br>
        <br>
           このサービスは、そんなフラストレーションを解消するために生まれた、<br>
           『金銭取引が絶対に発生しない』<br>
           『いくらでも、どんなものでも購入できる(気分になれる)』<br>
           『ECサイト』<br>
           です。
        </p>
        <br>
        <p>検索フォーム</p>
        <form action="Search" method="GET">
            <input type="search" name="search" size="30" maxlength="200">
            <input type="submit" value="検索する">
        </form>
        <br>
        </div>
    </body>
</html>

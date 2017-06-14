<%-- 
    Document   : search
    Created on : 2017/05/24, 16:52:05
    Author     : nana
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.Helper"%>
<%@page import="kagoyume.ItemData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  HttpSession hs = request.getSession();
  ItemData iData = (ItemData)hs.getAttribute("itemSearch");
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
        <title>かごゆめ　結果一覧</title>
        <link rel="stylesheet" href="search.css">
    </head>
    <body>
        <div class="header">
            <%=Helper.getInstance().headerMenu(login,"search.jsp",loginName)%>
        </div>
        <div class="main">
        <h3>検索結果</h3>
        検索hit数：<%=iData.getTotalSearch()%>件<br>
        キーワード：<%=iData.getQuery()%><br>
        <br>
        <p>上位20件まで表示</p>
        <table border="1">
            <tr>
                <th>No.</th>
                <th>商品名</th>
                <th>画像</th>
                <th>価格</th>
            </tr>
        <%
          for(int i = 0; i < iData.getName().size(); i++){ %>
          <tr>
              <td><%=i+1%></td>
              <td><a href="Item?itemcode=<%=iData.getCode().get(i)%>"><%=iData.getName().get(i)%></a></td>
              <td><img src="<%=iData.getImage().get(i)%>"></td>
              <td><%=iData.getPrice().get(i)%>円</td>
          </tr>
        <% } %>
        </table>
        </div>
    </body>
    <%=Helper.getInstance().home()%>
</html>

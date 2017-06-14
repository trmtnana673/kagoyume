package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.UserDataDTO;
import kagoyume.Helper;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

  HttpSession hs = request.getSession();
  String msg = (String)hs.getAttribute("loginError");
  String logout = (String)request.getAttribute("logout");

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>かごゆめ　ログインページ</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"registration.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <a class=\"title\" href=\\\"top.jsp\\\">かごゆめ</a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"main\">\n");
      out.write("        ");
if(logout==null || !logout.equals("out")){
      out.write("\n");
      out.write("        <h1>ログイン</h1>\n");
      out.write("        <form action=\"Login\" method=\"POST\">\n");
      out.write("            ユーザー名：<input type=\"text\" name=\"name\"><br>\n");
      out.write("            パスワード：<input type=\"password\" name=\"password\"><br>\n");
      out.write("            <input type=\"submit\" value=\"ログイン\"><br>\n");
      out.write("        </form>\n");
      out.write("        <form action=\"Registration\" method=\"POST\">\n");
      out.write("            <input type=\"submit\" value=\"新規会員登録\">\n");
      out.write("        </form>\n");
      out.write("        ");
if(msg!=null){
      out.write("\n");
      out.write("           ");
      out.print(msg);
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        ");
}else{
      out.write("\n");
      out.write("        <h1>ログアウトしました</h1>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        ");
      out.print(Helper.getInstance().home());
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

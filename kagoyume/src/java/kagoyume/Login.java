/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nana
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  {
            request.setCharacterEncoding("UTF-8");
            HttpSession hs = request.getSession();
            String page = (String)hs.getAttribute("page");
            String login = (String)hs.getAttribute("login");
            Cookie cookies[] = request.getCookies();
            
            if(login==null || !login.equals("in")){
                if(page==null){
                 page = request.getParameter("page");
                }
                hs.setAttribute("page", page);
            }else{
                hs.invalidate();
                for(Cookie cookie :cookies){
                    if(cookie.getName().equals("JSESSIONID")){
                        cookie.setMaxAge(0);
                        cookie.setPath("/");
                        response.addCookie(cookie);
                    }
                }
                request.setAttribute("logout", "out");
            }
            
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }catch(Exception e){
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String msg = "";
        
        if(name==null || name.length()==0){
           msg += "名前を入力してください<br>";          
        }
        
        if(password==null || password.length()==0){
           msg += "パスワードを入力してください<br>";
        }
        
        HttpSession hs = request.getSession();
        String page = (String)hs.getAttribute("page");
        
        UserData ud = new UserData();
        ud.setName(name);
        ud.setPassword(password);
        
        UserDataDTO dto = new UserDataDTO();
        ud.DTOMapping(dto);
        
        
        UserDataDTO resultDTO = UserDataDAO.getInstance().search(dto);
        
        hs.setAttribute("resultDTO", resultDTO);
        
        if(msg.length()==0){
        if(resultDTO.getUserID()==0){
            msg += "ユーザー名かパスワードが間違っています<br>再度入力してください<br>";
        }
        
        if(resultDTO.getDeleteFlg()!=0){
            msg += "入力されたユーザーはすでに削除されています<br>別のユーザー名とパスワードを入力してください<br>";
        }
        }
        
        hs.setAttribute("loginError", msg);
        
        if(msg.length()!=0){
            response.sendRedirect("login.jsp");
        }else{
            hs.setAttribute("login", "in");
            request.getRequestDispatcher(page).forward(request, response);
        }
        
        }catch(SQLException e){
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }catch(Exception e){
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nana
 */
public class Buycomplete extends HttpServlet {

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
        try {
            request.setCharacterEncoding("UTF-8");
            String type = request.getParameter("type");
            String itemtotal = request.getParameter("total");
            ItemDataDetail idd;
            
            HttpSession hs = request.getSession();
            ArrayList<ItemDataDetail> cartitem = (ArrayList)hs.getAttribute("cartitem");
            UserDataDTO dto = (UserDataDTO)hs.getAttribute("resultDTO");
            ItemDataDTO idDTO = new ItemDataDTO();
            
            if(type==null || type.length()==0){
                hs.setAttribute("msg", "発送方法を選択してください");
                response.sendRedirect("buyconfirm.jsp");
            }else{
                for(int i = 0; i < cartitem.size(); i++){
                    idd = cartitem.get(i);
                    idd.ItemDataDTOMapping(idDTO, dto, type);
                    ItemDataDAO.getInstance().itemRegistration(idDTO);
                }
            
                int total = dto.getTotal();
                total += Integer.parseInt(itemtotal);
                dto.setTotal(total);
                UserDataDAO.getInstance().itemTotalUpdate(dto);
            
                hs.setAttribute("resultDTO", dto);
                hs.removeAttribute("cartitem");
            
                request.getRequestDispatcher("/buycomplete.jsp").forward(request, response);
            }
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
        processRequest(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 *
 * @author nana
 */
public class Search extends HttpServlet {

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
        
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("search");
        String totalSearch = "";
        String query = "";
        ArrayList<String> code = new ArrayList();
        ArrayList<String> name = new ArrayList();
        ArrayList<String> image = new ArrayList();
        ArrayList<String> price = new ArrayList();
        
        try{
            //商品検索APIを呼び出す
            String api = "http://shopping.yahooapis.jp/ShoppingWebService/V1/itemSearch?";
            String id = "appid=dj0zaiZpPThVRERNSTVoYXJVdyZzPWNvbnN1bWVyc2VjcmV0Jng9NjA-";
            search = URLEncoder.encode(search, "UTF-8");
            String apiURL = api + id + "&query=" + search;
            
            //urlの作成
            URL url = new URL(apiURL);
            //接続用HttpURLConnectionオブジェクト作成
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            //リクエストメソッドの設定
            con.setRequestMethod("GET");
            //リダイレクトを自動で許可しない設定
            con.setInstanceFollowRedirects(false);
            //接続
            con.connect();
            
            //documentを取得
            Document doc = null;
            //DocumentBuilderFactoryのインスタンスを取得、DocumentBuilderオブジェクトを取得
            DocumentBuilder docbuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            //パラメータに指定されたInputStreamからXML文書を読み取り、Documentを作成する
            doc = docbuilder.parse(url.openStream());
            //ルート要素取得
            Element root = doc.getDocumentElement();
            //ルート要素<ResultSet>の属性より検索数を取得
            totalSearch = root.getAttribute("totalResultsAvailable");
            //ノード<Result>を取得
            Node resultNode = root.getFirstChild();
            //ノード<Result>の子ノードを取得
            NodeList nodelist = resultNode.getChildNodes();
            
            for(int i = 0; i < nodelist.getLength(); i++){
                Node iNode = nodelist.item(i);
                
                if(iNode.getNodeName().equals("Request")){
                    Node queryNode = iNode.getFirstChild();
                    query = queryNode.getTextContent();
                }else{
                    NodeList hitNodeList = iNode.getChildNodes();
                    
                    for(int j = 0; j < hitNodeList.getLength(); j++){
                       Node hitNode = hitNodeList.item(j);
                       
                       if(hitNode.getNodeName().equals("Code")){
                           code.add(hitNode.getTextContent());
                       }
                       
                       if(hitNode.getNodeName().equals("Name")){
                           name.add(hitNode.getTextContent());
                       }
                       
                       if(hitNode.getNodeName().equals("Image")){
                           NodeList imageList = hitNode.getChildNodes();
                           
                           for(int k = 0; k < imageList.getLength(); k++){
                               Node imageNode = imageList.item(k);
                               
                               if(imageNode.getNodeName().equals("Small")){
                                   image.add(imageNode.getTextContent());
                               }
                           }
                       }
                       
                       if(hitNode.getNodeName().equals("Price")){
                           price.add(hitNode.getTextContent());
                       }
                    } 
                }
            }
            
            ItemData iData = new ItemData();
            iData.setTotalSearch(totalSearch);
            iData.setQuery(query);
            iData.setCode(code);
            iData.setName(name);
            iData.setImage(image);
            iData.setPrice(price);
            
            HttpSession hs = request.getSession();
            hs.setAttribute("itemSearch", iData);
                
            con.disconnect();
            
            request.getRequestDispatcher("/search.jsp").forward(request, response);  
        }catch(IOException e){
            if(search==null || search.length()==0){
                request.setAttribute("error", "未入力です");
            }else{
            request.setAttribute("error", e.getMessage());
            }
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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

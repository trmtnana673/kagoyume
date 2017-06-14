/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import base.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author nana
 */
public class ItemDataDAO {
    
    public static ItemDataDAO getInstance(){
        return new ItemDataDAO();
    }
    
    public void itemRegistration(ItemDataDTO idDTO) throws SQLException{
      Connection con = null;
      PreparedStatement st = null;
      
      try{
          con = DBManager.getConnection();
          st = con.prepareStatement("INSERT INTO buy_t(UserID,itemCode,type,buyDate) VALUES(?,?,?,?)");
          st.setInt(1, idDTO.getUserID());
          st.setString(2, idDTO.getItemCode());
          st.setInt(3, idDTO.getType());
          st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
          st.executeUpdate();
          System.out.println("itemRegistration completed!!");
      }catch(SQLException e){
          System.out.print(e.getMessage());
          throw new SQLException(e);
      }finally{
          if(con != null){
              con.close();
          }
      }
    }
}

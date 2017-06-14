/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import base.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author nana
 */
public class UserDataDAO {
    
    public static UserDataDAO getInstance(){
        return new UserDataDAO();
    }
    
    public void insert(UserDataDTO dto) throws SQLException{
      Connection con = null;
      PreparedStatement st = null;
      
      try{
          con = DBManager.getConnection();
          st = con.prepareStatement("INSERT INTO user_t(name,password,mail,address,newDate) VALUES(?,?,?,?,?)");
          st.setString(1, dto.getName());
          st.setString(2, dto.getPassword());
          st.setString(3, dto.getEmail());
          st.setString(4, dto.getAddress());
          st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
          st.executeUpdate();
          System.out.println("insert completed!!");
      }catch(SQLException e){
          System.out.print(e.getMessage());
          throw new SQLException(e);
      }finally{
          if(con != null){
              con.close();
          }
      }
    }
    
    public UserDataDTO search(UserDataDTO dto) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
          con = DBManager.getConnection();
          st = con.prepareStatement("SELECT * FROM user_t WHERE name=? AND password=?");
          st.setString(1, dto.getName());
          st.setString(2, dto.getPassword());
          ResultSet rs = st.executeQuery();
          
          UserDataDTO resultDTO = new UserDataDTO();
          
          if(rs.next()){
          resultDTO.setUserID(rs.getInt(1));
          resultDTO.setName(rs.getString(2));
          resultDTO.setTotal(rs.getInt(6));
          resultDTO.setDeleteFlg(rs.getInt(8));
          }
          
          System.out.println("search completed!!");
          
          return resultDTO;
      }catch(SQLException e){
          System.out.print(e.getMessage());
          throw new SQLException(e);
      }finally{
          if(con != null){
              con.close();
          }
      }
    }
    
    public UserDataDTO myData(int userID) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
          con = DBManager.getConnection();
          st = con.prepareStatement("SELECT * FROM user_t WHERE userID=?");
          st.setInt(1, userID);
          ResultSet rs = st.executeQuery();
          
          rs.next();
          UserDataDTO udd = new UserDataDTO();
          udd.setUserID(rs.getInt(1));
          udd.setName(rs.getString(2));
          udd.setPassword(rs.getString(3));
          udd.setEmail(rs.getString(4));
          udd.setAddress(rs.getString(5));
          udd.setTotal(rs.getInt(6));
          udd.setNewDate(rs.getTimestamp(7));
          udd.setDeleteFlg(rs.getInt(8));
          
          System.out.println("myData completed!!");
          
          return udd;
      }catch(SQLException e){
          System.out.print(e.getMessage());
          throw new SQLException(e);
      }finally{
          if(con != null){
              con.close();
          }
      }
    }
    
    public void userDataUpdate(UserDataDTO dto) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
          con = DBManager.getConnection();
          st = con.prepareStatement("UPDATE user_t SET name = ?, password = ?, mail = ?, address = ? WHERE userID=?");
          st.setString(1, dto.getName());
          st.setString(2, dto.getPassword());
          st.setString(3, dto.getEmail());
          st.setString(4, dto.getAddress());
          st.setInt(5, dto.getUserID());
          st.executeUpdate();
          System.out.println("userDataUpdate completed!!");
      }catch(SQLException e){
          System.out.print(e.getMessage());
          throw new SQLException(e);
      }finally{
          if(con != null){
              con.close();
          }
      }
    }
    
    public void itemTotalUpdate(UserDataDTO dto) throws SQLException{
      Connection con = null;
      PreparedStatement st = null;
      
      try{
          con = DBManager.getConnection();
          st = con.prepareStatement("UPDATE user_t SET total=? WHERE userID=?");
          st.setInt(1, dto.getTotal());
          st.setInt(2, dto.getUserID());
          st.executeUpdate();
          System.out.println("itemTotalUpdate completed!!");
      }catch(SQLException e){
          System.out.print(e.getMessage());
          throw new SQLException(e);
      }finally{
          if(con != null){
              con.close();
          }
      }
    }
    
    public ArrayList<ItemDataDTO> history(int userID) throws SQLException{
       ArrayList<ItemDataDTO> historyList = new ArrayList();
       
       Connection con = null;
       PreparedStatement st = null;
      
      try{
          con = DBManager.getConnection();
          st = con.prepareStatement("SELECT *  FROM buy_t WHERE userID=?");
          st.setInt(1, userID);
          ResultSet rs = st.executeQuery();
          
          while(rs.next()){
          ItemDataDTO itemDTO = new ItemDataDTO();
          itemDTO.setBuyID(rs.getInt(1));
          itemDTO.setUserID(rs.getInt(2));
          itemDTO.setItemCode(rs.getString(3));
          itemDTO.setType(rs.getInt(4));
          itemDTO.setBuyDate(rs.getTimestamp(5));
          historyList.add(itemDTO);
          }
          
          System.out.println("history completed!!");
          
          return historyList;
      }catch(SQLException e){
          System.out.print(e.getMessage());
          throw new SQLException(e);
      }finally{
          if(con != null){
              con.close();
          }
      }
    }
    
    public void delete(int userID) throws SQLException{
      Connection con = null;
      PreparedStatement st = null;
      
      try{
          con = DBManager.getConnection();
          st = con.prepareStatement("UPDATE user_t SET deleteFlg=? WHERE userID=?");
          st.setInt(1, 1);
          st.setInt(2, userID);
          st.executeUpdate();
          System.out.println("delete completed!!");
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

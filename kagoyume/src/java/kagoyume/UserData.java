/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author nana
 */
public class UserData implements Serializable{
    
    private String name;
    private String password;
    private String email;
    private String address;
    private int total;
    
    public UserData(){
        this.name = "";
        this.password =  "";
        this.email = "";
        this.address = "";
        this.total = 0;
    }
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        if(name.length()==0){
            this.name = "";
        }else{
            this.name = name;
        }
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String passward){
        if(passward.length()==0){
            this.password = "";
        }else{
            this.password = passward;
        }
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        if(email.length()==0){
            this.email = "";
        }else{
            this.email = email;
        }
    }
    
    public String getAddress(){
        return address;
    }
    
    public void setAddress(String address){
        if(address.length()==0){
            this.address = "";
        }else{
            this.address = address;
        }
    }
    
    public int getTotal(){
        return total;
    }
    
    public void setTotal(String total){
        if(total.equals("")){
            this.total = 0;
        }else{
            this.total = Integer.parseInt(total);
        }
    }
    
    public ArrayList<String> check(){
        ArrayList chkList = new ArrayList();
        if(this.name.equals("")){
            chkList.add("name");
        }
        if(this.password.equals("")){
            chkList.add("password");
        }
        if(this.email.equals("")){
            chkList.add("email");
        }
        if(this.address.equals("")){
            chkList.add("address");
        }
        return chkList;
    }
    
    public void DTOMapping(UserDataDTO dto){
        dto.setName(this.name);
        dto.setPassword(this.password);
        dto.setEmail(this.email);
        dto.setAddress(this.address);
    }
    
    public void UserDataMapping(UserDataDTO dto,UserData ud){
        ud.setName(dto.getName());
        ud.setPassword(dto.getPassword());
        ud.setEmail(dto.getEmail());
        ud.setAddress(dto.getAddress());
        ud.setTotal(Integer.toString(dto.getTotal()));
    }
}

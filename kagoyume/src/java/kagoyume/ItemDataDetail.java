/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.Serializable;

/**
 *
 * @author nana
 */
public class ItemDataDetail implements Serializable{
    
    private String code;
    private String name;
    private String itemURL;
    private String condition;
    private String headline;
    private String image;
    private String price;
    
    public String getCode(){
        return code;
    }
    
    public void setCode(String code){
        this.code = code;
    }
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getItemURL(){
        return itemURL;
    }
    
    public void setItemURL(String itemURL){
        this.itemURL = itemURL;
    }
    
    public String getCondition(){
        return condition;
    }
    
    public void setCondition(String condition){
        this.condition = condition;
    }
    
    public String getHeadline(){
        return headline;
    }
    
    public void setHeadline(String headline){
        this.headline = headline;
    }
    
    public String getImage(){
        return image;
    }
    
    public void setImage(String image){
        this.image = image;
    }
    
    public String getPrice(){
        return price;
    }
    
    public void setPrice(String price){
        this.price = price;
    }
    
    public void ItemDataDTOMapping(ItemDataDTO idd,UserDataDTO udd,String type){
        idd.setUserID(udd.getUserID());
        idd.setItemCode(this.code);
        idd.setType(Integer.parseInt(type));
    }
}

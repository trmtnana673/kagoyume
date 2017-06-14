/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.util.ArrayList;

/**
 *
 * @author nana
 */
public class Helper {
    
    private final String homeURL = "top.jsp";
    private String menu ="";
    
    public static Helper getInstance(){
        return new Helper();
    }
    
    public String home(){
        return "<a href=\"" + homeURL + "\">トップへ戻る</a>";
    }
    
    public String headerMenu(boolean login,String page,String name){
        menu = "<a class=\"title\" href=\"top.jsp\">かごゆめ</a>";
        if(!login){
            menu += "<div class=\"menu\"><form action=\"Login\" method=\"GET\">" +
                    "<input type=\"hidden\" name=\"page\" value=\"" + page +"\">" +
                    "<input type=\"submit\" value=\"ログイン\">"+
                    "</form>";
        }else{
            menu += "<div class=\"menu\"><p class=\"user\">ようこそ" + name + "さん！</p>";
            
            menu += "<form action=\"Login\" method=\"GET\">" +
                    "<input type=\"hidden\" name=\"login\" value=\"out\">" +
                    "<input type=\"submit\" value=\"ログアウト\">" +
                    "</form>" +
                    "<form action=\"Mydata\" method=\"POST\">" +
                    "<input type=\"submit\" value=\"会員情報\">" +
                    "</form>";
        }
            menu += "<form action=\"Cart\" method=\"POST\">" +
                    "<input type=\"hidden\" name=\"page\" value=\"cart.jsp\">" +
                    "<input type=\"submit\" value=\"カート\">" +
                    "</form></div>";
            
            return menu;
    }
                            
    public String chkInput(ArrayList<String> chkList){
        String output = "";
        for(String val: chkList){
            if(val.equals("name")){
                output += "名前";
            }
            if(val.equals("password")){
                output += "パスワード";
            }
            if(val.equals("email")){
                output += "メールアドレス";
            }
            if(val.equals("address")){
                output += "住所";
            }
            output += "が未入力です<br>";
        }
        return output;
    }
    
}

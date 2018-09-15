/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.util.ArrayList;
import model.Client;

/**
 *
 * @author Diego
 */
public class Validation {
    
   public static Client validerUsager(String usa, String pas,ArrayList<Client> list){
   for (Client u:list){
       if (u.getUsager().equals(usa) && u.getPass().equals(pas)){
           return u;
       }
   }
   return null;
   
}
   
      public static Client validerUsager(String usa, ArrayList<Client> list){
   for (Client u:list){
       if (u.getUsager().equalsIgnoreCase(usa)){
           return u;
       }
       
   }
   return null;
   
}
    
}

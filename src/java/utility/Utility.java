/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Client;
import service.Db;




/**
 *
 * @author Diego
 */
public class Utility {
    
    

    
    public static ArrayList<Client> getListUsager(){
        ArrayList<Client> listUsager=new ArrayList<Client>();
        
        String query = "SELECT * FROM CLIENT";
        Connection con = Db.conectar();
        System.out.println("Conexao:" +con);
        ResultSet rs = null;
        PreparedStatement stm = null;   
            try{
            stm=con.prepareStatement(query);
            rs= stm.executeQuery();
            while (rs.next()){
              
                int idClient=rs.getInt("IDCLIENT");
               
                String nom = rs.getString("NOMCLIENT");
                
                String adresse = rs.getString("ADRESSE");
                
                int telephone =rs.getInt("TELEPHONE");
               
                String usager = rs.getString("USAGER");
                
                String pass = rs.getString("PASS");
               
                
                Client usa=new Client(idClient,nom,adresse,telephone,usager,pass);
                listUsager.add(usa);
            }
            rs.close();
            stm.close();
                
        }catch (SQLException e){
            e.printStackTrace();
        }
        Db.endCon(con);
        return listUsager;
        
    }
    
    
    
    public static int enregistrerUsager(String nom,String adresse,int tel,String usager,String pass){
        
        String query="INSERT INTO client VALUES(client_seq.nextval,?,?,?,?,?)";
        Connection con=Db.conectar();
        PreparedStatement stm = null;
        int repondre=0;
        try{
            stm = con.prepareStatement(query);
            //stm.setString(0,idClient);
            stm.setString(1,nom);
            stm.setString(2,adresse);
            stm.setInt(3,tel);
            stm.setString(4,usager);
            stm.setString(5,pass);
            repondre=stm.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
        
        Db.endCon(con);
        return repondre;
        
        
    }
    

    
}

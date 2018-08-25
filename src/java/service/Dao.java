/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.*;

/**
 *
 * @author jvict
 */
public class Dao {
        
    public static Modele getModele(int id){        
        Modele modele = null;
        String query = "select * from modele where idModele=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try{
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idMo = rs.getInt("idModele");
                Marque idMa = getMarque(rs.getInt("idMarque"));                
                String nModele = rs.getString("nomModele");
                modele = new Modele(idMo,idMa,nModele);
            }
            rs.close();
            stm.close();
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("Pouvait pas prendre le modele");
        }
        Db.endCon(con);
        return modele;
    }
    
        public static Marque getMarque(int id){        
        Marque marque = null;
        String query = "select * from marque where idMarque=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try{
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idMa = rs.getInt("idMarque");               
                String nMarque = rs.getString("nomMarque");
                marque = new Marque(idMa,nMarque);
            }
            rs.close();
            stm.close();
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("Pouvait pas prendre la marque");
        }
        Db.endCon(con);
        return marque;
    }
        
    
        public static Piece getPiece(int id){        
        Piece piece = null;
        String query = "select * from team where idTeam=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try{
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String country = rs.getString("country");
                String city = rs.getString("city");
                int year = rs.getInt("year");
                String wsite = rs.getString("website");
              //  piece = new Modele(id,name,country,city,year,wsite);
            }
            rs.close();
            stm.close();
        }catch (SQLException e){
            System.out.println("Nao conseguiu criar o tine");
        }
        Db.endCon(con);
        return null;
    }
}

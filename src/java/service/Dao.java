/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.sun.xml.wss.saml.internal.saml11.jaxb10.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.*;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author jvict
 */
public class Dao {

    public static Modele getModele(int id) {
        Modele modele = null;
        String query = "select * from modele where idModele=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Marque idMa = getMarque(rs.getInt("idMarque"));
                String nModele = rs.getString("nomModele");
                modele = new Modele(id, idMa, nModele);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return modele;
    }

    public static Marque getMarque(int id) {
        Marque marque = null;
        String query = "select * from marque where idMarque=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String nMarque = rs.getString("nomMarque");
                marque = new Marque(id, nMarque);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return marque;
    }

    public static Commande getCommande(int id) {
        Commande commande = null;
        ArrayList<LigneCommande> lignes;
        String query = "select * from commande where idCommande=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idCli = rs.getInt("idCLient");
                int annee = rs.getInt("annee");
                Client cli = getClient(idCli);
                Date date = rs.getDate("dateCommande");
                Modele mod = getModele(rs.getInt("idMod"));
                lignes = getLignes(id);
                commande = new Commande(id, date, mod, annee, cli, lignes);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return commande;
    }

    public static ArrayList<LigneCommande> getLignes(int id) {
        String query = "select * from lignecommande where idcommande=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;
        LigneCommande ligne;
        ArrayList<LigneCommande> lignes = new ArrayList<LigneCommande>();
        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Piece piece = getPiece(rs.getInt("idPiece"));
                int qtt = rs.getInt("qtt");
                String pos = rs.getString("position");
                String cote = rs.getString("cote");
                ligne = new LigneCommande(piece, qtt, pos, cote);
                lignes.add(ligne);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return lignes;
    }

    public static ArrayList<Commande> getCommandes(int id) {
        String query = "select * from commande where idclient=? order by idcommande ";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;
        //LigneCommande ligne;
        ArrayList<Commande> commandes = new ArrayList<Commande>();
        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Commande commande = getCommande(rs.getInt("idcommande"));
                commandes.add(commande);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return commandes;
    }

    public static Client getClient(int id) {
        Client client = null;
        String query = "select * from client where idClient=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String nomClient = rs.getString("nomClient");
                String adresse = rs.getString("adresse");
                double tel = rs.getDouble("telephone");
                client = new Client(id, nomClient, adresse, tel);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return client;
    }

    public static Piece getPiece(int id) {
        Piece piece = null;
        String query = "select * from piece where idPiece=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Categorie cat = getCategorie(rs.getInt("idcategorie"));
                String nomP = rs.getString("nomPiece");
                String desc = rs.getString("description");
                piece = new Piece(id, cat, nomP, desc);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return piece;
    }

    public static Categorie getCategorie(int id) {
        Categorie cat = null;
        String query = "select * from categorie where idCategorie=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String nomCat = rs.getString("nomCategorie");
                cat = new Categorie(id, nomCat);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
        }
        Db.endCon(con);
        return cat;
    }

    public static int insertCommande(Commande com) {

        String query = "insert into commande values(idCommande_seq.NEXTVAL,?,?,?,?)";
        Connection con = Db.conectar();
        int ver = 0;
        int key = 0;
        PreparedStatement stm = null;
        try {
            String gCol[] = {"idcommande"};
            stm = con.prepareStatement(query, gCol);
            stm.setInt(1, com.getClient().getIdClient());
            stm.setDate(2, com.getDateCommande());
            stm.setInt(3, com.getIdMod().getIdModele());
            stm.setInt(4, com.getAnnee());

            ver = stm.executeUpdate();
            ResultSet keys = stm.getGeneratedKeys();
            keys.next();
            key = keys.getInt(1);
            keys.close();
            for (LigneCommande lc : com.getLigneCommande()) {
                insertLigneCommande(lc, key);
            }
            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);

        return ver;
    }

    public static void insertLigneCommande(LigneCommande l, int idC) {
        String query = "insert into lignecommande values(?,?,?,?,?)";
        Connection con = Db.conectar();
        int ver = 0;
        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, idC);
            stm.setInt(2, l.getPiece().getIdPiece());
            stm.setInt(3, l.getQtt());
            stm.setString(4, l.getPosition());
            stm.setString(5, l.getCote());

            ver = stm.executeUpdate();

            stm.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
    }

    public static ArrayList<Marque> getListeMarques() {
        ArrayList<Marque> listMarque = new ArrayList<Marque>();
        String query = "SELECT * FROM marque";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idMarque = rs.getInt("idmarque");
                String nomMarque = rs.getString("nommarque");
                Marque marque = new Marque(idMarque, nomMarque);
                listMarque.add(marque);
            }
            rs.close();
            stm.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        Db.endCon(con);
        return listMarque;
    }

    public static ArrayList<Modele> getListeModele(int idmarque) {
        ArrayList<Modele> listModele = new ArrayList<Modele>();
        String query = "SELECT idmodele,idmarque,nommodele FROM modele WHERE idmarque=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, idmarque);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idModele = rs.getInt("idmodele");
                Marque marque = Dao.getMarque(idmarque);
                String nomModele = rs.getString("nommodele");
                Modele modele = new Modele(idModele, marque, nomModele);
                listModele.add(modele);
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }

        return listModele;
    }

    public static ArrayList<Categorie> getListeCategorie() {
        ArrayList<Categorie> listeCategorie = new ArrayList<Categorie>();
        String query = "SELECT * FROM categorie";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idCategorie = rs.getInt("idcategorie");
                String nomCategorie = rs.getString("nomcategorie");
                Categorie cat = new Categorie(idCategorie, nomCategorie);
                listeCategorie.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listeCategorie;

    }

    public static ArrayList<Piece> getListePiece(int idCategorie) {
        ArrayList<Piece> listPiece = new ArrayList<Piece>();
        String query = "SELECT idpiece,nompiece,description FROM piece where idcategorie=?";
        Connection con = Db.conectar();
        ResultSet rs = null;
        PreparedStatement stm = null;

        try {
            stm = con.prepareStatement(query);
            stm.setInt(1, idCategorie);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idPiece = rs.getInt("idpiece");
                Categorie categorie = Dao.getCategorie(idCategorie);
                String nomPiece = rs.getString("nompiece");
                String description = rs.getString("description");
                Piece piece = new Piece(idPiece, categorie, nomPiece, description);
                listPiece.add(piece);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPiece;
    }

} 


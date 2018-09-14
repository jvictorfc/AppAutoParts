/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author jvict
 */
public class Commande {

    private int idCommande;
    private Date dateCommande;
    private Modele idMod;
    private int annee;
    private Client client;
    private ArrayList<LigneCommande> ligneCommande = new ArrayList<LigneCommande>();

    //Constructor commande complete
    public Commande(int idCommande, Date dateCommande, Modele idMod, int annee, Client client, ArrayList<LigneCommande> lc) {
        this.ligneCommande = lc;
        this.idCommande = idCommande;
        this.dateCommande = dateCommande;
        this.idMod = idMod;
        this.annee = annee;
        this.client = client;
    }

    public Commande(Date dateCommande, Modele idMod, int annee, Client client) {
        this.dateCommande = dateCommande;
        this.idMod = idMod;
        this.annee = annee;
        this.client = client;
    }

    public int getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }

    public Date getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(Date dateCommande) {
        this.dateCommande = dateCommande;
    }

    public Modele getIdMod() {
        return idMod;
    }

    public void setIdMod(Modele idMod) {
        this.idMod = idMod;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public ArrayList<LigneCommande> getLigneCommande() {
        return ligneCommande;
    }

    public void setLigneCommande(ArrayList<LigneCommande> ligneCommande) {
        this.ligneCommande = ligneCommande;
    }

    public void addPiece(LigneCommande lc) {
        boolean isEquals = false;
        if (!ligneCommande.isEmpty()) {
            for (LigneCommande l : ligneCommande) {
                if (lc.getCote().equals(l.getCote())
                        && lc.getPosition().equals(l.getPosition())
                        && lc.getPiece().getIdPiece() == l.getPiece().getIdPiece()) {
                    
                    isEquals = true;
                    l.setQtt(lc.getQtt() + l.getQtt());
                    break;
                }
            }
            
            if (!isEquals) {
                ligneCommande.add(lc);
            }
        } else {
            ligneCommande.add(lc);
        }
    }

    public void updQtt(int ligne, int qtt) {
        ligneCommande.get(ligne).setQtt(qtt);
    }

    public void remPiece(int id) {
//        for (LigneCommande l : ligneCommande) {
//            if (l.getPiece().getIdPiece() == id) {
//                ligneCommande.remove(l);
//            }
//        }
        System.out.println(ligneCommande.get(id).getCote() + ligneCommande.get(id).getPosition() + ligneCommande.get(id).getPiece().getNomPiece());
        ligneCommande.remove(id);
    }

    @Override
    public String toString() {
        return "Commande{" + "idCommande=" + idCommande + ", dateCommande=" + dateCommande + ", idMod=" + idMod.getNomModele() + ", annee=" + annee + ", client=" + client.getNomClient() + ", ligneCommande=" + ligneCommande + '}';
    }
    

}

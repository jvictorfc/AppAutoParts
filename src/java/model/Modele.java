/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author jvict
 */
public class Modele {
    private int idModele;
    private Marque marque;
    private String nomModele;

    public Modele(int idModele, Marque marque, String nomModele) {
        this.idModele = idModele;
        this.marque = marque;
        this.nomModele = nomModele;
    }

    public int getIdModele() {
        return idModele;
    }

    public void setIdModele(int idModele) {
        this.idModele = idModele;
    }

    public Marque getMarque() {
        return marque;
    }

    public void setMarque(Marque marque) {
        this.marque = marque;
    }

    public String getNomModele() {
        return nomModele;
    }

    public void setNomModele(String nomModele) {
        this.nomModele = nomModele;
    }
    
    
}

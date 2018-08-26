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
public class Piece {
    private int idPiece;
    private Categorie categorie;
    private String nomPiece;
    private String description;

    public Piece(int idPiece, Categorie categorie, String nomPiece, String description) {
        this.idPiece = idPiece;
        this.categorie = categorie;
        this.nomPiece = nomPiece;
        this.description = description;
    }

    public int getIdPiece() {
        return idPiece;
    }

    public void setIdPiece(int idPiece) {
        this.idPiece = idPiece;
    }

    public Categorie getIdCategorie() {
        return categorie;
    }

    public void setIdCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public String getNomPiece() {
        return nomPiece;
    }

    public void setNomPiece(String nomPiece) {
        this.nomPiece = nomPiece;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}

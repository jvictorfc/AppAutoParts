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
public class LigneCommande {
    private Piece piece;
    private int qtt;
    private String position;
    private String cote;

    public LigneCommande(Piece piece, int qtt, String position, String cote) {
        this.piece = piece;
        this.qtt = qtt;
        this.position = position;
        this.cote = cote;
    }

    public Piece getPiece() {
        return piece;
    }

    public void setPiece(Piece piece) {
        this.piece = piece;
    }

    public int getQtt() {
        return qtt;
    }

    public void setQtt(int qtt) {
        this.qtt = qtt;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCote() {
        return cote;
    }

    public void setCote(String cote) {
        this.cote = cote;
    }


}

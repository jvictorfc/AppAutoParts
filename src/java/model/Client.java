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
public class Client {
    private int idClient;
    private String nomClient;
    private String adresse;
    private double telephone;
    private String usager;
    private String pass;

    public Client(int idClient, String nomClient, String adresse, double telephone, String usager, String pass) {
        this.idClient = idClient;
        this.nomClient = nomClient;
        this.adresse = adresse;
        this.telephone = telephone;
        this.usager = usager;
        this.pass = pass;
    }

    public Client(int idClient, String nomClient, String adresse, double telephone) {
        this.idClient = idClient;
        this.nomClient = nomClient;
        this.adresse = adresse;
        this.telephone = telephone;
    }
    
    

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public String getNomClient() {
        return nomClient;
    }

    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public double getTelephone() {
        return telephone;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public String getUsager() {
        return usager;
    }

    public void setUsager(String usager) {
        this.usager = usager;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}

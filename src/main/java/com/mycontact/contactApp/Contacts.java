package com.mycontact.contactApp;

public class Contacts {
    private static int count = 0;
    private int id;
    private String nom;
    private String prenom;
    private String numero;
    private String competence;

    public Contacts(String nom, String prenom, String numero, String competence) {
        this.id = ++count;
        this.nom = nom;
        this.prenom = prenom;
        this.numero = numero;
        this.competence = competence;
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCompetence() {
        return competence;
    }

    public void setFonction(String competence) {
        this.competence = competence;
    }

    void setCompetence(String competence) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}

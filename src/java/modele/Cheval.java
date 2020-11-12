/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.util.ArrayList;

/**
 *
 * @author sio2
 */
public class Cheval {
    private int id;
    private String nom;
    private String sexe;
    private int prixDepart;
    private String vendeur;
    private String proprietaire;
    private String sire;
    private String mere;
    private String pere;
    private String chemin_image;
    private TypeCheval unTypeChev;
    private ArrayList<Vente> lesVentes ;
    private Client unClient;

    public Cheval() {
    }

    public Cheval(int id, String nom, String sexe, int prixDepart, String vendeur, String proprietaire, String sire, String mere, String pere, String image) {
        this.id = id;
        this.nom = nom;
        this.sexe = sexe;
        this.prixDepart = prixDepart;
        this.vendeur = vendeur;
        this.proprietaire = proprietaire;
        this.sire = sire;
        this.mere = mere;
        this.pere = pere;
        this.chemin_image = image;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public int getPrixDepart() {
        return prixDepart;
    }

    public String getChemin_image() {
        return chemin_image;
    }

    public void setChemin_image(String chemin_image) {
        this.chemin_image = chemin_image;
    }    
    

    public void setPrixDepart(int prixDepart) {
        this.prixDepart = prixDepart;
    }

    public String getVendeur() {
        return vendeur;
    }

    public void setVendeur(String vendeur) {
        this.vendeur = vendeur;
    }

    public String getProprietaire() {
        return proprietaire;
    }

    public void setProprietaire(String proprietaire) {
        this.proprietaire = proprietaire;
    }  

    public String getSire() {
        return sire;
    }

    public void setSire(String sire) {
        this.sire = sire;
    }

    public String getMere() {
        return mere;
    }

    public void setMere(String mere) {
        this.mere = mere;
    }

    public String getPere() {
        return pere;
    }

    public void setPere(String pere) {
        this.pere = pere;
    }
    

    public Client getUnClient() {
        return unClient;
    }

    public void setUnClient(Client unClient) {
        this.unClient = unClient;
    }
    
    public TypeCheval getUnTypeChev() {
        return unTypeChev;
    }

    public void setUnTypeChev(TypeCheval unTypeChev) {
        this.unTypeChev = unTypeChev;
    }

    public ArrayList<Vente> getLesVentes() {
        return lesVentes;
    }

    public void setLesVentes(ArrayList<Vente> lesVentes) {
        this.lesVentes = lesVentes;
    }
    
    public void addUneVente(Vente uneVente){
        if (lesVentes == null){
            lesVentes = new ArrayList<Vente>();
        }
        lesVentes.add(uneVente);
    } 

}

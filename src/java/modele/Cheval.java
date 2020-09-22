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
    private String sire;
    private TypeCheval unTypeChev;
    private ArrayList<Vente> lesVentes ;

    public Cheval() {
    }

    public Cheval(int id, String nom, String sexe, int prixDepart, String vendeur, String sire) {
        this.id = id;
        this.nom = nom;
        this.sexe = sexe;
        this.prixDepart = prixDepart;
        this.vendeur = vendeur;
        this.sire = sire;
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

    public void setPrixDepart(int prixDepart) {
        this.prixDepart = prixDepart;
    }

    public String getVendeur() {
        return vendeur;
    }

    public void setVendeur(String vendeur) {
        this.vendeur = vendeur;
    }

    public String getSire() {
        return sire;
    }

    public void setSire(String sire) {
        this.sire = sire;
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

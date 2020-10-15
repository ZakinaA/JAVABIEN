/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

/**
 *
 * @author sio2
 */
public class Enchere {
    private int numero;
    private float montant;
    private Lot unLot;
    private Vente uneVente;
    private Cheval unCheval;
    
    
    public Enchere () {
        
    }

    public Enchere(int numero, float montant) {
        this.numero = numero;
        this.montant = montant;
    }

    public int getNumero() {
        return numero;
    }

    public float getMontant() {
        return montant;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public void setMontant(float montant) {
        this.montant = montant;
    }

    public Lot getUnLot() {
        return unLot;
    }

    public void setUnLot(Lot unLot) {
        this.unLot = unLot;
    }

    public Vente getUneVente() {
        return uneVente;
    }

    public Cheval getUnCheval() {
        return unCheval;
    }

    public void setUneVente(Vente uneVente) {
        this.uneVente = uneVente;
    }

    public void setUnCheval(Cheval unCheval) {
        this.unCheval = unCheval;
    }
    
    
    
    
}

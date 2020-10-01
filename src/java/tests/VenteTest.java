/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import java.util.ArrayList;
import modele.Courriel;
import modele.Vente;

/**
 *
 * @author sio2
 */
public class VenteTest {
    public static void main(String[] args) {
       Vente uneVente = new Vente(1, "Vente automne", "12/05/2001");
       System.out.println(uneVente.toString());
       //System.out.println(uneVente.getId() + "  " + uneVente.getNom() + " " + uneVente.getDateDebutVente());
       
       
        ArrayList maListe = new ArrayList();
        Courriel unCourriel = new Courriel(1, "10/05/2001", "objet", "corps");
        maListe.add(uneVente) ;
        maListe.add(1);
                
    for(int i = 0; i < maListe.size(); i++)
    {
      //System.out.println("donnée à l'indice " + i + " = " + maListe.get(i));
      System.out.println(uneVente.getId()+" "+uneVente.getNom()+" "+uneVente.getDateDebutVente());
    }    
    System.out.println("Courriel comptabilisé : " +maListe.size());
  } 
}

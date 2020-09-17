/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import java.util.ArrayList;
import modele.Lieu;
import modele.Vente;


/**
 *
 * @author sio2
 */
public class LieuTest {
    
    public static void main(String[] args) {
       Lieu unLieu = new Lieu(1, "Caen", 3, "Parfait");
       System.out.println(unLieu.toString());
       System.out.println(unLieu.getId() + "  " + unLieu.getVille() + " " + unLieu.getNbBoxes() + " " + unLieu.getCommentaires());
    
         
        ArrayList maListe = new ArrayList();
        Vente uneVente = new Vente(1, "Caen en cheval", "20/09/2020");
        maListe.add(uneVente) ;
        maListe.add(1);
                
    for(int i = 0; i < maListe.size(); i++)
    {
      System.out.println("donnée à l'indice " + i + " = " + maListe.get(i));
      System.out.println(uneVente.getId()+" "+uneVente.getNom()+" "+uneVente.getDateDebutVente());
    }              
   }
}
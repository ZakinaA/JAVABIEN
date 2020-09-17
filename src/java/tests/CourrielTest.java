/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import java.util.ArrayList;
import modele.Courriel;
import modele.PiecesJointes;

/**
 *
 * @author sio2
 */
public class CourrielTest {
    public static void main(String[] args) {
        
        Courriel unCourriel = new Courriel(1, "27/08/2020", "A l'attention de monsieur", "Recap du mois d'août disponible dans la piéce jointe");    
        System.out.println(unCourriel.toString());
        System.out.println(unCourriel.getId() + "  " + unCourriel.getDate() + " " + unCourriel.getObjet() + " " + unCourriel.getCorps());

        ArrayList maListe = new ArrayList();
        PiecesJointes unePJ = new PiecesJointes(1, "www.imgserver/16421.png/");
        maListe.add(unePJ) ;
        maListe.add(1);
                
    for(int i = 0; i < maListe.size(); i++)
    {
      //System.out.println("donnée à l'indice " + i + " = " + maListe.get(i));
      System.out.println(unePJ.getId()+" "+unePJ.getCheminAcces());
    }              
    
    
    
    }
}

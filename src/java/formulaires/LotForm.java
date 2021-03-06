/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formulaires;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modele.Cheval;
import modele.Lot;
import modele.Vente;

/**
 *
 * @author sio2
 */
public class LotForm {
    
private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }
    
    //méthode de validation du champ de saisie nom
    //private void validationNom( String nom ) throws Exception {
    //    if ( nom != null && nom.length() < 3 ) {
    //    throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
    //    }
    //}

    private void setErreur( String champ, String message ) {
    erreurs.put(champ, message );
    }    
    
    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Lot ajouterLot( HttpServletRequest request ) {
      
        Lot unLot  = new Lot();
         
        String prixDepart = getDataForm( request, "prixDepart" );
        Integer result = Integer.parseInt(prixDepart);

       
        
         Cheval unCheval  = new Cheval();
         String id = getDataForm( request, "Cheval");
         System.out.println("hgfhf"+ id);
         unCheval.setId(Integer.parseInt(id));
                 

         Vente uneVente = new Vente();
         String nom = getDataForm( request, "Vente");

       
         if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
        unLot.setPrixDepart(result);
        unLot.setUnCheval(unCheval);
        unLot.setUneVente(uneVente);
  
       
        return unLot ;
    }
}

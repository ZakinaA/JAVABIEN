/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formulaires;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modele.Cheval;
import modele.Enchere;
import modele.Lot;
import modele.Vente;

/**
 *
 * @author sio2
 */
public class EnchereForm {
    
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
    
    public Enchere listerLesEncheres( HttpServletRequest request ) {
      
        Enchere uneEnchere  = new Enchere();
         
        String montant = getDataForm( request, "montant" );
        //String unTypeCheval = getDataForm( request, "id_typeChev" );
         Float montant1 = Float.parseFloat(montant);
         Lot unLot  = new Lot();
         String prixDepart = getDataForm( request, "prixDepart_Lot");
         
         // Liaison entre Cheval et Client 
         Vente uneVente = new Vente();
         String nom = getDataForm( request, "nom_Vente");
         String dateDebut = getDataForm( request, "dateDebut_Vente");
         
         Cheval unCheval  = new Cheval();
         String Nom = getDataForm( request, "nom_cheval");
        
        // Traitement de la liste à choix multiple
        //Pour chq catégorie selectionné, on instancie une nouvelle catégorie et on l'ajoute au client
        //TypeCheval unTypeChev ;
        //String[] typeCheval = request.getParameterValues("typeCheval");
        //for (int i=0; i<typeCheval.length; i++){
         //   unTypeChev = new TypeCheval();
        //    unTypeChev.setId(unTypeChev[i]);
        //    unCheval.addUnTypeChev(unTypeChev);
        //}
        
 
       
        //try {
        //     validationNom( nom );
       // } catch ( Exception e ) {
        //    setErreur( "nom", e.getMessage() );
        //}
        //unClient.setNom(nom);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
      
        uneEnchere.setMontant(montant1);
        uneEnchere.setUnLot(unLot);
        uneEnchere.setUneVente(uneVente);
        uneEnchere.setUnCheval(unCheval);
       
        
               
       
        return uneEnchere ;
    }
    
}

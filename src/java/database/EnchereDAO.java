/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modele.Cheval;
import modele.Enchere;
import modele.Lot;
import modele.Vente;

/**
 *
 * @author sio2
 */
public class EnchereDAO {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Enchere getUneEnchere(Connection connection, String numEnchere){      
        Enchere uneEnchere = new Enchere();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT enchere.montant, cheval.nom FROM lot, enchere, cheval WHERE lot.id = enchere.numero AND lot.id = cheval.id AND lot.idVente = ?");
        
            //executer la requete
            
            requete.setString(1, numEnchere);
            System.out.println("requete  " + requete);
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next()) {  
                //Cheval unCheval = new Cheval();
                uneEnchere.setNumero(rs.getInt("num"));
                uneEnchere.setMontant(rs.getFloat("montant"));
        
                
                Lot unLot = new Lot();
                unLot.setPrixDepart(rs.getInt("prix de départ"));
                uneEnchere.setUnLot(unLot);
                //Cheval.add(unCheval);
                
                Vente uneVente = new Vente();
                uneVente.setDateDebutVente(rs.getString ("date de début"));
                uneVente.setNom(rs.getString ("nom"));
                uneEnchere.setUnLot(unLot);
        
                
                Cheval unCheval = new Cheval();
                unCheval.setNom(rs.getString ("nom"));           
                uneEnchere.setUnLot(unLot);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneEnchere;    
    }
    
    public static Enchere listerLesEncheres(Connection connection, Enchere uneEnchere){      
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO ENCHERE (montant, nom_cheval, prixDepart_Lot, nom_Vente, dateDebut_Vente)\n" + "VALUES (?,?,?,?,?)");
            requete.setFloat(1, uneEnchere.getMontant());
            requete.setInt(2, uneEnchere.getUnLot().getPrixDepart());
            requete.setString(3, uneEnchere.getUneVente().getDateDebutVente());
            requete.setString(4, uneEnchere.getUneVente().getNom());
            requete.setString(5, uneEnchere.getUnCheval().getNom());
    


           /* Exécution de la requête */
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                uneEnchere.setNumero(idGenere);
            }
            
            // ajout des enregistrement dans la table clientcategvente
            //for (int i=0;i<unCheval.getLesCategVentes().size();i++){
             //   PreparedStatement requete2=connection.prepareStatement("INSERT INTO clientcategvente (codeClient, codeCategVente )\n" +
             //       "VALUES (?,?)");
             //    requete2.setInt(1, unClient.getId());
             //    requete2.setString(2, unClient.getLesCategVentes().get(i).getCode());
             //    requete2.executeUpdate();
        //    }
  
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneEnchere ;    
    }
    
}

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
import modele.Lot;
import modele.TypeCheval;

/**
 *
 * @author sio2
 */
public class LotDAO {Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Lot getLeLot(Connection connection, String idLot){      
        Lot unLot = new Lot();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT Lot.* FROM cheval WHERE Lot.id = ?");
        
            //executer la requete
            
            requete.setString(1, idLot);
            System.out.println("requete  " + requete);
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next()) {  
                //Cheval unCheval = new Cheval();
                unLot.setId(rs.getInt("id"));
                unLot.setPrixDepart(rs.getInt("prixDepart"));
                unLot.setIdCheval(rs.getInt("idCheval"));
                unLot.setidVente(rs.getInt("idVente"));
                
                
             
                //Cheval.add(unCheval);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unLot;    
    } 
    
    
    public static Lot ajouterLot(Connection connection, Lot unLot){      
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO Lot (id, prixDepart, idCheval, idVente)\n" + "VALUES (?,?,?,?)");
            requete.setInt(1, unLot.getId());
            requete.setInt(2, unLot.getPrixDepart());
            requete.setInt(3, unLot.getIdCheval());
            requete.setString(6, unLot.getIdVente());
           

           /* Exécution de la requête */
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unLot.setId(idGenere);
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
        return unLot ;    
    }
}
    


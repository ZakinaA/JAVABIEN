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
import java.util.ArrayList;
import modele.CategVente;
/**
 *
 * @author Zakina
 */
public class CategVenteDAO {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
     public static ArrayList<CategVente>  getLesCategVentes(Connection connection){      
        ArrayList<CategVente> lesCategVentes = new  ArrayList<CategVente>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from categvente");
            
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                CategVente uneCategVente = new CategVente();
                uneCategVente.setCode(rs.getString("code"));
                uneCategVente.setLibelle(rs.getString("libelle"));
                lesCategVentes.add(uneCategVente);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesCategVentes ;    
    } 
     
     
     
     
     
     public static CategVente ajouterCategorie(Connection connection, CategVente uneCategVente){      
       // int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO categvente (code, libelle)\n" + "VALUES (?,?)");
            requete.setString(1, uneCategVente.getCode());
            requete.setString(2, uneCategVente.getLibelle());

           /* Exécution de la requête */
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            //rs = requete.getGeneratedKeys();
            //while ( rs.next() ) {
                //idGenere = rs.getInt( 1 );
                //unClient.setId(idGenere);
            //}
            
            // ajout des enregistrement dans la table clientcategvente
            
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneCategVente ;    
    }
    
}

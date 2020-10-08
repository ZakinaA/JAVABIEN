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
import modele.TypeCheval;

/**
 *
 * @author sio2
 */
public class ChevalDAO {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Cheval getLeCheval(Connection connection, String idCheval){      
        Cheval unCheval = new Cheval();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT cheval.*, typecheval.libelle FROM cheval, typecheval WHERE cheval.id = typecheval.id AND cheval.id = ?");
        
            //executer la requete
            
            requete.setString(1, idCheval);
            System.out.println("requete  " + requete);
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next()) {  
                //Cheval unCheval = new Cheval();
                unCheval.setId(rs.getInt("id"));
                unCheval.setNom(rs.getString("nom"));
                unCheval.setSexe(rs.getString("sexe"));
                unCheval.setPrixDepart(rs.getInt("prixDepart"));
                unCheval.setVendeur(rs.getString("vendeur"));
                unCheval.setProprietaire(rs.getString("proprietaire"));
                unCheval.setSire(rs.getString("SIRE"));
                unCheval.setMere(rs.getString("id_mere"));
                unCheval.setPere(rs.getString("id_pere"));
                unCheval.setChemin_image(rs.getString("chemin_image"));
                
                TypeCheval unTypeChev = new TypeCheval();
                unTypeChev.setLibelle(rs.getString("libelle"));
                
                
                unCheval.setUnTypeChev(unTypeChev);
                //Cheval.add(unCheval);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unCheval;    
    } 
    
    
    public static Cheval ajouterCheval(Connection connection, Cheval unCheval){      
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO CHEVAL (nom, sexe, prixDepart, vendeur, proprietaire, SIRE, id_typeChev)\n" + "VALUES (?,?,?,?,?,?,?)");
            requete.setString(1, unCheval.getNom());
            requete.setString(2, unCheval.getSexe());
            requete.setInt(3, unCheval.getPrixDepart());
            requete.setString(4, unCheval.getVendeur());
            requete.setString(5, unCheval.getProprietaire());
            requete.setString(6, unCheval.getSire());
            requete.setInt(7, unCheval.getUnTypeChev().getId());

           /* Exécution de la requête */
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unCheval.setId(idGenere);
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
        return unCheval ;    
    }
}



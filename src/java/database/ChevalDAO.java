/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import static database.VenteDAO.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.Cheval;
import modele.Client;
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
            requete=connection.prepareStatement("SELECT cheval.*, typecheval.libelle, client.nom FROM client,appartenir, cheval, typecheval WHERE appartenir.id_cheval = cheval.id AND appartenir.id_client = client.id AND cheval.id = typecheval.id AND cheval.id = ?");
        
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

                unCheval.setSire(rs.getString("SIRE"));
                unCheval.setMere(rs.getString("id_mere"));
                unCheval.setPere(rs.getString("id_pere"));
                unCheval.setChemin_image(rs.getString("chemin_image"));
                
                TypeCheval unTypeChev = new TypeCheval();
                unTypeChev.setLibelle(rs.getString("libelle"));

                unCheval.setUnTypeChev(unTypeChev);
                //Cheval.add(unCheval);
                
                Client unClient = new Client();
                unClient.setNom(rs.getString ("nom"));
                
                unCheval.setUnClient(unClient);
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

            requete=connection.prepareStatement("INSERT INTO cheval (nom, sexe, prixDepart,SIRE, id_typeChev)\n" + "VALUES (?,?,?,?,?)");
            requete.setString(1, unCheval.getNom());
            requete.setString(2, unCheval.getSexe());
            requete.setInt(3, unCheval.getPrixDepart());
            requete.setString(4, unCheval.getSire());
            requete.setInt(5, unCheval.getUnTypeChev().getId());

            System.out.println("REQUETE " + requete);
            int resultatRequete = requete.executeUpdate();
            if (resultatRequete == 1){
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unCheval.setId(idGenere);
            }   
            unCheval = getrecupcheval(connection, unCheval.getId());
            }
            else{
                unCheval = null;
            }
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unCheval=null;
        }    
        return unCheval ;    
    }
    
    
     public static Cheval getrecupcheval(Connection connection, int idGenere){      
        Cheval unCheval = new Cheval();
        try
        {
            requete=connection.prepareStatement("select cheval.id, cheval.nom, cheval.sexe, cheval.sire,cheval.prixDepart typecheval.libelle from cheval, typecheval where typecheval.id=cheval.id_typeChev and cheval.id = ? ");
            requete.setInt(1, idGenere);
            rs=requete.executeQuery();
           // System.out.println("reqqqq  " +  requete);
           while (rs.next() ){
               unCheval.setNom(rs.getString("nom"));
               unCheval.setSexe(rs.getString("sexe"));
               unCheval.setPrixDepart(rs.getInt("prixDepart"));
               unCheval.setSire(rs.getString("sire"));
               
               TypeCheval unTypeCheval = new TypeCheval(); 
               unTypeCheval.setLibelle(rs.getString("libelle"));
               unCheval.setUnTypeChev(unTypeCheval);
           }    
           /* Exécution de la requête */
            requete.executeUpdate();
             
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unCheval ;    
    }
     
    public static ArrayList<Client>  getLesClients(Connection connection){      {      
        ArrayList<Client> LesClients = new  ArrayList<Client>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT * from client");          
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Client unClient = new Client();
                unClient.setId(rs.getInt("id"));
                unClient.setNom(rs.getString("nom"));
            
                LesClients.add(unClient);

            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return LesClients ;    
    }

        
        }   
      
    public static ArrayList<Cheval>  getLesChevaux(Connection connection){      
        ArrayList<Cheval> lesChevaux = new  ArrayList<Cheval>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT cheval.id, cheval.nom, typecheval.libelle FROM typecheval, cheval WHERE typecheval.id = cheval.id_typeChev ORDER BY cheval.id");          
            //executer la requete
            
            
            System.out.println("requete  " + requete);
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Cheval unCheval = new Cheval();
                unCheval.setId(rs.getInt("id"));
                unCheval.setNom(rs.getString("nom")); 
                
                
                TypeCheval unTypeChev = new TypeCheval();
                unTypeChev.setId(rs.getInt("id"));
                unTypeChev.setLibelle(rs.getString("libelle"));
                
                unCheval.setUnTypeChev(unTypeChev);
                
                lesChevaux.add(unCheval);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesChevaux ;    
        
    }
   
}



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
import modele.Cheval;
import modele.Lot;
import modele.Vente;

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
            requete=connection.prepareStatement("SELECT Lot.* FROM lot WHERE Lot.id = ?");
        
            //executer la requete
            
            requete.setString(1, idLot);
            System.out.println("requete  " + requete);
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next()) {  
                //Cheval unCheval = new Cheval();
                unLot.setId(rs.getInt("id"));
                unLot.setPrixDepart(rs.getInt("prixDepart"));
                //unLot.setIdCheval(rs.getInt("idCheval"));
              //  unLot.setidVente(rs.getInt("idVente"));
                
                
             
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
        public static ArrayList<Lot> getLesLots(Connection connection){      
        ArrayList<Lot> lesLots = new  ArrayList<Lot>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT lot.* FROM lot, cheval , vente where lot.idcheval =cheval.id and lot.idvente = vente.id order by id");           
            rs=requete.executeQuery();

            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next()) {  
                Lot unLot = new Lot();
                unLot.setId(rs.getInt("id"));
                unLot.setPrixDepart(rs.getInt("prixDepart"));
                
                Cheval unCheval = new Cheval();
                unCheval.setId(rs.getInt("id"));
                unLot.setUnCheval(unCheval);
                                
                Vente uneVente = new Vente();
                uneVente.setId(rs.getInt("id"));
                unLot.setUneVente(uneVente);
                
             lesLots.add(unLot);
                
            }
        }   
        
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesLots;    
    } 
    
    public static Lot ajouterLot(Connection connection, Lot unLot){      
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO lot (id, prixDepart, idCheval, idVente)\n" + "VALUES (?,?,?)");

            requete.setInt(1, unLot.getPrixDepart());
            requete.setString(2,unLot.getUnCheval().getNom());
            requete.setString(3, unLot.getUneVente().getNom());
           
            System.out.println("REQUETE " + requete);
            int resultatRequete = requete.executeUpdate();
            if (resultatRequete == 1){
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unLot.setId(idGenere);
            }   
            unLot = getrecupLot(connection, unLot.getId());
            }
            else{
                unLot = null;
            }
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unLot=null;
        }    
        return unLot ;    
    }
    
    public static Lot getrecupLot(Connection connection, int idGenere){      
        Lot unLot = new Lot();
        try
        {
            requete=connection.prepareStatement("select lot.id, lot.prixDepart, cheval.id, vente.id from lot , cheval,vente where lot.idCheval=cheval.id and vente.id = lot.idVente and lot.id = ? ");
            requete.setInt(1, idGenere);
            rs=requete.executeQuery();
           // System.out.println("reqqqq  " +  requete);
           while (rs.next() ){

               unLot.setPrixDepart(rs.getInt("prixDepart"));
               
               Cheval unCheval = new Cheval(); 
               unCheval.setId(rs.getInt("idcheval"));
               unLot.setUnCheval(unCheval);
               
               Vente uneVente = new Vente(); 
               uneVente.setId(rs.getInt("idvente"));
               unLot.setUneVente(uneVente);
           }    
           /* Exécution de la requête */
            requete.executeUpdate();
             
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unLot ;    
    }
    
    
}
    


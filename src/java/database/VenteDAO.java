/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import modele.CategVente;
import modele.Cheval;
import modele.Client;
import modele.Courriel;
import modele.Lieu;
import modele.Lot;
import modele.Pays;
import modele.TypeCheval;
import modele.Vente;


public class VenteDAO {

    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    static PreparedStatement requeteCategVente = null;
    static ResultSet rsCategVente = null;
    

    public static ArrayList<Vente>  getLesVentes(Connection connection){      
        ArrayList<Vente> lesVentes = new  ArrayList<Vente>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT * from vente, categvente, lieu where categvente.code = vente.codeCategVente AND vente.id_lieu = lieu.id");          
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Vente uneVente = new Vente();
                uneVente.setId(rs.getInt("id"));
                uneVente.setNom(rs.getString("nom"));
                uneVente.setDateDebutVente(rs.getString("dateDebut"));
                
                
                CategVente uneCateg = new CategVente(); 
                uneCateg.setCode(rs.getString("code")); 
                uneCateg.setLibelle(rs.getString("libelle"));
                
                uneVente.setUneCategVente(uneCateg);
                lesVentes.add(uneVente);
                
                Lieu unLieu = new Lieu();
                unLieu.setId(rs.getInt("id"));
                unLieu.setVille(rs.getString("ville"));
                unLieu.setNbBoxes(rs.getInt("nbBoxes"));
                unLieu.setCommentaires(rs.getString("commentaire"));
                
                uneVente.setUnLieu(unLieu);
                
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesVentes ;    
    } 
    

    public static ArrayList<Client>  getLesClients(Connection connection, String codeCateg){      
        ArrayList<Client> lesClients = new  ArrayList<Client>();
        try
        {
            //preparation de la requete     
            //codeCateg="ETE";
            requete=connection.prepareStatement("SELECT c.*, p.nom as nomPays, cv.libelle FROM client c, pays p, clientcategvente cc, categvente cv where c.codePays=p.code and cc.codeClient=c.id and cv.code=cc.codeCategVente and codeCategVente= ? ");
            requete.setString(1, codeCateg);
            //executer la requete
            rs=requete.executeQuery();
             
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                
                
                
                Client unClient = new Client();
                unClient.setId(rs.getInt("id"));
                unClient.setNom(rs.getString("nom"));
                unClient.setPrenom(rs.getString("prenom"));
                unClient.setMail(rs.getString("mail"));
                unClient.setVille(rs.getString("ville"));
                unClient.setRue(rs.getString("rue"));
                unClient.setCopos(rs.getString("copos"));
                
                
                Pays p = new Pays();
                p.setCode(rs.getString("codePays"));
                p.setNom(rs.getString("nomPays"));
                
                unClient.setUnPays(p);
                /*CategVente uneCateg = new CategVente();
                uneCateg.setCode(rs.getString("code"));  // on aurait aussi pu prendre CodeCateg
                uneCateg.setLibelle(rs.getString("libelle"));*/
                
                lesClients.add(unClient);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesClients ;    
    } 
    
    public static ArrayList<Courriel>  getLesCourriels(Connection connection, String idVente){      
        ArrayList<Courriel> lesCourriels = new  ArrayList<Courriel>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT mail.* FROM vente, mail WHERE vente.id = mail.id_vente AND vente.id = ?");          
            //executer la requete
            requete.setString(1, idVente);
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Courriel unCourriel = new Courriel();
                unCourriel.setId(rs.getInt("id"));
                unCourriel.setDate(rs.getString("date_mail"));
                unCourriel.setObjet(rs.getString("objet"));
                unCourriel.setCorps(rs.getString("corps"));
                
                
                lesCourriels.add(unCourriel);
            }
            
        }   

        catch (SQLException e) 
        {
            e.printStackTrace();
        } 
        return lesCourriels ;    
    }
    
    
    
    
    public static ArrayList<Cheval>  getLesChevaux(Connection connection, String idVente){      
        ArrayList<Cheval> lesChevaux = new  ArrayList<Cheval>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT cheval.id, cheval.nom, typecheval.libelle FROM typecheval, cheval, lot, vente WHERE typecheval.id = cheval.id_typeChev AND cheval.id = lot.idCheval AND lot.idVente = vente.id AND vente.id = ?");          
            //executer la requete
            requete.setString(1, idVente);
            
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
    
    public static Vente ajouterVente(Connection connection, Vente uneVente){      
        int idGenere = -1;
        try
        {
           
            requete=connection.prepareStatement("INSERT INTO vente (nom, dateDebut, codeCategVente, id_lieu)\n" + "VALUES (?,?,?,?)" , requete.RETURN_GENERATED_KEYS);
            
            requete.setString(1, uneVente.getNom());
            requete.setString(2, uneVente.getDateDebutVente());
            requete.setString(3, uneVente.getUneCategVente().getCode());
            requete.setInt(4, uneVente.getUnLieu().getId());
            System.out.println("REQUETE " + requete);
           /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            if (resultatRequete == 1){
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                uneVente.setId(idGenere);
            }   
            uneVente = getrecupvente(connection, uneVente.getId());
            }
            else{
                uneVente = null;
            }
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            uneVente=null;
        }    
        return uneVente ;    
    }
    
    public static Vente getrecupvente(Connection connection, int idGenere){      
        Vente uneVente = new Vente();
        try
        {
            requete=connection.prepareStatement("select vente.id, vente.nom, vente.dateDebut, categvente.libelle, lieu.ville from vente, lieu , categvente where lieu.id=vente.id_lieu and categvente.code = vente.codeCategVente and vente.id = ? ");
            requete.setInt(1, idGenere);
            rs=requete.executeQuery();
            
           // System.out.println("reqqqq  " +  requete);
           while (rs.next() ){
               
               uneVente.setNom(rs.getString("Nom"));
               uneVente.setDateDebutVente(rs.getString("dateDebut"));
               
               CategVente uneCateg = new CategVente(); 
               uneCateg.setLibelle(rs.getString("libelle"));
               uneVente.setUneCategVente(uneCateg);

                Lieu unLieu = new Lieu();
                unLieu.setVille(rs.getString("ville"));
                uneVente.setUnLieu(unLieu);
   
           }    



           /* Exécution de la requête */
            requete.executeUpdate();
             
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneVente ;    
    }
    
    
    
}
    
    
    


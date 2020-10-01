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
import modele.TypeCheval;
import modele.Vente;

/**
 *
 * @author sio2
 */
public class TypeChevalDAO {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static ArrayList<TypeCheval>  getLesTypesChev(Connection connection){      {      
        ArrayList<TypeCheval> lesTypesChev = new  ArrayList<TypeCheval>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("SELECT * from typecheval");          
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                TypeCheval unTypeChev = new TypeCheval();
                unTypeChev.setId(rs.getInt("id"));
                unTypeChev.setLibelle(rs.getString("libelle"));
                unTypeChev.setDescription(rs.getString("description"));
                lesTypesChev.add(unTypeChev);

            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesTypesChev ;    
    }
  }
} 
  



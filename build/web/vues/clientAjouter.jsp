<%-- 
    Document   : ClientAjouter
    Author     : Javabien
--%>

<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Pays"%>
<%@page import="formulaires.ClientForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Client Ajouter</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
    <center>
        <h1><u>Nouveau client</u></h1><br>
        
         <%
                //Client client=(Client)request.getAttribute("client");
                ClientForm form = (ClientForm)request.getAttribute("form");
            %>
        
        <form class="form-group" action="ajouterClient" method="POST">
                <label for="nom">Nom : </label>
                <input class="form-control" id="nom" type="text" name="nom"  size="30" maxlength="30">
                </br>
                
                <label for="prenom">Prénom : </label>
                <input class="form-control" id="prenom"  type="text"  name="prenom" size="30" maxlength="30">      
                 </br>
                
                <label for="rue">Adresse : </label>
                <input class="form-control" id="rue"  type="text"  name="rue" size="30" maxlength="50">
                 </br>
                               
                
                <label for="copos">Code postal : </label>
                <input class="form-control" id="copos"  type="text"  name="copos" size="5" maxlength="5">
                </br>
                
                <label for="ville">Ville : </label>
                <input class="form-control" id="ville"  type="text"  name="ville" size="40" maxlength="40">
                </br>
                
                <%-- Champ Liste des pays --%>
                <label for="pays">Pays : </label><br>
                
               
                <select id="codePays" size="5" class="form-control">
                    <%
                        ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                        for (int i=0; i<lesPays.size();i++){
                            Pays p = lesPays.get(i);
                            out.println("<option value='" + p.getCode()+"'>" + p.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br>            
                
                <label for="categVente">Catégorie de vente : <i>(Vous pouvez en choisir plusieurs)</i></label><br>
                <select name="categVente" size="5" multiple class="form-control">
                <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select></br>
                
                
                
                <%-- Cases à cocher permettant de choisir les différentes catégories de vente auxquelles le client souhaite s'inscrire 
                <label for="categVente">Categories de vente : </label></br>
                 <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<input type='checkbox' id='cb" + i + "' name='" + cv.getCode() + "'>"); 
                            out.println(cv.getLibelle()); 
                            out.println("</label></br>");
                        }
                    %>
                    </br>
                    --%>
                 
                
            <input type="submit" name="valider" id="valider" value="Ajouter"/>
            </form>
    </center>
        </div>
    </body>
</html>

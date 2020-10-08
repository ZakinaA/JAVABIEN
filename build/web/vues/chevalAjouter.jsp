<%-- 
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>

<%@page import="formulaires.ChevalForm"%>
<%@page import="modele.TypeCheval"%>
<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Pays"%>
<%@page import="formulaires.ClientForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter un cheval</title>
    </head>
    <body>
        <h1>AJOUTER CHEVAL</h1>
        
         <%
                //Client client=(Client)request.getAttribute("client");
                ChevalForm form = (ChevalForm)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="chevalAjouter" method="POST">
                <label for="nom">Nom : </label>
                <input id="nom" type="text" name="nom"  size="30" maxlength="50">
                </br>
                
                <label for="sexe">Sexe : </label>
                <input type="radio" name="Sexe" value="F" />F
                <input type="radio" name="Sexe" value="M" />M
                 </br>
                
                <label for="prixDepart">Prix de départ : </label>
                <input id="prixDepart"  type="number"  name="prixDepart" size="30" maxlength="10">
                 </br>
                               
                
                <label for="vendeur">Vendeur : </label>
                <input id="vendeur"  type="text"  name="vendeur" size="30" maxlength="50">
                </br>
                
                <label for="proprietaire">Propriétaire : </label>
                <input id="proprietaire"  type="text"  name="proprietaire" size="30" maxlength="50">
                </br>
                
                <label for="SIRE">SIRE : </label>
                <input id="SIRE"  type="text"  name="SIRE" size="30" maxlength="50">
                </br>
               
                </br>            
                
                <label for="TypeCheval">Type de cheval : </label>
                <select name="TypeCheval" size="5" multiple>
                <%
                        ArrayList<TypeCheval> lesTypesChev = (ArrayList)request.getAttribute("pLesTypesChev");
                        for (int i=0; i<lesTypesChev.size();i++){
                            TypeCheval p = lesTypesChev.get(i);
                            out.println("<option value ='" + p.getId() + "'>" + p.getLibelle() + "</option>"); 
                           
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
                 
                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
        
    </body>
</html>



<%@page import="formulaires.VenteForm"%>
<%@page import="modele.CategVente"%>
<%@page import="modele.Lieu"%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter une Vente</title>
    </head>
    <body>
        <h1>AJOUTER VENTE</h1>
        
         <%
                
                VenteForm form = (VenteForm)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="venteAjouter" method="POST">
                

                <label for="nom">Nom : </label>
                <input id="nom" type="text" name="nom"  size="30" maxlength="50">
                 </br>
                
                <label for="date">Date de début : </label>
                <input id="date"  type="date"  name="dateDebut" size="30" maxlength="10">
                 </br>
                
                <label for="categVente">Categorie de vente : </label>
                <select name="categVente" size="5" >
                <%
                        ArrayList<CategVente> uneCategVente = (ArrayList)request.getAttribute("pLesCategVentes");
                        for (int i=0; i<uneCategVente.size();i++){
                            CategVente p = uneCategVente.get(i);
                            out.println("<option value ='" + p.getCode() + "'>" + p.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select>
                
                </br>            
                
                <label for="Lieu">Lieu de vente : </label>
                <select name="lieu" size="5" >
                <%
                        ArrayList<Lieu> lesLieux = (ArrayList)request.getAttribute("pLesLieux");
                        for (int i=0; i<lesLieux.size();i++){
                            Lieu p = lesLieux.get(i);
                            out.println("<option value ='" + p.getId() + "'>" + p.getVille() + "</option>"); 
                        }
                    %>
                </select></br>
                
                              
                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
        
    </body>
</html>

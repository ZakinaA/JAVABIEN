<%-- 
    Document   : lotAjouter
    Created on : 12 nov. 2020, 14:47:23
    Author     : sio2
--%>


<%@page import="modele.Lot"%>
<%@page import="formulaires.ChevalForm"%>
<%@page import="modele.Cheval"%>
<%@page import="modele.Vente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="formulaires.LotForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Cheval ajouter</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
    <center>
        <h1><u>Ajout d'un lot</u></h1><br>


         <%

                LotForm form = (LotForm)request.getAttribute("form");
            %>
        
        <form class="form-group" action="lotAjouter" method="POST">
                <label for="prixDepart">Prix de départ : </label>
                <input class="form-control" id="prixDepart" type="text" name="prixDepart"  size="30" maxlength="50">   
                </br>            
                
                <label for="Cheval">cheval : </label>
                <select class="form-control" name="Cheval" size="5" >
                <%
                        ArrayList<Cheval> lesChevaux = (ArrayList)request.getAttribute("pLesChevaux");
                        for (int i=0; i<lesChevaux.size();i++){
                            Cheval p = lesChevaux.get(i);
                            out.println("<option value ='" + p.getId() + "'>" + p.getNom() + "</option>"); 
                           
                        }
                    %>
                </select></br>
            
                <label for="Vente">vente : </label><br>
                <select name="Vente" size="5"  class="form-control">
                <%
                        ArrayList<Vente> lesVentes = (ArrayList)request.getAttribute("pLesVentes");
                        for (int i=0; i<lesVentes.size();i++){
                            Vente cv = lesVentes.get(i);
                            out.println("<option value ='" + cv.getId() + "'>" + cv.getNom() + "</option>"); 
                           
                        }
                    %>
                </select></br>
                
                 
                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
    </center>
        </div>
    </body>
</html>

<%-- 
    Document   : chevalAjouter
    Author     : Javabien
--%>

<%@page import="modele.Client"%>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Cheval ajouter</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
    <center>
        <h1><u>Nouveau cheval</u></h1><br>


         <%

                ChevalForm form = (ChevalForm)request.getAttribute("form");
            %>
        
        <form class="form-group" action="chevalAjouter" method="POST">
                <label for="nom">Nom : </label>
                <input class="form-control" id="nom" type="text" name="nom"  size="30" maxlength="50">
                </br>
                
                <center>
                <label for="sexe">Sexe : </label>
                <input class="form-control" id="sexe" type="text" name="sexe"  size="30" maxlength="1">
                <br><br></center>
                
                <label for="prixDepart">Prix de départ : </label>
                <input class="form-control" id="prixDepart"  type="number"  name="prixDepart" size="30" maxlength="10">
                 </br>

                <label for="SIRE">SIRE : </label>
                <input class="form-control" id="sire"  type="text"  name="SIRE" size="30" maxlength="50">
                </br>
               
                </br>            
                
                <label for="TypeCheval">Type de cheval : </label>
                <select class="form-control" name="TypeCheval" size="5" >
                <%
                        ArrayList<TypeCheval> lesTypesChev = (ArrayList)request.getAttribute("pLesTypesChev");
                        for (int i=0; i<lesTypesChev.size();i++){
                            TypeCheval p = lesTypesChev.get(i);
                            out.println("<option value ='" + p.getId() + "'>" + p.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select></br>
            
                 
                
            <input type="submit" name="valider" id="valider" value="Ajouter"/>
            </form>
    </center>
        </div>
    </body>
</html>

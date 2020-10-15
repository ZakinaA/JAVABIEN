
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter un cheval</title>
    </head>
    <body>

        <h1>AJOUTER CHEVAL</h1>

        <br><h3><u>Ajouter un cheval</u></h3><br>

        <%@ include file="menu.html"%>
        <div class="container">
    <center>
        <h1><u>Ajout d'un cheval</u></h1><br>


         <%
                //Client client=(Client)request.getAttribute("client");
                ChevalForm form = (ChevalForm)request.getAttribute("form");
            %>
        
        <form class="form-group" action="chevalAjouter" method="POST">
                <label for="nom">Nom : </label>
                <input class="form-control" id="nom" type="text" name="nom"  size="30" maxlength="50">
                </br>
                
                <center>
                <label for="sexe">Sexe : </label>
                <input class="form-control" type="radio" name="Sexe" value="F"/>F
                <input class="form-control" type="radio" name="Sexe" value="M"/>M
                <br><br></center>
                
                <label for="prixDepart">Prix de départ : </label>
                <input class="form-control" id="prixDepart"  type="number"  name="prixDepart" size="30" maxlength="10">
                 </br>

                               
                
<<<<<<< HEAD
                
                
            
=======
                <label for="vendeur">Vendeur : </label>
                <input class="form-control" id="vendeur"  type="text"  name="vendeur" size="30" maxlength="50">
                </br>
                
                <label for="proprietaire">Propriétaire : </label>
                <input class="form-control" id="proprietaire"  type="text"  name="proprietaire" size="30" maxlength="50">
                </br>
<<<<<<< HEAD
>>>>>>> 44a5752f2895d63955d4cfd8b06511f1f9f18ede
=======

>>>>>>> 20dd5599578ef8266db7441ff9e11fd2c16a8472
                
                <label for="SIRE">SIRE : </label>
                <input class="form-control" id="SIRE"  type="text"  name="SIRE" size="30" maxlength="50">
                </br>
               
                </br>            
                
                <label for="TypeCheval">Type de cheval : </label>
                <select class="form-control" name="TypeCheval" size="5" multiple>
                <%
                        ArrayList<TypeCheval> lesTypesChev = (ArrayList)request.getAttribute("pLesTypesChev");
                        for (int i=0; i<lesTypesChev.size();i++){
                            TypeCheval p = lesTypesChev.get(i);
                            out.println("<option value ='" + p.getId() + "'>" + p.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select></br>
                
                <label for="Client">Les Clients : </label>
                <select class="form-control" name="Client" size="5" multiple>
                <% 
                    
                        ArrayList<Client> lesClients = (ArrayList)request.getAttribute("pLesClients");
                        for (int i=0; i<lesClients.size();i++){
                            Client p = lesClients.get(i);
                            out.println("<option value ='" + p.getId() + "'>" + p.getNom() + "</option>"); 
                           
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
    </center>
        </div>
    </body>
</html>

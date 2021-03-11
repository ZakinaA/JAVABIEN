<%-- 
    Document   : listerLesEncheres
    Created on : 15 oct. 2020, 10:17:23
    Author     : sio2
--%>

<%@page import="modele.Enchere"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>Information des enchères</title>
    </head>
    <body>
        <div class="container">
        <h1>En savoir plus sur les enchères </h1>
        <%
       Enchere uneEnchere = (Enchere)request.getAttribute("pUneEnchere");
        %>
        
        <table  class="table">  
            <thead>
                <tr align="center">                 
                    <td><img><%out.println(uneEnchere.getMontant());%></h2></tr>
                    <!--<td><img src="../vues/image/cheval.jpg"/></tr>-->
                    <td><img src="<%out.println(uneEnchere.getMontant());%>"></tr>
                    <td><strong><u>Montant:</u></strong><%out.println(uneEnchere.getMontant());%></tr>                  
                    <td><strong><u>Prix de départ:</u></strong><%out.println(uneEnchere.getUnLot().getPrixDepart());%></tr>
                    <td><strong><u>Date de début de la vente:</u></strong><%out.println(uneEnchere.getUneVente().getDateDebutVente());%></tr>
                    <td><strong><u>Nom de la vente:</u></strong><%out.println(uneEnchere.getUneVente().getNom());%></tr>
                    <td><strong><u>Nom du cheval:</u></strong><%out.println(uneEnchere.getUnCheval().getNom());%></tr>
           
                </tr>
            </thead>           
            <tbody>
            
            
            </tbody>
        </table>
        
         </div>
                      
              <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
         
    </body>
</html>

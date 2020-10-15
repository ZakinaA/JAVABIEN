<%-- 
    Document   : listerLesVentes 
    Author     : Javabien
--%>

<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="menu.html">
       
        <title>Liste des catégories</title>
    </head>
    <body>
        <div class="container">
            <%@ include file="../menu/menu.html"%>
            <center><h1>Liste des catégories de ventes</h1>
        <h4><a href="../ServletAdmin/categorieAjouter">Ajouter une catégorie de vente</a></h4></center>
         <img src="../vues/image/categorie.png" class="img-fluid" alt="Responsive image">
         <%
        ArrayList<CategVente> lesCategVentes = (ArrayList)request.getAttribute("pLesCategVente");
        %>
        <table  class="table table-bordered table-striped table-condensed" border="5">  
            <thead>             
                         
                <tr>             
                    <th>Code</th>
                    <th>Libellé</th>
            <br>
            <br>
                </tr> 
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesCategVentes.size();i++)
                    {
                        
                        CategVente uneCategVente = lesCategVentes.get(i);
                        out.println("<tr><td>");
                        out.println(uneCategVente.getCode());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(uneCategVente.getLibelle());
                        out.println("</td>");
         
                    }
                    %>
                </tr>
            </tbody>
        </table>
                </div>
                
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
    </body>
</html>

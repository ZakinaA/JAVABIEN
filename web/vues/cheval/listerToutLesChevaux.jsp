<%-- 
    Document   : listerToutLesChevaux
    Author     : Javabien
--%>

<%@page import="modele.Cheval"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        
        
        <title>Liste de tous les chevaux</title>
    </head>
    <body>
        
            <%@ include file="../menu/menu.html"%>
            <div class="container">
                <br><center><h1>Liste des chevaux</h1>
                    <a href="../ServletCheval/chevalAjouter"><button class="btn btn-dark" type="button">Ajouter un cheval</button></a>
               
         <%
        ArrayList<Cheval> lesChevaux = (ArrayList)request.getAttribute("pLesChevaux");
        %>
        <table  class="table">  
            <thead>
                <tr align="center">             
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Race</th>
                    <th></th>
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
               
                    <%
                    for(int i = 0; i < lesChevaux.size();i++)
                    {
                        
                        Cheval unCheval = lesChevaux.get(i);
                        out.println("<tr align='center'><td>");
                        out.println(unCheval.getId());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(unCheval.getNom());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getUnTypeChev().getLibelle());
                        out.println("</td>");
                        
                        out.println("<td><a href ='../ServletCheval/listerInfoCheval?idCheval="+ unCheval.getId()+ "'>");
                        out.println("<button type='button' class='btn btn-secondary'>Plus d'information</button>");
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



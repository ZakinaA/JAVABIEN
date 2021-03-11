<%-- 
    Document   : listerToutLesLieux
    Author     : Javabien
--%>

<%@page import="modele.Lieu"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        
        
        <title>Lieux de vente</title>
    </head>
    <body>
        
            <%@ include file="../menu/menu.html"%>
            <center><div class="container">
                <br><h1>Liste des lieux</h1>
                <button type="button" class="btn btn-secondary" disabled>Ajouter un lieu</button>
         <%
        ArrayList<Lieu> lesLieux = (ArrayList)request.getAttribute("pLesLieux");
        %>
        <table  class="table">  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Ville</th>
                    <th>Nombre de boxes</th>
                    <th>Commentaires</th>
 
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesLieux.size();i++)
                    {
                        
                        Lieu unLieu = lesLieux.get(i);
                        out.println("<tr><td>");
                        out.println(unLieu.getId());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(unLieu.getVille());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unLieu.getNbBoxes());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unLieu.getCommentaires());
                        out.println("</td>");
                        
      
                    }
                    %>
                </tr>
            </tbody>
        </table>
        
        </div>
            </center>
    
                
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
         
    </body>
</html>



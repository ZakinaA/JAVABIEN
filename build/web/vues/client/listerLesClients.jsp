<%-- 
    Document   : listerLesClients 
    Author     : Javabien
--%>

<%@page import="modele.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
       
        <title>Liste des clients</title>
    </head>
    <body>
        <%@ include file="../menu/menu.html"%>
        <div class="container">
            
            <br><center><h1>Liste des clients</h1>
                <a href="../ServletClient/ajouterClient"><button class="btn btn-dark" type="button">Ajouter un client</button></a>
             <%    
        ArrayList<Client> lesClients = (ArrayList)request.getAttribute("pLesClients");
        %>
        <table  class="table">  
            <thead>             
                         
                <tr align="center">             
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Adresse</th>  
                    <th>Code postal</th>
                    <th>Ville</th>
                    <th>E-mail</th>

            <br>
            <br>
                </tr> 
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesClients.size();i++)
                    {
                        
                        Client unClient = lesClients.get(i);
                        out.println("<tr align='center'><td>");
                        out.println(unClient.getId());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(unClient.getNom());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unClient.getPrenom());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unClient.getRue());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getCopos());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getVille());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getMail());
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

<%-- 
    Document   : listerLesLots
    Created on : 12 nov. 2020, 12:56:57
    Author     : sio2
--%>
<%@page import="modele.Lot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        
        
        <title>Liste des Lots</title>
    </head>
    <body>
        
            <%@ include file="../menu/menu.html"%>
            <div class="container">
                <center><h1>Liste des lots</h1></center>

         <%
        ArrayList<Lot> lesLots = (ArrayList)request.getAttribute("pLesLots");
        %>
        <table  class="table table-bordered table-striped table-condensed"  border="5">  
            <thead>
                <tr align="center">             
                    <th>Id</th>
                    <th>Prix de départ</th>
                    <th>Cheval</th>
                    <th>Vente</th>
                    
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesLots.size();i++)
                    {
                        
                        Lot unLot = lesLots.get(i);
                        out.println("<tr align='center'><td>");
                        out.println(unLot.getId());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(unLot.getPrixDepart());
                        out.println("€</td>");

                        out.println("<td>");
                        out.println(unLot.getUnCheval().getId());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unLot.getUneVente().getId());
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


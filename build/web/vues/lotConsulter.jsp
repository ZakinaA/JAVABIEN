<%-- 
    Document   : lotConsulter
    Created on : 12 nov. 2020, 14:54:19
    Author     : sio2
--%>

<%@page import="modele.Lot"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        
        <title>Consultation Lot</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
        <h1>Infos Lot</h1>
        
         <%
        Lot unLot = (Lot)request.getAttribute("pLot");
        %>
        
        
         <table class="table table-bordered table-striped table-condensed">
            
           
            <tr><td>Prix de départ :</td><td><%  out.println(unLot.getPrixDepart());%></td>  </tr>
            <tr><td>Cheval :</td><td><%  out.println(unLot.getUnCheval().getNom());%></td>  </tr>
            <tr><td>Vente :</td><td><%  out.println(unLot.getUneVente().getNom());%></td>  </tr>

              </td></tr>
        </table>
        </div>
    </body>
</html>

<%-- 
    Document   : categorieConsulter
    Author     : Javabien
--%>

<%@page import="modele.CategVente"%>
<%@page import="modele.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultation categorie de vente</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <h1>Infos catégorie de vente</h1>
        
         <%
        CategVente uneCategVente = (CategVente)request.getAttribute("pCategVente");
        %>
        
        
         <table class="table table-bordered table-striped table-condensed">
            <tr><td>CODE :</td><td><% out.println(uneCategVente.getCode());%></td></tr>
            <tr><td>LIBELLÉ :</td><td><%  out.println(uneCategVente.getLibelle());%></td>  </tr>
              </td></tr>
        </table>
        
    </body>
</html>

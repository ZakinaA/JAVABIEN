

<%@page import="modele.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        
        <title>Consultation Vente</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
        <h1>Information de la vente</h1>
        
         <%
        Vente uneVente = (Vente)request.getAttribute("pVente");
        %>
        
        
         <table class="table table-bordered table-striped table-condensed">
            
            <tr><td>NOM :</td><td><%  out.println(uneVente.getNom());%></td>  </tr>
            <tr><td>DATE DEBUT  :</td><td><%  out.println(uneVente.getDateDebutVente());%></td>  </tr>
            <tr><td>CATEGORIE VENTE  :</td><td><%  out.println(uneVente.getUneCategVente().getLibelle());%></td>  </tr>
            <tr><td>LIEU  :</td><td><%  out.println(uneVente.getUnLieu().getVille());%></td>  </tr>

              </td></tr>
        </table>
        </div>
    </body>
</html>



<%@page import="modele.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultation Vente</title>
    </head>
    <body>
        <h1>Infos Vente</h1>
        
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
        
    </body>
</html>

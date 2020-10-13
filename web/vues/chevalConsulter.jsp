<%-- 
    Document   : chevalConsulter
    Created on : 8 oct. 2020, 09:42:16
    Author     : sio2
--%>

<%@page import="modele.Cheval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultation Chevaux</title>
    </head>
    <body>
        <h1>Infos Chevaux</h1>
        
        <%
        Cheval unCheval = (Cheval)request.getAttribute("pCheval");
        %>
        
        <table class="table table-bordered table-striped table-condensed">
            <tr><td>NOM :</td><td><% out.println(unCheval.getNom());%></td></tr>
            <tr><td>SEXE :</td><td><%  out.println(unCheval.getSexe());%></td>  </tr>
            <tr><td>PRIXDEDEPART  :</td><td><%  out.println(unCheval.getPrixDepart());%></td>  </tr>
           
            <tr><td>SIRE  :</td><td><%  out.println(unCheval.getSire());%></td>  </tr>
            <tr><td>TYPEDECHEVAL  :</td><td><%  out.println(unCheval.getUnTypeChev());%></td>  </tr>
            <tr><td> Catégories selectionnées</td><td>
                  
         
              </td></tr>
        </table>
        
    </body>
</html>

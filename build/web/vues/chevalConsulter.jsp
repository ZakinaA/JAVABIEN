<%-- 
    Document   : chevalConsulter
    Author     : Javabien
--%>

<%@page import="modele.Cheval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Consultation Chevaux</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
        <h1>Infos Chevaux</h1>
        
        <%
        Cheval unCheval = (Cheval)request.getAttribute("pCheval");
        %>
        
        <table class="table table-bordered table-striped table-condensed">
            <tr><td>NOM :</td><td><% out.println(unCheval.getNom());%></td></tr>
            <tr><td>SEXE :</td><td><%  out.println(unCheval.getSexe());%></td>  </tr>
            <tr><td>PRIX DE DEPART  :</td><td><%  out.println(unCheval.getPrixDepart());%></td>  </tr>
            <tr><td>SIRE  :</td><td><%  out.println(unCheval.getSire());%></td>  </tr>
            <tr><td>TYPE DE CHEVAL  :</td><td><%  out.println(unCheval.getUnTypeChev().getId());%></td>  </tr>
              </td></tr>
        </table>
        </div>
    </body>
</html>

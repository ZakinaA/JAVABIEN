<%-- 
    Document   : consulterClient
    Author     : Javabien
--%>

<%@page import="modele.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Consultation CLient</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <h1>Infos clients</h1>
        
         <%
        Client unClient = (Client)request.getAttribute("pClient");
        %>
        
        
         <table class="table table-bordered table-striped table-condensed">
            <tr><td>NOM :</td><td><% out.println(unClient.getNom());%></td></tr>
            <tr><td>PRENOM :</td><td><%  out.println(unClient.getPrenom());%></td>  </tr>
            <tr><td>ADRESSE  :</td><td><%  out.println(unClient.getRue());%></td>  </tr>
            <tr><td> CODE POSTAL  :</td><td><%  out.println(unClient.getCopos());%></td>  </tr>
          <tr><td> VILLE  :</td><td><%  out.println(unClient.getVille());%></td>  </tr>
          <tr><td> Catégories selectionnées</td><td>
          <% for (int i=0; i<unClient.getLesCategVentes().size(); i++){
               out.println(unClient.getLesCategVentes().get(i).getCode() + "</br>");
             
          }
          %>
              </td></tr>
        </table>
        
    </body>
</html>

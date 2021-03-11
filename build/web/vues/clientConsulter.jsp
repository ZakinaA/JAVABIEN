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
        <title>Information du client</title>
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
        
         <%
        Client unClient = (Client)request.getAttribute("pClient");
        %>
       
        <br>
<div class="card">
  <div class="card-header">
    Information client
  </div>
  <div class="card-body">
    <h5 class="card-title"><% out.println(unClient.getNom());%><%  out.println(unClient.getPrenom());%></h5>
    <p class="card-text"><%  out.println(unClient.getRue());%> - <%  out.println(unClient.getVille());%><%  out.println(unClient.getCopos());%></p>
    <p class="card-text">Catégorie(s) séléctionnée(s) : 
    <% for (int i=0; i<unClient.getLesCategVentes().size(); i++){
               out.println(unClient.getLesCategVentes().get(i).getCode()+",");
             
          }
          %>
    </p>
    <a href="../index.jsp" class="btn btn-dark">Retourner à l'accueil</a>
  </div>
</div>
        </div>
    </body>
</html>

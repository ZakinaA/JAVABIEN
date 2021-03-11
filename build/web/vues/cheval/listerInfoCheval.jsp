<%-- 
    Document   : listerInfoCheval
    Author     : Javabien
--%>

<%@page import="modele.Cheval"%>
<%@page import="modele.TypeCheval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    
        <title>Information du cheval</title>
    </head>
    <body>
        <%@ include file="../menu/menu.html"%>
         <div class="container">
             <br><center><u><h1>Information du cheval</h1></u></center><br>
         <%
       Cheval unCheval = (Cheval)request.getAttribute("pUnCheval");
        %>

        
<div class="card mb-3">
  <div class="row g-0">
    <div class="col-md-4">
        <img class="img-fluid" src="<%out.println(unCheval.getChemin_image());%>" height="100%" width="100%">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%out.println(unCheval.getId());%>- <%out.println(unCheval.getNom());%></h5>
        <p class="card-text">Sexe : <%out.println(unCheval.getSexe());%></p>
        <p class="card-text">Valeur : <%out.println(unCheval.getPrixDepart());%>€</p>
        <p class="card-text">SIRE : <%out.println(unCheval.getSire());%></p>
        <p class="card-text">Race : <%out.println(unCheval.getUnTypeChev().getLibelle());%></p>
        <p class="card-text">Mère : <%out.println(unCheval.getMere());%> - Pére : <%out.println(unCheval.getPere());%></p>
      </div>
    </div>
  </div>
</div>      
</div>
                      
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>      
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>    
</body>
</html>


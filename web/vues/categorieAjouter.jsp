<%@page import="formulaires.CategForm"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajout catégorie vente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="menu.html"%>
        <div class="container">
    <center>
        <h1><u>Nouvelle catégorie de vente</u></h1><br>
        
         <%
                //Client client=(Client)request.getAttribute("client");
                CategForm form = (CategForm)request.getAttribute("form");
            %>

        <form class="form-group" action="categorieAjouter" method="POST">
                <label for="code">Code : </label>
                <input class="form-control" id="code" type="text" name="code"  size="20" maxlength="5">
                <br>
                
                <label for="libelle">Libellé : </label>
                <input class="form-control" id="libelle"  type="text"  name="libelle" size="40" maxlength="30">      
                <br>
                
            <input type="submit" name="valider" id="valider" value="Ajouter"/>
        </form> 
        </div>     
    </body>
</html>

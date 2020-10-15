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
         <div class="container">
        <u><h1>Information du cheval</h1></u>
         <%
       Cheval unCheval = (Cheval)request.getAttribute("pUnCheval");
        %>
        <table  class="table table-bordered table-striped table-condensed"  border="0">  
            
                <tr>           
                    <td><img><%out.println(unCheval.getNom());%></h2></tr>
                    <!--<td><img src="../vues/image/cheval.jpg"/></tr>-->
            
                    <td><img src="<%out.println(unCheval.getChemin_image());%>" height="200" width="250"></tr>
                            
                    <td><strong><u>Id:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getId());%></tr>                  
                    <td><strong><u>Sexe:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getSexe());%></tr>
                   
                    <td><strong><u>Valeur:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getPrixDepart());%>€</tr>                       
        
  
                    <td><strong><u>SIRE:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getSire());%></tr>
                    <td><strong><u>Race:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getUnTypeChev().getLibelle());%></tr>
                    
                        <td><strong><u>Mère:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getMere());%></tr>
                    
                   <!-- <td><strong><u>Mère:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getMere());%></tr>-->
                    <td><strong><u>Père:</u>&nbsp;&nbsp;</strong><%out.println(unCheval.getPere());%></tr>
           
                </tr>
                       
            <tbody>
            
            
            </tbody>
        </table>
        
         </div>
                      
              <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
         
    </body>
</html>


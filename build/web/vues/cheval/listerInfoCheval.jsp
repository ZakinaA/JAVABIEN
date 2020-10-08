<%-- 
    Document   : listerInfoCheval
    Created on : 24 sept. 2020, 08:58:57
    Author     : sio2
--%>

<%@page import="modele.Cheval"%>
<%@page import="modele.TypeCheval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Information du cheval</title>
    </head>
    <body>
        <h1>En savoir plus sur le cheval</h1>
         <%
       Cheval unCheval = (Cheval)request.getAttribute("pUnCheval");
        %>
        <table  class="table table-bordered table-striped table-condensed"  border="0">  
            <thead>
                <tr>                 
                    <td><img><%out.println(unCheval.getNom());%></h2></tr>
                    <!--<td><img src="../vues/image/cheval.jpg"/></tr>-->
                    <td><img src="<%out.println(unCheval.getChemin_image());%>"></tr>
                    <td><strong><u>Id:</u></strong><%out.println(unCheval.getId());%></tr>                  
                    <td><strong><u>Sexe:</u></strong><%out.println(unCheval.getSexe());%></tr>
                    <td><strong><u>Valeur:</u></strong><%out.println(unCheval.getPrixDepart());%></tr>
                    <td><strong><u>Vendeur:</u></strong><%out.println(unCheval.getVendeur());%></tr>
                    <td><strong><u>SIRE:</u></strong><%out.println(unCheval.getSire());%></tr>
                    <td><strong><u>Race:</u></strong><%out.println(unCheval.getUnTypeChev().getLibelle());%></tr>
                    <td><strong><u>Mére:</u></strong><%out.println(unCheval.getMere());%></tr>
                    <td><strong><u>Père:</u></strong><%out.println(unCheval.getPere());%></tr>
           
                </tr>
            </thead>           
            <tbody>
            
            
            </tbody>
        </table>
    </body>
</html>


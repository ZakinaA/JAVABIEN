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
        <table  class="table table-bordered table-striped table-condensed"  border="5">  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Sexe</th>
                    <th>Valeur</th>
                    <th>Vendeur</th>
                    <th>SIRE</th>
                    <th>Race</th>
                    <th>Mére</th>
                    <th>Père</th>
            <br>
            <br>
                </tr>
            </thead>
            
            <tbody>
                <tr>  <%
                        out.println("<td>");
                        out.println(unCheval.getId());
                        out.println("</td>");

                       out.println("<td>");
                       out.println(unCheval.getNom());
                       out.println("</td>");

                        out.println("<td>");
                        out.println(unCheval.getSexe());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getPrixDepart());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getVendeur());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getSire());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getUnTypeChev().getLibelle());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getMere());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getPere());
                        out.println("</td>");
                      %>

            </tbody>
        </table>
    </body>
</html>

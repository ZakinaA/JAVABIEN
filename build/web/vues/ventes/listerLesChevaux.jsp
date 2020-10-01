<%-- 
    Document   : listerLesChevaux
    Created on : 17 sept. 2020, 15:36:59
    Author     : sio2
--%>

<%@page import="modele.Cheval"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../../src/css/styles.css"/>
        <title>LISTE DES CHEVAUX</title>
    </head>
    <body>
        <h1>LISTE DES CHEVAUX</h1>
         <%
        ArrayList<Cheval> lesChevaux = (ArrayList)request.getAttribute("pLesChevaux");
        %>
        <table  class="table table-bordered table-striped table-condensed"  border="5">  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Vendeur</th>
                    <th>Race</th>
                    
 
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesChevaux.size();i++)
                    {
                        
                        Cheval unCheval = lesChevaux.get(i);
                        out.println("<tr align='center'><td>");
                        out.println(unCheval.getId());
                        out.println("</a></td>");

                       out.println("<td>");
                       out.println(unCheval.getNom());
                       out.println("</td>");

                        out.println("<td>");
                        out.println(unCheval.getVendeur());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCheval.getUnTypeChev().getLibelle());
                        out.println("</td>");
                        
                        out.println("<td><a href ='../ServletCheval/listerInfoCheval?idCheval="+ unCheval.getId()+ "'>");
                        out.println("Plus d'information");
                        out.println("</td>");
                        
      
                    }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>


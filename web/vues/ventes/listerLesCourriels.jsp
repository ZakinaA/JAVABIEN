<%-- 
    Document   : listerLesMails
    Created on : 10 sept. 2020, 14:44:47
    Author     : sio2
--%>

<%@page import="modele.Courriel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>LISTE LES COURRIELS POUR UNE CATEGORIE DE VENTE</title>
    </head>
    <body>
        <h1>LISTE DES COURRIELS POUR UNE CATEGORIE DE VENTE</h1>
         <%
        ArrayList<Courriel> lesCourriels = (ArrayList)request.getAttribute("pLesCourriels");
        %>
        <table  class="table table-bordered table-striped table-condensed"  border="5">  
            <thead>
                <tr>             
                    <th>id</th>
                    <th>date</th>
                    <th>objet</th>
                    <th>corps</th>
 
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesCourriels.size();i++)
                    {
                        
                        Courriel unCourriel = lesCourriels.get(i);
                        out.println("<tr align='center'><td>");
                        out.println(unCourriel.getId());
                        out.println("</a></td>");

                         out.println("<td>");
                         out.println(unCourriel.getDate());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unCourriel.getObjet());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unCourriel.getCorps());
                        out.println("</td>");
      
                    }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>

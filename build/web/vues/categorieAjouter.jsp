<%@page import="formulaires.CategForm"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter categorie de vente</title>
    </head>
    <body>
        <h1>Nouvelle catégorie de vente</h1>
        
         <%
                //Client client=(Client)request.getAttribute("client");
                CategForm form = (CategForm)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="categorieAjouter" method="POST">
                <label for="code">Code : </label>
                <input id="code" type="text" name="code"  size="20" maxlength="5">
                </br>
                
                <label for="libelle">Libellé : </label>
                <input id="libelle"  type="text"  name="libelle" size="40" maxlength="30">      
                 </br>
                
                
                </br>            
                
                <%-- Cases à cocher permettant de choisir les différentes catégories de vente auxquelles le client souhaite s'inscrire 
                <label for="categVente">Categories de vente : </label></br>
                 <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<input type='checkbox' id='cb" + i + "' name='" + cv.getCode() + "'>"); 
                            out.println(cv.getLibelle()); 
                            out.println("</label></br>");
                        }
                    %>
                    </br>
                    --%>
                 
                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
        
    </body>
</html>

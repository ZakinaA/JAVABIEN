/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.ChevalDAO;
import database.EnchereDAO;
import formulaires.EnchereForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Enchere;

/**
 *
 * @author sio2
 */
public class ServletEnchere extends HttpServlet {
    
    Connection connection ;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        //try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           /* out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEnchere</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEnchere at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       
        String url = request.getRequestURI();
        
        // Récup et affichage par date décroissante de toutes les ventes   
          
        if(url.equals("/JAVABIEN/ServletEnchere/listerLesEncheres"))
        {  
            String numEnchere = (String) request.getParameter("numEnchere");
            Enchere uneEnchere = EnchereDAO.getUneEnchere(connection, numEnchere);
            request.setAttribute("pUneEnchere", uneEnchere);
            getServletContext().getRequestDispatcher("/vues/vente/listerLesEncheres.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        /* Préparation de l'objet formulaire */
        EnchereForm form = new EnchereForm();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Enchere uneEnchere = form.listerLesEncheres(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pEnchere", uneEnchere );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
            EnchereDAO.listerLesEncheres(connection, uneEnchere);
            this.getServletContext().getRequestDispatcher("/vues/listerLesEncheres.jsp" ).forward( request, response );
        }
        else
        { 
		// il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
            //ArrayList<TypeCheval> lesTypesCheval = TypeChevalDAO.getLesTypesChev(connection);
            //request.setAttribute("pLesTypesChev", lesPays);
            
            //ArrayList<CategVente> lesCategVentes = CategVenteDAO.getLesCategVentes(connection);
            //request.setAttribute("pLesCategVente", lesCategVentes);
           this.getServletContext().getRequestDispatcher("/vues/listerLesEncheres.jsp" ).forward( request, response );
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

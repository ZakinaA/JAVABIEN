/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.ChevalDAO;
import database.LotDAO;
import database.VenteDAO;
import formulaires.LotForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Cheval;
import modele.Lot;
import modele.Vente;

/**
 *
 * @author sio2
 */
public class ServletLot extends HttpServlet {
     Connection connection ;
      
        
    @Override
    public void init()
    {     
        ServletContext servletContext=getServletContext();
        connection=(Connection)servletContext.getAttribute("connection");
    }
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLot</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLot at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String url = request.getRequestURI();
        
        // Récup et affichage par date décroissante de toutes les ventes   
          
        if(url.equals("/JAVABIEN/ServletLot/listerLesLots"))
        {  
            ArrayList<Lot> lesLots = LotDAO.getLesLots(connection);
            System.out.println("REQUETE " + lesLots.size());
            request.setAttribute("pLesLots", lesLots);
            getServletContext().getRequestDispatcher("/vues/ventes/listerLesLots.jsp").forward(request, response);
        }
        
        if(url.equals("/JAVABIEN/ServletLot/lotAjouter"))
        {  

            ArrayList<Cheval> lesChevaux = ChevalDAO.getLesChevaux(connection);
            request.setAttribute("pLesChevaux", lesChevaux);
            
            ArrayList<Vente> lesVentes = VenteDAO.getLesVentes(connection);
            request.setAttribute("pLesVentes", lesVentes);
            
            
            
            getServletContext().getRequestDispatcher("/vues/lotAjouter.jsp").forward(request, response);
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
               
         /* Préparation de l'objet formulaire */
        LotForm form = new LotForm();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Lot unLot = form.ajouterLot(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pLot", unLot );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
            Lot unLot2 = LotDAO.ajouterLot(connection, unLot);
            System.out.println("cheval : " + unLot2);
            this.getServletContext().getRequestDispatcher("/vues/lotConsulter.jsp" ).forward( request, response );
        }
        else
        { 
	
           this.getServletContext().getRequestDispatcher("/vues/lotAjouter.jsp" ).forward( request, response );
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

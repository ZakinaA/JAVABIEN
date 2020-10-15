/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.ChevalDAO;
import database.ClientDAO;
import database.TypeChevalDAO;
import database.Utilitaire;
import formulaires.ChevalForm;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Cheval;
import modele.Client;
import modele.TypeCheval;



/**
 *
 * @author Zakina
 * Classe Servlet permettant d'executer les fonctionnalités relatives aux ventes :
 * Fonctionnalités implémentées :
 *      lister les ventes
 *      lister les clients d'une vente passée en paramètre
 */
public class ServletCheval extends HttpServlet {
    
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
        //response.setContentType("text/html;charset=UTF-8");
        //try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletVentes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletVentes at " + request.getContextPath() + "</h1>");
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
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        
        String url = request.getRequestURI();
        
        // Récup et affichage par date décroissante de toutes les ventes   
          
        if(url.equals("/JAVABIEN/ServletCheval/listerInfoCheval"))
        {  
            String idCheval = (String) request.getParameter("idCheval");
            Cheval unCheval = ChevalDAO.getLeCheval(connection, idCheval);
            request.setAttribute("pUnCheval", unCheval);
            getServletContext().getRequestDispatcher("/vues/cheval/listerInfoCheval.jsp").forward(request, response);
        }
        
        if(url.equals("/JAVABIEN/ServletCheval/chevalAjouter"))
        {  
            ArrayList<TypeCheval> lesTypesChev = TypeChevalDAO.getLesTypesChev(connection);
            System.out.println ("les types " + lesTypesChev.size());
            request.setAttribute("pLesTypesChev", lesTypesChev);
            
            ArrayList<Client> lesClients = ChevalDAO.getLesClients(connection);
            System.out.println ("lesclients" + lesClients.size());
            request.setAttribute("pLesClients", lesClients);
            
            getServletContext().getRequestDispatcher("/vues/chevalAjouter.jsp").forward(request, response);
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
        ChevalForm form = new ChevalForm();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Cheval unCheval = form.ajouterCheval(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pCheval", unCheval );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
            ChevalDAO.ajouterCheval(connection, unCheval);
            this.getServletContext().getRequestDispatcher("/vues/chevalConsulter.jsp" ).forward( request, response );
        }
        else
        { 
		// il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
            //ArrayList<TypeCheval> lesTypesCheval = TypeChevalDAO.getLesTypesChev(connection);
            //request.setAttribute("pLesTypesChev", lesPays);
            
            //ArrayList<CategVente> lesCategVentes = CategVenteDAO.getLesCategVentes(connection);
            //request.setAttribute("pLesCategVente", lesCategVentes);
           this.getServletContext().getRequestDispatcher("/vues/chevalAjouter.jsp" ).forward( request, response );
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
    }
    
  public void destroy(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try
        {
            //fermeture
            System.out.println("Connexion fermée");
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            System.out.println("Erreur lors de l’établissement de la connexion");
        }
        finally
        {
            //Utilitaire.fermerConnexion(rs);
            //Utilitaire.fermerConnexion(requete);
            Utilitaire.fermerConnexion(connection);
        }
    }
}
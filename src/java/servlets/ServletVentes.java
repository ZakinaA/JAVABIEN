/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.CategVenteDAO;
import database.LieuDAO;
import database.Utilitaire;
import database.VenteDAO;
import formulaires.VenteForm;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.CategVente;
import modele.Cheval;
import modele.Client;
import modele.Courriel;
import modele.Lieu;
import modele.Vente;


/**
 *
 * @author Zakina
 * Classe Servlet permettant d'executer les fonctionnalités relatives aux ventes :
 * Fonctionnalités implémentées :
 *      lister les ventes
 *      lister les clients d'une vente passée en paramètre
 */
public class ServletVentes extends HttpServlet {
    
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
          
        if(url.equals("/JAVABIEN/ServletVentes/listerLesVentes"))
        {  
            ArrayList<Vente> lesVentes = VenteDAO.getLesVentes(connection);
            request.setAttribute("pLesVentes", lesVentes);
            getServletContext().getRequestDispatcher("/vues/ventes/listerLesVentes.jsp").forward(request, response);
        }
        
        
        // Récup et affichage des clients interessés par une certaine catégorie de ventes
        if(url.equals("/JAVABIEN/ServletVentes/listerLesClients"))
        {  
           System.out.println("DANS LISTER LES CLIENTS");
            String codeCat = (String)request.getParameter("codeCat");
           
            
            ArrayList<Client> lesClients = VenteDAO.getLesClients(connection, codeCat);
            request.setAttribute("pLesClients", lesClients);
            getServletContext().getRequestDispatcher("/vues/ventes/listerLesClients.jsp").forward(request, response);
        }
        
                // Récup et affichage par date décroissante de toutes les ventes   
          
        if(url.equals("/JAVABIEN/ServletVentes/listerLesCourriels"))
        {  
            String idVente = (String) request.getParameter("idVente");
            ArrayList<Courriel> lesCourriels = VenteDAO.getLesCourriels(connection, idVente);
            request.setAttribute("pLesCourriels", lesCourriels);
            getServletContext().getRequestDispatcher("/vues/ventes/listerLesCourriels.jsp").forward(request, response);
        }
        
        if(url.equals("/JAVABIEN/ServletVentes/listerLesChevaux"))
        {  
            String idVente = (String) request.getParameter("idVente");
            ArrayList<Cheval> lesChevaux = VenteDAO.getLesChevaux(connection,idVente);
            System.out.println("nb chevaux " + lesChevaux.size() );
            request.setAttribute("pLesChevaux", lesChevaux);
            getServletContext().getRequestDispatcher("/vues/ventes/listerLesChevaux.jsp").forward(request, response);
        }
        

        if(url.equals("/JAVABIEN/ServletVentes/venteAjouter"))
        {  
            ArrayList<CategVente> lesCategVentes = CategVenteDAO.getLesCategVentes(connection);
            System.out.println ("les categVentes " + lesCategVentes.size());
            request.setAttribute("pLesCategVentes", lesCategVentes);
            
            
            ArrayList<Lieu> lesLieux = LieuDAO.getLesLieux(connection);
            System.out.println ("les Lieux " + lesLieux.size());
            request.setAttribute("pLesLieux", lesLieux);
            
            getServletContext().getRequestDispatcher("/vues/venteAjouter.jsp").forward(request, response);
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
        VenteForm form = new VenteForm();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Vente uneVente = form.ajouterVente(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        //request.setAttribute( "pVente", uneVente );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
            Vente uneVente2= VenteDAO.ajouterVente(connection, uneVente);
            //uneVente2 = null;
            System.out.println("vente : " + uneVente2);
            if (uneVente2 != null){
             //  System.out.println("vente N'EST PAS NUL: " + uneVente2);
                request.setAttribute("pVente", uneVente2);
                this.getServletContext().getRequestDispatcher("/vues/venteConsulter.jsp" ).forward( request, response );
            }
            else{
              //  System.out.println("vente EST NUL: " + uneVente2);
                this.getServletContext().getRequestDispatcher("/vues/venteAjouter.jsp" ).forward( request, response );
            }
        }
    }
    
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

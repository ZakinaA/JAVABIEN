package org.apache.jsp.vues.ventes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modele.Client;
import java.util.ArrayList;

public final class listerLesClients_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("        <title>LISTE LES CLIENTS POUR UNE CATEGORIE DE VENTE</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>LISTE DES CLIENTS POUR UNE CATEGORIE DE VENTE</h1>\n");
      out.write("         ");

        ArrayList<Client> lesClients = (ArrayList)request.getAttribute("pLesClients");
        
      out.write("\n");
      out.write("        <table  class=\"table table-bordered table-striped table-condensed\"  border=\"5\">  \n");
      out.write("            <thead>\n");
      out.write("                <tr>             \n");
      out.write("                    <th>id</th>\n");
      out.write("                    <th>nom</th>\n");
      out.write("                    <th>prenom</th>\n");
      out.write("                    <th>mail</th>\n");
      out.write("                    <th>ville</th> \n");
      out.write("                    <th>adresse</th>\n");
      out.write("                    <th>code postal</th>\n");
      out.write("                    <th>pays</th>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    ");

                    for(int i = 0; i < lesClients.size();i++)
                    {
                        
                        Client unClient = lesClients.get(i);
                        out.println("<tr align='center'><td>");
                        out.println(unClient.getId());
                        out.println("</a></td>");

                         out.println("<td>");
                         out.println(unClient.getNom());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unClient.getPrenom());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getMail());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getVille());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getRue());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getCopos());
                        out.println("</td>");
                       
                        out.println("<td>");
                        out.println(unClient.getUnPays().getNom());
                        out.println("</td>");
                        
                               
                    }
                    
      out.write("\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

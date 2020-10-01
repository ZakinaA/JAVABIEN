package org.apache.jsp.vues.ventes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modele.Cheval;
import java.util.ArrayList;

public final class listerLesChevaux_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../../src/css/styles.css\"/>\r\n");
      out.write("        <title>LISTE DES CHEVAUX</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>LISTE DES CHEVAUX</h1>\r\n");
      out.write("         ");

        ArrayList<Cheval> lesChevaux = (ArrayList)request.getAttribute("pLesChevaux");
        
      out.write("\r\n");
      out.write("        <table  class=\"table table-bordered table-striped table-condensed\"  border=\"5\">  \r\n");
      out.write("            <thead>\r\n");
      out.write("                <tr>             \r\n");
      out.write("                    <th>Id</th>\r\n");
      out.write("                    <th>Nom</th>\r\n");
      out.write("                    <th>Vendeur</th>\r\n");
      out.write("                    <th>Race</th>\r\n");
      out.write("                    \r\n");
      out.write(" \r\n");
      out.write("            <br>\r\n");
      out.write("            <br>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("            <tbody>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    ");

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
                    
      out.write("\r\n");
      out.write("                </tr>\r\n");
      out.write("            </tbody>\r\n");
      out.write("        </table>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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

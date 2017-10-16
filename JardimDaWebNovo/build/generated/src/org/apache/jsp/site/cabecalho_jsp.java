package org.apache.jsp.site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.CategoriaDAO;
import java.util.List;
import modelo.Categoria;
import dao.UsuarioDAO;
import modelo.Usuario;

public final class cabecalho_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<html><head>\n");
      out.write("    <title>Jardim da Web</title>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <script type=\"text/javascript\" src=\"http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js\"></script>\n");
      out.write("    <link href=\"http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    <link href=\"css/css da index.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("  </head>\n");
 
    Usuario usuario = new Usuario();
    UsuarioDAO Usuariodao = new UsuarioDAO();
    
    CategoriaDAO Cdao = new CategoriaDAO();
    List<Categoria> Clista = Cdao.listar();
    

      out.write("\n");
      out.write("  <body>\n");
      out.write("    <div class=\"navbar navbar-default navbar-static-top\">\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("          <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navbar-ex-collapse\"></button>\n");
      out.write("          <a class=\"brand\" href=\"index.jsp\"><span><img src=\"css/home.png\" height=\"26\" width=\"50\" class=\"img-circle img-responsive\"></span></a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbar-ex-collapse\">\n");
      out.write("          <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("            <!-- Categoria -->\n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("                <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Plantas<span></span></a>\n");
      out.write("                <ul class=\"dropdown-menu\">\n");
      out.write("                    ");
for(Categoria Citem: Clista){ 
      out.write("\n");
      out.write("                        <li><a class=\"list\" href=\"listaPlanta.jsp?categoria=");
      out.print(Citem.getCodigo());
      out.write('"');
      out.write('>');
      out.print(Citem.getNome() );
      out.write("</a></li>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("                <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Doações<span></span></a>\n");
      out.write("                <ul class=\"dropdown-menu\">\n");
      out.write("                    <li><a href=\"listaDoacao.jsp\">Árvores</a></li>\n");
      out.write("                    <li><a href=\"listaDoacao.jsp\">Temperos</a></li>\n");
      out.write("                    <li><a href=\"listaDoacao.jsp\">Chás</a></li>\n");
      out.write("                    <li><a href=\"listaDoacao.jsp\">Flores</a></li>\n");
      out.write("                    <li><a href=\"listaDoacao.jsp\">Verduras</a></li>\n");
      out.write("                    <li><a href=\"listaDoacao.jsp\">Legumes</a></li>\n");
      out.write("                    <li><a href=\"listaDoacao.jsp\">PANC's</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("              <a href=\"#\">Contato</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("                ");
if (session.getAttribute("usuario") != null) { 
      out.write("\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Categoria<span></span></a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                        <li><a href=\"addCategoria.jsp\">Add Categoria</a></li>\n");
      out.write("                        <li><a href=\"gerenciarCategoria.jsp\">Gerenciar Categoria</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                ");
} 
      out.write("\n");
      out.write("            </li>\n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("                ");
if (session.getAttribute("usuario") != null) { 
      out.write("\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Planta<span></span></a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                        <li><a href=\"addPlanta.jsp\">Add Planta</a></li>\n");
      out.write("                        <li><a href=\"gerenciarPlanta.jsp\">Gerenciar Planta</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                ");
} 
      out.write("\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <form class=\"form-inline my-2 my-lg-0\">\n");
      out.write("                    <input class=\"form-control mr-sm-2\" name=\"txtPesquisar\" type=\"text\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("                    <button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Search</button>\n");
      out.write("                </form>\n");
      out.write("            </li>\n");
      out.write("            <li> \n");
      out.write("                ");
if (session.getAttribute("usuario") == null) { 
      out.write("\n");
      out.write("                    <a href=\"login.jsp\"><img src=\"css/person.png\"></a>\n");
      out.write("                ");
}else{ 
      out.write("\n");
      out.write("                    <a href=\"meuPerfil.jsp\"><img src=\"css/person.png\" ></a>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </li>\n");
      out.write("            \n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
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

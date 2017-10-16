package org.apache.jsp.site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.CategoriaDAO;
import java.util.List;
import modelo.Categoria;
import dao.UsuarioDAO;
import modelo.Usuario;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/site/cabecalho.jsp");
    _jspx_dependants.add("/site/modalExcluirUsuario.jsp");
    _jspx_dependants.add("/site/rodape.jsp");
  }

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
      out.write("            <li> \n");
      out.write("                ");
if (session.getAttribute("usuario") == null) { 
      out.write("\n");
      out.write("                    ");
if (session.getAttribute("usuario") != null) { 
      out.write("\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\"><img src=\"css/config.png\" ><span></span></a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                        <li><a href=\"updUsuario.jsp?codigo=");
      out.print(usuario.getCodigo());
      out.write("\" class=\"btn btn-primary\">Editar conta</a></li>\n");
      out.write("                        <li><button class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModalUsuario\" onclick=\"codigo=");
      out.print(usuario.getCodigo());
      out.write("\">Excluir conta</button></li>\n");
      out.write("                    </ul>\n");
      out.write("                ");
} 
      out.write("\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </li>\n");
      out.write("            <li>\n");
      out.write("                <nav class=\"navbar navbar-light bg-light justify-content-between\">\n");
      out.write("                    <form class=\"form-inline\">\n");
      out.write("                        <input class=\"form-control mr-sm-2\" type=\"text\" name=\"txtPesquisar\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("                        <button class=\"btn btn-primary\" type=\"submit\">Search</button>\n");
      out.write("                    </form>\n");
      out.write("                </nav>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("<!-- Button trigger modal -->\n");
      out.write("<!-- Modal -->\n");
      out.write("<div class=\"modal fade\" id=\"myModalUsuario\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("    <div class=\"modal-dialog\">\n");
      out.write("        <div class=\"modal-content\">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                <h4 class=\"modal-title\" id=\"myModalLabel\">Exclusão</h4>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\">\n");
      out.write("                Tem certeza que deseja excluir?\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancelar</button>\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" onclick=\"excluir()\">Confirmar Exclusão</button>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- /.modal-content -->\n");
      out.write("    </div>\n");
      out.write("    <!-- /.modal-dialog -->\n");
      out.write("</div>\n");
      out.write("<!-- /.modal -->\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    var codigo;\n");
      out.write("    function excluir(){\n");
      out.write("        document.location.href = \"meuPerfil.jsp?codigo=\"+codigo;\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"cover\">\n");
      out.write("      <div class=\"cover-image\" style=\"background-image : url('https://unsplash.imgix.net/photo-1422022098106-b3a9edc463af?w=1024&amp;q=50&amp;fm=jpg&amp;s=bbe0beb19ba846e0de37abd1f63acf13')\"></div>\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-md-12 text-center\">\n");
      out.write("            <h1>\n");
      out.write("              <b>Jardim da Web</b>\n");
      out.write("            </h1>\n");
      out.write("            <p>\n");
      out.write("              <b>Um novo jeito de cuidar da sua saúde.</b>\n");
      out.write("            </p>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <footer class=\"section section-primary\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-sm-6\">\n");
      out.write("            <div class=\"col-sm-6 col-md-12\">\n");
      out.write("              <h1>Sugestões</h1>\n");
      out.write("              <form>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                  <textarea class=\"form-control\" placeholder=\"Sugestões aqui...\" name=\"txtSugestao\"></textarea>\n");
      out.write("                </div>\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n");
      out.write("              </form>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-sm-6\">\n");
      out.write("            <p class=\"text-info text-right\">\n");
      out.write("              <br>\n");
      out.write("              <br>\n");
      out.write("            </p>\n");
      out.write("            <div class=\"row\">\n");
      out.write("              <div class=\"col-md-12 hidden-lg hidden-md hidden-sm text-left\">\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-instagram text-inverse\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-twitter text-inverse\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-facebook text-inverse\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-github text-inverse\"></i></a>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("              <div class=\"col-md-12 hidden-xs text-right\">\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-instagram text-inverse\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-twitter text-inverse\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-facebook text-inverse\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-3x fa-fw fa-github text-inverse\"></i></a>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </footer>\n");
      out.write("  \n");
      out.write("\n");
      out.write("</body></html>");
      out.write('\n');
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

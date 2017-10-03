package org.apache.jsp.site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import util.Criptografia;
import dao.UsuarioDAO;
import modelo.Usuario;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/site/cabecalho.jsp");
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

      out.write('\n');
      out.write('\n');
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
 
    Usuario usuario;

      out.write("\n");
      out.write("  <body>\n");
      out.write("    <div class=\"navbar navbar-default navbar-static-top\">\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("          <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#navbar-ex-collapse\"></button>\n");
      out.write("          <a class=\"navbar-brand\" href=\"home/index.jsp\"><span><img src=\"css/logo.png\" height=\"34\" width=\"83\"></span></a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbar-ex-collapse\">\n");
      out.write("          <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("                <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Categorias<span></span></a>\n");
      out.write("                <ul class=\"dropdown-menu\">\n");
      out.write("                    <li><a href=\"listaPlanta.jsp\">Árvores</a></li>\n");
      out.write("                    <li><a href=\"listaPlanta.jsp\">Temperos</a></li>\n");
      out.write("                    <li><a href=\"listaPlanta.jsp\">Chás</a></li>\n");
      out.write("                    <li><a href=\"listaPlanta.jsp\">Flores</a></li>\n");
      out.write("                    <li><a href=\"listaPlanta.jsp\">Verduras</a></li>\n");
      out.write("                    <li><a href=\"listaPlanta.jsp\">Legumes</a></li>\n");
      out.write("                    <li><a href=\"listaPlanta.jsp\">PANC's</a></li>\n");
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
      out.write("            <li>\n");
      out.write("              <a href=\"login.jsp\">Meu Perfil</a>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("<link href=\"../css do login.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
 
    UsuarioDAO dao = new UsuarioDAO();
    
    if(request.getMethod().equals("POST")){
        //tentativa de login
        
        usuario = dao.login(request.getParameter("txtEmail"));
        
        String senha = Criptografia.convertPasswordToMD5(request.getParameter("txtSenha"));
        
        if(senha.equals(usuario.getSenha())){
            //criar a minha session
            //se a senha estiver certa, ele loga
            session.setAttribute("usuario", usuario);
            //redirecionar para o perfil
            response.sendRedirect("meuPerfil.jsp"); //depois eu vou direto pro perfil do usuario
        }
    }
    //Não ta entrando com post
    


      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"section\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-md-6\">\n");
      out.write("            <div class=\"section\">\n");
      out.write("              <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                  <div class=\"col-md-6\">\n");
      out.write("                    <h1 class=\"text-center\">Criar nova conta</h1>\n");
      out.write("                    <center>\n");
      out.write("                      <!--<button type=\"button\" onClick=\"usuario/addUsuario.jsp\" class=\"btn btn-lg btn-primary\" disabled=\"\">Criar conta</button> -->\n");
      out.write("                      <a href=\"addUsuario.jsp\" class=\"btn btn-lg btn-primary\">Criar Conta</a>\n");
      out.write("                    </center>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-6\">\n");
      out.write("            <form method=\"post\" action=\"meuPerfil.jsp\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                    <input type=\"email\" name=\"txtEmail\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"Enter email\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                    <input type=\"password\" name=\"txtSenha\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-check\">\n");
      out.write("                    <label class=\"form-check-label\">\n");
      out.write("                    <input type=\"checkbox\" class=\"form-check-input\">Check me out</label>\n");
      out.write("                </div>\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n");
      out.write("            </form>\n");
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

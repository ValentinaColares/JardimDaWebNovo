
<%@page import="modelo.Planta"%>
<%@page import="dao.PlantaDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<html><head>
    <title>Jardim da Web</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/css da index.css" rel="stylesheet" type="text/css">
  </head>
<% 
    
    Usuario usuario = new Usuario();
    UsuarioDAO Usuariodao = new UsuarioDAO();
    
    CategoriaDAO Cdao = new CategoriaDAO();
    List<Categoria> Clista = Cdao.listar();
    
    PlantaDAO Pdao = new PlantaDAO();
    List<Planta> Plista;
    
    if (request.getParameter("txtFiltro") != null) {
        Plista = Pdao.listar(request.getParameter("txtFiltro"));
        
    }
    
%>
    <body>
        <div class="navbar navbar-default navbar-static-top">

            <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse"></button>
              <a class="brand" href="index.jsp"><span><img src="css/home.png" height="26" width="50" class="img-circle img-responsive"></span></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-ex-collapse">
              <ul class="nav navbar-nav navbar-right">
                <!-- Categoria -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Plantas<span></span></a>
                    <ul class="dropdown-menu">
                        <%for(Categoria Citem: Clista){ %>
                            <li><a class="list" href="listaPlanta.jsp?categoria=<%=Citem.getCodigo()%>"><%=Citem.getNome() %></a></li>
                        <% } %>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Doações<span></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="listaDoacao.jsp">Árvores</a></li>
                        <li><a href="listaDoacao.jsp">Temperos</a></li>
                        <li><a href="listaDoacao.jsp">Chás</a></li>
                        <li><a href="listaDoacao.jsp">Flores</a></li>
                        <li><a href="listaDoacao.jsp">Verduras</a></li>
                        <li><a href="listaDoacao.jsp">Legumes</a></li>
                        <li><a href="listaDoacao.jsp">PANC's</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <%if (session.getAttribute("usuario") != null) { %>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categoria<span></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="addCategoria.jsp">Add Categoria</a></li>
                            <li><a href="gerenciarCategoria.jsp">Gerenciar Categoria</a></li>
                        </ul>
                    <%} %>
                </li>
                <li class="dropdown">
                    <%if (session.getAttribute("usuario") != null) { %>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Planta<span></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="addPlanta.jsp">Add Planta</a></li>
                            <li><a href="gerenciarPlanta.jsp">Gerenciar Planta</a></li>
                        </ul>
                    <%} %>
                </li>
                <li>
                    <a href="#">Contato</a> 
                </li>
                <li> 
                    <%if (session.getAttribute("usuario") == null) { %>
                        <a href="login.jsp"><img src="css/person.png"></a>
                    <%}else{ %>
                        <a href="meuPerfil.jsp"><img src="css/person.png" ></a>
                    <%}%>
                </li>
                <li class="dropdown">
                    <%if (session.getAttribute("usuario") != null) { %>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="css/ic_con.png"><span></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="sair.jsp">Sair</a></li>
                        </ul>
                    <%} %>
                </li>

                <li>
                    <nav class="navbar navbar-light bg-light justify-content-between">
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="text" name="txtFiltro" placeholder="Search" aria-label="Search">
                            <button class="btn btn-primary" type="submit">Search</button>
                        </form>
                    </nav>
                </li>
              </ul>

            </div>
          </div>
        </div>


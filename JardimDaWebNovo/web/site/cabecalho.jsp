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
%>
  <body>
    <div class="navbar navbar-default navbar-static-top">
        
        <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse"></button>
          <a class="navbar-brand" href="index.jsp"><span><img src="css/logo.png" height="34" width="83"></span></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categorias<span></span></a>
                <ul class="dropdown-menu">
                    <%for(Categoria Citem: Clista){ %>
                        <li><a class="list" href="listaPlanta.jsp?categoria=<%=Citem.getCodigo()%>"><%=Citem.getNome() %></a></li>
                    <% } %>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Doa��es<span></span></a>
                <ul class="dropdown-menu">
                    <li><a href="listaDoacao.jsp">�rvores</a></li>
                    <li><a href="listaDoacao.jsp">Temperos</a></li>
                    <li><a href="listaDoacao.jsp">Ch�s</a></li>
                    <li><a href="listaDoacao.jsp">Flores</a></li>
                    <li><a href="listaDoacao.jsp">Verduras</a></li>
                    <li><a href="listaDoacao.jsp">Legumes</a></li>
                    <li><a href="listaDoacao.jsp">PANC's</a></li>
                </ul>
            </li>
            <li>
              <a href="#">Contato</a>
            </li>
            <li>
              <a href="login.jsp">Meu Perfil</a>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categoria<span></span></a>
                <ul class="dropdown-menu">
                    <li><a href="addCategoria.jsp">Add Categoria</a></li>
                    <li><a href="gerenciarCategoria.jsp">Gerenciar Categoria</a></li>
                </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>

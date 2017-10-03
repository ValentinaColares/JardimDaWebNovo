<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@include file="cabecalho.jsp"%>
<link href="../meuPerfil.css" rel="stylesheet" type="text/css">

<% 
    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = dao.listar();
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{   
        usuario = ((Usuario) session.getAttribute("usuario"));
    
        
        if (request.getParameter("txtFiltro") != null) {
            //lista = dao.listar(request.getParameter("txtFiltro"));

        } else{ 

        //verifico se é excluir
            if(request.getParameter("codigo") != null){
                obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
                if(obj != null){
                    dao.excluir(obj);
                }
                response.sendRedirect("index.jsp");
            }
        }
        
    }
%>

    <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-center">Meu Perfil</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png" class="img-circle img-responsive">
                    </div>
                    <div class="col-md-10">
                        <h3 class="text-left">
                            <b>Ursinha</b>
                        </h3>
                        <!--<p class="text-left">Lorem ipsum dolor sit amet, adipiscing elit Aenean commodo ligula eget.</p> -->
                        <p>Residente na rua 14 número 1014</p>
                        <p>Vila Operária - Candiota - RS</p>
                        <p>CEP: 96495-000</p>
                        <p>Amante de rosas e chás, sobrevive do amor de sua família e sua filhotinha
                            Florzinha. Sempre de boas, adora lagartear no sol e tomar um matezinho!</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
                        <h2>
                            <b>Planta</b>
                        </h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
                        <h2>A title</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive img-rounded">
                        <h2>A title</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
                        <h2>A title</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
                        <h2>
                            <b>Doação</b>
                        </h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
                        <h2>A title</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive img-rounded">
                        <h2>A title</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
                        <h2>A title</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                </div>
            </div>
        </div>

<%@include file="rodape.jsp"%>

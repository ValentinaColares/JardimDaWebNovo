<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@include file="cabecalho.jsp"%>
<link href="../meuPerfil.css" rel="stylesheet" type="text/css">

<% 
    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = dao.listar();
    
    Pdao = new PlantaDAO();
    Plista = Pdao.listar();
    
    Ddao = new DoacaoDAO();
    Dlista = Ddao.listar();    
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{   
        
        usuario = ((Usuario) session.getAttribute("usuario"));
    
        
        if (request.getParameter("txtFiltro") != null) {
            lista = dao.listar(request.getParameter("txtFiltro"));

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
                        <%if(usuario.getImagem() == null){ %>
                            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png" class="img-circle img-responsive">
                        <%}else{ %>
                            <img src="../Fotos/<%=usuario.getImagem() %>" width="200" height="160" class="img-circle img-responsive">
                        <%} %>
                    </div>
                    <div class="col-md-10">
                        <h3 class="text-left">
                            <b><%=usuario.getNome() %></b>&nbsp;<a href="updUsuario.jsp?codigo=<%=usuario.getCodigo() %>" class="btn btn-primary"><img src="css/ic_edit.png" ></a> <!-- Separa o botão do editar do de excluir --> <button class="btn btn-primary" data-toggle="modal" data-target="#myModalUsuario" onclick="codigo=<%=usuario.getCodigo() %>"><img src="css/ic_delete.png"></button> 
                        
                        </h3>
                            
                        <!--<p class="text-left">Lorem ipsum dolor sit amet, adipiscing elit Aenean commodo ligula eget.</p> -->
                        <p><%=usuario.getEmail() %></p>
                        <p>Residente na <%=usuario.getEndereco() %></p>
                        <p><%=usuario.getBairro() %> - <%=usuario.getCidade() %> - <%=usuario.getEstado() %></p>
                        <p>CEP: <%=usuario.getCep() %></p>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                    <!-- Aqui vai planta -->
                    <%
                        for(Planta Pitem : Plista){
                    %>
                    <div class="col-md-3 col-sm-6 hero-feature">
                        <div class="thumbnail">
                            <%if(Pitem.getImagem() == null){ %>    
                            <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>"><img src="http://placehold.it/800x500" alt=""></a>
                            <%} else if(Pitem.getImagem() != null){ %>
                            <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>"><img src="../Fotos/<%=Pitem.getImagem() %>" width="800" height="500"></a>
                            <% } %>
                            <div class="caption">
                                <h3><%=Pitem.getNomePopular() %></h3>
                                <h4><%=Pitem.getNomeCientifico()%></h4>
                                <p><%=Pitem.getCodigoCategoria().getNome() %></p>
                                <p><%=Pitem.getDescricao()%></p>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    
                </div>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                   <!-- Aqui vai a doação -->
                   <%
                    for(Doacao Ditem : Dlista){ 
                %>
                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <%if(Ditem.getCodigoItensdoacao().getCodigoPlanta().getImagem() == null){ %>    
                            <a href="detalheDoacao.jsp?codigo=<%=Ditem.getCodigo()%>"><img src="http://placehold.it/800x500" alt=""></a>
                            <%} else if(Ditem.getCodigoItensdoacao().getCodigoPlanta().getImagem() != null){ %>
                            <a href="detalheDoacao.jsp?codigo=<%=Ditem.getCodigo()%>"><img src="../Fotos/<%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getImagem() %>" width="800" height="500"></a>
                        <% } %>
                        <div class="caption">
                            <h2><%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getNomePopular()%></h2>
                            <h4><%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getNomeCientifico()%></h4>
                            <p><%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getCodigoCategoria().getNome() %></p>
                            <p>
                              <strong>Planta doada? </strong><%if(Ditem.getDoada() == true){%>Sim<%}else{%>Não<%}%></p>
                            
                            
                        </div>
                    </div>
                </div>
                <%} %>
                </div>
            </div>
        </div>
<%@include file="modalExcluirUsuario.jsp" %>
<%@include file="rodape.jsp"%>

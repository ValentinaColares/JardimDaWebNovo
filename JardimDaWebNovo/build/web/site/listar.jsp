<%@page import="dao.DoacaoDAO"%>
<%@page import="modelo.Doacao"%>
<%@include file="cabecalho.jsp"%>
<link href="css/listaDoacao.css" rel="stylesheet" type="text/css">

<%
    Planta Pobj = new Planta();
    Pdao = new PlantaDAO();
    
    Doacao Dobj = new Doacao();
    Ddao = new DoacaoDAO();
    
    Plista = Pdao.listar(request.getParameter("txtFiltro"));
    Dlista = Ddao.listar(request.getParameter("txtFiltro"));


%>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center">Lista de Plantas</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="row text-center">
                    <%
                    if(Plista != null){
                        for(Planta Pitem : Plista){
                    %>
                        <div class="col-md-3 col-sm-6 hero-feature">
                            <div class="thumbnail">
                                <%if(Pitem.getImagem() == null){ %>    
                                <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>"><img src="http://placehold.it/800x500" alt=""></a>
                                <%} else if(Pitem.getImagem() != null){ %>
                                <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>" class="imagem-planta-container">
                                    <img src="../Fotos/<%=Pitem.getImagem() %>" width="800" height="500">
                                </a>
                                <% } %>
                                <div class="caption cada-planta">
                                    <h3><%=Pitem.getNomePopular() %></h3>
                                    <h4><%=Pitem.getNomeCientifico()%></h4>
                                    <p><%=Pitem.getCodigoCategoria().getNome() %></p>
                                    <p><%=Pitem.getDescricao()%></p>
                                </div>
                            </div>
                        </div>
                    <% 
                            }
                    }                    
                    %>
                    
                    <%
                    if(Dlista != null){    
                        for(Doacao Ditem : Dlista){ 
                    %>
                        <div class="col-md-3 col-sm-6 hero-feature">
                            <div class="thumbnail">
                                <%if(Ditem.getCodigoItensdoacao().getCodigoPlanta().getImagem() == null){ %>    
                                    <a href="detalheDoacao.jsp?codigo=<%=Ditem.getCodigo()%>"><img src="http://placehold.it/800x500" alt=""></a>
                                    <%} else if(Ditem.getCodigoItensdoacao().getCodigoPlanta().getImagem() != null){ %>
                                    <a href="detalheDoacao.jsp?codigo=<%=Ditem.getCodigo()%>" class="imagem-planta-container">
                                        <img src="../Fotos/<%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getImagem() %>" width="800" height="500">
                                    </a>
                                <% } %>
                                <div class="caption cada-planta">
                                    <h2><%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getNomePopular()%></h2>
                                    <h4><%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getNomeCientifico()%></h4>
                                    <p><%=Ditem.getCodigoItensdoacao().getCodigoPlanta().getCodigoCategoria().getNome() %></p>
                                    
                                    <p><strong>Doador(a): </strong><%=Ditem.getCodigoUsuario().getNome() %></p>
                                    <p><%=Ditem.getCodigoUsuario().getEndereco() %></p>
                                    <p><%=Ditem.getCodigoUsuario().getBairro()%> - <%=Ditem.getCodigoUsuario().getCep() %></p>
                                    <p><%=Ditem.getCodigoUsuario().getCidade() %> - <%=Ditem.getCodigoUsuario().getEstado()%></p>

                                </div>
                            </div>
                        </div>
                    <%
                        }
                    }
                    %>
                </div>
            </div>
        </div>
    </div>

<%@include file="rodape.jsp"%>

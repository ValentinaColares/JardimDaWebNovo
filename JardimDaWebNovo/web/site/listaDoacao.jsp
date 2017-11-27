<%@page import="dao.DoacaoDAO"%>
<%@page import="modelo.Doacao"%>
<%@include file="cabecalho.jsp"%>
<link href="../listaDoacao.css" rel="stylesheet" type="text/css">
    
<%
    Doacao obj = new Doacao();
    DoacaoDAO dao = new DoacaoDAO();
    List<Doacao> Dlista = dao.listar();
   
    if(request.getParameter("categoria")!= null){
        Dlista = dao.listarFiltro(Integer.parseInt(request.getParameter("categoria")), "C");
    }
    else{
        Dlista = dao.listar();
    }
    


%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Lista de Doa��es</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
            <div class="row text-center">
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
                              <strong>Doadora: </strong><%=Ditem.getCodigoUsuario().getNome() %></p>
                            <p><%=Ditem.getCodigoUsuario().getCidade() %> - <%=Ditem.getCodigoUsuario().getEstado()%></p>
                            
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
          
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

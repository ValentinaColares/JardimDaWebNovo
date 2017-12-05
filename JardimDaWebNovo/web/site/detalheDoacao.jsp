<%@include file="cabecalho.jsp"%>
<link href="../detalheDoacao.css" rel="stylesheet" type="text/css">

<% 
    Doacao obj = new Doacao();
    DoacaoDAO dao = new DoacaoDAO();
    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    
    
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Detalhe Doação</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <%if(obj.getCodigoItensdoacao().getCodigoPlanta().getImagem() == null){ %>
                <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
            <%} else if(obj.getCodigoItensdoacao().getCodigoPlanta().getImagem() != null){ %>
                <img src="../Fotos/<%=obj.getCodigoItensdoacao().getCodigoPlanta().getImagem() %>" width="460" height="380">
            <%}%>
          </div>
          <div class="col-md-6">
            <strong><h1><%=obj.getCodigoItensdoacao().getCodigoPlanta().getNomePopular() %></h1></strong>
            <h3><%=obj.getCodigoItensdoacao().getCodigoPlanta().getNomeCientifico()%></h3>
            <ul>
              <li>
                <strong>Categoria</strong>: <%=obj.getCodigoItensdoacao().getCodigoPlanta().getCodigoCategoria().getNome() %></li>
              <li>
                <strong>Origem</strong>: <%=obj.getCodigoItensdoacao().getCodigoPlanta().getOrigem()%></li>
              <li>
                <strong>Propagação</strong>: <%=obj.getCodigoItensdoacao().getCodigoPlanta().getPropagacao()%></li>
              <li>
                <strong>Época de poca</strong>: <%=obj.getCodigoItensdoacao().getCodigoPlanta().getEpocaPoda()%></li>
              <li>
                <strong>Quantidade</strong>: <%=obj.getCodigoItensdoacao().getCodigoPlanta().getQuantidade()%></li>
              <li>
                <strong>Data da Planta</strong>: <%=obj.getCodigoItensdoacao().getCodigoPlanta().getDataPlanta()%></li>
              <li>
              <li>
                <strong>Descrição</strong>: <%=obj.getCodigoItensdoacao().getCodigoPlanta().getDescricao()%></li>
            </ul>
            <br>
            <h1><strong>Doador(a)</strong>: <%=obj.getCodigoUsuario().getNome() %></h1>
            <ul>
              <li><%=obj.getCodigoUsuario().getEndereco()%></li>
              <li><%=obj.getCodigoUsuario().getBairro()%></li>                                                    
              <li><%=obj.getCodigoUsuario().getCep()%></li>
              <li><%=obj.getCodigoUsuario().getCidade()%>/<%=obj.getCodigoUsuario().getEstado()%></li>
            </ul><br>
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

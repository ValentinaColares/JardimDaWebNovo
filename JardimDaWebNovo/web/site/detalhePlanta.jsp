
<%@include file="cabecalho.jsp"%>
<link href="../detalhePlanta.css" rel="stylesheet" type="text/css">

<% 
    Planta obj = new Planta();
    PlantaDAO dao = new PlantaDAO();
    obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    
    
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Detalhe Planta</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <%if(obj.getImagem() == null){ %>
                <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
            <%} else if(obj.getImagem() != null){ %>
                <img src="../Fotos/<%=obj.getImagem() %>" class="img-responsive">
            <%}%>
          </div>
          <div class="col-md-6">
            <strong>
              <h1><%=obj.getNomePopular() %></h1>
            </strong>
            <h3><%=obj.getNomeCientifico()%></h3>
            <ul>
              <li>
                <strong>Categoria</strong>: <%=obj.getCodigoCategoria().getNome() %></li>
              <li>
                <strong>Origem</strong>: <%=obj.getOrigem()%>.</li>
              <li>
                <strong>Propagação</strong>: <%=obj.getPropagacao()%>.</li>
              <li>
                <strong>Época de poca</strong>: <%=obj.getEpocaPoda()%>.</li>
              <li>
                <strong>Quantidade</strong>: <%=obj.getQuantidade()%></li>
              <li>
                <strong>Data da Planta</strong>: <%=obj.getDataPlanta()%></li>
              <li>
                <strong>Descrição</strong>: <%=obj.getDescricao()%></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

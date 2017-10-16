

<%@include file="cabecalho.jsp"%>
<link href="../gerenciarPlanta.css" rel="stylesheet" type="text/css">

<%
    //btn  btn-primary btn-sm
    Planta obj = new Planta();
    PlantaDAO dao = new PlantaDAO();
    List<Planta> lista = dao.listar();
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    //verifico se é excluir
        if(request.getParameter("codigo") != null){
            obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                Boolean funcionou = dao.excluir(obj);
            }
        }
        
        lista = dao.listar();
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Gerenciar Planta</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="panel-body">
                <a  href="addPlanta.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
            </div>
            <table class="table">
              <thead class="thead-inverse">
                <tr>
                  <th>Código</th>
                  <th>Nome Popular</th>
                  <th>Nome Científico</th>
                  <th>Origem</th>
                  <th>Propagação</th>
                  <th>Época de Poda</th>
                  <th>Quantidade</th>
                  <th>Categoria</th>
                  <th>Data</th>
                  <th>Imagem</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <%for(Planta item: lista){
                %>
                <tr>
                    <td><%=item.getCodigo()%></td>
                    <td><%=item.getNomePopular()%></td>
                    <td><%=item.getNomeCientifico()%></td>
                    <td><%=item.getOrigem()%></td>
                    <td><%=item.getPropagacao()%></td>
                    <td><%=item.getEpocaPoda()%></td>
                    <td><%=item.getQuantidade()%></td>
                    <td><%=item.getCodigoCategoria().getNome() %></td>
                    <td><%=item.getDataPlanta() %></td>
                    <td><img src="../Fotos/<%=item.getImagem() %>" width="40" height="40" /> </td>
                    <td><a href="updPlanta.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-danger btn-sm">Alterar</a>
                        <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModalPlanta" onclick="codigo=<%=item.getCodigo()%>">Excluir</button> 
                    </td>
                </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

<%@include file="modalExcluirPlanta.jsp" %>
<%@include file="rodape.jsp"%>
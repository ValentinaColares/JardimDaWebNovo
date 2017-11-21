<%@page import="dao.SugestaoDAO"%>
<%@page import="modelo.Sugestao"%>
<%@include file="cabecalho.jsp"%>
<link href="../gerenciarCategoria.css" rel="stylesheet" type="text/css">
    
    <%
    Sugestao obj = new Sugestao();
    SugestaoDAO dao = new SugestaoDAO();
    List<Sugestao> lista = dao.listar();
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
        //verifico se é excluir
        if(request.getParameter("codigo") != null){
            obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listar();
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Gerenciar Sugestao</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
                <div class="panel-body">
                    <a  href="addSugestao.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
                </div>
            <table class="table">
              <thead class="thead-inverse">
                <tr>
                  <th>Código</th>
                  <th>Sugestão</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <%for(Sugestao item: lista){
                %>
                <tr>
                  <td><%=item.getCodigo() %></td>
                  <td><%=item.getSugestao()%></td>
                  <td><button class="btn btn-primary" data-toggle="modal" data-target="#myModalSugestao" onclick="codigo=<%=item.getCodigo()%>">Excluir</button></td>
                </tr>
                <%}%>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

<%@include file="modalExcluirSugestao.jsp" %>
<%@include file="rodape.jsp"%>


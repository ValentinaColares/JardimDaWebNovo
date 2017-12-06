<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@include file="cabecalho.jsp"%>
<link href="css/gerenciarCategoria.css" rel="stylesheet" type="text/css">
    
    <%
    //btn  btn-primary btn-sm
    Categoria obj = new Categoria();
    CategoriaDAO dao = new CategoriaDAO();
    List<Categoria> lista = dao.listar();
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("erro.jsp");
    
    } else{   
        
        //usuario = ((Usuario) session.getAttribute("usuario"));
        
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
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Gerenciar Categoria</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
                <div class="panel-body">
                    <a  href="addCategoria.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
                </div>
            <table class="table">
              <thead class="thead-inverse">
                <tr>
                  <th>Código</th>
                  <th>Nome</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <%for(Categoria item: lista){
                %>
                <tr>
                  <td><%=item.getCodigo() %></td>
                  <td><%=item.getNome() %></td>
                  <td><a href="updCategoria.jsp?codigo=<%=item.getCodigo()%>" class="btn btn-primary">Alterar</a>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModalCategoria" onclick="codigo=<%=item.getCodigo()%>">Excluir</button></td>
                </tr>
                <%}%>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

<%@include file="modalExcluirCategoria.jsp" %>
<%@include file="rodape.jsp"%>

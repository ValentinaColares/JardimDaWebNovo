

<%@page import="dao.DoacaoDAO"%>
<%@page import="modelo.Doacao"%>
<%@page import="dao.ItensdoacaoDAO"%>
<%@page import="modelo.Itensdoacao"%>
<%@include file="cabecalho.jsp"%>
<link href="../gerenciarPlanta.css" rel="stylesheet" type="text/css">

<%
    //btn  btn-primary btn-sm
    Itensdoacao Iobj = new Itensdoacao();
    ItensdoacaoDAO Idao = new ItensdoacaoDAO();
    List<Itensdoacao> Ilista = Idao.listar();
    
    Doacao Dobj = new Doacao();
    Ddao = new DoacaoDAO();
    Dlista = Ddao.listar();
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{
        if (request.getParameter("txtFiltro") != null) {
            Dlista = Ddao.listar(request.getParameter("txtFiltro"));

        } else{ 

        //verifico se é excluir
            if(request.getParameter("codigo") != null){
                Dobj = Ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
                if(Dobj != null){
                    //atribuo o codigo do item que ta na doação para o obj
                    Iobj = Dobj.getCodigoItensdoacao();
                    //excluo a doação
                    Ddao.excluir(Dobj);
                    //excluo o item da doação
                    Boolean funcionou = Idao.excluir(Iobj);
                }
            }

            Dlista = Ddao.listar();
        }
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Gerenciar Doação</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="panel-body">
                <a  href="addDoacao.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
            </div>
            <table class="table">
              <thead class="thead-inverse">
                <tr>
                  <th>Código</th>
                  <th>Nome Planta</th>
                  <th>Quantidade para doar</th>
                  <th>Data doação</th>
                  <th>Doação efetuada</th>
                  <th>Descrição</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <%for(Doacao item: Dlista){
                %>
                <tr>
                    <td><%=item.getCodigo()%></td>
                    <td><%=item.getCodigoItensdoacao().getCodigoPlanta().getNomePopular() %></td>
                    <td><%=item.getCodigoItensdoacao().getQuantidade() %></td>
                    <td><%=item.getDataDoacao() %></td>
                    <td><%=item.getDoada()%></td>
                    <td><%=item.getDescricao()%></td>
                    <td><a href="updDoacao.jsp?codigo=<%=item.getCodigo()%>" class="btn btn-primary">Alterar</a>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModalDoacao" onclick="codigo=<%=item.getCodigo()%>">Excluir</button> 
                    </td>
                </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

<%@include file="modalExcluirDoacao.jsp" %>
<%@include file="rodape.jsp"%>
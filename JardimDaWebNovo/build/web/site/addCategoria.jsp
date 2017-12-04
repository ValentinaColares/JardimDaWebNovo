<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<link href="../addCategoria.css" rel="stylesheet" type="text/css">

<% 
    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = new Categoria();
    
   Boolean resultado = false;
   
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{
        
        if(request.getParameter("txtNome") != null){
            obj.setNome(request.getParameter("txtNome"));
            resultado = dao.incluir(obj);
        }

        if(resultado){
            response.sendRedirect("gerenciarCategoria.jsp");
        }
    }
    
    
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Cadastrar Categoria</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <form method="post" action="#">
              <div align="center" class="form-group">
                <label>Nome</label>
                <input type="text" name="txtNome" placeholder="Digite o nome da categoria..." class="form-control">
                <br>
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>
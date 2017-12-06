<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp"%>
<link href="../updCategoria.css" rel="stylesheet" type="text/css">

    <% 
    Categoria obj = new Categoria();
    CategoriaDAO dao = new CategoriaDAO();
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("erro.jsp");
    
    } else{   
        
        usuario = ((Usuario) session.getAttribute("usuario"));
    
        if(request.getMethod().equals("POST")){
            obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
            obj.setNome(request.getParameter("txtNome"));
            Boolean resultado = dao.alterar(obj);

            if(resultado){
                response.sendRedirect("gerenciarCategoria.jsp");
            }
        }else{
            //se vier por get
            if(request.getParameter("codigo") == null){
                response.sendRedirect("gerenciarCategoria.jsp");
            }
            dao = new CategoriaDAO();
            obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

            if(obj == null){
                response.sendRedirect("gerenciarCategoria.jsp");
                return;
            }
        }  
    }
%>
    
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Editar Categoria</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <form method="post" action="#">
                <div class="form-group">
                    <label>Código*</label>
                    <input type="text" name="txtCodigo" value="<%=obj.getCodigo() %>" class="form-control">
                </div>
                
             	<div class="form-group">
                    <label>Nome*</label>
                    <input type="text" name="txtNome" value="<%=obj.getNome() %>" class="form-control" >
              </div>
              <label>* Preenchimento obrigatório</label><br><br>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

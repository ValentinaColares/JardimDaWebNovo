
<%@page import="util.Upload"%>
<%@include file="cabecalho.jsp"%>
<link href="../updPlanta.css" rel="stylesheet" type="text/css">

<% 
    PlantaDAO dao = new PlantaDAO();
    Planta obj = new Planta();
    
    CategoriaDAO cdao = new CategoriaDAO();
    List<Categoria> clista = cdao.listar();
    
    Boolean resultado = false;
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("erro.jsp");
    
    } else{   
        
        usuario = ((Usuario) session.getAttribute("usuario"));
        
        if(request.getMethod().equals("POST")){

            Upload up = new Upload();
            up.setFolderUpload("Fotos");

            if(request.getParameter("codigoPlanta") == null){
                response.sendRedirect("meuPerfil.jsp"); //volta pra index
                return;
            }
            //buscar o obj a partir da chave primaria
            //exibe as informações od obj no form

            Integer codigo = Integer.parseInt(request.getParameter("codigoPlanta"));
            obj = dao.buscarPorChavePrimaria(codigo);

            if(up.formProcess(getServletContext(), request)){
                if(up.getForm().get("txtNome") == null){
                    //volta pra tela da listagem
                    response.sendRedirect("meuPerfil.jsp");
                    return;
                }
                //verifica se o campo esta vazio
                if(up.getForm().get("txtCodigo").toString().isEmpty()){
                    //volta pra tela da listagem
                    response.sendRedirect("meuPerfil.jsp");
                    return;
                }


                obj.setCodigo(Integer.parseInt(up.getForm().get("txtCodigo").toString()));
                obj.setNomePopular(up.getForm().get("txtNome").toString());
                obj.setNomeCientifico(up.getForm().get("txtNomeCientifico").toString());
                obj.setOrigem(up.getForm().get("txtOrigem").toString());
                obj.setPropagacao(up.getForm().get("txtPropagacao").toString());
                obj.setEpocaPoda(up.getForm().get("txtPoda").toString());
                obj.setQuantidade(Integer.parseInt(up.getForm().get("txtQtd").toString()));
                obj.setDescricao(up.getForm().get("txtDescricao").toString());
                                
                //set de Categoria
                Categoria categoria = new Categoria();    
                categoria.setCodigo(Integer.parseInt(up.getForm().get("selCategoria").toString()));
                obj.setCodigoCategoria(categoria);

                //set de Imagem
                if(!up.getFiles().isEmpty()){
                    obj.setImagem(up.getFiles().get(0));
                }

                resultado = dao.alterar(obj);  
            }
            if(resultado){
                response.sendRedirect("meuPerfil.jsp");
            }

        }else{
            //se vier por GET
            if(request.getParameter("codigoPlanta") == null){
                response.sendRedirect("meuPerfil.jsp");
            }

            dao = new PlantaDAO();
            obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigoPlanta")));

            if(obj == null){
                response.sendRedirect("meuPerfil.jsp");
                return;
            }
        }
    }
    
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Editar Planta</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
        <div class="container">
            <div class="row">
          
                <div class="col-md-6">
                    <form action="#" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Código*</label>
                            <input type="text" name ="txtCodigo" value="<%=obj.getCodigo() %>" placeholder="Código da Planta" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nome*</label>
                            <input type="text" name ="txtNome" value="<%=obj.getNomePopular()%>" placeholder="Nome da Planta" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nome Científico</label>
                            <input type="text" name="txtNomeCientifico" value="<%=obj.getNomeCientifico()%>" class="form-control" placeholder="Nome Científico da planta">
                        </div>
                        <div class="form-group">
                            <label>Origem</label>
                            <input type="text" name="txtOrigem" value="<%=obj.getOrigem()%>" class="form-control" placeholder="Origem da planta">
                        </div>
                        <div class="form-group">
                            <label>Época de poda</label>
                            <input type="text" name="txtPoda" value="<%=obj.getEpocaPoda()%>" class="form-control" placeholder="Época de poda da planta">
                        </div>
                        <div class="form-group">
                            <label>Propagação</label>
                            <input type="text" name="txtPropagacao" value="<%=obj.getPropagacao()%>" class="form-control" placeholder="Como acontece a propagação da planta">
                        </div>
                        <div class="form-group">
                            <label>Quantidade*</label>
                            <input type="number" name="txtQtd" value="<%=obj.getQuantidade()%>" class="form-control" placeholder="Quantidade de plantas">
                        </div>

                        <div class="form-group">
                            <label>Imagem</label>
                            <input type="file" name="txtImagem">
                        </div>
                        <div class="form-group">
                            <label>Categoria*</label>                            
                            <select class="form-control form-control-lg" name="selCategoria">
                                <option value="<%=obj.getCodigoCategoria().getCodigo() %>"><%=obj.getCodigoCategoria().getNome() %></option>
                                <% 
                                    for(Categoria cat: clista) {
                                %>
                                <option value="<%=cat.getCodigo() %>" ><%=cat.getNome()%></option>
                                <% 
                                    }
                                %>   
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Descrição</label>
                            <textarea class="form-control" value="<%=obj.getDescricao()%>" name="txtDescricao"><%=obj.getDescricao()%></textarea>
                        </div> 
                        <label>* Preenchimento obrigatório</label><br><br>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
         </div>
    </div>

<%@include file="rodape.jsp"%>

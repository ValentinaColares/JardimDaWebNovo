<%@page import="util.Data"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="util.Upload"%>
<%@include file="cabecalho.jsp"%>
<link href="../addPlanta.css" rel="stylesheet" type="text/css">

<% 
    Planta obj = new Planta();
    PlantaDAO dao = new PlantaDAO();
    
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> clista = cDAO.listar();
    
    Boolean resultado = false;
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("erro.jsp");
    
    } else{   
        
        usuario = ((Usuario) session.getAttribute("usuario"));
    
        if(request.getMethod().equals("POST")){        

            Upload up = new Upload();
            up.setFolderUpload("Fotos");

            if(up.formProcess(getServletContext(), request)){

                //verifico se foi enviado o campo txtNome
                 if(up.getForm().get("txtNome") == null){
                    //volta pra tela da listagem
                    response.sendRedirect("meuPerfil.jsp");
                    return;
                }
                //verifica se o campo esta vazio
                if(up.getForm().get("txtNome").toString().isEmpty()){
                    //volta pra tela da listagem
                    response.sendRedirect("meuPerfil.jsp");
                    return;  
                } 
                //Gravar planta no banco

                //Monto o objeto com os dados para sim inserir

                obj.setNomePopular(up.getForm().get("txtNome").toString());
                obj.setNomeCientifico(up.getForm().get("txtNomeCientifico").toString());
                obj.setOrigem(up.getForm().get("txtOrigem").toString());
                obj.setPropagacao(up.getForm().get("txtPropagacao").toString());
                obj.setEpocaPoda(up.getForm().get("txtPoda").toString());
                obj.setQuantidade(Integer.parseInt(up.getForm().get("txtQtd").toString()));
                obj.setDescricao(up.getForm().get("txtDescricao").toString());
                obj.setCodigoUsuario(usuario);
                //fazendo o add da Data
                Data d = new Data();
                obj.setDataPlanta(d.getData());
                
                //set de Categoria
                Categoria categoria = new Categoria();    
                categoria.setCodigo(Integer.parseInt(up.getForm().get("selCategoria").toString()));
                obj.setCodigoCategoria(categoria);

                //set de Imagem
                if(!up.getFiles().isEmpty()){
                    obj.setImagem(up.getFiles().get(0));
                }            

                resultado = dao.incluir(obj);

            }   

            if(resultado){
                response.sendRedirect("meuPerfil.jsp");
            }


            //Digo que a sessão ta aberta
        }
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Cadastrar Planta</h1>
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
                    <label>Nome*</label>
                    <input type="text" name ="txtNome" placeholder="Nome da Planta" class="form-control">
                </div>
                <div class="form-group">
                    <label>Nome Científico</label>
                    <input type="text" name="txtNomeCientifico" class="form-control" placeholder="Nome Científico da planta">
                </div>
                <div class="form-group">
                    <label>Origem</label>
                    <input type="text" name="txtOrigem" class="form-control" placeholder="Origem da planta">
                </div>
                <div class="form-group">
                    <label>Época de poda</label>
                    <input type="text" name="txtPoda" class="form-control" placeholder="Época de poda da planta">
                </div>
                <div class="form-group">
                    <label>Propagação</label>
                    <input type="text" name="txtPropagacao" class="form-control" placeholder="Como acontece a propagação da planta">
                </div>
                <div class="form-group">
                    <label>Quantidade*</label>
                    <input type="number" name="txtQtd" class="form-control" placeholder="Quantidade de plantas">
                </div>
                
                <div class="form-group">
                    <label>Imagem</label>
                    <input type="file" name="txtImagem">
                </div>
                <div class="form-group">
                    <label>Categoria*</label>
                    <select class="form-control form-control-lg" name="selCategoria">
                        <option value="">Selecione</option>
                        <% 
                            for(Categoria cat: clista) {
                        %>
                        <option value="<%=cat.getCodigo() %>" ><%=cat.getNome() %></option>
                        <% 
                            }
                        %>   
                    </select>
               
                </div>
                <div class="form-group">
                    <label>Descrição</label>
                    <textarea class="form-control" name="txtDescricao" placeholder="Descrição da planta"></textarea>
                </div>
                <label>* Preenchimento obrigatório</label><br><br>
                <button type="submit" class="btn btn-primary">Submit</button>
                 
            </form>
                
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

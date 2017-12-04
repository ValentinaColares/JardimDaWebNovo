<%@page import="util.Upload"%>
<%@page import="util.Criptografia"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="cabecalho.jsp"%>
<link href="../updUsuario.css" rel="stylesheet" type="text/css">

<% 
    Usuario obj = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();
    Boolean resultado = false;
    
    if(request.getMethod().equals("POST")){

        Upload up = new Upload();
        up.setFolderUpload("Fotos");

        if(request.getParameter("codigo") == null){
            response.sendRedirect("meuPerfil.jsp"); //volta pra index
            return;
        }
        //buscar o obj a partir da chave primaria
        //exibe as informações od obj no form
        
        Integer codigo = Integer.parseInt(request.getParameter("codigo"));
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


            obj.setNome(up.getForm().get("txtNome").toString());
            obj.setEstado(up.getForm().get("txtEstado").toString());
            obj.setCidade(up.getForm().get("txtCidade").toString());
            obj.setBairro(up.getForm().get("txtBairro").toString());
            obj.setEndereco(up.getForm().get("txtEndereco").toString());
            obj.setCep(up.getForm().get("txtCep").toString());
            obj.setEmail(up.getForm().get("txtEmail").toString());
            
            if(Boolean.parseBoolean(request.getParameter("checkSenha"))){
                obj.setSenha(Criptografia.convertPasswordToMD5(up.getForm().get("txtSenha").toString()));
            }
            
            /*if(obj.getSenha() != Criptografia.convertPasswordToMD5(up.getForm().get("txtSenha").toString())){
                obj.setSenha(Criptografia.convertPasswordToMD5(up.getForm().get("txtSenha").toString()));
            }*/
            
            if(up.getForm().get("txtDoador") != null){
                obj.setDoador(true);
            }else{
                obj.setDoador(false);
            }
            
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
        if(request.getParameter("codigo") == null){
            response.sendRedirect("meuPerfil.jsp");
        }
        
        dao = new UsuarioDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("meuPerfil.jsp");
            return;
        }
    }
    
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Editar Usuario</h1>
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
                            <label>Código</label>
                            <input type="text" name="txtCodigo" value="<%=obj.getCodigo() %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nome</label>
                            <input type="text" name="txtNome" value="<%=obj.getNome() %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Bairro</label>
                            <input type="text" name="txtBairro" class="form-control" value="<%=obj.getBairro()%>">
                        </div>
                        <div class="form-group">
                            <label>Estado</label>
                            <input type="text" name="txtEstado" class="form-control" value="<%=obj.getEstado()%>">
                        </div>
                        <div class="form-group">
                            <label>CEP</label>
                            <input type="text" name="txtCep" class="form-control" value="<%=obj.getCep()%>">
                        </div>
                        <div class="form-group">
                            <label>Endereço</label>
                            <input type="text" name="txtEndereco" class="form-control" value="<%=obj.getEndereco()%>">
                        </div>
                        <div class="form-group">
                            <label>Cidade</label>
                            <input type="text" name="txtCidade" class="form-control" value="<%=obj.getCidade()%>">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="txtEmail" class="form-control" value="<%=obj.getEmail()%>">
                        </div>
                        <div class="form-group">
                            <label>Senha</label>
                            <input type="password" name="txtSenha" class="form-control" value="<%=obj.getSenha()%>"><input type="checkbox" name="checkSenha"  class="form-check-input">
                        </div> 
                        <div class="form-group">
                            <label>Imagem</label>
                            <input type="file" name="txtImagem" value="<%=obj.getImagem()%>">
                        </div>
                        <div class="form-group">
                            <label>Doador</label>
                            <input type="checkbox" name="txtDoador" value="<%=obj.getDoador()%>" class="form-check-input">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%@include file="rodape.jsp"%>

<%@page import="util.Upload"%>
<%@page import="util.Criptografia"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="cabecalho.jsp"%>
<link href="../css/addUsuario.css" rel="stylesheet" type="text/css">

<% 
    UsuarioDAO dao = new UsuarioDAO();
    Usuario obj = new Usuario();
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
                    response.sendRedirect("index.jsp");
                    return;
                }
                //verifica se o campo esta vazio
                if(up.getForm().get("txtNome").toString().isEmpty()){
                    //volta pra tela da listagem
                    response.sendRedirect("index.jsp");
                    return;  
                } 
                //Gravar usuario do banco

                //Monto o objeto com os dados para sim inserir
                obj.setNome(up.getForm().get("txtNome").toString());
                obj.setCidade(up.getForm().get("txtCidade").toString());
                obj.setBairro(up.getForm().get("txtBairro").toString());
                obj.setEstado(up.getForm().get("txtEstado").toString());
                obj.setEndereco(up.getForm().get("txtEndereco").toString());
                obj.setCep(up.getForm().get("txtCep").toString());
                obj.setEmail(up.getForm().get("txtEmail").toString());

                obj.setSenha(Criptografia.convertPasswordToMD5(up.getForm().get("txtSenha").toString()));

                if(up.getForm().get("txtDoador") != null){
                    obj.setDoador(true);
                }else{
                    obj.setDoador(false);
                }

                if(!up.getFiles().isEmpty()){
                    obj.setImagem(up.getFiles().get(0));
                }

                resultado = dao.incluir(obj);
            }

            if(resultado){
                session.setAttribute("usuario", obj);
                //redirecionar para o perfil
                response.sendRedirect("meuPerfil.jsp");
                 //depois eu vou direto pro perfil do usuario
            }
        }
    }

%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Cadastrar Usuario</h1>
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
                        <input type="text" name="txtNome" placeholder="Digite seu nome..." class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Bairro*</label>
                        <input type="text" name="txtBairro" class="form-control" placeholder="Digite seu bairro...">
                    </div>
                    <div class="form-group">
                        <label>Estado*</label>
                        <input type="text" name="txtEstado" class="form-control" placeholder="Digite seu estado....">
                    </div>
                    <div class="form-group">
                        <label>CEP</label>
                        <input type="text" name="txtCep" class="form-control" placeholder="Digite seu CEP...">
                    </div>
                    <div class="form-group">
                        <label>Endereço*</label>
                        <input type="text" name="txtEndereco" class="form-control" placeholder="Digite seu endereço...">
                    </div>
                    <div class="form-group">
                        <label>Cidade*</label>
                        <input type="text" name="txtCidade" class="form-control" placeholder="Digite sua cidade...">
                    </div>
                    <div class="form-group">
                        <label>Email*</label>
                        <input type="email" name="txtEmail" class="form-control" placeholder="Digite seu email...">
                    </div>
                   <div class="form-group">
                        <label>Senha*</label>
                        <input type="password" name="txtSenha" class="form-control" placeholder="Digite sua senha...">
                    </div> 
                    <div class="form-group">
                        <label>Imagem</label>
                        <input type="file" name="txtImagem">
                    </div>
                    <div class="form-group">
                        <label>Doador*</label>
                        <input type="checkbox" name="txtDoador" class="form-check-input">
                    </div>
                    <label>* Preenchimento obrigatório</label><br><br>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                  
              </div>
            </div>
        </div>
    </div>
        
<%@include file="rodape.jsp"%>

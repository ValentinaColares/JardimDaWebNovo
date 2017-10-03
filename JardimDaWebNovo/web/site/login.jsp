<%@page import="util.Criptografia"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="cabecalho.jsp"%>
<link href="../css do login.css" rel="stylesheet" type="text/css">

<% 
    
    if(request.getMethod().equals("POST")){
        //tentativa de login

        try{
            usuario = Usuariodao.login(request.getParameter("txtEmail"));
            String senhaCerta = usuario.getSenha();
        
            if(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")).equals(senhaCerta)){
                //criar a minha session
                //se a senha estiver certa, ele loga
                session.setAttribute("usuario", usuario);
                //redirecionar para o perfil
                response.sendRedirect("meuPerfil.jsp"); //depois eu vou direto pro perfil do usuario
            }
        }catch(Exception ex){
            //Erro no email
        }
        
        
    }
    //Não ta entrando com post
    

%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-6">
                    <h1 class="text-center">Criar nova conta</h1>
                    <center>
                      
                      <a href="addUsuario.jsp" class="btn btn-lg btn-primary">Criar Conta</a>
                    </center>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <form method="post" action="#">
                <div class="form-group">
                    <label>E-mail</label>
                    <input type="text" name="txtEmail" class="form-control" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label>Senha</label>
                    <input type="password" name="txtSenha" class="form-control" placeholder="Password">
                </div>
                <input type="submit" class="btn btn-primary" value="Entrar"></input>
            </form>
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

<%@page import="dao.DoacaoDAO"%>
<%@page import="modelo.Doacao"%>
<%@page import="dao.ItensdoacaoDAO"%>
<%@page import="modelo.Itensdoacao"%>
<%@page import="util.Data"%>
<%@include file="cabecalho.jsp"%>
<link href="../addPlanta.css" rel="stylesheet" type="text/css">

<% 
    
    Itensdoacao Iobj = new Itensdoacao();
    ItensdoacaoDAO ITdao = new ItensdoacaoDAO();
    
    Doacao Dobj = new Doacao();
    Ddao = new DoacaoDAO();
    
    PlantaDAO pDAO = new PlantaDAO();
    List<Planta> plista = pDAO.listar();
    
    Boolean resultado = false;
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{   
        
        usuario = ((Usuario) session.getAttribute("usuario"));
        
        //Pergunta se o usuario é doador
        if(usuario.getDoador() == true){
    
            if(request.getMethod().equals("POST")){  
                //Itens da doação
                //set de Planta
                Planta planta = new Planta();    
                planta.setCodigo(Integer.parseInt(request.getParameter("selPlanta")));
                Iobj.setCodigoPlanta(planta); 
                //set de quantidade
                Iobj.setQuantidade(Integer.parseInt(request.getParameter("txtQtd")));
                ITdao.incluir(Iobj);

                //Doação
                Dobj.setCodigoItensdoacao(Iobj);
                //fazendo o add da Data
                Data d = new Data();
                Dobj.setDataDoacao(d.getData());
                Dobj.setDescricao(request.getParameter("txtDescricao"));
                Dobj.setDoada(false);
                Dobj.setCodigoUsuario(usuario);

                resultado = Ddao.incluir(Dobj);

            }   

            if(resultado){
                response.sendRedirect("meuPerfil.jsp");
            }   
        }else{
            response.sendRedirect("naoDoador.jsp");
        }
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Cadastrar Doação</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <form action="#" method="post">
                <div class="form-group">
                    <label>Planta*</label>
                    <select class="form-control form-control-lg" name="selPlanta">
                        <option value="">Selecione</option>
                        <% 
                            for(Planta plan: plista) {
                                if(plan.getCodigoUsuario().getCodigo() == usuario.getCodigo()){
                        %>
                            <option value="<%=plan.getCodigo() %>" ><%=plan.getNomePopular()%></option>
                        <% 
                                }
                            }
                        %>   
                    </select>
               
                </div>
                <div class="form-group">
                    <label>Quantidade*</label>
                    <input type="number" name="txtQtd" class="form-control" placeholder="Quantidade de plantas para doar">
                </div> 
                <div class="form-group">
                    <label>Descrição</label>
                    <textarea class="form-control" name="txtDescricao" placeholder="Descrição da doação"></textarea>
                </div>
                <label>* Preenchimento obrigatório</label><br><br>
                <button type="submit" class="btn btn-primary">Submit</button>
                 
            </form>
                
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

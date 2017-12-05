
<%@page import="util.Data"%>
<%@page import="dao.DoacaoDAO"%>
<%@page import="modelo.Doacao"%>
<%@page import="dao.ItensdoacaoDAO"%>
<%@page import="modelo.Itensdoacao"%>
<%@page import="util.Upload"%>
<%@include file="cabecalho.jsp"%>
<link href="../updPlanta.css" rel="stylesheet" type="text/css">


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
    
        if(request.getMethod().equals("POST")){ 
            if(request.getParameter("codigoDoacao") == null){
                response.sendRedirect("meuPerfil.jsp"); //volta pra index
                return;
            }
            //buscar o obj a partir da chave primaria
            //exibe as informa��es od obj no form

            Integer codigo = Integer.parseInt(request.getParameter("codigoDoacao"));
            Dobj = Ddao.buscarPorChavePrimaria(codigo);
            
            //Itens da doa��o
            //set de Planta
            Planta planta = new Planta();    
            planta.setCodigo(Dobj.getCodigoItensdoacao().getCodigoPlanta().getCodigo());
            Iobj.setCodigoPlanta(planta); 
            
            //set de quantidade
            Iobj.setQuantidade(Integer.parseInt(request.getParameter("txtQtd")));
            ITdao.alterar(Iobj);
            
            //Doa��o
            Dobj.setCodigoItensdoacao(Iobj);
            //fazendo o add da Data
            Data d = new Data();
            Dobj.setDataDoacao(d.getData());
            Dobj.setDescricao(request.getParameter("txtDescricao"));
            if(request.getParameter("txtDoada") != null){
                Dobj.setDoada(true);
            }else{
                Dobj.setDoada(false);
            }
            Dobj.setCodigoUsuario(usuario);
            Dobj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
            
            resultado = Ddao.alterar(Dobj);

        }else{
            //se vier por GET
            if(request.getParameter("codigoDoacao") == null){
                response.sendRedirect("meuPerfil.jsp");
            }

            Ddao = new DoacaoDAO();
            Dobj = Ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigoDoacao")));

            if(Dobj == null){
                response.sendRedirect("meuPerfil.jsp");
                return;
            }
        }   
        
        if(resultado){
            response.sendRedirect("meuPerfil.jsp");
        }      
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Editar Doa��o</h1>
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
                    <label>C�digo</label>
                    <input type="text" name="txtCodigo" class="form-control" value="<%=Dobj.getCodigo()%>">
                </div>
                <div class="form-group">
                    <label>Planta*</label>
                    <select class="form-control form-control-lg" name="selPlanta">
                        <option value="<%=Dobj.getCodigoItensdoacao().getCodigoPlanta() %>"><%=Dobj.getCodigoItensdoacao().getCodigoPlanta().getNomePopular() %></option>
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
                    <label>Planta doada</label>
                    <input type="checkbox" name="txtDoada" class="form-control" value="<%=Dobj.getDoada() %>">
                </div> 
                <div class="form-group">
                    <label>Quantidade*</label>
                    <input type="number" name="txtQtd" class="form-control" value="<%=Dobj.getCodigoItensdoacao().getQuantidade() %>">
                </div> 
                <div class="form-group">
                    <label>Descri��o</label>
                    <textarea class="form-control" name="txtDescricao" value="<%=Dobj.getDescricao()%>"><%=Dobj.getDescricao()%></textarea>
                </div>
                <label>* Preenchimento obrigat�rio</label><br><br>
                <button type="submit" class="btn btn-primary">Submit</button>
                 
            </form>
                
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>


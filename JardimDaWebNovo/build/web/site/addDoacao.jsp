
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
    DoacaoDAO Ddao = new DoacaoDAO();
    
    PlantaDAO pDAO = new PlantaDAO();
    List<Planta> plista = pDAO.listar();
    
    Boolean resultado = false;
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{   
        
        usuario = ((Usuario) session.getAttribute("usuario"));
    
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
            
            resultado = Ddao.incluir(Dobj);

            
        }   
        
        if(resultado){
            response.sendRedirect("gerenciarDoacao.jsp");
        }      
    }
%>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Cadastrar Itensdoacao</h1>
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
                    <label>Planta</label>
                    <select class="form-control form-control-lg" name="selPlanta">
                        <option value="">Selecione</option>
                        <% 
                            for(Planta plan: plista) {
                        %>
                        <option value="<%=plan.getCodigo() %>" ><%=plan.getNomePopular()%></option>
                        <% 
                            }
                        %>   
                    </select>
               
                </div>
                <div class="form-group">
                    <label>Quantidade</label>
                    <input type="number" name="txtQtd" class="form-control" placeholder="Quantidade de plantas para doar">
                </div> 
                <button type="submit" class="btn btn-primary">Submit</button>
                 
            </form>
                
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

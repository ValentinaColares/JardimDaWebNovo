<%@page import="dao.ItensdoacaoDAO"%>
<%@page import="modelo.Itensdoacao"%>
<%@page import="util.Data"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="util.Upload"%>
<%@include file="cabecalho.jsp"%>
<link href="../addPlanta.css" rel="stylesheet" type="text/css">

<% 
    Itensdoacao obj = new Itensdoacao();
    ItensdoacaoDAO dao = new ItensdoacaoDAO();
    
    PlantaDAO pDAO = new PlantaDAO();
    List<Planta> plista = pDAO.listar();
    
    Boolean resultado = false;
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{   
        
        usuario = ((Usuario) session.getAttribute("usuario"));
    
        if(request.getMethod().equals("POST")){        
            
            Planta planta = new Planta();    
            planta.setCodigo(Integer.parseInt(request.getParameter("selPlanta")));
            obj.setCodigoPlanta(planta);
                        

                resultado = dao.incluir(obj);

            }   

            if(resultado){
                response.sendRedirect("gerenciarItensdoacao.jsp");
            }


            //Digo que a sessão ta aberta
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
            <form action="#" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Planta</label>
                    <select class="form-control form-control-lg" name="selPlanta">
                        <option value="">Selecione</option>
                        <%for(Planta plan: plista) {%>
                        <option value="<%=plan.getCodigo()%>" ><%=plan.getNomePopular()%></option>
                        <%}%>   
                    </select>
               
                </div>
                <div class="form-group">
                    <label>Quantidade</label>
                    <input type="number" name="txtQtd" class="form-control" placeholder="Quantidade de plantas">
                </div>          
                <button type="submit" class="btn btn-primary">Submit</button>
                 
            </form>
                
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

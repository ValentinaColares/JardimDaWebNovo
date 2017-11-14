
<%@include file="cabecalho.jsp"%>
<link href="../listaPlanta.css" rel="stylesheet" type="text/css">

<%
    Planta obj = new Planta();
    PlantaDAO dao = new PlantaDAO();
    Plista = dao.listar();
   
    if(request.getParameter("categoria")!= null){
        Plista = dao.listarFiltro(Integer.parseInt(request.getParameter("categoria")), "C");
    }
    else{
        Plista = dao.listar();
    }
    


%>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center">Lista de Plantas</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="row text-center">

                    <div class="col-md-3 col-sm-6 hero-feature">
                        <div class="thumbnail">
                            <%
                                for(Planta Pitem : Plista){
                            %>

                            <%if(Pitem.getImagem() == null){ %>    
                            <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>"><img src="http://placehold.it/800x500" alt=""></a>
                            <%} else if(Pitem.getImagem() != null){ %>
                            <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>"><img src="../Fotos/<%=Pitem.getImagem() %>" width="800" height="500"></a>
                            <% } %>
                            <div class="caption">
                                <h3><%=Pitem.getNomePopular() %></h3>
                                <h4><%=Pitem.getNomeCientifico()%></h4>
                                <p><%=Pitem.getCodigoCategoria().getNome() %></p>
                                <p><%=Pitem.getDescricao()%></p>
                            <% } %>
                            </div>
                        </div>
                    </div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                </div>
            </div>
        </div>
    </div>

<%@include file="rodape.jsp"%>

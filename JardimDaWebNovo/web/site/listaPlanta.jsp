
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
                <div class="col-md-3">
                    <%
                        for(Planta Pitem : Plista){
                     %>

                        <%if(Pitem.getImagem() == null){ %>    
                        <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>"><img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive"></a>
                        <%} else if(Pitem.getImagem() != null){ %>
                        <a href="detalhePlanta.jsp?codigo=<%=Pitem.getCodigo()%>"><img src="../Fotos/<%=Pitem.getImagem() %>" width="263" height="197"></a>
                        <% } %>
                        <h2><%=Pitem.getNomePopular() %></h2>
                        <h4><%=Pitem.getNomeCientifico()%></h4>
                        <p><%=Pitem.getCodigoCategoria().getNome() %></p>
                        <p><%=Pitem.getDescricao()%></p>
                    <% } %>
                </div>


            </div>
        </div>
    </div>

<%@include file="rodape.jsp"%>

<%@page import="dao.SugestaoDAO"%>
<%@page import="modelo.Sugestao"%>
<%@include file="cabecalho.jsp"%>
<%
    SugestaoDAO Sugdao = new SugestaoDAO();
    Sugestao Sugobj = new Sugestao();
    
    usuario = ((Usuario) session.getAttribute("usuario"));
    Boolean resultado = false;
    
    if(request.getParameter("txtSugestao") != null && session.getAttribute("usuario") != null){
        Sugobj.setSugestao(request.getParameter("txtSugestao"));
        Sugobj.setCodigoUsuario(usuario);
        
        resultado = Sugdao.incluir(Sugobj);
    }

    if(resultado){
        response.sendRedirect("gerenciarSugestao.jsp");
    }
   
%>

<%//@include file="rodape.jsp"%>
<%@include file="cabecalho.jsp"%>

<%
    session.removeAttribute("usuario");
    response.sendRedirect("index.jsp");
%>

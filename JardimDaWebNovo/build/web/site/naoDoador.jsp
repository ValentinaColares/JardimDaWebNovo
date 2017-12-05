<%@include file="cabecalho.jsp"%>

<% 
    usuario = ((Usuario) session.getAttribute("usuario"));
%>

    <div class="section">
      <div class="container">
            <div class="row"><br><br>
            <h3>Infelizmente você não é um doador. Gostaria de se tornar? <a href="updUsuario.jsp?codigo=<%=usuario.getCodigo() %>">Clique aqui</a> e altere seu perfil para o de um doador</h3>
        </div>
        </div>
    </div>


<%@include file="rodape.jsp"%>

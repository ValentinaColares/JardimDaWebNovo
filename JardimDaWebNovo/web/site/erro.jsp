<%@include file="cabecalho.jsp"%>


    <div class="section">
      <div class="container">
            <div class="row text-center"><br><br>
            <h1>Erro!!! Algo de errado ocorreu...</h1>
        </div>
        </div>
    </div>

<script>
    $(document).ready(function(){
        window.console.log("!");
        window.setTimeout(function(){
            window.location = "login.jsp";
        }, 3000)
    })
</script>
<%@include file="rodape.jsp"%>

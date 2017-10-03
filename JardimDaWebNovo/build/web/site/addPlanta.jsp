<%@include file="cabecalho.jsp"%>
<link href="../addPlanta.css" rel="stylesheet" type="text/css">

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Cadastrar Planta</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <form method="post" action="#">
              <div class="form-group">
                <label>Nome</label>
                <input type="text" placeholder="Nome da Planta" class="form-control">
              </div>
              <div class="form-group">
                <label>Origem</label>
                <input type="text" class="form-control" placeholder="Origem da planta">
              </div>
              <div class="form-group">
                <label>Época de poda</label>
                <input type="text" class="form-control" placeholder="Época de poda da planta">
              </div>
              <div class="form-group">
                <label>Descrição</label>
                <textarea class="form-control" placeholder="Descrição da planta" name="txtSugestao"></textarea>
              </div>
              <div class="form-group">
                <label>Imagem</label>
                <input type="file" name="txtImagem">
              </div>
            </form>
          </div>
          <div class="col-md-6">
            <form method="post" action="#">
              <div class="form-group">
                <label>Nome Científico</label>
                <input type="text" class="form-control" placeholder="Nome Científico da planta">
              </div>
              <div class="form-group">
                <label>Propagação</label>
                <input type="text" class="form-control" placeholder="Como acontece a propagação da planta">
              </div>
              <div class="form-group">
                <label>Quantidade</label>
                <input type="number" class="form-control" placeholder="Quantidade de plantas">
              </div>
              <div class="form-group">
                <label>Categoria</label>
                <select class="form-control form-control-lg">
                  <option>Flor</option>
                  <option>Árvore</option>
                </select>
              </div>
            </form>
          </div>
          <div class="section">
            <div class="container">
              <div class="row">
                <div class="col-md-12" align="center">
                  <br>
                  <form method="post" action="#">
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<%@include file="rodape.jsp"%>

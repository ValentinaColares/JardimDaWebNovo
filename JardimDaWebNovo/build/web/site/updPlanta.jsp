<%@include file="cabecalho.jsp"%>
<link href="../updPlanta.css" rel="stylesheet" type="text/css">

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center">Editar Planta</h1>
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
                <label>C�digo</label>
                <input type="text" placeholder="C�digo da planta" class="form-control">
              </div>
              <div class="form-group">
                <label>Nome Cient�fico</label>
                <input type="text" class="form-control" placeholder="Nome Cient�fico da planta">
              </div>
              
              <div class="form-group">
                <label>Origem</label>
                <input type="text" class="form-control" placeholder="Origem da planta">
              </div>
              <div class="form-group">
                <label>�poca de poda</label>
                <input type="text" class="form-control" placeholder="�poca de poda da planta">
              </div>
              <div class="form-group">
                <label>Descri��o</label>
                <textarea class="form-control" placeholder="Descri��o da planta" name="txtSugestao"></textarea>
              </div>
              
            </form>
          </div>
          <div class="col-md-6">
            <form method="post" action="#">
              <div class="form-group">
                <label>Nome</label>
                <input type="text" class="form-control" placeholder="Nome da planta">
              </div>
              
              <div class="form-group">
                <label>Propaga��o</label>
                <input type="text" class="form-control" placeholder="Como acontece a propaga��o da planta">
              </div>
              <div class="form-group">
                <label>Quantidade</label>
                <input type="text" class="form-control" placeholder="Quantidade de plantas">
              </div>
              <div class="form-group">
                <label>Categoria</label>
                <select class="form-control form-control-lg">
                  <option>Flor</option>
                  <option>�rvore</option>
                </select>
              </div>
              <div class="form-group">
                <label>Imagem</label>
                <input type="file" name="txtImagem">
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

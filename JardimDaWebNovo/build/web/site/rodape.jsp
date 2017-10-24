
<%@page import="modelo.Sugestao"%>
<%@page import="dao.SugestaoDAO"%>
<%
    SugestaoDAO dao = new SugestaoDAO();
    Sugestao obj = new Sugestao();
    
    Boolean resultado = false;
    
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    
    } else{  
        if(request.getParameter("txtSugestao") != null){
            obj.setSugestao(request.getParameter("txtSugestao"));
            resultado = dao.incluir(obj);
        }

        if(resultado){
            //response.sendRedirect("gerenciarSugestao.jsp");
        }
    }
%>
    <footer class="section section-primary">
        <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <div class="col-sm-6 col-md-12">
              <h1>Sugestões</h1>
              <form>
                <div class="form-group">
                  <textarea class="form-control" placeholder="Sugestões aqui..." name="txtSugestao"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>
          <div class="col-sm-6">
            <p class="text-info text-right">
              <br>
              <br>
            </p>
            <div class="row">
              <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 hidden-xs text-right">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  

</body></html>
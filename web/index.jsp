<html>
  <head>
    <meta charset="UTF-8">
    <title>Sistema Web AP</title>

  </head>
  <body>
    <div id="wrap">
      <div id="header">
        <jsp:include page="/WEB-INF/pages/commons/header.jsp"/>
      </div>

      <div id="nav">
        <jsp:include page="/WEB-INF/pages/commons/menu.jsp"/>
      </div>

      <div id="main">
       
        <div class="subtitulo">
          <a href="${pageContext.request.contextPath}/ServletControlador?accion=listarPersonas">
            Consulta nuestro cat&aacute;logo de personas
          </a>
        </div>
        <div class="subtitulo">
          <a href="${pageContext.request.contextPath}/ServletControlador?accion=listarUsuarios">
            Consulta nuestro cat&aacute;logo de Usuarios
          </a>
        </div>
     

      </div>
      <div id="footer">
        <jsp:include page="/WEB-INF/pages/commons/footer.jsp"/>
      </div>
    </div>
  </body>
</html>

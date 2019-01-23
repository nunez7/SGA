
<html>
  <head>
    <meta charset="UTF-8">
    <title>Login Sistema Web AP</title>

  </head>
  <body onload="sf();">
    <div id="wrap">
      <div id="header">
        <jsp:include page="/WEB-INF/pages/commons/header.jsp"/>
      </div>

      <div id="nav">
        <jsp:include page="/WEB-INF/pages/commons/menu.jsp"/>
      </div>

      <div id="msg">
        <jsp:include page="/WEB-INF/pages/commons/messages.jsp"/>
      </div>

      <div id="main">

        <div class="subtitulo">
          Login Sistema SGA
        </div>

        <div class="formulario">
          <form id="form1" name="form1" action="${pageContext.request.contextPath}/ServletControlador" method="post">


            <input type="hidden" name="accion" value="validarUsuario" />

            <table align="center" class="elemento">
              <tr>
                <td>Usuario:</td>
                <td><input type="text" name="username"/></td>
              </tr>
              <tr>
                <td>Password:</td>
                <td> <input type="password" name="password" /></td>
              </tr>
            </table>
             <input type="submit" value="Enviar"/>
          </form>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="/WEB-INF/pages/commons/footer.jsp"/>
      </div>
    </div>
  </body>
</html>

<script>
  <!--
  function sf(){

    document.form1.username.value = "";
    document.form1.password.value = "";
    document.form1.username.focus();
  }
  -->
</script>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Listado de Personas</title>
  </head>
  <body>
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
          Detalle Persona
        </div>

        <div class="formulario">
          <!--Es importante definir el id de la forma, ya que se validara con JavaScript -->
          <form id="form1" name="form1" action="${pageContext.request.contextPath}/ServletControlador" method="post" >

            <!-- Esta accion se va modificar por JavaScript según la opción seleccionada -->
            <input type="hidden" name="accion"  id="accion" value="guardarPersona"/>

            <!--nos va a servir para que javascript tome el valor dinamicamente
            del nombre de la aplicacion-->
            <input type="hidden" name="contexto"  id="contexto" value="${pageContext.request.contextPath}"/>


            <!--Id persona. Si estamos editando, reenviamos el id_persona al servidor
            Esto nos permitirá distinguir si estamos Agregando(insert) o
            modificando (update) -->
            <input type="hidden" name="idPersona" value="${persona.idPersona}" />

            <table align="center" class="elemento">
              <tr>
                <td>Nombre:</td>
                <td><input type="text" name="nombre" value="${persona.nombre}" /></td>
              </tr>
              <tr>
                <td>Apellido:</td>
                <td><input type="text" name="apellido" value="${persona.apellido}" /></td>
              </tr>
            </table>

            <input type="submit" value="Guardar" />
            <input type="button" value="Cancelar"  onclick="cancelar();" />
          </form>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="/WEB-INF/pages/commons/footer.jsp"/>
      </div>
    </div>
  </body>
</html>

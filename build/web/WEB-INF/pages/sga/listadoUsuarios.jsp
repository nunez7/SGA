<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
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
        <!--Es importante definir el id de la forma, ya que se validara con JavaScript -->
        <form id="form1" name="form1" action="${pageContext.request.contextPath}/ServletControlador" method="post">
          <!-- Esta accion se va modificar por JavaScript según la opción seleccionada -->
          <input type="hidden" name="accion"  id="accion"/>
          <div class="subtitulo">
            Listado de Usuarios
          </div>
          <div class="tabla">
            <table  align="center" class="elemento" >
              <tr>
                <th><input type="checkbox" name="controladorCheckbox" onclick="selectAllCheckboxesUsuarios(this);" /> </th>
                <th>Id. Usuario</th>
                <th>Id. Persona</th>
                <th>Nombre</th>
                <th>Password</th>
              </tr>
              <c:forEach var="usuario" items="${listaUsuarios}" varStatus="row">
                <tr class="${(row.count % 2) == 0 ? "row1" : "row2" }" >
                  <td align="center">
                    <input type="checkbox" name="usuarios" id="usuarios" value="${usuario.idUsuario}">
                  </td>
                  <td onclick="editaRegistroUsuario(${row.count});">${usuario.idUsuario}</td>
                  <td onclick="editaRegistroUsuario(${row.count});">${usuario.idPersona}</td>
                  <td onclick="editaRegistroUsuario(${row.count});">${usuario.username}</td>
                  <td onclick="editaRegistroUsuario(${row.count});">${usuario.password}</td>
                </tr>
              </c:forEach>
            </table>
            <input id="botonAgregar" type="button" value="Agregar" onclick="validaFormularioListadoUsuarios(this);">
            <input id="botonEditar" type="button" value="Editar" onclick="validaFormularioListadoUsuarios(this);">
            <input id="botonEliminar" type="button" value="Eliminar" onclick="validaFormularioListadoUsuarios(this);">
          </div>
        </form>
      </div>
      <div id="footer">
        <jsp:include page="/WEB-INF/pages/commons/footer.jsp"/>
      </div>
    </div>
  </body>
</html>


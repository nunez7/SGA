<%-- 
    Document   : detalleUsuarios
    Created on : 22/01/2019, 09:01:35 PM
    Author     : nunez-pc
--%>
<%@page import="sga.services.impl.PersonaServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="sga.eis.dto.Persona"%>
<%@page import="sga.services.PersonaService"%>
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

        <div class="subtitulo">
          Detalle Usuario
        </div>

        <div class="formulario">
          <!--Es importante definir el id de la forma, ya que se validara con JavaScript -->
          <form id="form1" name="form1" action="${pageContext.request.contextPath}/ServletControlador" method="post" >

            <!-- Esta accion se va modificar por JavaScript según la opción seleccionada -->
            <input type="hidden" name="accion"  id="accion" value="guardarUsuario"/>

            <!--nos va a servir para que javascript tome el valor dinamicamente
            del nombre de la aplicacion-->
            <input type="hidden" name="contexto"  id="contexto" value="${pageContext.request.contextPath}"/>


            <!--Id persona. Si estamos editando, reenviamos el id_persona al servidor
            Esto nos permitirá distinguir si estamos Agregando(insert) o
            modificando (update) -->
            <input type="hidden" name="idUsuario" value="${usuario.idUsuario}" />

            <table align="center" class="elemento">
              <tr>
                <td>Usuario:</td>
                <td><input type="text" name="usuario" value="${usuario.username}" /></td>
              </tr>
              <tr>
                <td>Password:</td>
                <td><input type="text" name="password" value="${usuario.password}" /></td>
              </tr>
              <tr>
                  <td>Persona:</td>
                  <td>
                      <select name="idPersona">
                          <%!
                          PersonaService personaService = PersonaServiceImpl.getInstance();
                          List<Persona> personas = personaService.getAllPersonas();
                          %>
                          <option value="0">- Selecciona -</option>
                          <c:forEach var="p" items='<%= personas%>'>
                              <option <c:if test="${p.idPersona==usuario.idPersona}"> selected</c:if> value="${p.idPersona}">${p.nombre}</option>
                          </c:forEach>
                      </select>
                  </td>
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

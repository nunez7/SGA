<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="der">
  ${usuario!=null ? "Bienvenido " : ""}
</div>


<div class="izq">
  <a href="${pageContext.request.contextPath}/index.jsp">
    Inicio
  </a>
  &nbsp;

  <c:if test="${usuario!=null}" >
    &nbsp;
    <a href="${pageContext.request.contextPath}/ServletControlador?accion=salir">
      Salir
    </a>
  </c:if>
</div>


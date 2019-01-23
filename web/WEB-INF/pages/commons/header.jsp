<%-- Prevencion del cache --%>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    response.setHeader("Cache-Control", "no-store");
%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/estilos.css"/>

<script language="javascript" src="${pageContext.request.contextPath}/resources/funciones.js"></script>
<!--Incluimos el logo de global mentoring -->

<div class="titulo">
  Sistema de Gesti&oacute;n
  <br> de Alumnos (SGA)
</div>

<%@page isErrorPage="true" %>
<%
    String param = (String) request.getAttribute("mensaje");
    String mensaje = "Sin mensaje";
    if (param != null && param.length() > 0) {
      mensaje = param;
    }
%>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Login Sistema Web AP</title>

  </head>
  <body  onload="ocultarDetalle();">
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

        <table border="0"  width="720" cellpadding="0" cellspacing="0"  >
          <tr>
            <td>
              &nbsp;
            </td>
          </tr>
          <tr align="center">
            <td class="nau-main-new-Red">
              <b>El sistema AP no est&aacute; disponible. Por favor intentelo m&aacute;s tarde.</b>
            </td>
          </tr>

          <tr align="center">
            <td class="nau-main-new-Red">
              <b>Disculpe las molestias que esto le ocasiona</b>
            </td>
          </tr>
          <tr>
            <td>
              &nbsp;
            </td>
          </tr>
          <tr>
            <td>
              <table class="formDataTbl" border="0" align="center" width="150" cellpadding="0" cellspacing="0" >
                <tr align="center">
                  <td>
                    <input id="btnDetalle" type="button" value="Ver detalle" onclick="verDetalle();"/>
                  </td>
                  <td>
                    &nbsp;
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              &nbsp;
            </td>
          </tr>
          <tr>
            <td>
              <div id="detalle">
                <table border="0" align="center" cellpadding="0" cellspacing="0"  >
                  <tr>
                    <td class="paginacion">
                      <b>Detalles T&eacute;cnicos</b>
                      <br>
                    </td>
                  </tr>
                  <tr>
                    <td class="formTdDataTblLeft">
                      Causa:
                    </td>
                  </tr>
                  <tr>
                    <td class="formTdDataTblLeft">
                      <textarea class="iceTextarea" rows="3" cols="115">
                        <%= exception.getMessage()%>
                      </textarea>
                    </td>
                  </tr>
                  <tr>
                    <td class="formTdDataTblLeft">
                      Traza:
                    </td>
                  </tr>
                  <tr>
                    <td class="formTdDataTblLeft">
                      <textarea class="iceTextarea" rows="8" cols="115">
                        <%
                            // If there is an exception object in the attribute list,
                            // display the exception details
                            Exception exc = (Exception) request.getAttribute("Exception");
                            java.io.PrintWriter writer = new java.io.PrintWriter(out);
                            if (exc != null) {
                              exc.printStackTrace(writer);
                            }
                            if (exception != null) {
                              exception.printStackTrace(writer);
                            }
                        %>
                      </textarea>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>

      </div>
      <div id="footer">
        <jsp:include page="/WEB-INF/pages/commons/footer.jsp"/>
      </div>
    </div>
  </body>
</html>

var oculto = true;

function verDetalle(){
  if(oculto == true){
    mostrarDetalle();
  }
  else{
    ocultarDetalle();
  }
}

function mostrarDetalle(){
  document.getElementById("detalle").style.display="inline";
  document.getElementById("btnDetalle").value = "Ocultar detalle";
  oculto = false;
}

function ocultarDetalle(){
  document.getElementById("detalle").style.display="none";
  document.getElementById("btnDetalle").value = "Ver detalle";
  oculto = true;
}

//Funcion para seleccionar o deseleccinar todos los checkboxes de un formulario
function selectAllCheckboxes( controladorCheckbox ){
  //Recuperamos la forma y el arreglo de checkboxes
  var forma = document.getElementById("form1");
  var personas = forma.personas;

  //El checkboxControlador define si se activan o desactivan los elementos individuales
  //Verificamos que sea un arreglo
  if(personas.length > 0){
    for(i=0; i<personas.length; i++){
      personas[i].checked = controladorCheckbox.checked;
    }
  }
  else{
    if(personas != null){
      personas.checked = controladorCheckbox.checked;
    }
  }
}
//Funcion para seleccionar o deseleccinar todos los checkboxes de un formulario
function selectAllCheckboxesUsuarios( controladorCheckbox ){
  //Recuperamos la forma y el arreglo de checkboxes
  var forma = document.getElementById("form1");
  var usuarios = forma.usuarios;

  //El checkboxControlador define si se activan o desactivan los elementos individuales
  //Verificamos que sea un arreglo
  if(usuarios.length > 0){
    for(i=0; i<usuarios.length; i++){
      usuarios[i].checked = controladorCheckbox.checked;
    }
  }
  else{
    if(usuarios != null){
      usuarios.checked = controladorCheckbox.checked;
    }
  }
}

//Validacion del formulario de Personas
function validaFormularioListadoPersonas( boton ){
  //Recuperamos la formay la accion para modificarla
  var forma = document.getElementById("form1");
  var accion = document.getElementById("accion");
  if( boton.value == "Agregar" ){
    accion.value = "agregarPersona";
  }
  else if( boton.value == "Editar"){
    //Solo debe haber un elemento seleccionado
    if(this.validaUnicoCheckbox()){
      accion.value = "editarPersona";
    }
    else{
      alert("Debe seleccionar solo un elemento a Editar");
      return false;
    }
  }
  else if( boton.value == "Eliminar"){
    accion.value = "eliminarPersona";
  }

  //Enviamos el formulario
  forma.submit();
}
function validaFormularioListadoUsuarios(boton){
    //Recuperamos la formay la accion para modificarla
  var forma = document.getElementById("form1");
  var accion = document.getElementById("accion");
  if( boton.value == "Agregar" ){
    accion.value = "agregarUsuario";
  }else if( boton.value == "Editar"){
    //Solo debe haber un elemento seleccionado
    if(this.validaUnicoCheckbox2()){
      accion.value = "editarUsuario";
    }else{
      alert("Debe seleccionar solo un elemento a Editar");
      return false;
    }
  }else if( boton.value == "Eliminar"){
    accion.value = "eliminarUsuario";
  }

  //Enviamos el formulario
  forma.submit();
}

//Validacion de solo un checkbox seleccionado
function validaUnicoCheckbox(){
  //Recuperamos la forma y el arreglo de checkboxes
  var forma = document.getElementById("form1");
  var personas = forma.personas;

  //Verificamos si se selecciono mas de un elemento
  contadorCheckboxes = 0;

  //Verificamos que sea un arreglo
  if(personas.length > 0){
    //Incrementamos el contador por cada
    for(i=0; i<personas.length; i++){
      if( personas[i].checked ){
        contadorCheckboxes++;
      }
    }
  }else{
    //Esto sucede cuando solo hay un elemento en la tabla, hay que recordar
    //que dinamicamente podrian eliminarse las personas y solo dejar un registro
    //por lo que ya no genera un arreglo en javascript, sino un checkbox aislado
    if(personas != null && personas.checked){
      contadorCheckboxes++;
    }
  }

  //Solo se debio haber seleccionado un elemento
  if(contadorCheckboxes == 1)
    return true;
  else
    return false;
}

//Validacion de solo un checkbox seleccionado
function validaUnicoCheckbox2(){
  //Recuperamos la forma y el arreglo de checkboxes
  var forma = document.getElementById("form1");
  var usuarios = forma.usuarios;

  //Verificamos si se selecciono mas de un elemento
  contadorCheckboxes = 0;

  //Verificamos que sea un arreglo
  if(usuarios.length > 0){
    //Incrementamos el contador por cada
    for(i=0; i<usuarios.length; i++){
      if( usuarios[i].checked ){
        contadorCheckboxes++;
      }
    }
  }else{
    //Esto sucede cuando solo hay un elemento en la tabla, hay que recordar
    //que dinamicamente podrian eliminarse las personas y solo dejar un registro
    //por lo que ya no genera un arreglo en javascript, sino un checkbox aislado
    if(usuarios != null && usuarios.checked){
      contadorCheckboxes++;
    }
  }

  //Solo se debio haber seleccionado un elemento
  if(contadorCheckboxes == 1)
    return true;
  else
    return false;
}

/*Regresamos al listado*/
function cancelar(){
  var forma = document.getElementById("form1");
  //Actualizamos el URL que tenia asignado el formulario
  //Para solicitar nuevamente el listado de personas, ya que estamos cancelando la modificacion
  window.location = forma.contexto.value + "/ServletControlador";
  forma.accion.value = "listarPersonas";
  forma.submit();
}

//Este evento nos permite detectar cuando damos click a una celda
function editaRegistro( renglonSeleccionado ){
  //Recuperamos la formay la accion para modificarla
  var forma = document.getElementById("form1");
  var accion = document.getElementById("accion");
 
accion.value = "editarPersona";
forma.personas[renglonSeleccionado-1].checked = true;

//Enviamos el formulario
forma.submit();
}

//Este evento nos permite detectar cuando damos click a una celda
function editaRegistroUsuario( renglonSeleccionado ){
  //alert(renglonSeleccionado);
  //Recuperamos la formay la accion para modificarla
  var forma = document.getElementById("form1");
  var accion = document.getElementById("accion");
 
accion.value = "editarUsuario";
forma.usuarios[renglonSeleccionado-1].checked = true;

//Enviamos el formulario
forma.submit();
}
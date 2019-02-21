//var ip = "http://localhost/info-vinculacion/";
var ip = "../";
var datosPrivilegio;

var id_rol = $('#id_rol').val();
var id_cedula = $('#id_cedula').val();

function privilegio(){
  archivoValidacion = ip+"ws/datos_administrativos.php?jsoncallback=?"

  $.getJSON(archivoValidacion, {
      //id_rol: id_rol
  }).done(function(respuestaServer) {
      if (respuestaServer.validacionPrivilegio == "ok") {
          datosPrivilegio = respuestaServer.datosPrivilegio;
          mostrarPrivilegio();
      }
      if (respuestaServer.validacionPrivilegio == "error") {
          toastr.error("Alerta: "+respuestaServer.mensajePrivilegio);
      }

  }).fail(function() {
      notificacion('Alerta: ','No se puede conectar con el Servidor!!');
  })

}

function mostrarPrivilegio(){
    var html = '<li class="nav-header">Navegación</li>';

    if(menus(id_rol, 'admPerfil')){
      html += '<li><a href="perfil.php"><i class="fa fa-user-o"></i> <span>Perfil</span></a></li>';
    }
    if(menus(id_rol, 'admPrivilegios')){
      html +='<li class="has-sub">'+
              '<a href="javascript:;">'+
                '<b class="caret pull-right"></b>'+
                '<i class="fa fa-laptop"></i>'+
                '<span>Administración</span>'+
              '</a>'+
              '<ul class="sub-menu">';
      if(menus(id_rol, 'admSistema')){
        html += '<li><a href="sistema.php">Datos Generales</a></li>';
      }
      if(menus(id_rol, 'admPrivilegios')){
        html += '<li><a href="privilegios.php">Adm Roles y Privilegios</a></li>';
      }      
      html += '</ul>'+
            '</li>';
      
    }
    html += '<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>';
    $(".nav_menu").prepend(html);
    App.init();
}

function notificacion(titulo,texto) {
    $.gritter.add({
      title: titulo,
      text: texto
    });
    return false
  };

$('.telefonos').on('input', function () { 
    this.value = this.value.replace(/[^0-9^/]/g,'');
});

function menus(idRol, buscar){
  var estado=false;

  for(var i=0 in datosPrivilegio) {
    if (datosPrivilegio[i].p_id_rol==idRol&&datosPrivilegio[i].p_pagina==buscar){
      estado=true;
      break;
    }
  }
  return estado;
} 
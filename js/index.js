$( ".password" ).keyup(function(event) {
  event.preventDefault();
    if (event.keyCode === 13) {
      $( ".ingresar" ).click();
    }
});

$( ".ingresar" ).click(function() {
  var username = $('.username').val();
  var password = $.md5($('.password').val());

  archivoValidacion =  "ws/select_usuario.php?jsoncallback=?"

  $.getJSON( archivoValidacion,{ 
    usuario:username,
    pass:password
  }).done(function(respuestaServer){ 
      if(respuestaServer.validacion == "ok"){
      var user= respuestaServer.datosU;
       //InsertarUsuario(user);
       var nombre = user[0].razon_social;
       location.href = "pags/perfil.php";
      }
      else{   
        //alert('Usuario y/o Contraseña Incorrectos!!');
        notificacion('Error', respuestaServer.mensaje);
      }
    }).fail(function() {

      notificacion('Error','No se puede conectar con el Servidor!!');
    })
});

function notificacion(titulo,texto) {
  $.gritter.add({
    title: titulo,
    text: texto
  });
};

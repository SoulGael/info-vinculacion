$(document).on("ready",  privilegio());
$(".messages").hide();
var fileExtension = ""; //queremos que esta variable sea global para la foto
var arrayProvincia = new Array();
var arrayCanton = new Array();
var arrayParroquia = new Array();

function cargarDatos() {
	var id_ciudadano = $('#id_ciudadano').val();
    //console.log(id_usuario);
    archivoValidacion = ip+"ws/cimtel_datos_administrativos.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
    }).done(function(respuestaServer) {
        //Datos Provincia
        if (respuestaServer.validacionProvincia == "ok") {
            var datosProvincia = respuestaServer.datosProvincia;

            for(var i=0 in datosProvincia) {
                $(".provincia").append('<option value=\''+datosProvincia[i].id_provincia+'\'>'+datosProvincia[i].provincia+'</option>');
                arrayProvincia.push([datosProvincia[i].id_provincia,datosProvincia[i].provincia]);
            }
        } 
        if (respuestaServer.validacionProvincia == "notOk") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            mensajeUnico("Alerta: ", respuestaServer.mensaje);
        }

        //Datos Canton
        if (respuestaServer.validacionCanton == "ok") {
            var datosCanton = respuestaServer.datosCanton;

            for(var i=0 in datosCanton) {
                //$(".canton").append('<option value=\''+datosCanton[i].id_canton+'\'>'+datosCanton[i].canton+'</option>');
                arrayCanton.push([datosCanton[i].id_canton,datosCanton[i].canton,datosCanton[i].id_provincia]);
            }
        } 
        if (respuestaServer.validacionCanton == "notOk") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            mensajeUnico("Alerta: ", respuestaServer.mensaje);
        }

        //Datos Parroquia
        if (respuestaServer.validacionParroquia == "ok") {
            var datosParroquia = respuestaServer.datosParroquia;

            for(var i=0 in datosParroquia) {
                //$(".parroquia").append('<option value=\''+datosParroquia[i].id_parroquia+'\'>'+datosParroquia[i].parroquia+'</option>');
                arrayParroquia.push([datosParroquia[i].id_parroquia,datosParroquia[i].parroquia,datosParroquia[i].id_canton]);
            }
        } 
        if (respuestaServer.validacionParroquia == "notOk") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            mensajeUnico("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        mensajeUnico("Alerta:", 'No se puede conectar con el Servidor de Datos Administrativos!!');
    })
    
    //Datos Ciudadano
    archivoValidacion = ip+"ws/cimtel_select_datos_ciudadano.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        id_ciudadano: id_ciudadano
    }).done(function(respuestaServer) {

        //Datos usuario
        if (respuestaServer.validacion == "ok") {
            var user = respuestaServer.datosU;
            var foto = user[0].FOTO != null ? user[0].FOTO : "../img/user-12.jpg";
            //var nombre = user[0].NOMBRES + " " + user[0].APELLIDOS;
            $("#infoGeneral").html('<h4>'+user[0].RAZON_SOCIAL+
                                        '<small>'+user[0].CEDULA+'</small>'+
                                        '<small>'+user[0].TELEFONOS+'</small></h4>'+
                                        '<small>'+user[0].DIRECCION+'</small></h4>');

            $(".cedula").val(user[0].CEDULA);
            $(".nombres").val(user[0].RAZON_SOCIAL);
            $(".f_nacimiento").val(user[0].FECHA_NACIMIENTO);
            $(".telefonos").val(user[0].TELEFONOS);
            $(".direccion").val(user[0].DIRECCION);
            $(".email").val(user[0].EMAIL);            
            $(".user").val(user[0].USUARIO);
            $(".pass").val("");
            $(".passAnt").val(user[0].PASS);
            $(".coorx").val(user[0].coordenadax);
            $(".coory").val(user[0].coordenaday);

            $(".genero").val(user[0].GENERO);
            $(".provincia").val(user[0].PROVINCIA);
            $(".provincia").change();
            $(".canton").val(user[0].CANTON);
            $(".canton").change();
            $(".parroquia").val(user[0].PARROQUIA);

            $(".imagenPerfil").html('<img width="100%" src="'+foto+'" alt="Imagen de Perfil"> <i class="fa fa-user hide"></i>');            
            
        } else {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            mensajeUnico("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        mensajeUnico("Alerta:", 'No se puede conectar con el Servidor!!');
    })
}

$('.provincia').change(function(){
    var idProv = $(".provincia").val();
    $(".canton").html("");
    $(".canton").append('<option value="-1">Elejir...</option>');
    for(var i=0; i < arrayCanton.length ; i++) {
        if(arrayCanton[i][2]==idProv){
            $(".canton").append('<option value=\''+arrayCanton[i][0]+'\'>'+arrayCanton[i][1]+'</option>');
        }
        //$(".parroquia").append('<option value=\''+datosParroquia[i].id_parroquia+'\'>'+datosParroquia[i].parroquia+'</option>');
    }
})

$('.canton').change(function(){
    var idCanton = $(".canton").val();
    $(".parroquia").html("");
    $(".parroquia").append('<option value="-1">Elejir...</option>');
    for(var i=0; i < arrayParroquia.length ; i++) {
        if(arrayParroquia[i][2]==idCanton){
            $(".parroquia").append('<option value=\''+arrayParroquia[i][0]+'\'>'+arrayParroquia[i][1]+'</option>');
        }
        //$(".parroquia").append('<option value=\''+datosParroquia[i].id_parroquia+'\'>'+datosParroquia[i].parroquia+'</option>');
    }
})

$('.guardar').click(function(){
    var id_ciudadano = $("#id_ciudadano").val();
    var tipo_ciudadano = $("#id_rol").val();
    var cedula = $(".cedula").val();
    var nombres = $(".nombres").val().toUpperCase();
    var genero = $(".genero").val();
    var f_nacimiento = $(".f_nacimiento").val();
    var telefonos = $(".telefonos").val();
    var provincia = $(".provincia").val();
    var canton = $(".canton").val();
    var parroquia = $(".parroquia").val();
    var direccion = $(".direccion").val();
    var email = $(".email").val();
    var user = $(".user").val();
    var coorx = $(".coorx").val();
    var coory = $(".coory").val();    
    
    var pass = $(".pass").val();
    if( pass==""){
    	pass = $(".passAnt").val();
    }

    //0990336151 Cristina sai
    archivoValidacion = ip+"ws/cimtel_sincronizar_ciudadano.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        id_ciudadano: id_ciudadano,
        cedula: cedula,
        nombres: nombres,
        genero: genero, 
        f_nacimiento: f_nacimiento,
        telefonos: telefonos,
        provincia: provincia,
        canton: canton,
        parroquia: parroquia,
        direccion: direccion,
        email: email,
        user: user,
        pass: pass,
        coorx: coorx,
        coory: coory,
        tipo_ciudadano: tipo_ciudadano
    }).done(function(respuestaServer) {

        if (respuestaServer.validacion == "ok") {
        	cargarDatos();
        	//var user = respuestaServer.datosU;
            //var nombre = user[0].NOMBRES + " " + user[0].APELLIDOS;
            mensajeUnico("Alerta: ", respuestaServer.mensaje);
        } else {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            mensajeUnico("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        mensajeUnico("Alerta:", 'No se puede conectar con el Servidor!!');
    })

})



//función que observa los cambios del campo file y obtiene información
$(':file').change(function()
{
    //obtenemos un array con los datos del archivo
    var file = $("#imagen")[0].files[0];
    //obtenemos el nombre del archivo
    var fileName = file.name;
    //obtenemos la extensión del archivo
    fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
    //obtenemos el tamaño del archivo
    var fileSize = file.size;
    //obtenemos el tipo de archivo image/png ejemplo
    var fileType = file.type;
    //mensaje con la información del archivo
    showMessage("<span class='info'>Archivo para subir: "+fileName+", peso total: "+fileSize+" bytes.</span>");
});

//al enviar el formulario
$(':button').click(function(){
    //información del formulario
    var formData = new FormData($(".formulario")[0]);
    var message = ""; 
    //hacemos la petición ajax  
    $.ajax({
        url: 'subirFoto.php',  
        type: 'POST',
        // Form data
        //datos del formulario
        data: formData,
        //necesario para subir archivos via ajax
        cache: false,
        contentType: false,
        processData: false,
        //mientras enviamos el archivo
        beforeSend: function(){
            message = $("<span class='before'>Subiendo la imagen, por favor espere...</span>");
            showMessage(message)        
        },
        //una vez finalizado correctamente
        success: function(data){
            message = $("<span class='success'>La imagen ha subido correctamente.</span>");
            showMessage(message);
            if(isImage(fileExtension))
            {
                $(".imagenPerfil").html("<img width='100%' alt='Imagen de Perfil' src='../img/perfil/"+data+"' />");
            }
        },
        //si ha ocurrido un error
        error: function(){
            message = $("<span class='error'>Ha ocurrido un error.</span>");
            showMessage(message);
        }
    });
});

function showMessage(message){
    $(".messages").html("").show();
    $(".messages").html(message);
}
 
//comprobamos si el archivo a subir es una imagen
//para visualizarla una vez haya subido
function isImage(extension)
{
    switch(extension.toLowerCase()) 
    {
        case 'jpg': case 'gif': case 'png': case 'jpeg':
            return true;
        break;
        default:
            return false;
        break;
    }
}
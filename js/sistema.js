$(document).on("ready", privilegio(), cargarDatos());
var datosProvincia;
var datosCiudad;
var datosExtension;
var datosModalidad;
var datosFacultad;

function cargarDatos() {    
    //Datos Administrativos
    archivoValidacion = ip+"ws/datos_administrativos.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
    }).done(function(respuestaServer) {

        //Datos Provincia
        $(".divProvincias").html("");
        $(".form-select-provincia").html('<option value="-1">Seleccione un valor</option>');
        $(".form-select-extProvincia").html('<option value="-1">Seleccione un valor</option>');
        var html = '';
        if (respuestaServer.validacionProvincia == "ok") {
            datosProvincia = respuestaServer.datosProvincia;
            for(var i=0 in datosProvincia) {
                var estado = datosProvincia[i].estado=="a" ? "Activo" : "Inactivo";
                html +='<li class="media media-sm">'+
                            '<div class="media-body">'+
                                '<span class="label label-inverse f-s-10 pull-right">'+estado+'</span>'+
                                '<strong>'+datosProvincia[i].provincia+'</strong><br>'+
                                //'<small class="text-muted">Today 5:60 pm - 12.06.2014</small>'+
                                '<p>'+
                                    '<a href="javascript:;" class="btn btn-xs btn-warning m-r-5" onclick="verProvincias('+datosProvincia[i].id_provincia+')">Modificar</a>'+
                                '</p>'+
                            '</div>'+
                        '</li>';
                if(estado=="Activo"){
                    $(".form-select-provincia").append('<option value="'+datosProvincia[i].id_provincia+'">'+datosProvincia[i].provincia+'</option>');
                    $(".form-select-extProvincia").append('<option value="'+datosProvincia[i].id_provincia+'">'+datosProvincia[i].provincia+'</option>');
                }
            }
            $(".divProvincias").append(html);
        } 
        if (respuestaServer.validacionProvincia == "error") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            notificacion("Alerta: ", respuestaServer.mensajeProvincia);
        }

        //Datos Ciudad
        $(".divCiudades").html("");
        var html = '';
        if (respuestaServer.validacionCiudad == "ok") {
            datosCiudad = respuestaServer.datosCiudad;
            for(var i=0 in datosCiudad) {
                var estado = datosCiudad[i].estado=="a" ? "Activo" : "Inactivo";
                html +='<li class="media media-sm">'+
                            '<div class="media-body">'+
                                '<span class="label label-inverse f-s-10 pull-right">'+estado+'</span>'+
                                '<strong>'+datosCiudad[i].ciudad+'</strong><br>'+
                                '<small class="text-muted">'+datosCiudad[i].provincia+'</small>'+
                                '<p>'+
                                    '<a href="javascript:;" class="btn btn-xs btn-warning m-r-5" onclick="verCiudades('+datosCiudad[i].id_ciudad+')">Modificar</a>'+
                                '</p>'+
                            '</div>'+
                        '</li>';
            }
            $(".divCiudades").append(html);
        } 
        if (respuestaServer.validacionCiudad == "error") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            notificacion("Alerta: ", respuestaServer.mensajeCiudad);
        }

    }).fail(function() {
        notificacion("Alerta:"," No se puede conectar con el Servidor!!");
    })

    //Datos Universidad
    archivoValidacion = ip+"ws/datos_universidad.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
    }).done(function(respuestaServer) {

        //Datos Extension
        $(".divExtension").html("");
        $(".form-select-facExtension").html('<option value="-1">Seleccione un valor</option>');
        var html = '';
        if (respuestaServer.validacionExtension == "ok") {
            datosExtension = respuestaServer.datosExtension;
            for(var i=0 in datosExtension) {
                var estado = datosExtension[i].estado=="a" ? "Activo" : "Inactivo";
                html +='<li class="media media-sm">'+
                            '<div class="media-body">'+
                                '<span class="label label-inverse f-s-10 pull-right">'+estado+'</span>'+
                                '<strong>'+datosExtension[i].extension+'</strong><br>'+
                                '<small class="text-muted">'+datosExtension[i].codigo_u+' - '+datosExtension[i].ciudad+' - '+datosExtension[i].provincia+'</small>'+
                                '<p>'+
                                    '<a href="javascript:;" class="btn btn-xs btn-warning m-r-5" onclick="verExtension('+datosExtension[i].id_extension+')">Modificar</a>'+
                                '</p>'+
                            '</div>'+
                        '</li>';
                if(estado=="Activo"){
                    $(".form-select-facExtension").append('<option value="'+datosExtension[i].id_extension+'">'+datosExtension[i].extension+'</option>');
                }
            }
            $(".divExtension").append(html);
        } 
        if (respuestaServer.validacionExtension == "error") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            notificacion("Alerta: ", respuestaServer.mensajeExtension);
        }

        //Datos Modalidad
        $(".divModalidad").html("");
        var html = '';
        if (respuestaServer.validacionModalidad == "ok") {
            datosModalidad = respuestaServer.datosModalidad;
            for(var i=0 in datosModalidad) {
                var estado = datosModalidad[i].estado=="a" ? "Activo" : "Inactivo";
                html +='<li class="media media-sm">'+
                            '<div class="media-body">'+
                                '<span class="label label-inverse f-s-10 pull-right">'+estado+'</span>'+
                                '<strong>'+datosModalidad[i].modalidad+'</strong><br>'+
                                '<p>'+
                                    '<a href="javascript:;" class="btn btn-xs btn-warning m-r-5" onclick="verModalidad('+datosModalidad[i].id_modalidad+')">Modificar</a>'+
                                '</p>'+
                            '</div>'+
                        '</li>';
            }
            $(".divModalidad").append(html);
        } 
        if (respuestaServer.validacionModalidad == "error") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            notificacion("Alerta: ", respuestaServer.mensajeModalidad);
        }

        //Datos Facultad
        $(".divFacultad").html("");
        var html = '';
        if (respuestaServer.validacionFacultad == "ok") {
            datosFacultad = respuestaServer.datosFacultad;
            
            for(var i=0 in datosFacultad) {
                var estado = datosFacultad[i].estado=="a" ? "Activo" : "Inactivo";
                html +='<li class="media media-sm">'+
                            '<div class="media-body">'+
                                '<span class="label label-inverse f-s-10 pull-right">'+estado+'</span>'+
                                '<strong>'+datosFacultad[i].facultad+'</strong><br>'+
                                '<small class="text-muted">'+datosFacultad[i].extension+' - '+datosFacultad[i].ciudad+' - '+datosFacultad[i].provincia+'</small>'+
                                '<p>'+
                                    '<a href="javascript:;" class="btn btn-xs btn-warning m-r-5" onclick="verFacultad('+datosFacultad[i].id_facultad+')">Modificar</a>'+
                                '</p>'+
                            '</div>'+
                        '</li>';
            }
            $(".divFacultad").append(html);
        } 
        if (respuestaServer.validacionFacultad == "error") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            notificacion("Alerta: ", respuestaServer.mensajeFacultad);
        }

    }).fail(function() {
        notificacion("Alerta:"," No se puede conectar con el Servidor!!");
    })

    FormPlugins.init();
}

//Provincias
function verProvincias(idProvincia){
    for(var i=0 in datosProvincia) {
        if(datosProvincia[i].id_provincia==idProvincia){
            $(".form-id-provincia").val(idProvincia);
            $(".form-provincia").val(datosProvincia[i].provincia);

            datosProvincia[i].estado=='a' ? $("#radio-provincia1").prop("checked", true) : $("#radio-provincia2").prop("checked", true);
        }
    }
}

$('.form-guardar-provincia').click(function(){
    
    var form_id_provincia = $(".form-id-provincia").val();
    var form_provincia = $(".form-provincia").val().toUpperCase();
    var form_estado_provincia = $('input[name=radioProvincia]:checked').val();

    if(form_provincia==""){
        notificacion("Alerta ", "Ingrese un valor en el campo de Provincia");
        return;
    }

    archivoValidacion = ip+"ws/sincronizar_provincia.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
        form_id_provincia: form_id_provincia,
        form_provincia: form_provincia,
        form_estado: form_estado_provincia

    }).done(function(respuestaServer) {

        if (respuestaServer.validacion == "ok") {
            cargarDatos();
            notificacion("Listo", respuestaServer.mensaje);
        } else {
            notificacion("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        notificacion("Alerta: ", "No se puede conectar con el Servidor!!");
    })

})

$('.btn-nuevo-provincia').click(function(){
    $('input[type="text"]').val('');
    $(".form-id-provincia").val("-1");
    $("#radio-provincia1").prop("checked", true);
})
//Fin Provincias

//Cantón
function verCiudades(idCiudad){
    for(var i=0 in datosCiudad) {
        if(datosCiudad[i].id_ciudad==idCiudad){
            $(".form-id-ciudad").val(idCiudad);
            $(".form-ciudad").val(datosCiudad[i].ciudad);
            $(".form-select-provincia").val(datosCiudad[i].id_provincia);

            datosCiudad[i].estado=='a' ? $("#radio-ciudad1").prop("checked", true) : $("#radio-ciudad2").prop("checked", true);
            FormPlugins.init();
        }
    }
}

$('.form-guardar-ciudad').click(function(){
    
    var form_id_ciudad = $(".form-id-ciudad").val();
    var form_select_provincia = $(".form-select-provincia").val();
    var form_ciudad = $(".form-ciudad").val().toUpperCase();
    var form_estado_ciudad = $('input[name=radioCiudad]:checked').val();

    if(form_select_provincia=="-1"){
        notificacion("Alerta ", "Seleccione una Provincia");
        return;
    }
    if(form_ciudad==""){
        notificacion("Alerta ", "Ingrese un valor en el campo de Ciudad");
        return;
    }


    archivoValidacion = ip+"ws/sincronizar_ciudad.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
        form_id_ciudad: form_id_ciudad,
        form_id_provincia: form_select_provincia,
        form_ciudad: form_ciudad,
        form_estado: form_estado_ciudad

    }).done(function(respuestaServer) {

        if (respuestaServer.validacion == "ok") {
            cargarDatos();
            notificacion("Listo", respuestaServer.mensaje);
        } else {
            notificacion("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        notificacion("Alerta: ", "No se puede conectar con el Servidor!!");
    })

})

$('.btn-nuevo-ciudad').click(function(){
    $('input[type="text"]').val('');
    $(".form-id-ciudad").val("-1");
    $("#radio-ciudad1").prop("checked", true);
})
//Fin Cantón

//Modalidad
function verModalidad(idModalidad){
    for(var i=0 in datosModalidad) {
        if(datosModalidad[i].id_modalidad==idModalidad){
            $(".form-id-modalidad").val(idModalidad);
            $(".form-modalidad").val(datosModalidad[i].modalidad);

            datosModalidad[i].estado=='a' ? $("#radio-modalidad1").prop("checked", true) : $("#radio-modalidad2").prop("checked", true);
        }
    }
}

$('.form-guardar-modalidad').click(function(){
    
    var form_id_modalidad = $(".form-id-modalidad").val();
    var form_modalidad = $(".form-modalidad").val().toUpperCase();
    var form_estado_modalidad = $('input[name=radioModalidad]:checked').val();

    if(form_modalidad==""){
        notificacion("Alerta ", "Ingrese un valor en el campo de Modalidad");
        return;
    }

    archivoValidacion = ip+"ws/sincronizar_modalidad.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
        id_modalidad: form_id_modalidad,
        modalidad: form_modalidad,
        estado: form_estado_modalidad

    }).done(function(respuestaServer) {

        if (respuestaServer.validacion == "ok") {
            cargarDatos();
            notificacion("Listo", respuestaServer.mensaje);
        } else {
            notificacion("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        notificacion("Alerta: ", "No se puede conectar con el Servidor!!");
    })

})

$('.btn-nuevo-modalidad').click(function(){
    $('input[type="text"]').val('');
    $(".form-id-modalidad").val("-1");
    $("#radio-modalidad1").prop("checked", true);
})
//Fin Modalidad

//Extensiones
function verExtension(idExtension){
    for(var i=0 in datosExtension) {
        if(datosExtension[i].id_extension==idExtension){
            $(".form-id-extension").val(idExtension);
            $(".form-extension").val(datosExtension[i].extension);
            $(".form-codigo-extension").val(datosExtension[i].codigo_u);

            $(".form-select-extProvincia").val(datosExtension[i].id_provincia);
            $(".form-select-extProvincia").change();
            $(".form-select-extCiudad").val(datosExtension[i].id_ciudad);

            datosExtension[i].estado=='a' ? $("#radio-extension1").prop("checked", true) : $("#radio-extension2").prop("checked", true);
        }
    }
}

$('.form-select-extProvincia').change(function(){
    var idProv = $(".form-select-extProvincia").val();
    $(".form-select-extCiudad").html('<option value="-1">Seleccione un valor</option>');
    for(var i=0; i < datosCiudad.length ; i++) {
        if(datosCiudad[i].id_provincia==idProv){
            if(datosCiudad[i].estado=="a"){
                $(".form-select-extCiudad").append('<option value="'+datosCiudad[i].id_ciudad+'">'+datosCiudad[i].ciudad+'</option>');
            }
        }
    }
})

$('.form-guardar-extesion').click(function(){
    
    var form_id_extension = $(".form-id-extension").val();
    var form_select_extCiudad = $(".form-select-extCiudad").val();
    var form_extension = $(".form-extension").val().toUpperCase();
    var form_codigo_extension = $(".form-codigo-extension").val();
    var form_estado_extension = $('input[name=radioExtension]:checked').val();

    if(form_select_extCiudad=="-1"){
        notificacion("Alerta ", "Seleccione una Ciudad");
        return;
    }
    if(form_extension==""){
        notificacion("Alerta ", "Ingrese un valor en el campo de Extesión");
        return;
    }


    archivoValidacion = ip+"ws/sincronizar_extension.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
        id_extension: form_id_extension,
        id_ciudad: form_select_extCiudad,
        extension: form_extension,
        codigo_extension: form_codigo_extension,
        estado: form_estado_extension

    }).done(function(respuestaServer) {

        if (respuestaServer.validacion == "ok") {
            cargarDatos();
            notificacion("Listo: ", respuestaServer.mensaje);
        } else {
            notificacion("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        notificacion("Alerta: ", "No se puede conectar con el Servidor!!");
    })

})

$('.btn-nuevo-extension').click(function(){
    $('input[type="text"]').val('');
    $(".form-id-extension").val("-1");
    $("#radio-extension1").prop("checked", true);
})
//Fin Extensiones

//Facultad
function verFacultad(idFacultad){
    for(var i=0 in datosFacultad) {
        if(datosFacultad[i].id_facultad==idFacultad){
            $(".form-id-facultad").val(idFacultad);
            $(".form-facultad").val(datosFacultad[i].facultad);

            $(".form-select-facExtension").val(datosFacultad[i].id_extension);

            datosFacultad[i].estado=='a' ? $("#radio-facultad1").prop("checked", true) : $("#radio-facultad2").prop("checked", true);
        }
    }
}

$('.form-guardar-facultad').click(function(){
    
    var form_id_facultad = $(".form-id-facultad").val();
    var form_facultad = $(".form-facultad").val().toUpperCase();
    var form_select_facExtension = $(".form-select-facExtension").val();
    var form_estado_facultad = $('input[name=radioFacultad]:checked').val();

    if(form_select_facExtension=="-1"){
        notificacion("Alerta ", "Seleccione una Extensión");
        return;
    }
    if(form_facultad==""){
        notificacion("Alerta ", "Ingrese un valor en el campo de Facultad");
        return;
    }


    archivoValidacion = ip+"ws/sincronizar_facultad.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
        id_facultad: form_id_facultad,
        facultad: form_facultad,
        id_extension: form_select_facExtension,
        estado: form_estado_facultad

    }).done(function(respuestaServer) {

        if (respuestaServer.validacion == "ok") {
            cargarDatos();
            notificacion("Listo: ", respuestaServer.mensaje);
        } else {
            notificacion("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        notificacion("Alerta: ", "No se puede conectar con el Servidor!!");
    })

})

$('.btn-nuevo-facultad').click(function(){
    $('input[type="text"]').val('');
    $(".form-id-facultad").val("-1");
    $("#radio-facultad1").prop("checked", true);
})
//Fin Facultad
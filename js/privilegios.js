$(document).on("ready", privilegio(), cargarDatos());
var datosRol;


function cargarDatos() {    
    //Datos Usuario
    archivoValidacion = ip+"ws/datos_administrativos.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
    }).done(function(respuestaServer) {

        //Datos usuario
        $(".divRoles").html("");
        var html = '';
        if (respuestaServer.validacionRol == "ok") {
            datosRol = respuestaServer.datosRol;
            for(var i=0 in datosRol) {
                var estado = datosRol[i].estado=="a" ? "Activo" : "Inactivo";
                html +='<li class="media media-sm">'+
                            '<div class="media-body">'+
                                '<span class="label label-inverse f-s-10 pull-right">'+estado+'</span>'+
                                '<strong>'+datosRol[i].rol+'</strong><br>'+
                                //'<small class="text-muted">Today 5:60 pm - 12.06.2014</small>'+
                                '<p>'+
                                    '<a href="javascript:;" class="btn btn-xs btn-warning m-r-5" onclick="verPrivilegios('+datosRol[i].id_rol+')">Modificar</a>'+
                                '</p>'+
                            '</div>'+
                        '</li>';
            }
            $(".divRoles").append(html);
        } 
        if (respuestaServer.validacionRol == "error") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            notificacion("Alerta: ", respuestaServer.mensaje);
        }

    }).fail(function() {
        notificacion("Alerta:"," No se puede conectar con el Servidor!!");
    })
}

function verPrivilegios(idRol){
    for(var i=0 in datosRol) {
        if(datosRol[i].id_rol==idRol){
            $(".form-id-rol").val(idRol);
            $(".form-rol").val(datosRol[i].rol);

            datosRol[i].estado=='a' ? $("#inlineRadio1").prop("checked", true) : $("#inlineRadio2").prop("checked", true);
        }
    }

    //Priilegios
    archivoValidacion = ip+"ws/select_datos_privilegio.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        idRol: idRol
    }).done(function(respuestaServer) {
        //console.log(respuestaServer);
        $("#idBody").html("");
        if (respuestaServer.validacionOtorgados == "ok") {
            var datosOtorgados = respuestaServer.datosOtorgados;
            //var nombre = user[0].NOMBRES + " " + user[0].APELLIDOS;
            for(var i=0 in datosOtorgados) {
                $("#idBody").append("<tr>"+
                                        "<td>"+datosOtorgados[i].descripcion+"</td>"+
                                        "<td>"+
                                            "<input type='checkbox' data-render='switchery' data-theme='red' checked onchange=cambiarPrivilegios('"+idRol+"','"+datosOtorgados[i].id_pagina+"','f') />"+
                                        "</td>"+
                                    "</tr>");
            }
            
        } 
        if (respuestaServer.validacionOtorgados == "notOk") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            //mensajeUnico("Alerta: ", respuestaServer.mensajeOtorgados);
        }

        //Denegados
        if (respuestaServer.validacionDenegados == "ok") {
            var datosDenegados = respuestaServer.datosDenegados;
            //var nombre = user[0].NOMBRES + " " + user[0].APELLIDOS;
            for(var i=0 in datosDenegados) {
                $("#idBody").append("<tr>"+
                                        "<td>"+datosDenegados[i].descripcion+"</td>"+
                                        "<td>"+
                                            "<input type='checkbox' data-render='switchery' data-theme='red' onchange=cambiarPrivilegios('"+idRol+"','"+datosDenegados[i].id_pagina+"','t') />"+
                                        "</td>"+
                                    "</tr>");
            }
            
        } 
        if (respuestaServer.validacionDenegados == "notOk") {
            //alert('Usuario y/o Contraseña Incorrectos!!');
            //mensajeUnico("Alerta: ", respuestaServer.mensajeDenegados);
        }
        FormSliderSwitcher.init();
    }).fail(function() {
        notificacion("Alerta:", 'No se puede conectar con el Servidor!!');
    })
}

$('.form_guardar').click(function(){
    
    var form_id_rol = $(".form-id-rol").val();
    var form_rol = $(".form-rol").val().toUpperCase();
    var form_estado = $('input[name=radioInline]:checked').val();

    archivoValidacion = ip+"ws/sincronizar_rol.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        
        form_id_rol: form_id_rol,
        form_rol: form_rol,
        form_estado: form_estado

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

$('.btn_nuevo').click(function(){
    $('input[type="text"]').val('');
    $(".form-id-rol").val("-1");
    $("#inlineRadio1").prop("checked", true);
    $('#idBody').html('');
})

function cambiarPrivilegios(idRol, idPagina, estado){
    archivoValidacion = ip+"ws/sincronizar_privilegios.php?jsoncallback=?"

    $.getJSON(archivoValidacion, {
        idRol: idRol,
        idPagina: idPagina,
        estado: estado

    }).done(function(respuestaServer) {

        if (respuestaServer.validacion == "ok") {
            cargarDatos();
            notificacion(respuestaServer.mensaje);
        } else {
            notificacion("Alerta: ", respuestaServer.mensaje);
        }
    }).fail(function() {
        notificacion("Alerta: ","No se puede conectar con el Servidor!!");
    })
}
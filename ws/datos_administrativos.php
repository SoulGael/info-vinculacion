<?php
ob_start();
session_start();
require_once('conecta.php');
/* crea un array con datos arbitrarios que seran enviados de vuelta a la aplicacion */

/* Inicio Datos */
$resultados = array();
mysqli_select_db($conecta,$database_conecta);

//PROVINCIA
$datosProvincia = array();

$query_provincia = "SELECT * FROM tbl_provincia;";
$provincia = mysqli_query($conecta,$query_provincia) or die(mysqli_error($conecta));

$totalRows_provincia = mysqli_num_rows($provincia);
if($totalRows_provincia>0)
{
	while ($row_provincia = mysqli_fetch_assoc($provincia)) {
		$datosProvincia[]=array('id_provincia'=> $row_provincia['id_provincia'],
						'provincia'=> $row_provincia['provincia'],
						'estado'=> $row_provincia['estado']);
	}

	$resultados["mensajeProvincia"] = "Validacion Correcta";
	$resultados["validacionProvincia"] = "ok";
	$resultados["datosProvincia"]=$datosProvincia;

}else{
	$resultados["mensajeProvincia"] = "No se encontraron datos";
	$resultados["validacionProvincia"] = "error";
	$resultados["datosProvincia"]=$query_provincia;
}
/* Fin Provincia*/

//Canton
$datosCiudad = array();

$query_ciudad = "SELECT * FROM vta_ciudad order by id_provincia;";
$ciudad = mysqli_query($conecta,$query_ciudad) or die(mysqli_error($conecta));

$totalRows_ciudad = mysqli_num_rows($ciudad);
if($totalRows_ciudad>0)
{
	while ($row_ciudad = mysqli_fetch_assoc($ciudad)) {
		$datosCiudad[]=array('id_ciudad'=> $row_ciudad['id_ciudad'],
						'ciudad'=> $row_ciudad['ciudad'],
						'estado'=> $row_ciudad['estado'],
						'id_provincia'=> $row_ciudad['id_provincia'],
						'provincia'=> $row_ciudad['provincia']);
	}

	$resultados["mensajeCiudad"] = "Validacion Correcta";
	$resultados["validacionCiudad"] = "ok";
	$resultados["datosCiudad"]=$datosCiudad;

}else{
	$resultados["mensajeCiudad"] = "No se encontraron datos";
	$resultados["validacionCiudad"] = "error";
	$resultados["datosCiudad"]=$query_ciudad;
}
/* Fin Canton*/

/* PRIVILEGIOS */
$datosPrivilegio= array();

$query_privilegio = "SELECT * FROM vta_privilegio;";
$privilegio = mysqli_query($conecta,$query_privilegio) or die(mysqli_error($conecta));

$totalRows_privilegio = mysqli_num_rows($privilegio);
if($totalRows_privilegio>0)
{
	while ($row_privilegio = mysqli_fetch_assoc($privilegio)) {
		$datosPrivilegio[]=array('p_id_rol'=> $row_privilegio['id_rol'],
						'p_id_pagina'=> $row_privilegio['id_pagina'],
						'p_pagina'=> $row_privilegio['pagina'],
						'p_descripcion'=> $row_privilegio['descripcion']);
	}

	$resultados["mensajePrivilegio"] = "Validacion Correcta";
	$resultados["validacionPrivilegio"] = "ok";
	$resultados["datosPrivilegio"]=$datosPrivilegio;
	
}else{
	$resultados["mensajePrivilegio"] = "Error al recojer datos de los Privilegios";
	$resultados["validacionPrivilegio"] = "error";
	$resultados["datosPrivilegio"] = $privilegio;
}
/* Fin PRIVILEGIOS*/

/* ROLES */
$datosRol= array();

$query_rol = "SELECT * FROM tbl_rol order by rol;";
$rol = mysqli_query($conecta,$query_rol) or die(mysqli_error($conecta));

$totalRows_rol = mysqli_num_rows($rol);
//$resultados["totalRol"] = $totalRows_rol;
if($totalRows_rol>0)
{
	while ($row_rol = mysqli_fetch_assoc($rol)) {
		$datosRol[]=array('id_rol'=> $row_rol['id_rol'],
						'rol'=> $row_rol['rol'],
						'estado'=> $row_rol['estado']);
	}

	$resultados["mensajeRol"] = "Validacion Correcta";
	$resultados["validacionRol"] = "ok";
	$resultados["datosRol"]=$datosRol;
	
}else{
	$resultados["mensajeRol"] = "Error al recojer datos de los Roles";
	$resultados["validacionRol"] = "error";
	$resultados["datosRol"] = $rol;
}
/* FIn ROLES */

mysqli_close($conecta);
$resultadosJson = json_encode($resultados);


echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';

			header('Content-type: application/json');
			
			//Se abre el acceso a las conexiones que requieran de esta aplicacion
			header("Access-Control-Allow-Origin: *");
ob_end_flush();
?>


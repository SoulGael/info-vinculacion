<?php
ob_start();
session_start();
require_once('conecta.php');
/* crea un array con datos arbitrarios que seran enviados de vuelta a la aplicacion */

/* Inicio Datos */
$resultados = array();
mysqli_select_db($conecta,$database_conecta);

//Extension
$datosExtension = array();

$query_extension = "SELECT * FROM vta_extension;";
$extension = mysqli_query($conecta,$query_extension) or die(mysqli_error($conecta));

$totalRows_extension = mysqli_num_rows($extension);
if($totalRows_extension>0)
{
	while ($row_extension = mysqli_fetch_assoc($extension)) {
		$datosExtension[]=array('id_extension'=> $row_extension['id_extension'],
						'extension'=> $row_extension['extension'],
						'estado'=> $row_extension['estado'],
						'codigo_u'=> $row_extension['codigo_u'],
						'id_ciudad'=> $row_extension['id_ciudad'],
						'ciudad'=> $row_extension['ciudad'],
						'id_provincia'=> $row_extension['id_provincia'],
						'provincia'=> $row_extension['provincia']);
	}

	$resultados["mensajeExtension"] = "Validacion Correcta";
	$resultados["validacionExtension"] = "ok";
	$resultados["datosExtension"]=$datosExtension;

}else{
	$resultados["mensajeExtension"] = "No se encontraron datos";
	$resultados["validacionExtension"] = "error";
	$resultados["datosExtension"]=$query_extension;
}
/* Fin Extension*/

//Modalidad
$datosModalidad = array();

$query_modalidad = "SELECT * FROM tbl_modalidad;";
$modalidad = mysqli_query($conecta,$query_modalidad) or die(mysqli_error($conecta));

$totalRows_modalidad = mysqli_num_rows($modalidad);
if($totalRows_modalidad>0)
{
	while ($row_modalidad = mysqli_fetch_assoc($modalidad)) {
		$datosModalidad[]=array('id_modalidad'=> $row_modalidad['id_modalidad'],
						'modalidad'=> $row_modalidad['modalidad'],
						'estado'=> $row_modalidad['estado']);
	}

	$resultados["mensajeModalidad"] = "Validacion Correcta";
	$resultados["validacionModalidad"] = "ok";
	$resultados["datosModalidad"]=$datosModalidad;

}else{
	$resultados["mensajeModalidad"] = "No se encontraron datos";
	$resultados["validacionModalidad"] = "error";
	$resultados["datosModalidad"]=$query_modalidad;
}
/* Fin Extension*/

//Facultad
$datosFacultad = array();

$query_facultad = "SELECT * FROM vta_facultad;";
$facultad = mysqli_query($conecta,$query_facultad) or die(mysqli_error($conecta));

$totalRows_facultad = mysqli_num_rows($facultad);
if($totalRows_facultad>0)
{
	while ($row_facultad = mysqli_fetch_assoc($facultad)) {
		$datosFacultad[]=array('id_facultad'=> $row_facultad['id_facultad'],
						'facultad'=> $row_facultad['facultad'],
						'estado'=> $row_facultad['estado'],
						'id_extension'=> $row_facultad['id_extension'],
						'extension'=> $row_facultad['extension'],
						'codigo_u'=> $row_facultad['codigo_u'],
						'id_ciudad'=> $row_facultad['id_ciudad'],
						'ciudad'=> $row_facultad['ciudad'],
						'id_provincia'=> $row_facultad['id_provincia'],
						'provincia'=> $row_facultad['provincia']);
	}

	$resultados["mensajeFacultad"] = "Validacion Correcta";
	$resultados["validacionFacultad"] = "ok";
	$resultados["datosFacultad"]=$datosFacultad;

}else{
	$resultados["mensajeFacultad"] = "No se encontraron datos";
	$resultados["validacionFacultad"] = "error";
	$resultados["datosFacultad"]=$query_facultad;
}
/* Fin Facultad*/

mysqli_close($conecta);
$resultadosJson = json_encode($resultados);


echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';

			header('Content-type: application/json');
			
			//Se abre el acceso a las conexiones que requieran de esta aplicacion
			header("Access-Control-Allow-Origin: *");
ob_end_flush();
?>


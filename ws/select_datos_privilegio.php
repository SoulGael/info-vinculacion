<?php
ob_start();
session_start();
require_once('conecta.php');

$idRol=$_GET["idRol"];
/* crea un array con datos arbitrarios que seran enviados de vuelta a la aplicacion */
$resultados = array();
mysqli_select_db($conecta,$database_conecta);

//Otorgados
$datosOtorgados= array();

$query_otorgados = "select * from tbl_pagina where id_pagina in (select id_pagina from tbl_privilegio where id_rol=".$idRol.");";
$otorgados = mysqli_query($conecta, $query_otorgados) or die(mysqli_error($conecta));

$totalRows_otorgados = mysqli_num_rows($otorgados);
if($totalRows_otorgados>0)
{
	while($row_user = mysqli_fetch_assoc($otorgados)) {
		$datosOtorgados[]=array('id_pagina'=> $row_user['id_pagina'],
					'pagina'=> $row_user['pagina'],
					'descripcion'=> $row_user['descripcion']);
	}
	$resultados["mensajeOtorgados"] = "Validacion Correcta";
	$resultados["validacionOtorgados"] = "ok";
	$resultados["datosOtorgados"]=$datosOtorgados;
}else{
	/*esta informacion se envia si la validacion falla */
	$resultados["mensajeOtorgados"] = "Validacion Correcta";
	$resultados["validacionOtorgados"] = "notOk";
	$resultados["datosOtorgados"]=$query_otorgados;
}

//Denegados
$datosDenegados= array();

$queryDenegados = "select * from tbl_pagina where id_pagina not in (select id_pagina from tbl_privilegio where id_rol=".$idRol.");";
$denegados = mysqli_query($conecta, $queryDenegados) or die(mysqli_error($conecta));

$totalRowsDenegados = mysqli_num_rows($denegados);
if($totalRowsDenegados>0)
{
	while($row_user = mysqli_fetch_assoc($denegados)) {
		$datosDenegados[]=array('id_pagina'=> $row_user['id_pagina'],
					'pagina'=> $row_user['pagina'],
					'descripcion'=> $row_user['descripcion']);
	}
	
	//$resultados["mensajeDenegados"] = "Validacion Correcta";
	$resultados["validacionDenegados"] = "ok";
	$resultados["datosDenegados"]=$datosDenegados;
}else{
	/*esta informacion se envia si la validacion falla */
	//$resultados["mensajeDenegados"] = "Validacion Correcta";
	$resultados["validacionDenegados"] = "notOk";
	$resultados["datosDenegados"]=$queryDenegados;
}

$resultadosJson = json_encode($resultados);
mysqli_close($conecta);

echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';


			header('Content-type: application/json; charset=UTF-8');
			
			//Se abre el acceso a las conexiones que requieran de esta aplicacion
			header("Access-Control-Allow-Origin: *");

ob_end_flush();
?>


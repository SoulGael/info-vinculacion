<?php
ob_start();
session_start();
require_once('conecta.php');

$idRol=$_GET['idRol'];
$idPagina=$_GET['idPagina'];
$estado=$_GET['estado'];

$resultados=array();

$verifica = 0;

mysqli_select_db($conecta,$database_conecta);

if($estado=="t"){
	$query="INSERT INTO tbl_privilegio values (".$idRol.", ".$idPagina.");";

	if(mysqli_query($conecta,$query)){
		$resultados["mensaje"] = "Privilegio Otorgado";
		$resultados["validacion"] = "ok";
	}else{
		$resultados["mensaje"] = "Error al guardar: ".mysqli_error($conecta)." - ".$query;
		$resultados["validacion"] = "notOk";
	}
}else{
	$query="DELETE from tbl_privilegio where id_rol=".$idRol." and id_pagina=".$idPagina.";";

	if(mysqli_query($conecta,$query)){
		$resultados["mensaje"] = "Privilegio Denegado";
		$resultados["validacion"] = "ok";
	}else{
		$resultados["mensaje"] = "Error al guardar: ".mysqli_error($conecta)." - ".$query;
		$resultados["validacion"] = "notOk";
	}
}
	
//}

$resultadosJson = json_encode($resultados);


echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';


			header('Content-type: text/html; charset=utf-8; application/json');
			
			//Se abre el acceso a las conexiones que requieran de esta aplicacion
			header("Access-Control-Allow-Origin: *");
ob_end_flush();
?>


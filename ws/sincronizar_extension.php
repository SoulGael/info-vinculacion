<?php
ob_start();
require_once('conecta.php');

$id_extension=$_GET['id_extension'];
$id_ciudad=$_GET['id_ciudad'];
$extension=$_GET['extension'];
$codigo_extension=$_GET['codigo_extension'];
$estado=$_GET['estado'];

$resultados=array();

$verifica = 0;

mysqli_select_db($conecta,$database_conecta);

	if($id_extension!="-1"){
		$query=" UPDATE `tbl_extension` SET 
		`extension` = '".$extension."', 
		`codigo_u` = '".$codigo_extension."', 
		`id_ciudad` = ".$id_ciudad.", 
		`estado` = '".$estado."'
		WHERE `id_extension` = ".$id_extension." ";

		if(mysqli_query($conecta,$query)){
			$resultados["mensaje"] = "Actualizados Correctamente";
			$resultados["validacion"] = "ok";
		}else{
			$resultados["mensaje"] = "Ha ocurrido un error por favor contanctese con el Administrador del sistema.";
			$resultados["validacion"] = "notOk: ".mysqli_error($conecta);
		}

	}else{
		$query="INSERT INTO `tbl_extension` (`extension`,`codigo_u`,`id_ciudad`) value ('".$extension."', '".$codigo_extension."', ".$id_ciudad.")";

		if(mysqli_query($conecta,$query)){
			$resultados["mensaje"] = "Guardado Correctamente";
			$resultados["validacion"] = "ok";
			
		}else{
			$resultados["mensaje"] = "Ha ocurrio un error al guardar por favor contanctese con el Administrador del sistema.";
			$resultados["validacion"] = "notOkuPDA: ".mysqli_error($conecta);
		}
	}
	

$resultadosJson = json_encode($resultados);


echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';


			header('Content-type: text/html; charset=utf-8; application/json');
			
			//Se abre el acceso a las conexiones que requieran de esta aplicacion
			header("Access-Control-Allow-Origin: *");


ob_end_flush();
?>


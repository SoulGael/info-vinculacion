<?php
ob_start();
session_start();
require_once('conecta.php');

$verifica=0;
$cedula=$_GET["cedula"];
/* crea un array con datos arbitrarios que seran enviados de vuelta a la aplicacion */
$resultados = array();
$datosU= array();

mysqli_select_db($conecta,$database_conecta);

$query_ciudadano = "SELECT * FROM vta_usuario where cedula='".$cedula."' ;";
$ciudadano = mysqli_query($conecta, $query_ciudadano) or die("Error en la Consulta SQL:".mysqli_error($conecta));

$totalRows_ciudadano = mysqli_num_rows($ciudadano);
if($totalRows_ciudadano>0)
{
	if($row_user = mysqli_fetch_assoc($ciudadano)) {
		$datosU[]=array('id_usuario'=> $row_user['id_usuario'],
					'cedula'=> $row_user['cedula'],
					'razon_social'=> $row_user['razon_social'],
					'correo'=> $row_user['correo'],
					'telefonos'=> $row_user['telefonos'],
		            'direccion'=> $row_user['direccion'],
		            'dato_adicional'=> $row_user['dato_adicional'],
		            'pass'=> $row_user['pass'],
		            'foto'=> $row_user['foto'],
		            'estado'=> $row_user['estado'],
		            'txt_estado'=> $row_user['txt_estado'],
		            'id_institucion'=> $row_user['id_institucion'],
		            'id_rol'=> $row_user['id_rol'],
		            'institucion'=> $row_user['institucion'],
					'sitio_web'=> $row_user['sitio_web'],
					'tipo_institucion'=> $row_user['tipo_institucion'],
		            'txt_tipo_institucion'=> $row_user['txt_tipo_institucion'],
		            'telefonos_institucion'=> $row_user['telefonos_institucion'],
					'direccion_institucion'=> $row_user['direccion_institucion'],
					'datos_adicionales'=> $row_user['datos_adicionales'],
					'id_canton'=> $row_user['id_canton'],
					'id_provincia'=> $row_user['id_provincia'],
					'provincia'=> $row_user['provincia'],
					'canton'=> $row_user['canton'],
					'rol'=> $row_user['rol']);
		
		$resultados["mensaje"] = "Validacion Correcta";
		$resultados["validacion"] = "ok";
		$resultados["datosU"]=$datosU;
	}
}else{
	/*esta informacion se envia si la validacion falla */
	  $resultados["mensaje"] = "Cedula Incorrecta";
	  $resultados["validacion"] = "error";
}

$resultadosJson = json_encode($resultados);


echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';


			header('Content-type: application/json; charset=UTF-8');
			
			//Se abre el acceso a las conexiones que requieran de esta aplicacion
			header("Access-Control-Allow-Origin: *");
ob_end_flush();
?>


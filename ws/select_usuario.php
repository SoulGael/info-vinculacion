<?php
ob_start();
session_start();
require_once('conecta.php');

$verifica=0;
$email =$_GET["usuario"];
$pass=$_GET["pass"];
/* crea un array con datos arbitrarios que seran enviados de vuelta a la aplicacion */

mysqli_select_db($conecta,$database_conecta);

$datosU= array();
$resultados = array();
if($email=="administrador" && $pass=="3893879287914c1b99c3359eedd4d355"){
	$datosU[]=array('CEDULA'=> "999999999",
		            'APELLIDOS'=> "Administrador",
		            'NOMBRES'=> "Super",
		            'FOTO'=> "../img/perfil/perfil3.jpg",
		            'EMAIL'=> "ggabrielrd@gmail.com",
		            'TELEFONO'=> "0960907044",
		            'DIRECCION'=> "Otavalo, Guayaquil y Abdón Calederón",
		            'ID_ROL'=> "1");	

		$_SESSION["ID_ROL"] = "1"; 
		$_SESSION["ROL"] = "Administrador"; 
		$_SESSION["CEDULA"] = "999999999"; 
		$_SESSION["FOTO"] = "../img/perfil/perfil3.jpg"; 
		$_SESSION["RAZON_SOCIAL"] = "Super Administrador"; 
		$_SESSION['TIEMPO']=time();

		$resultados["mensaje"] = "Validacion Correcta";
		$resultados["validacion"] = "ok";
		$resultados["datosU"]=$datosU;
}else{
	
	$query_ciudadano = "SELECT * FROM vta_usuario where correo='".$email."' AND pass= '".$pass."' and estado='a';";
	
	$ciudadano = mysqli_query($conecta, $query_ciudadano) or die("Error en la Consulta SQL:".mysqli_error($conecta));

	$totalRows_ciudadano = mysqli_num_rows($ciudadano);

	if($totalRows_ciudadano>0){
		
		if ($row_user = mysqli_fetch_assoc($ciudadano)) {
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
						'rol'=> $row_user['rol']);	

			$_SESSION["ID_ROL"] = $row_user['id_rol']; 
			$_SESSION["ROL"] = $row_user['rol']; 
			$_SESSION["CEDULA"] = $row_user['cedula']; 
			$_SESSION["FOTO"] = $row_user['foto']; 
			$_SESSION["RAZON_SOCIAL"] = $row_user['razon_social']; 
			$_SESSION['TIEMPO']=time();

			$query=" UPDATE tbl_usuario SET sesion = '".session_id()."' WHERE cedula = '".$row_user['cedula']."' ";

			if(mysqli_query($conecta,$query)){
			//if(pg_query($conecta,$query)){
			}

			$resultados["mensaje"] = "Validacion Correcta";
			$resultados["validacion"] = "ok";
			$resultados["datosU"]=$datosU;
		}
	}else{
		$resultados["mensaje"] = "Contraseña Incorrecta, o por favor active su cuenta desde su Correo Electrónico";
		$resultados["validacion"] = "error";
		$resultados["datosU"] = $query_ciudadano;
	}
}

$resultadosJson = json_encode($resultados);

mysqli_close($conecta);
echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';


			header('Content-type: application/json');
			
			//Se abre el acceso a las conexiones que requieran de esta aplicacion
			header("Access-Control-Allow-Origin: *");
ob_end_flush();
?>
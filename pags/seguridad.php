<?php 
session_start();

include "../ws/conecta.php";
mysqli_select_db($conecta,$database_conecta);
if (!$_SESSION){
	echo '<script language = javascript>self.location = "../index.html"</script>';
}
if($_SESSION["CEDULA"]!="999999999"){
	$query_ciudadano = "SELECT sesion FROM tbl_persona where cedula= '".$_SESSION["CEDULA"]."' ;";
	$ciudadano = mysqli_query($conecta,$query_ciudadano) or die(mysqli_error($conecta));

	$sesion_valor="";
	if($row_user = mysqli_fetch_assoc($ciudadano)) {
		$sesion_valor = $row_user['sesion'];
	}

	if($sesion_valor!=session_id()){
		session_destroy();
		header("Location: ../500.html");
		//echo '<script language = javascript>self.location = "../500.html"</script>';
	}
}
/*
if (time() - $_SESSION['TIEMPO'] > 300) {
    session_destroy();*/
    /* Aquí redireccionas a la url especifica */
    /*header("Location: ../500.html");
    die();  
}
$_SESSION['TIEMPO']=time();*/
?>

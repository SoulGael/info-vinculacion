<?php
//$hostname_conecta="95.216.33.133";
//$database_conecta="cimtelec_bd";
//$username_conecta="cimtelec_gromero";
//$password_conecta="593Romero+593"; 
//1723048961 1722964119

$hostname_conecta="localhost";
$database_conecta="vinculacion";
$username_conecta="root";
$password_conecta="";
$conecta=mysqli_connect($hostname_conecta,$username_conecta,$password_conecta,$database_conecta);
mysqli_set_charset($conecta,"utf8");
?>
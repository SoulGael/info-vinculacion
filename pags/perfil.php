<?php 
include 'seguridad.php';
?>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>Info Vinculación - Perfil</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="Aplicación Web de Gestión de Vinculación y practicas Pre-profesionales de Uniandes" name="description" />
	<meta content="SoulGael | Giovanni Gabriel Romero Diaz" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="../assets/css/fontsgoogle.css" rel="stylesheet">
	<link href="../assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="../assets/css/animate.min.css" rel="stylesheet" />
	<link href="../assets/css/style.min.css" rel="stylesheet" />
	<link href="../assets/css/style-responsive.min.css" rel="stylesheet" />
	<link href="../assets/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->

	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="../assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="../assets/plugins/pace/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>
<body>
	<input type="hidden" id="id_rol" value="<?php echo $_SESSION["ID_ROL"] ?>">
    <input type="hidden" id="id_cedula" value="<?php echo $_SESSION["CEDULA"] ?>">
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #header -->
		<div id="header" class="header navbar navbar-default navbar-fixed-top">
			<!-- begin container-fluid -->
			<div class="container-fluid">
				<!-- begin mobile sidebar expand / collapse button -->
				<div class="navbar-header">
					<a href="perfil.php" class="navbar-brand">
						<p><img src="../img/logo_infopracticas.jpg" width="30px"> Info Vinculación</p>
					</a>
				</div>
				<!-- end mobile sidebar expand / collapse button -->
				
				<!-- begin header navigation right -->
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown navbar-user">
						<a href="salir.php">
		                    <i class="fa fa-sign-out"></i> Cerrar Sesión
		                </a>
					</li>
				</ul>
				<!-- end header navigation right -->
			</div>
			<!-- end container-fluid -->
		</div>
		<!-- end #header -->
		
		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a href="javascript:;"><img src="<?php echo $_SESSION["FOTO"] ?>" alt="" /></a>
						</div>
						<div class="info">
							<P><?php echo $_SESSION["RAZON_SOCIAL"]; ?></P>
							<small><?php echo $_SESSION["ROL"]; ?></small>
						</div>
					</li>
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul class="nav nav_menu">
			        <!-- begin sidebar minify button -->
					
			        <!-- end sidebar minify button -->
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li><a href="javascript:;">Inicio</a></li>
				<li class="active">Perfil</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Personaliza tu perfil <small> llena los campos vacios y obligatorios</small></h1>
			<!-- end page-header -->
			<!-- begin profile-container -->
            <div class="profile-container">
                <!-- begin profile-section -->
                <div class="profile-section">
                    <!-- begin profile-left -->
                    <div class="profile-left">
                        <!-- begin profile-image -->
                        <div class="profile-image imagenPerfil">
                            <!--<img src="../../assets/img/profile-cover.jpg" />
                            <i class="fa fa-user hide"></i>-->
                        </div>
                        <!-- end profile-image -->
                        <div class="m-b-10">
                            <!-- SUBIDA DE FOTO-->
                                <form enctype="multipart/form-data" class="formulario">
                                    <input type="hidden" name="id_clienteFoto" value="<?php echo $_SESSION["CEDULA"] ?>">
                                    <label>Cambiar Foto</label><br />
                                    <input name="archivo" type="file" id="imagen" /><br /><br />
                                    <input type="button" class="btn btn-success btn-block btn-sm" value="Subir imagen" /><br />
                                </form>
                                <!--div para visualizar mensajes-->
                                <div class="messages"></div><br /><br />
                                <!--div para visualizar en el caso de imagen-->
                                <!--FIN SUBIDA DE FOTO-->
                        </div>

                    </div>
                    <!-- end profile-left -->
                    <!-- begin profile-right -->
                    <div class="profile-right">
                        <!-- begin profile-info -->
                        <div class="profile-info">
                            <!-- begin table -->
                            <div class="table-responsive">
                                <table class="table table-profile">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th id="infoGeneral">
                                                <!--<h4>Micheal	Meyer <small>Lorraine Stokes</small></h4>-->
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="divider">
                                            <td colspan="2"></td>
										</tr>
										<tr>
                                            <td class="field">Cédula</td>
                                            <td>
                                                <input class="form-control input-sm cedula width-sm" disabled placeholder="C.I" type="text">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="field">Nombres</td>
                                            <td>
                                                <input class="form-control input-sm nombres width-sm" disabled placeholder="Nombres" type="text">
                                            </td>
										</tr>
										<tr>
                                            <td class="field">Género</td>
                                            <td>
												<select class="form-control input-sm genero width-sm" disabled>
													<option value='m'>Masculino</option>
													<option value='f'>Femenino</option>
												</select>
                                            </td>
										</tr>
										<tr>
                                            <td class="field">Fecha de Nacimiento</td>
                                            <td>
												<input type="text" class="form-control input-sm f_nacimiento width-sm" disabled id="datepicker-autoClose" placeholder="fecha de Nacimiento">
											</td>
                                        </tr>
                                        <tr>
                                            <td class="field">Teléfonos</td>
                                            <td><input class="form-control input-sm width-sm telefonos" placeholder="Telefonos" type="text"></td>
										</tr>
										<tr>
                                            <td class="field">Provincia</td>
                                            <td>
												<select class="form-control input-sm provincia width-sm">
													<option value="-1">Elejir...</option>
												</select>
                                            </td>
										</tr>
										<tr>
                                            <td class="field">Cantón</td>
                                            <td>
												<select class="form-control input-sm canton width-sm">
													<option>Elejir...</option>
												</select>
                                            </td>
										</tr>
										<tr>
                                            <td class="field">Parroquia</td>
                                            <td>
												<select class="form-control input-sm parroquia width-sm">
													<option>Elejir...</option>
												</select>
                                            </td>
										</tr>
										<tr>
											<td class="field">Dirección</td>
                                            <td><textarea class="form-control input-sm width-sm direccion" placeholder="Dirección" rows="5"></textarea></td>
                                        </tr>
										<tr>
                                            <td class="field">Email</td>
                                            <td><input class="form-control input-sm width-sm email" placeholder="Correo Electrónico" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td class="field">Usuario</td>
                                            <td><input class="form-control input-sm width-sm user" disabled placeholder="usuario" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td class="field">Contraseña</td>
                                            <td>
												<input class="form-control input-sm width-sm passAnt" type="hidden">
												<input class="form-control input-sm width-sm coorx" type="hidden">
												<input class="form-control input-sm width-sm coory" type="hidden">
                                                <input class="form-control input-sm width-sm pass" placeholder="Contraseña Nueva" type="password">
											</td>
                                        </tr>
                                        
                                        <tr>
                                            <td></td>
                                            <td><button class="btn btn-sm btn-danger guardar">Guardar</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- end table -->
                        </div>
                        <!-- end profile-info -->
                    </div>
                    <!-- end profile-right -->
                </div>
                <!-- end profile-section -->
            </div>
			<!-- end profile-container -->
		</div>
		<!-- end #content -->
		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="../assets/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="../assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="../assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
		<script src="crossbrowserjs/html5shiv.js"></script>
		<script src="crossbrowserjs/respond.min.js"></script>
		<script src="crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/plugins/jquery-cookie/jquery.cookie.js"></script>
	<script src="../assets/plugins/gritter/js/jquery.gritter.js"></script>
	<script src="../assets/js/ui-modal-notification.demo.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="../js/inicio.js"></script>
	<script src="../js/perfil.js"></script>
    <script src="../js/jquery.md5.js"></script>
    <script src="../assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			//App.init();
		});
	</script>
</body>
</html>

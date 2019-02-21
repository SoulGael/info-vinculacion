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
	<title>Info Vinculación - Privilegios</title>
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

	<!-- ================== BEGIN PAGE CSS STYLE SWITCHERY================== -->	
	<link href="../assets/plugins/switchery/switchery.min.css" rel="stylesheet" />
	<link href="../assets/plugins/powerange/powerange.min.css" rel="stylesheet" />
	<link href="../assets/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
	<!-- ================== END PAGE CSS STYLE ================== -->

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
				<li><a href="javascript:;" href="perfil.php">Inicio</a></li>
				<li><a href="javascript:;" href="perfil.php">Administración</a></li>
				<li class="active">Roles y Privilegios</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Roles y Privilegios <!--<small> llena los campos vacios y obligatorios</small>--></h1>
			<!-- end page-header -->
			<!-- begin profile-container -->
			<div class="col-md-4">
				<!--<div class="input-group m-b-15">
                    <input type="text" class="form-control input-sm input-white" placeholder="Search Mail">
                    <span class="input-group-btn">
                        <button class="btn btn-sm btn-inverse" type="button"><i class="fa fa-search"></i></button>
                    </span>
                </div>-->
            	<div class="profile-container">
            		<button class="btn btn-success btn-xs pull-right btn_nuevo">Nuevo</button>
            		<legend>Roles</legend>
            		<ul class="media-list media-list-with-divider divRoles">
            			<!--<li class="media media-sm">
							<a class="media-left" href="javascript:;">
							    <img src="assets/img/user-5.jpg" alt="" class="media-object rounded-corner">
							</a>
							<div class="media-body">
								<h4 class="media-heading">
									Media heading 
									<span class="label label-inverse f-s-10 float-md-right">admin</span>
								</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, tempus viverra turpis.</p>
							    <p>
							        <a href="javascript:;" class="btn btn-sm btn-danger m-r-5">Reject</a>
							    </p>
							</div>
						</li>-->
            		</ul>
            	</div>
            </div>
            <div class="col-md-8">
              	<div class="profile-container">
              		<legend>Más Información</legend>
              		<div class="form-horizontal">
		          		<div class="form-group">
		                    <label class="col-md-2 control-label">Rol</label>
		                    <div class="col-md-4">
		                    	<input type="hidden" class="form-control form-id-rol" value="-1">
		                        <input type="text" class="form-control form-rol" placeholder="Nombre Rol">
		                    </div>
		                </div>
		                <div class="form-group">
                            <label class="col-sm-2 control-label">Estado</label>
                            <div class="col-md-4">
                                <div class="radio radio-success radio-inline">
                                    <input type="radio" id="inlineRadio1" value="a" name="radioInline" checked>
                                    <label for="inlineRadio1"> Activo </label>
                                </div>
                                <div class="radio radio-danger radio-inline">
                                    <input type="radio" id="inlineRadio2" value="i" name="radioInline">
                                    <label for="inlineRadio2"> Inactivo </label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-success form_guardar">Guardar Cambios</button>
                            </div>
                        </div>

                        <legend>Privilegios</legend>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th width="70%">Descripción</th>
                                            <th width="30%">Otorgar / Denegar</th>
                                        </tr>
                                    </thead>
                                    <tbody id="idBody">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
		          	</div>
              	</div>
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
	<script src="../assets/plugins/switchery/switchery.min.js"></script>
	<script src="../assets/plugins/powerange/powerange.min.js"></script>
	<script src="../assets/js/form-slider-switcher.demo.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="../js/inicio.js"></script>
	<script src="../js/privilegios.js"></script>
    <script src="../js/jquery.md5.js"></script>
    <script src="../assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
			FormSliderSwitcher.init();
		});
	</script>
</body>
</html>

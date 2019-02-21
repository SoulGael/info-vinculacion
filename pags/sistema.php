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
	<title>Info Vinculación - Sistema</title>
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
	<link href="../assets/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
	<link href="../assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.css" rel="stylesheet" />
	<link href="../assets/plugins/ionRangeSlider/css/ion.rangeSlider.css" rel="stylesheet" />
	<link href="../assets/plugins/ionRangeSlider/css/ion.rangeSlider.skinNice.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" />
	<link href="../assets/plugins/password-indicator/css/password-indicator.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap-combobox/css/bootstrap-combobox.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" />
	<link href="../assets/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="../assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css" rel="stylesheet" />
    <link href="../assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.css" rel="stylesheet" />
    <link href="../assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-fontawesome.css" rel="stylesheet" />
    <link href="../assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker-glyphicons.css" rel="stylesheet" />
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
				<li class="active">Datos Generales</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Datos Generales del Sistema<!--<small> llena los campos vacios y obligatorios</small>--></h1>
			<!-- end page-header -->
			<!-- begin profile-container -->
			<ul class="nav nav-pills">
				<li class="active"><a href="#nav-pills-tab-1" data-toggle="tab">Provincia y Cantones</a></li>
				<li><a href="#nav-pills-tab-2" data-toggle="tab">Extensión / Facultad / Modalidad</a></li>
				<li><a href="#nav-pills-tab-3" data-toggle="tab">Carreras</a></li>
			</ul>
			<div class="tab-content" style="background-color: #d9e0e7;"><!---->
				<div class="tab-pane fade active in" id="nav-pills-tab-1">
					<!--PROVINCIAS-->
					<div class="row">
					    <div class="col-md-4">
			            	<div class="profile-container">
			            		<button class="btn btn-success btn-xs pull-right btn-nuevo-provincia">Nuevo</button>
			            		<legend>Provincias</legend>
			            		<ul class="media-list media-list-with-divider divProvincias">
			            			<!-- Informacion de Provincias -->
			            		</ul>
			            	</div>
			            </div>
			            <div class="col-md-8">
			              	<div class="profile-container">
			              		<legend>Más Información</legend>
			              		<div class="form-horizontal">
					          		<div class="form-group">
					                    <label class="col-md-2 control-label">Provincia</label>
					                    <div class="col-md-4">
					                    	<input type="hidden" class="form-control form-id-provincia" value="-1">
					                        <input type="text" class="form-control form-provincia" placeholder="Provincia">
					                    </div>
					                </div>
					                <div class="form-group">
			                            <label class="col-sm-2 control-label">Estado</label>
			                            <div class="col-md-4">
			                                <div class="radio radio-success radio-inline">
			                                    <input type="radio" id="radio-provincia1" value="a" name="radioProvincia" checked>
			                                    <label for="radio-provincia1"> Activo </label>
			                                </div>
			                                <div class="radio radio-danger radio-inline">
			                                    <input type="radio" id="radio-provincia2" value="i" name="radioProvincia">
			                                    <label for="radio-provincia2"> Inactivo </label>
			                                </div>
			                            </div>
			                        </div>
			                        
			                        <div class="form-group">
			                            <div class="col-sm-4 col-sm-offset-2">
			                                <button class="btn btn-success form-guardar-provincia">Guardar Cambios</button>
			                            </div>
			                        </div>
					          	</div>
			              	</div>
			            </div>
		            </div>
		            <!-- FIN PROVINCIAS -->
		            <br>
		            <!-- Ciudades -->
		            <div class="row">
					    <div class="col-md-4">
			            	<div class="profile-container">
			            		<button class="btn btn-success btn-xs pull-right btn-nuevo-ciudad">Nuevo</button>
			            		<legend>Ciudades</legend>
			            		<ul class="media-list media-list-with-divider divCiudades">
			            			<!-- Informacion de Provincias -->
			            		</ul>
			            	</div>
			            </div>
			            <div class="col-md-8">
			              	<div class="profile-container">
			              		<legend>Más Información</legend>
			              		<div class="form-horizontal">
			              			<div class="form-group">
					                    <label class="col-md-2 control-label">Provincia</label>
					                    <div class="col-md-4">
					                    	<select class="default-select2 form-control form-select-provincia">
					                    	</select>
					                    </div>
					                </div>
					          		<div class="form-group">
					                    <label class="col-md-2 control-label">Ciudad</label>
					                    <div class="col-md-4">
					                    	<input type="hidden" class="form-control form-id-ciudad" value="-1">
					                        <input type="text" class="form-control form-ciudad" placeholder="Ciudad">
					                    </div>
					                </div>
					                <div class="form-group">
			                            <label class="col-sm-2 control-label">Estado</label>
			                            <div class="col-md-4">
			                                <div class="radio radio-success radio-inline">
			                                    <input type="radio" id="radio-ciudad1" value="a" name="radioCiudad" checked>
			                                    <label for="radio-ciudad1"> Activo </label>
			                                </div>
			                                <div class="radio radio-danger radio-inline">
			                                    <input type="radio" id="radio-ciudad2" value="i" name="radioCiudad">
			                                    <label for="radio-ciudad2"> Inactivo </label>
			                                </div>
			                            </div>
			                        </div>
			                        
			                        <div class="form-group">
			                            <div class="col-sm-4 col-sm-offset-2">
			                                <button class="btn btn-success form-guardar-ciudad">Guardar Cambios</button>
			                            </div>
			                        </div>
					          	</div>
			              	</div>
			            </div>
		            </div>
		            <!-- FIN Ciudades -->
				</div>
				<div class="tab-pane fade" id="nav-pills-tab-2">
				    <!--Modalidad-->
					<div class="row">
					    <div class="col-md-4">
			            	<div class="profile-container">
			            		<button class="btn btn-success btn-xs pull-right btn-nuevo-modalidad">Nuevo</button>
			            		<legend>Modalidad</legend>
			            		<ul class="media-list media-list-with-divider divModalidad">
			            			<!-- Informacion de Modalidades-->
			            		</ul>
			            	</div>
			            </div>
			            <div class="col-md-8">
			              	<div class="profile-container">
			              		<legend>Más Información</legend>
			              		<div class="form-horizontal">
					          		<div class="form-group">
					                    <label class="col-md-2 control-label">Modalidad</label>
					                    <div class="col-md-4">
					                    	<input type="hidden" class="form-control form-id-modalidad" value="-1">
					                        <input type="text" class="form-control form-modalidad" placeholder="Nombre de la Modalidad">
					                    </div>
					                </div>
					                <div class="form-group">
			                            <label class="col-sm-2 control-label">Estado</label>
			                            <div class="col-md-4">
			                                <div class="radio radio-success radio-inline">
			                                    <input type="radio" id="radio-modalidad1" value="a" name="radioModalidad" checked>
			                                    <label for="radio-modalidad1"> Activo </label>
			                                </div>
			                                <div class="radio radio-danger radio-inline">
			                                    <input type="radio" id="radio-modalidad2" value="i" name="radioModalidad">
			                                    <label for="radio-modalidad2"> Inactivo </label>
			                                </div>
			                            </div>
			                        </div>
			                        
			                        <div class="form-group">
			                            <div class="col-sm-4 col-sm-offset-2">
			                                <button class="btn btn-success form-guardar-modalidad">Guardar Cambios</button>
			                            </div>
			                        </div>
					          	</div>
			              	</div>
			            </div>
		            </div>
		            <!-- FIN Modalidades -->

		            <br>
				    <!--Extensión-->
					<div class="row">
					    <div class="col-md-4">
			            	<div class="profile-container">
			            		<button class="btn btn-success btn-xs pull-right btn-nuevo-extension">Nuevo</button>
			            		<legend>Extensión</legend>
			            		<ul class="media-list media-list-with-divider divExtension">
			            			<!-- Informacion de Extensiones-->
			            		</ul>
			            	</div>
			            </div>
			            <div class="col-md-8">
			              	<div class="profile-container">
			              		<legend>Más Información</legend>
			              		<div class="form-horizontal">

			              			<div class="form-group">
					                    <label class="col-md-2 control-label">Provincia</label>
					                    <div class="col-md-4">
					                    	<select class="form-control form-select-extProvincia">
					                    	</select>
					                    </div>
					                </div>
			              			<div class="form-group">
					                    <label class="col-md-2 control-label">Ciudad</label>
					                    <div class="col-md-4">

					                    	<select class="form-control form-select-extCiudad">
					                    	</select>
					                    </div>
					                </div>
					                <div class="form-group">
					                    <label class="col-md-2 control-label">Código de la Extensión</label>
					                    <div class="col-md-4">
					                        <input type="text" class="form-control form-codigo-extension" placeholder="Código de la Extensión">
					                    </div>
					                </div>
					          		<div class="form-group">
					                    <label class="col-md-2 control-label">Extensión</label>
					                    <div class="col-md-4">
					                    	<input type="hidden" class="form-control form-id-extension" value="-1">
					                        <input type="text" class="form-control form-extension" placeholder="Nombre de la Extensión">
					                    </div>
					                </div>
					                <div class="form-group">
			                            <label class="col-sm-2 control-label">Estado</label>
			                            <div class="col-md-4">
			                                <div class="radio radio-success radio-inline">
			                                    <input type="radio" id="radio-extension1" value="a" name="radioExtension" checked>
			                                    <label for="radio-extension1"> Activo </label>
			                                </div>
			                                <div class="radio radio-danger radio-inline">
			                                    <input type="radio" id="radio-extension2" value="i" name="radioExtension">
			                                    <label for="radio-extension2"> Inactivo </label>
			                                </div>
			                            </div>
			                        </div>
			                        
			                        <div class="form-group">
			                            <div class="col-sm-4 col-sm-offset-2">
			                                <button class="btn btn-success form-guardar-extesion">Guardar Cambios</button>
			                            </div>
			                        </div>
					          	</div>
			              	</div>
			            </div>
		            </div>
		            <!-- FIN Extensiones -->

		            <br>
				    <!--Facultad-->
					<div class="row">
					    <div class="col-md-4">
			            	<div class="profile-container">
			            		<button class="btn btn-success btn-xs pull-right btn-nuevo-facultad">Nuevo</button>
			            		<legend>Facultad</legend>
			            		<ul class="media-list media-list-with-divider divFacultad">
			            			<!-- Informacion de Facultad-->
			            		</ul>
			            	</div>
			            </div>
			            <div class="col-md-8">
			              	<div class="profile-container">
			              		<legend>Más Información</legend>
			              		<div class="form-horizontal">

			              			<div class="form-group">
					                    <label class="col-md-2 control-label">Extensión</label>
					                    <div class="col-md-4">
					                    	<select class="form-control form-select-facExtension">
					                    	</select>
					                    </div>
					                </div>
					          		<div class="form-group">
					                    <label class="col-md-2 control-label">Facultad</label>
					                    <div class="col-md-4">
					                    	<input type="hidden" class="form-control form-id-facultad" value="-1">
					                        <input type="text" class="form-control form-facultad" placeholder="Nombre de la Facultad">
					                    </div>
					                </div>
					                <div class="form-group">
			                            <label class="col-sm-2 control-label">Estado</label>
			                            <div class="col-md-4">
			                                <div class="radio radio-success radio-inline">
			                                    <input type="radio" id="radio-facultad1" value="a" name="radioFacultad" checked>
			                                    <label for="radio-facultad1"> Activo </label>
			                                </div>
			                                <div class="radio radio-danger radio-inline">
			                                    <input type="radio" id="radio-facultad2" value="i" name="radioFacultad">
			                                    <label for="radio-facultad2"> Inactivo </label>
			                                </div>
			                            </div>
			                        </div>
			                        
			                        <div class="form-group">
			                            <div class="col-sm-4 col-sm-offset-2">
			                                <button class="btn btn-success form-guardar-facultad">Guardar Cambios</button>
			                            </div>
			                        </div>
					          	</div>
			              	</div>
			            </div>
		            </div>
		            <!-- FIN Facultad -->
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
	<script src="../assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="../assets/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
	<script src="../assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<script src="../assets/plugins/masked-input/masked-input.min.js"></script>
	<script src="../assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="../assets/plugins/password-indicator/js/password-indicator.js"></script>
	<script src="../assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
	<script src="../assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script src="../assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
	<script src="../assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
	<script src="../assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
    <script src="../assets/plugins/bootstrap-daterangepicker/moment.js"></script>
    <script src="../assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="../assets/plugins/select2/dist/js/select2.min.js"></script>
    <script src="../assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <script src="../assets/plugins/bootstrap-show-password/bootstrap-show-password.js"></script>
    <script src="../assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
    <script src="../assets/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
	<script src="../assets/js/form-plugins.demo.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="../assets/js/apps.min.js"></script>
	<script src="../js/inicio.js"></script>
	<script src="../js/sistema.js"></script>
    <script src="../js/jquery.md5.js"></script>
    
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
		});
	</script>
</body>
</html>

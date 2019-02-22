-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2019 a las 18:19:38
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_vinculacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_cronograma`
--

CREATE TABLE `actividades_cronograma` (
  `idactividades_cronograma` int(11) NOT NULL,
  `nombre` mediumtext,
  `resultado` mediumtext,
  `estado` varchar(45) DEFAULT NULL,
  `actividades_cronogramacol` varchar(1) DEFAULT 'A',
  `cronograma_idcronograma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alcance_territorial`
--

CREATE TABLE `alcance_territorial` (
  `idalcance_territorial` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `alcance_territorial`
--

INSERT INTO `alcance_territorial` (`idalcance_territorial`, `nombre`, `estado`) VALUES
(1, 'Nacional', 'A'),
(2, 'Internacional', 'A'),
(3, 'Local', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_practicas`
--

CREATE TABLE `asistencia_practicas` (
  `idasistencia_practicas` int(11) NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `n_horas` int(11) DEFAULT NULL,
  `practicas_idpracticas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_servicio_comunitario`
--

CREATE TABLE `asistencia_servicio_comunitario` (
  `idasistencia_servicio_comunitario` int(11) NOT NULL,
  `servicio_comunitario_idservicio_comunitario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `idauditoria` int(11) NOT NULL,
  `accion` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `ip` varchar(45) NOT NULL,
  `persona_idpersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo_amplio`
--

CREATE TABLE `campo_amplio` (
  `idcampo_amplio` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `campo_amplio`
--

INSERT INTO `campo_amplio` (`idcampo_amplio`, `nombre`, `estado`) VALUES
(1, 'AdministraciÃ³n, Negocios Y LegislaciÃ³n ', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo_detallado`
--

CREATE TABLE `campo_detallado` (
  `idcampo_detallado` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `campo_especifico_idcampo_especifico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `campo_detallado`
--

INSERT INTO `campo_detallado` (`idcampo_detallado`, `nombre`, `estado`, `campo_especifico_idcampo_especifico`) VALUES
(1, 'Contabilidad Y AuditorÃ­a', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campo_especifico`
--

CREATE TABLE `campo_especifico` (
  `idcampo_especifico` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `campo_amplio_idcampo_amplio` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `campo_especifico`
--

INSERT INTO `campo_especifico` (`idcampo_especifico`, `nombre`, `estado`, `campo_amplio_idcampo_amplio`) VALUES
(1, 'Negocios Y AdministraciÃ³n', 'A', 1),
(2, 'Derecho', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  `modalidad_idmodalidad` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idcarrera`, `nombre`, `facultad_idfacultad`, `modalidad_idmodalidad`, `codigo`, `estado`) VALUES
(1, 'SISTEMAS', 1, 1, 'SIS11', 'A'),
(2, 'Administracioón de Empresas y Negocios', 4, 1, 'Adm1', 'A'),
(3, 'Asa', 4, 1, 'Asa41', 'I'),
(4, 'Administracion', 4, 1, 'Adm41', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `provincia_idprovincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idciudad`, `nombre`, `estado`, `provincia_idprovincia`) VALUES
(1, 'IBARRA', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio`
--

CREATE TABLE `convenio` (
  `idconvenio` int(11) NOT NULL,
  `nombre` mediumtext NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `area` varchar(200) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `tipo_convenio_idtipo_convenio` int(11) NOT NULL,
  `institucion_idinstitucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `convenio`
--

INSERT INTO `convenio` (`idconvenio`, `nombre`, `codigo`, `fecha_inicio`, `fecha_fin`, `area`, `estado`, `tipo_convenio_idtipo_convenio`, `institucion_idinstitucion`) VALUES
(1, '                 \r\n                Conaopare Y Uniandes', '123', '2018-12-06', '2018-12-13', '                 Neocios\r\n                ', 'A', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronograma`
--

CREATE TABLE `cronograma` (
  `idcronograma` int(11) NOT NULL,
  `componente` varchar(45) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `proyecto_idproyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes_asignados`
--

CREATE TABLE `docentes_asignados` (
  `iddocentes_asignados` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `responsable` varchar(45) NOT NULL,
  `tutor` varchar(45) NOT NULL,
  `participante1` varchar(45) DEFAULT NULL,
  `participante2` varchar(45) DEFAULT NULL,
  `participante3` varchar(45) DEFAULT NULL,
  `participante4` varchar(45) DEFAULT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `docentes_asignados`
--

INSERT INTO `docentes_asignados` (`iddocentes_asignados`, `nombre`, `responsable`, `tutor`, `participante1`, `participante2`, `participante3`, `participante4`, `estado`) VALUES
(1, 'Desarrollo De Destrezas MIES', '1', '3', '0', '0', '0', '0', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_practicas_y_servicio`
--

CREATE TABLE `estado_practicas_y_servicio` (
  `idestado_practicas` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_proyecto`
--

CREATE TABLE `estado_proyecto` (
  `idestado_proyecto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `estado_proyecto`
--

INSERT INTO `estado_proyecto` (`idestado_proyecto`, `nombre`, `estado`) VALUES
(1, 'Activo', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extension`
--

CREATE TABLE `extension` (
  `idextension` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `ciudad_idciudad` int(11) NOT NULL,
  `codigo_u` varchar(10) NOT NULL DEFAULT '1042'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `extension`
--

INSERT INTO `extension` (`idextension`, `nombre`, `estado`, `ciudad_idciudad`, `codigo_u`) VALUES
(1, 'IBARRA', 'A', 1, '1042');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `idfacultad` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'A',
  `extension_idextension` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`idfacultad`, `nombre`, `estado`, `extension_idextension`) VALUES
(1, 'SISTEMAS MERCANTILES', 'A', 1),
(2, 'Jurisprudencia', 'A', 1),
(4, 'Dirección De Empresas', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuente_financiamiento`
--

CREATE TABLE `fuente_financiamiento` (
  `idfuente_financiamiento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `fuente_financiamiento`
--

INSERT INTO `fuente_financiamiento` (`idfuente_financiamiento`, `nombre`, `estado`) VALUES
(1, 'AsignaciÃ³n Regular IES', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impactos`
--

CREATE TABLE `impactos` (
  `idimpactos` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `cientifico` longtext NOT NULL,
  `economico` longtext NOT NULL,
  `politico` longtext NOT NULL,
  `social` longtext NOT NULL,
  `otro` longtext NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `idinstitucion` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `responsable` varchar(150) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `ciudad_idciudad` int(11) NOT NULL,
  `tipo_institucion_idtipo_institucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`idinstitucion`, `nombre`, `direccion`, `telefono`, `email`, `responsable`, `estado`, `ciudad_idciudad`, `tipo_institucion_idtipo_institucion`) VALUES
(1, 'Conagopare', 'Sector Yacucalle', '000000000', 'Info@conagopare.gob.ec', 'Lic. William Chamorro', 'A', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_investigacion`
--

CREATE TABLE `linea_investigacion` (
  `idlinea_investigacion` int(11) NOT NULL,
  `nombre` mediumtext NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `programa_vinculacion_idprograma_vinculacion` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `linea_investigacion`
--

INSERT INTO `linea_investigacion` (`idlinea_investigacion`, `nombre`, `estado`, `programa_vinculacion_idprograma_vinculacion`) VALUES
(1, 'GestiÃ³n De Los Emprendimientos', 'A', 1),
(2, 'Desarrollo De La EstiÃ³n Contable Y Financiera', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `icono` varchar(45) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `seccion_idseccion` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idmenu`, `nombre`, `icono`, `referencia`, `estado`, `seccion_idseccion`) VALUES
(1, 'PROVINCIAS', 'menu-icon fa fa-area-chart', 'reg_provincia.php', 'A', 1),
(2, 'EXTENSIONES', 'menu-icon fa fa-line-chart', 'reg_extension.php', 'A', 1),
(3, 'MENÚS', 'menu-icon fa fa-cog', 'reg_menu.php', 'A', 2),
(4, 'ESTUDIANTES', 'menu-icon fa fa-users', '', 'A', 3),
(5, 'DOCENTES', 'menu-icon fa fa-chevron-circle-right', '', 'A', 3),
(6, 'CONVENIOS', 'menu-icon fa fa-handshake-o', '', 'A', 4),
(7, 'PROYECTOS', 'menu-icon fa fa-spinner', '', 'A', 4),
(8, 'PRACTICAS PREPROFESIONALES', 'menu-icon fa fa-tags', '', 'A', 4),
(10, 'SERVICIO COMUNITARIO', 'menu-icon fa fa-tags', '', 'A', 4),
(11, 'PARÁMETROS', 'menu-icon fa fa-arrows', '', 'A', 5),
(12, 'INSTITUCIÓN', 'menu-icon fa fa-university', '', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metas`
--

CREATE TABLE `metas` (
  `idmetas` int(11) NOT NULL,
  `nombre` longtext NOT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `proyecto_idproyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `idmodalidad` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`idmodalidad`, `nombre`, `estado`) VALUES
(1, 'PRESENCIAL', 'A'),
(2, 'SEMI PRESENCIAL', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `idnivel` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`idnivel`, `nombre`, `estado`) VALUES
(1, 'Primero', 'A'),
(2, 'Segundo', 'A'),
(3, 'Tercero', 'A'),
(4, 'Cuarto', 'A'),
(5, 'Quinto', 'A'),
(6, 'Sexto', 'A'),
(7, 'Septimo', 'A'),
(8, 'Octavo', 'A'),
(9, 'Noveno', 'A'),
(10, 'Decimo', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto`
--

CREATE TABLE `objeto` (
  `idobjeto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `tipo_convenio_idtipo_convenio` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `objeto`
--

INSERT INTO `objeto` (`idobjeto`, `nombre`, `tipo_convenio_idtipo_convenio`) VALUES
(1, 'Tipo De Convenio Para Proyectos De Vinculación, Prácticas Preprofesionales E Investigación. ', 1),
(2, 'Tipo De Convenio Para Proyectos De Vinculación.', 2),
(3, 'Tipo De Convenio Para Prácticas Preprofesionales', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `idparametros` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro_cumplimiento`
--

CREATE TABLE `parametro_cumplimiento` (
  `idparametro_cumplimiento` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `parametro_cumplimiento`
--

INSERT INTO `parametro_cumplimiento` (`idparametro_cumplimiento`, `nombre`, `estado`) VALUES
(1, 'Gasto Nacional Bruto En I+D+I', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `idperiodo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `extension_idextension` int(11) NOT NULL,
  `rol_idrol` int(11) NOT NULL,
  `carrera_idcarrera` int(11) NOT NULL,
  `nivel` varchar(45) DEFAULT NULL,
  `periodo_idperiodo` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `politica`
--

CREATE TABLE `politica` (
  `idpolitica` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idprograma_vinculacion` int(11) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `politica`
--

INSERT INTO `politica` (`idpolitica`, `nombre`, `idprograma_vinculacion`, `estado`) VALUES
(1, 'Educacion', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practicas`
--

CREATE TABLE `practicas` (
  `idpracticas` int(11) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `actividad_principal` varchar(200) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `año` varchar(5) NOT NULL,
  `n_oficio` varchar(45) NOT NULL,
  `evidencia` varchar(100) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `n_horas` varchar(45) DEFAULT NULL,
  `practicascol` int(11) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `periodo_idperiodo` int(11) NOT NULL,
  `nivel_idnivel` int(11) NOT NULL,
  `ciudad_idciudad` int(11) NOT NULL,
  `convenio_idconvenio` int(11) NOT NULL,
  `institucion_idinstitucion` int(11) NOT NULL,
  `estado_practicas_idestado_practicas` int(11) NOT NULL,
  `persona_idpersona` int(11) NOT NULL,
  `docentes_asignados_iddocentes_asignados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `idprivilegios` int(11) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `seccion_idseccion` int(11) NOT NULL,
  `menu_idmenu` int(11) NOT NULL,
  `sub_menu_idsub_menu` int(11) NOT NULL,
  `rol_idrol` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=655 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`idprivilegios`, `estado`, `seccion_idseccion`, `menu_idmenu`, `sub_menu_idsub_menu`, `rol_idrol`) VALUES
(2, 'A', 1, 1, 26, 1),
(3, 'A', 1, 2, 24, 1),
(4, 'A', 2, 3, 25, 1),
(5, 'A', 3, 4, 3, 1),
(6, 'A', 3, 4, 4, 1),
(7, 'A', 3, 4, 5, 1),
(8, 'A', 3, 5, 6, 1),
(9, 'A', 3, 5, 8, 1),
(10, 'A', 3, 5, 7, 1),
(11, 'A', 3, 5, 8, 1),
(14, 'A', 4, 6, 9, 1),
(15, 'A', 4, 6, 10, 1),
(16, 'A', 4, 6, 11, 1),
(17, 'A', 4, 7, 12, 1),
(18, 'A', 4, 7, 13, 1),
(19, 'A', 4, 7, 14, 1),
(20, 'A', 4, 7, 15, 1),
(21, 'A', 4, 7, 16, 1),
(24, 'A', 1, 12, 21, 1),
(25, 'A', 1, 12, 22, 1),
(26, 'A', 4, 8, 17, 1),
(27, 'A', 4, 8, 18, 1),
(28, 'A', 4, 10, 19, 1),
(29, 'A', 4, 10, 20, 1),
(30, 'A', 5, 11, 27, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_vinculacion`
--

CREATE TABLE `programa_vinculacion` (
  `idprograma_vinculacion` int(11) NOT NULL,
  `nombre` mediumtext NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `carrera_idcarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `programa_vinculacion`
--

INSERT INTO `programa_vinculacion` (`idprograma_vinculacion`, `nombre`, `descripcion`, `estado`, `carrera_idcarrera`) VALUES
(1, 'GestiÃ³n Empresarial Y EconÃ³mica', 'Programa Orientado Al AcompaÃ±amiento', 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `idprovincia` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`idprovincia`, `nombre`, `estado`) VALUES
(1, 'Imbabura', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `idproyecto` int(11) NOT NULL,
  `nombre` longtext NOT NULL,
  `descripcion` longtext NOT NULL,
  `beneficiarios` mediumtext NOT NULL,
  `justificacion` longtext NOT NULL,
  `ob_general` longtext NOT NULL,
  `ob_especificos` longtext NOT NULL,
  `poa` varchar(45) NOT NULL,
  `monto` varchar(10) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `año` varchar(4) NOT NULL,
  `ciudad_idciudad` int(11) NOT NULL,
  `convenio_idconvenio` int(11) NOT NULL,
  `politica_idpolitica` int(11) NOT NULL,
  `estado_proyecto_idestado_proyecto` int(11) NOT NULL,
  `periodo_idperiodo` int(11) NOT NULL,
  `docentes_asignados_iddocentes_asignados` int(11) NOT NULL,
  `impactos_idimpactos` int(11) NOT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  `carrera_idcarrera` int(11) NOT NULL,
  `linea_investigacion_idlinea_investigacion` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `extension_idextension` int(11) NOT NULL,
  `campo_amplio_idcampo_amplio` int(11) NOT NULL,
  `campo_especifico_idcampo_especifico` int(11) NOT NULL,
  `campo_detallado_idcampo_detallado` int(11) NOT NULL,
  `alcance_territorial_idalcance_territorial` int(11) NOT NULL,
  `fuente_financiamiento_idfuente_financiamiento` int(11) NOT NULL,
  `parametro_cumplimiento_idparametro_cumplimiento` int(11) NOT NULL,
  `programa_vinculacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT 'A'
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`, `estado`) VALUES
(1, 'Aministrador', 'A'),
(2, 'Docente', 'A'),
(3, 'Estudiante', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `idseccion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT 'A'
) ENGINE=InnoDB AVG_ROW_LENGTH=2730 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`idseccion`, `nombre`, `estado`) VALUES
(1, 'UBICACIÓN', 'A'),
(2, 'MENÚS', 'A'),
(3, 'PERSONAS', 'A'),
(4, 'MÓDULOS', 'A'),
(5, 'CONFIGURACIONES', 'A'),
(6, 'ADMINISTRACIÓN', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_comunitario`
--

CREATE TABLE `servicio_comunitario` (
  `idservicio_comunitario` int(11) NOT NULL,
  `departamento` varchar(60) NOT NULL,
  `actividad_principal` varchar(200) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `n_horas` int(11) NOT NULL,
  `evidencia` varchar(100) DEFAULT NULL,
  `año` varchar(5) NOT NULL,
  `n_oficio` varchar(45) NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `periodo_idperiodo` int(11) NOT NULL,
  `nivel_idnivel` int(11) NOT NULL,
  `institucion_idinstitucion` int(11) NOT NULL,
  `convenio_idconvenio` int(11) NOT NULL,
  `estado_practicas_y_servicio_idestado_practicas` int(11) NOT NULL,
  `ciudad_idciudad` int(11) NOT NULL,
  `proyecto_idproyecto` int(11) NOT NULL,
  `persona_idpersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_menu`
--

CREATE TABLE `sub_menu` (
  `idsub_menu` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `icono` varchar(45) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `menu_idmenu` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=606 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `sub_menu`
--

INSERT INTO `sub_menu` (`idsub_menu`, `nombre`, `icono`, `referencia`, `estado`, `menu_idmenu`) VALUES
(1, 'REGISTRAR INSTITUCIÓN', 'menu-icon fa fa-certificate', 'reg_institucion.php', 'A', 12),
(2, 'LISTAR INSTITUCIÓN', 'menu-icon fa fa-circle', 'List_institucion.php', 'A', 12),
(3, 'REGISTRAR ESTUDIANTE', 'menu-icon fa fa-user', 'reg_estudiante.php', 'A', 4),
(4, 'SUBIR ESTUDIANTES', 'menu-icon fa fa-user-plus', 'subir_excelE.php', 'A', 4),
(5, 'LISTAR ESTUDIANTES', 'menu-icon fa fa-user-o', 'list_estudiante.php', 'A', 4),
(6, 'REGISTRAR DOCENTE', 'menu-icon fa fa-user', 'reg_docente.php', 'A', 5),
(7, 'SUBIR DOCENTE', 'menu-icon fa fa-user-plus', 'upload_docente.php', 'A', 5),
(8, 'LISTAR DOCENTE', 'menu-icon fa fa-user-o', 'list_docente.php', 'A', 5),
(9, 'REGISTRAR CONVENIO', 'menu-icon fa fa-globe', 'reg_convenio.php', 'A', 6),
(10, 'LISTAR CONVENIO', 'menu-icon fa fa-globe', 'list_convenio.php', 'A', 6),
(11, 'SUBIR CONVENIO', 'menu-icon fa fa-globe', 'upload_convenio.php', 'A', 6),
(12, 'REGISTRAR PROYECTO', 'menu-icon fa fa-diamond', 'reg_proyecto.php', 'A', 7),
(13, 'SUBIR PROYECTO', 'menu-icon fa fa-diamond', 'upload_proyecto.php', 'A', 7),
(14, 'LISTAR PROYECTO', 'menu-icon fa fa-diamond', 'list_proyecto.php', 'A', 7),
(15, 'ASIGNAR ESTUDIANTES', 'menu-icon fa fa-diamond', '', 'A', 7),
(16, 'ASIGNAR DOCENTES', 'menu-icon fa fa-diamond', '', 'A', 7),
(17, 'NUEVO PRACTICAS', 'menu-icon fa fa-pencil-square', '', 'A', 8),
(18, 'LISTAR PRACTICAS', 'menu-icon fa fa-pencil-square', '', 'A', 8),
(19, 'NUEVO SERVICIO C', 'menu-icon fa fa-pencil-square', '', 'A', 10),
(20, 'LISTAR SERVICIO C', 'menu-icon fa fa-pencil-square', '', 'A', 10),
(21, 'REGISTRAR INSTITUCIÓN', 'menu-icon fa fa-university', 'reg_institucion.php', 'A', 12),
(22, 'LISTAR INSTITUCIÓN', 'menu-icon fa fa-university', 'list_institucion.php', 'A', 12),
(23, 'REGISTRAR UBICACIÓN', 'menu-icon fa fa-dot-circle-o', 'reg_provincia', 'A', 1),
(24, 'REGISTRAR EXTENSIONES', 'menu-icon fa fa-dot-circle-o', 'reg_extension.php', 'A', 2),
(25, 'MENÚS', 'menu-icon fa fa-th-large', 'reg_menu.php', 'A', 3),
(26, 'REGISTRAR PROVINCIA', 'menu-icon fa fa-link', 'reg_provincia.php', 'A', 1),
(27, 'ADMINISTRACIÓN', 'menu-icon fa fa-buysellads', 'sc', 'A', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_convenio`
--

CREATE TABLE `tipo_convenio` (
  `idtipo_convenio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tipo_convenio`
--

INSERT INTO `tipo_convenio` (`idtipo_convenio`, `nombre`, `estado`) VALUES
(1, 'Marco', 'A'),
(2, 'Proyectos De Vinculación', 'A'),
(3, 'Prácticas Preprofesionales ', 'A'),
(4, 'Lolo', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_institucion`
--

CREATE TABLE `tipo_institucion` (
  `idtipo_institucion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(1) DEFAULT 'A'
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tipo_institucion`
--

INSERT INTO `tipo_institucion` (`idtipo_institucion`, `nombre`, `estado`) VALUES
(1, 'Pública', 'A'),
(2, 'Privada', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades_cronograma`
--
ALTER TABLE `actividades_cronograma`
  ADD PRIMARY KEY (`idactividades_cronograma`) USING BTREE,
  ADD KEY `fk_actividades_cronograma_cronograma1_idx` (`cronograma_idcronograma`) USING BTREE;

--
-- Indices de la tabla `alcance_territorial`
--
ALTER TABLE `alcance_territorial`
  ADD PRIMARY KEY (`idalcance_territorial`) USING BTREE;

--
-- Indices de la tabla `asistencia_practicas`
--
ALTER TABLE `asistencia_practicas`
  ADD PRIMARY KEY (`idasistencia_practicas`) USING BTREE,
  ADD KEY `fk_asistencia_practicas_practicas1_idx` (`practicas_idpracticas`) USING BTREE;

--
-- Indices de la tabla `asistencia_servicio_comunitario`
--
ALTER TABLE `asistencia_servicio_comunitario`
  ADD PRIMARY KEY (`idasistencia_servicio_comunitario`) USING BTREE,
  ADD KEY `fk_asistencia_servicio_comunitario_servicio_comunitario1_idx` (`servicio_comunitario_idservicio_comunitario`) USING BTREE;

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`idauditoria`) USING BTREE,
  ADD KEY `fk_auditoria_persona1_idx` (`persona_idpersona`) USING BTREE;

--
-- Indices de la tabla `campo_amplio`
--
ALTER TABLE `campo_amplio`
  ADD PRIMARY KEY (`idcampo_amplio`) USING BTREE;

--
-- Indices de la tabla `campo_detallado`
--
ALTER TABLE `campo_detallado`
  ADD PRIMARY KEY (`idcampo_detallado`) USING BTREE,
  ADD KEY `fk_campo_detallado_campo_especifico1_idx` (`campo_especifico_idcampo_especifico`) USING BTREE;

--
-- Indices de la tabla `campo_especifico`
--
ALTER TABLE `campo_especifico`
  ADD PRIMARY KEY (`idcampo_especifico`) USING BTREE,
  ADD KEY `fk_campo_especifico_campo_amplio1_idx` (`campo_amplio_idcampo_amplio`) USING BTREE;

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idcarrera`) USING BTREE,
  ADD KEY `fk_carrera_facultad1_idx` (`facultad_idfacultad`) USING BTREE,
  ADD KEY `fk_carrera_modalidad1_idx` (`modalidad_idmodalidad`) USING BTREE;

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idciudad`) USING BTREE,
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`) USING BTREE,
  ADD KEY `fk_ciudad_provincia_idx` (`provincia_idprovincia`) USING BTREE;

--
-- Indices de la tabla `convenio`
--
ALTER TABLE `convenio`
  ADD PRIMARY KEY (`idconvenio`) USING BTREE,
  ADD KEY `fk_convenio_tipo_convenio1_idx` (`tipo_convenio_idtipo_convenio`) USING BTREE,
  ADD KEY `fk_convenio_institucion1_idx` (`institucion_idinstitucion`) USING BTREE;

--
-- Indices de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  ADD PRIMARY KEY (`idcronograma`) USING BTREE,
  ADD KEY `fk_cronograma_proyecto1_idx` (`proyecto_idproyecto`) USING BTREE;

--
-- Indices de la tabla `docentes_asignados`
--
ALTER TABLE `docentes_asignados`
  ADD PRIMARY KEY (`iddocentes_asignados`) USING BTREE;

--
-- Indices de la tabla `estado_practicas_y_servicio`
--
ALTER TABLE `estado_practicas_y_servicio`
  ADD PRIMARY KEY (`idestado_practicas`) USING BTREE;

--
-- Indices de la tabla `estado_proyecto`
--
ALTER TABLE `estado_proyecto`
  ADD PRIMARY KEY (`idestado_proyecto`) USING BTREE;

--
-- Indices de la tabla `extension`
--
ALTER TABLE `extension`
  ADD PRIMARY KEY (`idextension`) USING BTREE,
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`) USING BTREE,
  ADD KEY `fk_extension_ciudad1_idx` (`ciudad_idciudad`) USING BTREE;

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`idfacultad`) USING BTREE,
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`) USING BTREE,
  ADD KEY `fk_facultad_extension1_idx` (`extension_idextension`) USING BTREE;

--
-- Indices de la tabla `fuente_financiamiento`
--
ALTER TABLE `fuente_financiamiento`
  ADD PRIMARY KEY (`idfuente_financiamiento`) USING BTREE;

--
-- Indices de la tabla `impactos`
--
ALTER TABLE `impactos`
  ADD PRIMARY KEY (`idimpactos`) USING BTREE;

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`idinstitucion`) USING BTREE,
  ADD KEY `fk_institucion_ciudad1_idx` (`ciudad_idciudad`) USING BTREE,
  ADD KEY `fk_institucion_tipo_institucion1_idx` (`tipo_institucion_idtipo_institucion`) USING BTREE;

--
-- Indices de la tabla `linea_investigacion`
--
ALTER TABLE `linea_investigacion`
  ADD PRIMARY KEY (`idlinea_investigacion`) USING BTREE,
  ADD KEY `fk_linea_investigacion_programa_vinculacion1_idx` (`programa_vinculacion_idprograma_vinculacion`) USING BTREE;

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`) USING BTREE,
  ADD KEY `fk_menu_seccion1_idx` (`seccion_idseccion`) USING BTREE;

--
-- Indices de la tabla `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`idmetas`) USING BTREE,
  ADD KEY `fk_metas_proyecto1_idx` (`proyecto_idproyecto`) USING BTREE;

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`idmodalidad`) USING BTREE;

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idnivel`) USING BTREE,
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`) USING BTREE;

--
-- Indices de la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`idobjeto`) USING BTREE,
  ADD KEY `fk_objeto_tipo_convenio1_idx` (`tipo_convenio_idtipo_convenio`) USING BTREE;

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`idparametros`) USING BTREE;

--
-- Indices de la tabla `parametro_cumplimiento`
--
ALTER TABLE `parametro_cumplimiento`
  ADD PRIMARY KEY (`idparametro_cumplimiento`) USING BTREE;

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`idperiodo`) USING BTREE;

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`) USING BTREE,
  ADD UNIQUE KEY `cedula_UNIQUE` (`cedula`) USING BTREE,
  ADD KEY `fk_persona_extension1_idx` (`extension_idextension`) USING BTREE,
  ADD KEY `fk_persona_rol1_idx` (`rol_idrol`) USING BTREE,
  ADD KEY `fk_persona_carrera1_idx` (`carrera_idcarrera`) USING BTREE,
  ADD KEY `fk_persona_periodo1_idx` (`periodo_idperiodo`) USING BTREE;

--
-- Indices de la tabla `politica`
--
ALTER TABLE `politica`
  ADD PRIMARY KEY (`idpolitica`) USING BTREE;

--
-- Indices de la tabla `practicas`
--
ALTER TABLE `practicas`
  ADD PRIMARY KEY (`idpracticas`) USING BTREE,
  ADD KEY `fk_practicas_periodo1_idx` (`periodo_idperiodo`) USING BTREE,
  ADD KEY `fk_practicas_nivel1_idx` (`nivel_idnivel`) USING BTREE,
  ADD KEY `fk_practicas_ciudad1_idx` (`ciudad_idciudad`) USING BTREE,
  ADD KEY `fk_practicas_convenio1_idx` (`convenio_idconvenio`) USING BTREE,
  ADD KEY `fk_practicas_institucion1_idx` (`institucion_idinstitucion`) USING BTREE,
  ADD KEY `fk_practicas_estado_practicas1_idx` (`estado_practicas_idestado_practicas`) USING BTREE,
  ADD KEY `fk_practicas_persona1_idx` (`persona_idpersona`) USING BTREE,
  ADD KEY `fk_practicas_docentes_asignados1_idx` (`docentes_asignados_iddocentes_asignados`) USING BTREE;

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idprivilegios`) USING BTREE,
  ADD KEY `fk_privilegios_seccion1_idx` (`seccion_idseccion`) USING BTREE,
  ADD KEY `fk_privilegios_menu1_idx` (`menu_idmenu`) USING BTREE,
  ADD KEY `fk_privilegios_sub_menu1_idx` (`sub_menu_idsub_menu`) USING BTREE,
  ADD KEY `fk_privilegios_rol1_idx` (`rol_idrol`) USING BTREE;

--
-- Indices de la tabla `programa_vinculacion`
--
ALTER TABLE `programa_vinculacion`
  ADD PRIMARY KEY (`idprograma_vinculacion`) USING BTREE,
  ADD KEY `fk_programa_vinculacion_carrera1_idx` (`carrera_idcarrera`) USING BTREE;

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`idprovincia`) USING BTREE,
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`) USING BTREE;

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`idproyecto`) USING BTREE,
  ADD KEY `fk_proyecto_ciudad1_idx` (`ciudad_idciudad`) USING BTREE,
  ADD KEY `fk_proyecto_convenio1_idx` (`convenio_idconvenio`) USING BTREE,
  ADD KEY `fk_proyecto_politica1_idx` (`politica_idpolitica`) USING BTREE,
  ADD KEY `fk_proyecto_estado_proyecto1_idx` (`estado_proyecto_idestado_proyecto`) USING BTREE,
  ADD KEY `fk_proyecto_campo_amplio1_idx` (`campo_amplio_idcampo_amplio`) USING BTREE,
  ADD KEY `fk_proyecto_periodo1_idx` (`periodo_idperiodo`) USING BTREE,
  ADD KEY `fk_proyecto_docentes_asignados1_idx` (`docentes_asignados_iddocentes_asignados`) USING BTREE,
  ADD KEY `fk_proyecto_impactos1_idx` (`impactos_idimpactos`) USING BTREE,
  ADD KEY `fk_proyecto_facultad1_idx` (`facultad_idfacultad`) USING BTREE,
  ADD KEY `fk_proyecto_carrera1_idx` (`carrera_idcarrera`) USING BTREE,
  ADD KEY `fk_proyecto_linea_investigacion1_idx` (`linea_investigacion_idlinea_investigacion`) USING BTREE,
  ADD KEY `fk_proyecto_extension1_idx` (`extension_idextension`) USING BTREE,
  ADD KEY `fk_proyecto_campo_especifico1_idx` (`campo_especifico_idcampo_especifico`) USING BTREE,
  ADD KEY `fk_proyecto_campo_detallado1_idx` (`campo_detallado_idcampo_detallado`) USING BTREE,
  ADD KEY `fk_proyecto_alcance_territorial1_idx` (`alcance_territorial_idalcance_territorial`) USING BTREE,
  ADD KEY `fk_proyecto_fuente_financiamiento1_idx` (`fuente_financiamiento_idfuente_financiamiento`) USING BTREE,
  ADD KEY `fk_proyecto_parametro_cumplimiento1_idx` (`parametro_cumplimiento_idparametro_cumplimiento`) USING BTREE,
  ADD KEY `programa_vinculacion` (`programa_vinculacion`) USING BTREE;

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`) USING BTREE;

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`idseccion`) USING BTREE;

--
-- Indices de la tabla `servicio_comunitario`
--
ALTER TABLE `servicio_comunitario`
  ADD PRIMARY KEY (`idservicio_comunitario`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_periodo1_idx` (`periodo_idperiodo`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_nivel1_idx` (`nivel_idnivel`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_institucion1_idx` (`institucion_idinstitucion`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_convenio1_idx` (`convenio_idconvenio`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_estado_practicas_y_servicio1_idx` (`estado_practicas_y_servicio_idestado_practicas`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_ciudad1_idx` (`ciudad_idciudad`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_proyecto1_idx` (`proyecto_idproyecto`) USING BTREE,
  ADD KEY `fk_servicio_comunitario_persona1_idx` (`persona_idpersona`) USING BTREE;

--
-- Indices de la tabla `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`idsub_menu`) USING BTREE,
  ADD KEY `fk_sub_menu_menu1_idx` (`menu_idmenu`) USING BTREE;

--
-- Indices de la tabla `tipo_convenio`
--
ALTER TABLE `tipo_convenio`
  ADD PRIMARY KEY (`idtipo_convenio`) USING BTREE;

--
-- Indices de la tabla `tipo_institucion`
--
ALTER TABLE `tipo_institucion`
  ADD PRIMARY KEY (`idtipo_institucion`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades_cronograma`
--
ALTER TABLE `actividades_cronograma`
  MODIFY `idactividades_cronograma` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `alcance_territorial`
--
ALTER TABLE `alcance_territorial`
  MODIFY `idalcance_territorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `asistencia_practicas`
--
ALTER TABLE `asistencia_practicas`
  MODIFY `idasistencia_practicas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `idauditoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `campo_amplio`
--
ALTER TABLE `campo_amplio`
  MODIFY `idcampo_amplio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `campo_detallado`
--
ALTER TABLE `campo_detallado`
  MODIFY `idcampo_detallado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `campo_especifico`
--
ALTER TABLE `campo_especifico`
  MODIFY `idcampo_especifico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idcarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `convenio`
--
ALTER TABLE `convenio`
  MODIFY `idconvenio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  MODIFY `idcronograma` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `docentes_asignados`
--
ALTER TABLE `docentes_asignados`
  MODIFY `iddocentes_asignados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estado_practicas_y_servicio`
--
ALTER TABLE `estado_practicas_y_servicio`
  MODIFY `idestado_practicas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estado_proyecto`
--
ALTER TABLE `estado_proyecto`
  MODIFY `idestado_proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `extension`
--
ALTER TABLE `extension`
  MODIFY `idextension` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `idfacultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `fuente_financiamiento`
--
ALTER TABLE `fuente_financiamiento`
  MODIFY `idfuente_financiamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `idinstitucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `linea_investigacion`
--
ALTER TABLE `linea_investigacion`
  MODIFY `idlinea_investigacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `metas`
--
ALTER TABLE `metas`
  MODIFY `idmetas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  MODIFY `idmodalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `idnivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `objeto`
--
ALTER TABLE `objeto`
  MODIFY `idobjeto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `idparametros` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `parametro_cumplimiento`
--
ALTER TABLE `parametro_cumplimiento`
  MODIFY `idparametro_cumplimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `idperiodo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `politica`
--
ALTER TABLE `politica`
  MODIFY `idpolitica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `practicas`
--
ALTER TABLE `practicas`
  MODIFY `idpracticas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idprivilegios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `programa_vinculacion`
--
ALTER TABLE `programa_vinculacion`
  MODIFY `idprograma_vinculacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `idproyecto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `idseccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `servicio_comunitario`
--
ALTER TABLE `servicio_comunitario`
  MODIFY `idservicio_comunitario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `idsub_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `tipo_convenio`
--
ALTER TABLE `tipo_convenio`
  MODIFY `idtipo_convenio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_institucion`
--
ALTER TABLE `tipo_institucion`
  MODIFY `idtipo_institucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades_cronograma`
--
ALTER TABLE `actividades_cronograma`
  ADD CONSTRAINT `fk_actividades_cronograma_cronograma1` FOREIGN KEY (`cronograma_idcronograma`) REFERENCES `cronograma` (`idcronograma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia_practicas`
--
ALTER TABLE `asistencia_practicas`
  ADD CONSTRAINT `fk_asistencia_practicas_practicas1` FOREIGN KEY (`practicas_idpracticas`) REFERENCES `practicas` (`idpracticas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia_servicio_comunitario`
--
ALTER TABLE `asistencia_servicio_comunitario`
  ADD CONSTRAINT `fk_asistencia_servicio_comunitario_servicio_comunitario1` FOREIGN KEY (`servicio_comunitario_idservicio_comunitario`) REFERENCES `servicio_comunitario` (`idservicio_comunitario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `fk_auditoria_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `campo_detallado`
--
ALTER TABLE `campo_detallado`
  ADD CONSTRAINT `fk_campo_detallado_campo_especifico1` FOREIGN KEY (`campo_especifico_idcampo_especifico`) REFERENCES `campo_especifico` (`idcampo_especifico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `campo_especifico`
--
ALTER TABLE `campo_especifico`
  ADD CONSTRAINT `fk_campo_especifico_campo_amplio1` FOREIGN KEY (`campo_amplio_idcampo_amplio`) REFERENCES `campo_amplio` (`idcampo_amplio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `fk_carrera_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carrera_modalidad1` FOREIGN KEY (`modalidad_idmodalidad`) REFERENCES `modalidad` (`idmodalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_ciudad_provincia` FOREIGN KEY (`provincia_idprovincia`) REFERENCES `provincia` (`idprovincia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `convenio`
--
ALTER TABLE `convenio`
  ADD CONSTRAINT `fk_convenio_institucion1` FOREIGN KEY (`institucion_idinstitucion`) REFERENCES `institucion` (`idinstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_convenio_tipo_convenio1` FOREIGN KEY (`tipo_convenio_idtipo_convenio`) REFERENCES `tipo_convenio` (`idtipo_convenio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cronograma`
--
ALTER TABLE `cronograma`
  ADD CONSTRAINT `fk_cronograma_proyecto1` FOREIGN KEY (`proyecto_idproyecto`) REFERENCES `proyecto` (`idproyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `extension`
--
ALTER TABLE `extension`
  ADD CONSTRAINT `fk_extension_ciudad1` FOREIGN KEY (`ciudad_idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `fk_facultad_extension1` FOREIGN KEY (`extension_idextension`) REFERENCES `extension` (`idextension`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `fk_institucion_ciudad1` FOREIGN KEY (`ciudad_idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_institucion_tipo_institucion1` FOREIGN KEY (`tipo_institucion_idtipo_institucion`) REFERENCES `tipo_institucion` (`idtipo_institucion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `linea_investigacion`
--
ALTER TABLE `linea_investigacion`
  ADD CONSTRAINT `fk_linea_investigacion_programa_vinculacion1` FOREIGN KEY (`programa_vinculacion_idprograma_vinculacion`) REFERENCES `programa_vinculacion` (`idprograma_vinculacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_seccion1` FOREIGN KEY (`seccion_idseccion`) REFERENCES `seccion` (`idseccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `metas`
--
ALTER TABLE `metas`
  ADD CONSTRAINT `fk_metas_proyecto1` FOREIGN KEY (`proyecto_idproyecto`) REFERENCES `proyecto` (`idproyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD CONSTRAINT `fk_objeto_tipo_convenio1` FOREIGN KEY (`tipo_convenio_idtipo_convenio`) REFERENCES `tipo_convenio` (`idtipo_convenio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_carrera1` FOREIGN KEY (`carrera_idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_extension1` FOREIGN KEY (`extension_idextension`) REFERENCES `extension` (`idextension`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_periodo1` FOREIGN KEY (`periodo_idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `practicas`
--
ALTER TABLE `practicas`
  ADD CONSTRAINT `fk_practicas_ciudad1` FOREIGN KEY (`ciudad_idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicas_convenio1` FOREIGN KEY (`convenio_idconvenio`) REFERENCES `convenio` (`idconvenio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicas_docentes_asignados1` FOREIGN KEY (`docentes_asignados_iddocentes_asignados`) REFERENCES `docentes_asignados` (`iddocentes_asignados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicas_estado_practicas1` FOREIGN KEY (`estado_practicas_idestado_practicas`) REFERENCES `estado_practicas_y_servicio` (`idestado_practicas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicas_institucion1` FOREIGN KEY (`institucion_idinstitucion`) REFERENCES `institucion` (`idinstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicas_nivel1` FOREIGN KEY (`nivel_idnivel`) REFERENCES `nivel` (`idnivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicas_periodo1` FOREIGN KEY (`periodo_idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practicas_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD CONSTRAINT `fk_privilegios_menu1` FOREIGN KEY (`menu_idmenu`) REFERENCES `menu` (`idmenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_privilegios_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_privilegios_seccion1` FOREIGN KEY (`seccion_idseccion`) REFERENCES `seccion` (`idseccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_privilegios_sub_menu1` FOREIGN KEY (`sub_menu_idsub_menu`) REFERENCES `sub_menu` (`idsub_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programa_vinculacion`
--
ALTER TABLE `programa_vinculacion`
  ADD CONSTRAINT `fk_programa_vinculacion_carrera1` FOREIGN KEY (`carrera_idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_proyecto_alcance_territorial1` FOREIGN KEY (`alcance_territorial_idalcance_territorial`) REFERENCES `alcance_territorial` (`idalcance_territorial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_campo_amplio1` FOREIGN KEY (`campo_amplio_idcampo_amplio`) REFERENCES `campo_amplio` (`idcampo_amplio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_campo_detallado1` FOREIGN KEY (`campo_detallado_idcampo_detallado`) REFERENCES `campo_detallado` (`idcampo_detallado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_campo_especifico1` FOREIGN KEY (`campo_especifico_idcampo_especifico`) REFERENCES `campo_especifico` (`idcampo_especifico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_carrera1` FOREIGN KEY (`carrera_idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_ciudad1` FOREIGN KEY (`ciudad_idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_convenio1` FOREIGN KEY (`convenio_idconvenio`) REFERENCES `convenio` (`idconvenio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_docentes_asignados1` FOREIGN KEY (`docentes_asignados_iddocentes_asignados`) REFERENCES `docentes_asignados` (`iddocentes_asignados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_estado_proyecto1` FOREIGN KEY (`estado_proyecto_idestado_proyecto`) REFERENCES `estado_proyecto` (`idestado_proyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_extension1` FOREIGN KEY (`extension_idextension`) REFERENCES `extension` (`idextension`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_fuente_financiamiento1` FOREIGN KEY (`fuente_financiamiento_idfuente_financiamiento`) REFERENCES `fuente_financiamiento` (`idfuente_financiamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_impactos1` FOREIGN KEY (`impactos_idimpactos`) REFERENCES `impactos` (`idimpactos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_linea_investigacion1` FOREIGN KEY (`linea_investigacion_idlinea_investigacion`) REFERENCES `linea_investigacion` (`idlinea_investigacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_parametro_cumplimiento1` FOREIGN KEY (`parametro_cumplimiento_idparametro_cumplimiento`) REFERENCES `parametro_cumplimiento` (`idparametro_cumplimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_periodo1` FOREIGN KEY (`periodo_idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_politica1` FOREIGN KEY (`politica_idpolitica`) REFERENCES `politica` (`idpolitica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`programa_vinculacion`) REFERENCES `programa_vinculacion` (`idprograma_vinculacion`);

--
-- Filtros para la tabla `servicio_comunitario`
--
ALTER TABLE `servicio_comunitario`
  ADD CONSTRAINT `fk_servicio_comunitario_ciudad1` FOREIGN KEY (`ciudad_idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_comunitario_convenio1` FOREIGN KEY (`convenio_idconvenio`) REFERENCES `convenio` (`idconvenio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_comunitario_estado_practicas_y_servicio1` FOREIGN KEY (`estado_practicas_y_servicio_idestado_practicas`) REFERENCES `estado_practicas_y_servicio` (`idestado_practicas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_comunitario_institucion1` FOREIGN KEY (`institucion_idinstitucion`) REFERENCES `institucion` (`idinstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_comunitario_nivel1` FOREIGN KEY (`nivel_idnivel`) REFERENCES `nivel` (`idnivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_comunitario_periodo1` FOREIGN KEY (`periodo_idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_comunitario_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicio_comunitario_proyecto1` FOREIGN KEY (`proyecto_idproyecto`) REFERENCES `proyecto` (`idproyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD CONSTRAINT `fk_sub_menu_menu1` FOREIGN KEY (`menu_idmenu`) REFERENCES `menu` (`idmenu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

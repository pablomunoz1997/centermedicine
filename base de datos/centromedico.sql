
CREATE DATABASE centromedico;
USE centromedico;



DROP TABLE IF EXISTS `citas`;
CREATE TABLE `citas` (
  `idcita` int(11) NOT NULL AUTO_INCREMENT,
  `citfecha` date NOT NULL,
  `cithora` time NOT NULL,
  `citPaciente` varchar(50) NOT NULL,
  `citMedico` varchar(50) NOT NULL,
  `citestado` enum('Agendada','confirmada','perdida') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcita`),
  KEY `cithora` (`cithora`),
  KEY `idPaciente` (`citPaciente`),
  KEY `idMedico` (`citMedico`)
) ;



DROP TABLE IF EXISTS `medicos`;
CREATE TABLE `medicos` (
  `idMedico` int(20) NOT NULL,
  `medidentificacion` char(20) COLLATE utf8_spanish_ci NOT NULL,
  `mednombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medtelefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medapellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medfecha` date NOT NULL,
  `medEspecialidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `medvalor` int(200) COLLATE utf8_spanish_ci NOT NULL,
  `medcorreo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idMedico`),
  UNIQUE KEY `medidentificacion` (`medidentificacion`)
);



DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `pacIdentificacion` char(20) COLLATE utf8_spanish_ci NOT NULL,
  `pacNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacApellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacDireccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacTelefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pacFechaNacimiento` date NOT NULL,
  `pacSexo` enum('Femenino','Masculino') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idPaciente`),
  UNIQUE KEY `pacIdentificacion` (`pacIdentificacion`)
) ;


DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Roll` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ;




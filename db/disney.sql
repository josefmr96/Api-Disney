-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.18-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para disney
CREATE DATABASE IF NOT EXISTS `disney` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */;
USE `disney`;

-- Volcando estructura para tabla disney.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `idgenero` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `imagen` varchar(50) NOT NULL DEFAULT '',
  `fk_idpelicula` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`idgenero`),
  KEY `FK_generos_peliculas` (`fk_idpelicula`),
  CONSTRAINT `FK_generos_peliculas` FOREIGN KEY (`fk_idpelicula`) REFERENCES `peliculas` (`idpelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla disney.peliculas
CREATE TABLE IF NOT EXISTS `peliculas` (
  `idpelicula` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `fecha_creacion` varchar(50) NOT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `fk_idpersonaje` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`idpelicula`),
  KEY `FK_peliculas_personajes` (`fk_idpersonaje`),
  CONSTRAINT `FK_peliculas_personajes` FOREIGN KEY (`fk_idpersonaje`) REFERENCES `personajes` (`idpersonaje`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla disney.personajes
CREATE TABLE IF NOT EXISTS `personajes` (
  `idpersonaje` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `historia` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `fk_idpelicula` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`idpersonaje`),
  KEY `FK_personajes_peliculas` (`fk_idpelicula`),
  CONSTRAINT `FK_personajes_peliculas` FOREIGN KEY (`fk_idpelicula`) REFERENCES `peliculas` (`idpelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla disney.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(250) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

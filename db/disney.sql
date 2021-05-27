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

-- Volcando datos para la tabla disney.generos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` (`idgenero`, `nombre`, `imagen`, `fk_idpelicula`) VALUES
	(1, 'comedia', 'http://humorsapiens.com/sites/default/files/Articu', 2),
	(2, 'comedia', 'http://humorsapiens.com/sites/default/files/Articu', 4),
	(3, 'accion', 'https://aceleratucarrera.com/wp-content/uploads/20', 1),
	(4, 'accion', 'https://aceleratucarrera.com/wp-content/uploads/20', 3);
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;

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

-- Volcando datos para la tabla disney.peliculas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` (`idpelicula`, `titulo`, `imagen`, `fecha_creacion`, `calificacion`, `fk_idpersonaje`) VALUES
	(1, 'Los increibles', 'https://beersandpolitics.com/wp-content/uploads/2019/06/rese%C3%B1a-los-increibles-2.jpg', '2004', 5, 1),
	(2, 'Monster Inc', 'https://static.wikia.nocookie.net/disney/images/a/a8/Monstruos_sa.jpg/revision/latest?cb=20110804055254&path-prefix=es', '2001', 5, 3),
	(3, 'Los increibles 2', 'https://i.blogs.es/fc2240/los-increibles-2-pixar-trailer-final/1366_2000.jpg', '2018', 4, 1),
	(4, 'Up: Una aventura en las alturas', 'https://akns-images.eonline.com/eol_images/Entire_Site/2014421/rs_560x404-140521141529-up2.jpg?fit=around%7C560:404&output-quality=90&crop=560:404;center,top', '2009', 3, NULL),
	(6, 'Up: Una aventura en las alturas', 'https://akns-images.eonline.com/eol_images/Entire_Site/2014421/rs_560x404-140521141529-up2.jpg?fit=around%7C560:404&output-quality=90&crop=560:404;center,top', '2009', 3, NULL);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;

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

-- Volcando datos para la tabla disney.personajes: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` (`idpersonaje`, `nombre`, `edad`, `peso`, `historia`, `imagen`, `fk_idpelicula`) VALUES
	(1, 'Dash', 10, 35, 'Es el hijo del medio de Bob y Helen Parris. Su principal poder de superhéroe es la capacidad de correr superrápido. También puede correr sobre el agua como consecuencia de esto, así como otras maniobras de flexión física, como subir edificios.', 'https://static.wikia.nocookie.net/disney/images/a/a5/I2_-_Dash.png/revision/latest?cb=20180609164216&path-prefix=es', 1),
	(3, 'Sullivan', 30, 200, 'Es un monstruo que habita Monstruópolis, igual que todos los otros monstruos existentes. Tiene más de dos metros de altura y el pelo azul con manchas moradas, y es el que posee el récord como asustador de niños. Vive tranquilamente con su mejor amigo', 'https://w7.pngwing.com/pngs/886/269/png-transparent-monsters-inc-mike-sulley-to-the-rescue-james-p-sullivan-mike-wazowski-monster-inc-snout-pixar-animation.png', 2),
	(6, 'mike wazowski', 30, 60, 'Es un monstruo que habita Monstruópolis, igual que todos los otros monstruos existentes. Tiene más de dos metros de altura y el pelo azul con manchas moradas, y es el que posee el récord como asustador de niños. Vive tranquilamente con su mejor amigo', 'http://assets.stickpng.com/images/58a7a0d35ad0fd0b7fdd33b4.png', 2),
	(8, 'Violeta', 15, 50, 'Es el hijo del medio de Bob y Helen Parris. Su principal poder de superhéroe es la capacidad de correr superrápido. También puede correr sobre el agua como consecuencia de esto, así como otras maniobras de flexión física, como subir edificios.', 'https://i.pinimg.com/originals/a7/4b/b3/a74bb34ed507989e670b2214b8f31c39.png', 1),
	(10, 'Lobo', 10, 35, 'Es un monstruo que habita Monstruópolis, igual que todos los otros monstruos existentes. Tiene más de dos metros de altura y el pelo azul con manchas moradas, y es el que posee el récord como asustador de niños. Vive tranquilamente con su mejor amigo', 'https://w7.pngwing.com/pngs/886/269/png-transparent-monsters-inc-mike-sulley-to-the-rescue-james-p-sullivan-mike-wazowski-monster-inc-snout-pixar-animation.png', NULL);
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;

-- Volcando estructura para tabla disney.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(250) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla disney.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`idusuario`, `nombre`, `correo`, `contraseña`) VALUES
	(6, 'juan', 'juan@gmail.com', '$2a$10$LTEYJd63ky61N5w4ywU1heYWw/aKBvJgGMgG9yqgCFkMT4Yk8U.MG'),
	(7, 'juan', 'juan1@gmail.com', '$2a$10$5cIsQNUKzHG5vnws/6YZi.T3Z4klNNS3bUs6IaKDQTdYeeB.TCeP6'),
	(8, 'juan', 'juan2@gmail.com', '$2a$10$unADHLi06qOnQlXa/xPQCuFjV/vdOivjPyFGJiGCz4QYGCZTPbWzm'),
	(12, 'ali', 'ali@ali.com', '$2a$10$Q/MbaiB3.488iSRfztBnpeC58HVNyyNioNt.rlvvyIFx9UMGS3EV2'),
	(13, 'ali', 'virginie.rempel99@ethereal.email', '$2a$10$mnwl6llhrTRtfIbcEEw4puRb2H0zGkrSX1Pbi93N7RD5zuQUGYA1u');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

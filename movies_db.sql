-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2021 a las 03:22:05
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `movies_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblactor`
--

CREATE TABLE `tblactor` (
  `idactor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblactor`
--

INSERT INTO `tblactor` (`idactor`, `nombre`, `nacionalidad`) VALUES
(1, 'Bratt Pittin', 'Noruego'),
(2, 'Ronaldo Brandon', 'Nueva Zelanda'),
(4, 'Actor 3', 'Mexicano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblclasificacion`
--

CREATE TABLE `tblclasificacion` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblclasificacion`
--

INSERT INTO `tblclasificacion` (`clave`, `nombre`, `descripcion`) VALUES
(1, 'AA', 'Películas para todo público que tengan además atractivo infantil y sean comprensibles para niños menores de siete años de edad. Películas para todo público que tengan además atractivo infantil y sean comprensibles para niños menores de siete años de edad.'),
(2, 'A', 'Películas para todo público.'),
(3, 'B', 'Películas para adolescentes de 12 años en adelante.'),
(4, 'B15', 'Película no recomendable para menores de 15 años de edad.'),
(5, 'C', 'Películas para adultos de 18 años en adelante.'),
(6, 'D', 'Películas para adultos, con sexo explícito, lenguaje procaz o alto grado de violencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldirector`
--

CREATE TABLE `tbldirector` (
  `iddirector` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbldirector`
--

INSERT INTO `tbldirector` (`iddirector`, `nombre`, `nacionalidad`) VALUES
(1, 'Guillermo del toro', 'Mexicana'),
(2, 'Mark Roberts', 'Estadounidense');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblgenero`
--

CREATE TABLE `tblgenero` (
  `idgenero` int(11) NOT NULL,
  `genero` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblgenero`
--

INSERT INTO `tblgenero` (`idgenero`, `genero`) VALUES
(1, 'Sci-Fi'),
(2, 'Romance'),
(3, 'Drama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpeliculas`
--

CREATE TABLE `tblpeliculas` (
  `idpelicula` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `fechaestreno` datetime DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  `genero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblpeliculas`
--

INSERT INTO `tblpeliculas` (`idpelicula`, `titulo`, `duracion`, `sinopsis`, `fechaestreno`, `clasificacion`, `director`, `genero`) VALUES
(1, 'Terror Edited', 152, 'skjdflkdhskdkjs', '0000-00-00 00:00:00', 1, 1, 1),
(2, 'Pelicula 2', 153, 'skjdflkdhskdkjs', '0000-00-00 00:00:00', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblreparto`
--

CREATE TABLE `tblreparto` (
  `idreparto` int(11) NOT NULL,
  `personaje` varchar(100) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  `pelicula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblreparto`
--

INSERT INTO `tblreparto` (`idreparto`, `personaje`, `actor`, `pelicula`) VALUES
(1, 'Personaje 1', 1, 1),
(2, 'Personaje 2', 2, 1),
(3, 'Personaje 3', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblactor`
--
ALTER TABLE `tblactor`
  ADD PRIMARY KEY (`idactor`);

--
-- Indices de la tabla `tblclasificacion`
--
ALTER TABLE `tblclasificacion`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `tbldirector`
--
ALTER TABLE `tbldirector`
  ADD PRIMARY KEY (`iddirector`);

--
-- Indices de la tabla `tblgenero`
--
ALTER TABLE `tblgenero`
  ADD PRIMARY KEY (`idgenero`);

--
-- Indices de la tabla `tblpeliculas`
--
ALTER TABLE `tblpeliculas`
  ADD PRIMARY KEY (`idpelicula`),
  ADD KEY `clasificacion` (`clasificacion`),
  ADD KEY `director` (`director`),
  ADD KEY `genero` (`genero`);

--
-- Indices de la tabla `tblreparto`
--
ALTER TABLE `tblreparto`
  ADD PRIMARY KEY (`idreparto`),
  ADD KEY `actor` (`actor`),
  ADD KEY `pelicula` (`pelicula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblactor`
--
ALTER TABLE `tblactor`
  MODIFY `idactor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblclasificacion`
--
ALTER TABLE `tblclasificacion`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbldirector`
--
ALTER TABLE `tbldirector`
  MODIFY `iddirector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblgenero`
--
ALTER TABLE `tblgenero`
  MODIFY `idgenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblpeliculas`
--
ALTER TABLE `tblpeliculas`
  MODIFY `idpelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblreparto`
--
ALTER TABLE `tblreparto`
  MODIFY `idreparto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblpeliculas`
--
ALTER TABLE `tblpeliculas`
  ADD CONSTRAINT `tblpeliculas_ibfk_1` FOREIGN KEY (`clasificacion`) REFERENCES `tblclasificacion` (`clave`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblpeliculas_ibfk_2` FOREIGN KEY (`director`) REFERENCES `tbldirector` (`iddirector`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblpeliculas_ibfk_3` FOREIGN KEY (`genero`) REFERENCES `tblgenero` (`idgenero`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tblreparto`
--
ALTER TABLE `tblreparto`
  ADD CONSTRAINT `tblreparto_ibfk_1` FOREIGN KEY (`actor`) REFERENCES `tblactor` (`idactor`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblreparto_ibfk_2` FOREIGN KEY (`pelicula`) REFERENCES `tblpeliculas` (`idpelicula`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

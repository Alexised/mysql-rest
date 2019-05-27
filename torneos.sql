-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2019 a las 23:44:48
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `torneos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `championship`
--

CREATE TABLE `championship` (
  `idChampionship` int(11) NOT NULL,
  `Name_Championship` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `City_Championship` varchar(45) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `championship`
--

INSERT INTO `championship` (`idChampionship`, `Name_Championship`, `City_Championship`) VALUES
(1, 'prueba', 'medellin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `idGroups` int(11) NOT NULL,
  ` Name_Groups` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Championship_idChampionship` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`idGroups`, ` Name_Groups`, `Championship_idChampionship`) VALUES
(1, 'grupoprueba', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matche`
--

CREATE TABLE `matche` (
  `idMatche` int(11) NOT NULL,
  `Observations` longtext COLLATE latin1_spanish_ci NOT NULL,
  `Winner` tinyint(4) NOT NULL,
  `Looser` tinyint(4) NOT NULL,
  `locate` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `date` date NOT NULL,
  `Championship_idChampionship` int(11) NOT NULL,
  `Groups_idGroups` int(11) NOT NULL,
  `Resultados_idResultados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player`
--

CREATE TABLE `player` (
  `idPlayer` int(11) NOT NULL,
  `FullName` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Genre` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `Age` varchar(3) COLLATE latin1_spanish_ci NOT NULL,
  `Passwords` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `Role` int(11) NOT NULL,
  `Team_idTeam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `player`
--

INSERT INTO `player` (`idPlayer`, `FullName`, `Email`, `Genre`, `Age`, `Passwords`, `Role`, `Team_idTeam`) VALUES
(1040752177, 'edwin alexis', 'alexis@hotmail.com', 'Masculino', '23', 'torneo12', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `idResultados` int(11) NOT NULL,
  `Match_Score_Winner` int(11) NOT NULL,
  `Match_Score_Looser` int(11) NOT NULL,
  `Max_Score_D_L` int(11) NOT NULL,
  `Max_Score_T_L` int(11) NOT NULL,
  `Max_Score_D_W` int(11) NOT NULL,
  `idplayerMax_Score_T_W` int(11) NOT NULL,
  `idplayerMax_Score_D_L` int(11) NOT NULL,
  `idplayerMax_Score_T_L` int(11) NOT NULL,
  `idplayerMax_Score_D_W` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--

CREATE TABLE `team` (
  `idTeam` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `logo` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `point` int(11) NOT NULL,
  `puntospromedio` decimal(30,0) NOT NULL,
  `puntoscontra` int(11) NOT NULL,
  `Groups_idGroups` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `team`
--

INSERT INTO `team` (`idTeam`, `name`, `logo`, `point`, `puntospromedio`, `puntoscontra`, `Groups_idGroups`) VALUES
(1, 'teamprueba', 'null', 0, '0', 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `championship`
--
ALTER TABLE `championship`
  ADD PRIMARY KEY (`idChampionship`),
  ADD UNIQUE KEY `Name_Championship` (`Name_Championship`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`idGroups`),
  ADD KEY `fk_Groups_Championship` (`Championship_idChampionship`);

--
-- Indices de la tabla `matche`
--
ALTER TABLE `matche`
  ADD PRIMARY KEY (`idMatche`),
  ADD KEY `fk_Matche_Championship1` (`Championship_idChampionship`),
  ADD KEY `fk_Matche_Groups1` (`Groups_idGroups`),
  ADD KEY `fk_Matche_Resultados1` (`Resultados_idResultados`);

--
-- Indices de la tabla `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`idPlayer`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `fk_Player_Team1` (`Team_idTeam`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`idResultados`);

--
-- Indices de la tabla `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`idTeam`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_Team_Groups1` (`Groups_idGroups`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `championship`
--
ALTER TABLE `championship`
  MODIFY `idChampionship` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `idGroups` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `matche`
--
ALTER TABLE `matche`
  MODIFY `idMatche` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `idResultados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `team`
--
ALTER TABLE `team`
  MODIFY `idTeam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `fk_Groups_Championship` FOREIGN KEY (`Championship_idChampionship`) REFERENCES `championship` (`idChampionship`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `matche`
--
ALTER TABLE `matche`
  ADD CONSTRAINT `fk_Matche_Championship1` FOREIGN KEY (`Championship_idChampionship`) REFERENCES `championship` (`idChampionship`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matche_Groups1` FOREIGN KEY (`Groups_idGroups`) REFERENCES `groups` (`idGroups`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matche_Resultados1` FOREIGN KEY (`Resultados_idResultados`) REFERENCES `resultados` (`idResultados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `fk_Player_Team1` FOREIGN KEY (`Team_idTeam`) REFERENCES `team` (`idTeam`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_Team_Groups1` FOREIGN KEY (`Groups_idGroups`) REFERENCES `groups` (`idGroups`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

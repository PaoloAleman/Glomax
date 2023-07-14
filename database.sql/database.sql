DROP DATABASE vestidos;
CREATE DATABASE vestidos;
USE vestidos;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2023 a las 19:29:30
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vestidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `vestidosDetalle` (
                            `id` smallint(6) NOT NULL,
                            `nombre_vestido` varchar(100) DEFAULT NULL,
                            `color_vestido` varchar(40) DEFAULT NULL,
                            `talle_vestido` varchar(10) DEFAULT NULL,
                            `cantidadS` int(11) DEFAULT NULL,
                            `cantidadE` int(11) DEFAULT NULL,
                            `totalStock` int,
                            `saldoTotal` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `vestidosDetalle` (`id`, `nombre_vestido`, `color_vestido`, `talle_vestido`, `cantidadS`, `cantidadE`) VALUES
                                                                                                                (1, 'Vestido corto Dhara', 'Negro', 'M', 2, 0),
                                                                                                                (2, 'Vestido corto Dhara', 'Negro', 'L', 0, 0),
                                                                                                                (3, 'Vestido corto Dhara', 'Negro', 'XL', 1, 0),
                                                                                                                (4, 'Vestido corto Dhara', 'Negro', 'XXL', 0, 0),
                                                                                                                (5, 'Vestido corto Dhara', 'Gris oscuro', 'M', 1, 0),
                                                                                                                (6, 'Vestido corto Dhara', 'Gris oscuro', 'L', 0, 0),
                                                                                                                (7, 'Vestido corto Dhara', 'Gris oscuro', 'XL', 0, 0),
                                                                                                                (8, 'Vestido corto Dhara', 'Gris oscuro', 'XXL', 1, 0),
                                                                                                                (9, 'Vestido corto Dhara', 'Gris claro', 'M', 0, 0),
                                                                                                                (10, 'Vestido corto Dhara', 'Gris claro', 'L', 0, 0),
                                                                                                                (11, 'Vestido corto Dhara', 'Gris claro', 'XL', 0, 0),
                                                                                                                (12, 'Vestido corto Dhara', 'Gris claro', 'XXL', 0, 0),
                                                                                                                (13, 'Vestido Starples', 'Negro', 'M', 0, 3),
                                                                                                                (14, 'Vestido Starples', 'Negro', 'L', 0, 3),
                                                                                                                (15, 'Vestido Starples', 'Negro', 'XL', 5, 3),
                                                                                                                (16, 'Vestido Starples', 'Negro', 'XXL', 6, 3),
                                                                                                                (17, 'Vestido Starples', 'Marron', 'M', 2, 3),
                                                                                                                (18, 'Vestido Starples', 'Marron', 'L', 0, 3),
                                                                                                                (19, 'Vestido Starples', 'Marron', 'XL', 0, 3),
                                                                                                                (20, 'Vestido Starples', 'Marron', 'XXL', 2, 3),
                                                                                                                (21, 'Vestido Starples', 'Rojo', 'M', 0, 3),
                                                                                                                (22, 'Vestido Starples', 'Rojo', 'L', 3, 3),
                                                                                                                (23, 'Vestido Starples', 'Rojo', 'XL', 4, 3),
                                                                                                                (24, 'Vestido Starples', 'Rojo', 'XXL', 2, 3),
                                                                                                                (25, 'Vestido Starples', 'Verde claro', 'M', 0, 0),
                                                                                                                (26, 'Vestido Starples', 'Verde claro', 'L', 0, 0),
                                                                                                                (27, 'Vestido Starples', 'Verde claro', 'XL', 1, 0),
                                                                                                                (28, 'Vestido Starples', 'Verde claro', 'XXL', 2, 0),
                                                                                                                (29, 'Vestido Remeron Fiorella', 'Negro', 'S', 0, 3),
                                                                                                                (30, 'Vestido Remeron Fiorella', 'Negro', 'M', 0, 3),
                                                                                                                (31, 'Vestido Remeron Fiorella', 'Negro', 'L', 3, 3),
                                                                                                                (32, 'Vestido Remeron Fiorella', 'Negro', 'XL', 1, 3),
                                                                                                                (33, 'Vestido Remeron Fiorella', 'Negro', 'XXL', 3, 3),
                                                                                                                (34, 'Vestido Remeron Fiorella', 'Gris claro', 'S', 3, 3),
                                                                                                                (35, 'Vestido Remeron Fiorella', 'Gris claro', 'M', 4, 3),
                                                                                                                (36, 'Vestido Remeron Fiorella', 'Gris claro', 'L', 0, 3),
                                                                                                                (37, 'Vestido Remeron Fiorella', 'Gris claro', 'XL', 0, 3),
                                                                                                                (38, 'Vestido Remeron Fiorella', 'Gris claro', 'XXL', 1, 3),
                                                                                                                (39, 'Tapado Channel', 'Beige', 'S', 2, 4),
                                                                                                                (40, 'Tapado Channel', 'Beige', 'M', 2, 1),
                                                                                                                (41, 'Tapado Channel', 'Beige', 'L', 0, 1),
                                                                                                                (42, 'Tapado Channel', 'Beige', 'XL', 2, 4),
                                                                                                                (43, 'Tapado Channel', 'Beige', 'XXL', 1, 2),
                                                                                                                (44, 'Vestido Gretta', 'Negro', 'S', 3, 3),
                                                                                                                (45, 'Vestido Gretta', 'Negro', 'M', 4, 3),
                                                                                                                (46, 'Vestido Gretta', 'Negro', 'L', 5, 3),
                                                                                                                (47, 'Vestido Gretta', 'Negro', 'XL', 4, 3),
                                                                                                                (48, 'Vestido Gretta', 'Negro', 'XXL', 3, 3),
                                                                                                                (49, 'Vestido Gretta', 'Gris claro', 'S', 1, 3),
                                                                                                                (50, 'Vestido Gretta', 'Gris claro', 'M', 0, 3),
                                                                                                                (51, 'Vestido Gretta', 'Gris claro', 'L', 0, 3),
                                                                                                                (52, 'Vestido Gretta', 'Gris claro', 'XL', 0, 3),
                                                                                                                (53, 'Vestido Gretta', 'Gris claro', 'XXL', 2, 3),
                                                                                                                (54, 'Poncho en Picos Yamilet', 'Negro', 'M', 0, 0),
                                                                                                                (55, 'Poncho en Picos Yamilet', 'Negro', 'XL', 0, 0),
                                                                                                                (56, 'Poncho en Picos Yamilet', 'Negro', 'XXL', 1, 0),
                                                                                                                (57, 'Poncho en Picos Yamilet', 'Gris claro', 'M', 0, 0),
                                                                                                                (58, 'Poncho en Picos Yamilet', 'Gris claro', 'XL', 0, 0),
                                                                                                                (59, 'Poncho en Picos Yamilet', 'Gris claro', 'XXL', 0, 0),
                                                                                                                (60, 'Chaleco Ethna', 'Natural', 'S', 3, 0),
                                                                                                                (61, 'Chaleco Ethna', 'Natural', 'M', 2, 4),
                                                                                                                (62, 'Chaleco Ethna', 'Natural', 'L', 0, 4),
                                                                                                                (63, 'Chaleco Ethna', 'Natural', 'XL', 0, 4),
                                                                                                                (64, 'Chaleco Ethna', 'Natural', 'XXL', 0, 4),
                                                                                                                (65, 'Chaleco Ethna', 'Negro', 'S', 1, 0),
                                                                                                                (66, 'Chaleco Ethna', 'Negro', 'M', 3, 0),
                                                                                                                (67, 'Chaleco Ethna', 'Negro', 'L', 2, 4),
                                                                                                                (68, 'Chaleco Ethna', 'Negro', 'XL', 1, 0),
                                                                                                                (69, 'Sueter Lisboa', 'Camel', 'M', 0, 0),
                                                                                                                (70, 'Sueter Lisboa', 'Camel', 'M', 0, 0),
                                                                                                                (71, 'Sueter Lisboa', 'Camel', 'L', 0, 0),
                                                                                                                (72, 'Sueter Lisboa', 'Camel', 'XL', 0, 0),
                                                                                                                (73, 'Sueter Lisboa', 'Camel', 'XXL', 0, 0),
                                                                                                                (74, 'Sueter Lisboa', 'Marron', 'M', 0, 0),
                                                                                                                (75, 'Sueter Lisboa', 'Marron', 'M', 0, 0),
                                                                                                                (76, 'Sueter Lisboa', 'Marron', 'L', 1, 0),
                                                                                                                (77, 'Sueter Lisboa', 'Marron', 'XL', 1, 0),
                                                                                                                (78, 'Sueter Lisboa', 'Marron', 'XXL', 0, 0),
                                                                                                                (79, 'Sueter Lisboa', 'Natural', 'M', 0, 0),
                                                                                                                (80, 'Sueter Lisboa', 'Natural', 'M', 0, 0),
                                                                                                                (81, 'Sueter Lisboa', 'Natural', 'L', 0, 0),
                                                                                                                (82, 'Sueter Lisboa', 'Natural', 'XL', 0, 0),
                                                                                                                (83, 'Sueter Lisboa', 'Natural', 'XXL', 0, 0),
                                                                                                                (84, 'Sueter Lisboa', 'Negro', 'M', 0, 0),
                                                                                                                (85, 'Sueter Lisboa', 'Negro', 'M', 0, 0),
                                                                                                                (86, 'Sueter Lisboa', 'Negro', 'L', 0, 0),
                                                                                                                (87, 'Sueter Lisboa', 'Negro', 'XL', 0, 0),
                                                                                                                (88, 'Sueter Lisboa', 'Negro', 'XXL', 2, 0),
                                                                                                                (89, 'Sueter Lisboa', 'Rojo', 'M', 0, 0),
                                                                                                                (90, 'Sueter Lisboa', 'Rojo', 'M', 0, 0),
                                                                                                                (91, 'Sueter Lisboa', 'Rojo', 'L', 1, 0),
                                                                                                                (92, 'Sueter Lisboa', 'Rojo', 'XL', 0, 0),
                                                                                                                (93, 'Sueter Lisboa', 'Rojo', 'XXL', 1, 0),
                                                                                                                (94, 'Sueter Aitana', 'Negro', 'M', 1, 0),
                                                                                                                (95, 'Sueter Aitana', 'Negro', 'L', 0, 0),
                                                                                                                (96, 'Sueter Aitana', 'Negro', 'XL', 0, 0),
                                                                                                                (97, 'Sueter Aitana', 'Negro', 'XXL', 0, 0),
                                                                                                                (98, 'Sueter Aitana', 'Rosa', 'M', 0, 0),
                                                                                                                (99, 'Sueter Aitana', 'Rosa', 'L', 0, 0),
                                                                                                                (100, 'Sueter Aitana', 'Rosa', 'XL', 0, 0),
                                                                                                                (101, 'Sueter Aitana', 'Rosa', 'XXL', 0, 0),
                                                                                                                (102, 'Sueter Ibiza', 'Negro', 'S', 0, 0),
                                                                                                                (103, 'Sueter Ibiza', 'Negro', 'M', 0, 0),
                                                                                                                (104, 'Sueter Ibiza', 'Negro', 'L', 0, 0),
                                                                                                                (105, 'Sueter Ibiza', 'Negro', 'XL', 0, 0),
                                                                                                                (106, 'Sueter Ibiza', 'Negro', 'XXL', 1, 0),
                                                                                                                (107, 'Sueter Ibiza', 'Gris claro', 'S', 1, 0),
                                                                                                                (108, 'Sueter Ibiza', 'Gris claro', 'M', 0, 0),
                                                                                                                (109, 'Sueter Ibiza', 'Gris claro', 'L', 0, 0),
                                                                                                                (110, 'Sueter Ibiza', 'Gris claro', 'XL', 0, 0),
                                                                                                                (111, 'Sueter Ibiza', 'Gris claro', 'XXL', 0, 0),
                                                                                                                (112, 'Sueter Ibiza', 'Natural', 'S', 0, 0),
                                                                                                                (113, 'Sueter Ibiza', 'Natural', 'M', 0, 0),
                                                                                                                (114, 'Sueter Ibiza', 'Natural', 'L', 0, 0),
                                                                                                                (115, 'Sueter Ibiza', 'Natural', 'XL', 0, 0),
                                                                                                                (116, 'Sueter Ibiza', 'Natural', 'XXL', 0, 0),
                                                                                                                (117, 'Sueter Ibiza', 'Rosa', 'S', 0, 0),
                                                                                                                (118, 'Sueter Ibiza', 'Rosa', 'M', 0, 0),
                                                                                                                (119, 'Sueter Ibiza', 'Rosa', 'L', 0, 0),
                                                                                                                (120, 'Sueter Ibiza', 'Rosa', 'XL', 0, 0),
                                                                                                                (121, 'Sueter Ibiza', 'Rosa', 'XXL', 1, 0),
                                                                                                                (122, 'Tapado Anezka', 'Marron', 'M', 1, 0),
                                                                                                                (123, 'Tapado Anezka', 'Marron', 'XL', 1, 0),
                                                                                                                (124, 'Tapado Anezka', 'Marron', 'XXL', 2, 0),
                                                                                                                (125, 'Tapado Anezka', 'Gris claro', 'M', 1, 0),
                                                                                                                (126, 'Tapado Anezka', 'Gris claro', 'XL', 2, 3),
                                                                                                                (127, 'Tapado Anezka', 'Gris claro', 'XXL', 3, 3),
                                                                                                                (128, 'Tapado Anezka', 'Negro', 'M', 7, 3),
                                                                                                                (129, 'Tapado Anezka', 'Negro', 'XL', 4, 3),
                                                                                                                (130, 'Sueter Amelia', 'Negro', 'M', 0, 0),
                                                                                                                (131, 'Sueter Amelia', 'Negro', 'M', 0, 0),
                                                                                                                (132, 'Sueter Amelia', 'Negro', 'L', 0, 0),
                                                                                                                (133, 'Sueter Amelia', 'Negro', 'XL', 0, 0),
                                                                                                                (134, 'Sueter Amelia', 'Negro', 'XXL', 1, 0),
                                                                                                                (135, 'Sueter Amelia', 'Militar', 'M', 0, 0),
                                                                                                                (136, 'Sueter Amelia', 'Militar', 'M', 0, 0),
                                                                                                                (137, 'Sueter Amelia', 'Militar', 'L', 0, 0),
                                                                                                                (138, 'Sueter Amelia', 'Militar', 'XL', 0, 0),
                                                                                                                (139, 'Sueter Amelia', 'Militar', 'XXL', 0, 0),
                                                                                                                (140, 'Sueter Amelia', 'Natural', 'M', 0, 0),
                                                                                                                (141, 'Sueter Amelia', 'Natural', 'M', 0, 0),
                                                                                                                (142, 'Sueter Amelia', 'Natural', 'L', 0, 0),
                                                                                                                (143, 'Sueter Amelia', 'Natural', 'XL', 0, 0),
                                                                                                                (144, 'Sueter Amelia', 'Natural', 'XXL', 0, 0),
                                                                                                                (145, 'Buzo Manta Teddy', 'Beige', 'U', 2, 0),
                                                                                                                (146, 'Buzo Manta Teddy', 'Gris oscuro', 'U', 1, 0),
                                                                                                                (147, 'Buzo Manta Teddy', 'Negro', 'U', 3, 0),
                                                                                                                (148, 'Vestido Indira', 'Negro', 'M', 1, 0),
                                                                                                                (149, 'Vestido Indira', 'Negro', 'L', 1, 0),
                                                                                                                (150, 'Vestido Indira', 'Negro', 'XL', 1, 0),
                                                                                                                (151, 'Vestido Indira', 'Negro', 'XXL', 2, 0),
                                                                                                                (152, 'Vestido Indira', 'Militar', 'M', 0, 0),
                                                                                                                (153, 'Vestido Indira', 'Militar', 'L', 0, 0),
                                                                                                                (154, 'Vestido Indira', 'Militar', 'XL', 0, 0),
                                                                                                                (155, 'Vestido Indira', 'Militar', 'XXL', 1, 0),
                                                                                                                (156, 'Sueter Ponchiito Nabi', 'Gris claro', 'U', 1, 0),
                                                                                                                (157, 'Sueter Ponchiito Nabi', 'Marron', 'U', 1, 0),
                                                                                                                (158, 'Vestido Bianka', 'Negro', 'M', 2, 3),
                                                                                                                (159, 'Vestido Bianka', 'Negro', 'L', 1, 0),
                                                                                                                (160, 'Vestido Bianka', 'Negro', 'XL', 4, 3),
                                                                                                                (161, 'Vestido Bianka', 'Negro', 'XXL', 2, 3),
                                                                                                                (162, 'Vestido Bianka', 'Marron', 'M', 0, 3),
                                                                                                                (163, 'Vestido Bianka', 'Marron', 'L', 0, 3),
                                                                                                                (164, 'Vestido Bianka', 'Marron', 'XL', 3, 3),
                                                                                                                (165, 'Vestido Bianka', 'Marron', 'XXL', 0, 3),
                                                                                                                (166, 'Vestido Bianka', 'Militar', 'M', 0, 3),
                                                                                                                (167, 'Vestido Bianka', 'Militar', 'L', 0, 3),
                                                                                                                (168, 'Vestido Bianka', 'Militar', 'XL', 0, 3),
                                                                                                                (169, 'Vestido Bianka', 'Militar', 'XXL', 0, 3),
                                                                                                                (170, 'Vestido Bianka', 'Natural', 'L', 1, 3),
                                                                                                                (171, 'Vestido Bianka', 'Natural', 'XL', 0, 3),
                                                                                                                (172, 'Vestido Bianka', 'Natural', 'XXL', 1, 0),
                                                                                                                (173, 'Tapado Julieth', 'Beige', 'U', 0, 0),
                                                                                                                (174, 'Tapado Julieth', 'Gris claro', 'U', 0, 0),
                                                                                                                (175, 'Tapado Julieth', 'Negro', 'U', 2, 0),
                                                                                                                (176, 'Tapado Roma', 'Camel', 'U', 3, 0),
                                                                                                                (177, 'Tapado Roma', 'Gris claro', 'U', 4, 0),
                                                                                                                (178, 'Tapado Roma', 'Habano', 'U', 5, 0),
                                                                                                                (179, 'Tapado Roma', 'Natural', 'U', 5, 0),
                                                                                                                (180, 'Tapado Roma', 'Negro', 'U', 3, 0),
                                                                                                                (181, 'Vestido Starples', 'Camel', 'M', 0, 3),
                                                                                                                (182, 'Vestido Starples', 'Camel', 'L', 0, 3),
                                                                                                                (183, 'Vestido Starples', 'Camel', 'XL', 0, 3),
                                                                                                                (184, 'Vestido Starples', 'Camel', 'XXL', 1, 3),
                                                                                                                (185, 'Vestido Starples', 'Verde hoja', 'M', 0, 3),
                                                                                                                (186, 'Vestido Starples', 'Verde hoja', 'L', 0, 3),
                                                                                                                (187, 'Vestido Starples', 'Verde hoja', 'XL', 0, 3),
                                                                                                                (188, 'Vestido Starples', 'Verde hoja', 'XXL', 0, 3),
                                                                                                                (189, 'Tapado Channel', 'Habano', 'S', 0, 5),
                                                                                                                (190, 'Tapado Channel', 'Habano', 'M', 2, 5),
                                                                                                                (191, 'Tapado Channel', 'Habano', 'L', 1, 5),
                                                                                                                (192, 'Tapado Channel', 'Habano', 'XL', 0, 5),
                                                                                                                (193, 'Tapado Channel', 'Habano', 'XXL', 3, 5),
                                                                                                                (194, 'Tapado Channel', 'Militar', 'S', 0, 5),
                                                                                                                (195, 'Tapado Channel', 'Militar', 'M', 0, 5),
                                                                                                                (196, 'Tapado Channel', 'Militar', 'L', 0, 5),
                                                                                                                (197, 'Tapado Channel', 'Militar', 'XL', 0, 5),
                                                                                                                (198, 'Tapado Channel', 'Militar', 'XXL', 1, 5),
                                                                                                                (199, 'Tapado Channel', 'Natural', 'S', 0, 4),
                                                                                                                (200, 'Tapado Channel', 'Natural', 'M', 0, 4),
                                                                                                                (201, 'Tapado Channel', 'Natural', 'L', 0, 4),
                                                                                                                (202, 'Tapado Channel', 'Natural', 'XL', 0, 4),
                                                                                                                (203, 'Tapado Channel', 'Natural', 'XXL', 1, 4),
                                                                                                                (204, 'Tapado Channel', 'Negro', 'S', 2, 4),
                                                                                                                (205, 'Tapado Channel', 'Negro', 'L', 1, 4),
                                                                                                                (206, 'Vestido Gretta', 'Francia', 'S', 1, 3),
                                                                                                                (207, 'Vestido Gretta', 'Francia', 'M', 0, 3),
                                                                                                                (208, 'Vestido Gretta', 'Francia', 'L', 1, 3),
                                                                                                                (209, 'Vestido Gretta', 'Francia', 'XL', 0, 3),
                                                                                                                (210, 'Vestido Gretta', 'Francia', 'XXL', 2, 3),
                                                                                                                (211, 'Chaleco Ethna', 'Gris claro', 'M', 0, 4),
                                                                                                                (213, 'Chaleco Ethna', 'Gris claro', 'L', 2, 4),
                                                                                                                (214, 'Chaleco Ethna', 'Gris claro', 'XL', 1, 4),
                                                                                                                (215, 'Chaleco Ethna', 'Gris claro', 'XXL', 2, 4),
                                                                                                                (216, 'Chaleco Ethna', 'Habano', 'M', 0, 4),
                                                                                                                (218, 'Chaleco Ethna', 'Habano', 'XL', 0, 4),
                                                                                                                (219, 'Chaleco Ethna', 'Habano', 'XXL', 0, 4),
                                                                                                                (220, 'Chaleco Ethna', 'Habano', 'L', 0, 4),
                                                                                                                (221, 'Tapado Anezka', 'Camel', 'M', 0, 3),
                                                                                                                (222, 'Tapado Anezka', 'Camel', 'XL', 0, 3),
                                                                                                                (223, 'Tapado Anezka', 'Camel', 'XXL', 0, 3),
                                                                                                                (224, 'Tapado Anezka', 'Gris oscuro', 'M', 1, 3),
                                                                                                                (225, 'Tapado Anezka', 'Gris oscuro', 'XL', 0, 3),
                                                                                                                (226, 'Tapado Anezka', 'Gris oscuro', 'XXL', 0, 3),
                                                                                                                (227, 'Tapado Anezka', 'Negro', 'XXL', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha`
--

CREATE TABLE `registros` (
                         `id` smallint(6) NOT NULL,
                         `nombre_vestido` varchar(100) DEFAULT NULL,
                         `color_vestido` varchar(40) DEFAULT NULL,
                         `talle_vestido` varchar(10) DEFAULT NULL,
                         `tipo` varchar(20) DEFAULT NULL,
                         `cantidad` int(11) DEFAULT NULL,
                         `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fecha`
--

INSERT INTO `registros` (`id`, `nombre_vestido`, `color_vestido`, `talle_vestido`, `tipo`, `cantidad`, `fecha`) VALUES
                                                                                                                (1, 'Vestido Gretta', 'Negro', 'L', 'Salida', 1, '2023-06-12'),
                                                                                                                (2, 'Chaleco Ethna', 'Negro', 'XL', 'Salida', 1, '2023-06-12'),
                                                                                                                (3, 'Vestido Gretta', 'Gris claro', 'XXL', 'Salida', 1, '2023-06-12'),
                                                                                                                (4, 'Vestido Starples', 'Marron', 'XXL', 'Salida', 1, '2023-06-12'),
                                                                                                                (5, 'Chaleco Ethna', 'Negro', 'L', 'Salida', 1, '2023-06-12'),
                                                                                                                (6, 'Tapado Anezka', 'Negro', 'XL', 'Salida', 1, '2023-06-12'),
                                                                                                                (7, 'Vestido Remeron Fiorella', 'Gris claro', 'M', 'Salida', 1, '2023-06-12'),
                                                                                                                (8, 'Vestido Bianka', 'Negro', 'XL', 'Salida', 1, '2023-06-12'),
                                                                                                                (9, 'Sueter Ibiza', 'Gris claro', 'S', 'Salida', 1, '2023-06-12'),
                                                                                                                (10, 'Vestido Remeron Fiorella', 'Gris claro', 'S', 'Salida', 1, '2023-06-12'),
                                                                                                                (11, 'Vestido corto Dhara', 'Gris oscuro', 'XXL', 'Salida', 1, '2023-06-12'),
                                                                                                                (12, 'Vestido Bianka', 'Negro', 'L', 'Salida', 1, '2023-06-12'),
                                                                                                                (13, 'Vestido Starples', 'Negro', 'XXL', 'Salida', 1, '2023-06-12'),
                                                                                                                (15, 'Tapado Roma', 'Negro', 'U', 'Salida', 1, '2023-06-12'),
                                                                                                                (16, 'Tapado Channel', 'Beige', 'S', 'Salida', 1, '2023-06-12'),
                                                                                                                (17, 'Tapado Channel', 'Beige', 'M', 'Salida', 1, '2023-06-12'),
                                                                                                                (19, 'Chaleco Ethna', 'Natural', 'S', 'Salida', 1, '2023-06-14'),
                                                                                                                (20, 'Chaleco Ethna', 'Negro', 'M', 'Salida', 1, '2023-06-14'),
                                                                                                                (21, 'Tapado Anezka', 'Gris oscuro', 'XXL', 'Salida', 1, '2023-06-14'),
                                                                                                                (22, 'Chaleco Ethna', 'Negro', 'M', 'Salida', 1, '2023-06-14'),
                                                                                                                (23, 'Chaleco Ethna', 'Negro', 'M', 'Salida', 1, '2023-06-14'),
                                                                                                                (24, 'Tapado Anezka', 'Negro', 'XL', 'Salida', 1, '2023-06-14'),
                                                                                                                (25, 'Tapado Roma', 'Gris claro', 'U', 'Salida', 1, '2023-06-14'),
                                                                                                                (26, 'Vestido Remeron Fiorella', 'Gris claro', 'M', 'Salida', 2, '2023-06-14'),
                                                                                                                (27, 'Tapado Anezka', 'Negro', 'XL', 'Salida', 1, '2023-06-14'),
                                                                                                                (29, 'Vestido corto Dhara', 'Negro', 'M', 'Salida', 1, '2023-06-14'),
                                                                                                                (30, 'Vestido Starples', 'Rojo', 'XL', 'Salida', 1, '2023-06-14'),
                                                                                                                (36, 'Vestido Starples', 'Negro', 'XXL', 'Salida', 1, '2023-06-15'),
                                                                                                                (38, 'Vestido Indira', 'Militar', 'XXL', 'Salida', 1, '2023-06-15'),
                                                                                                                (39, 'Vestido Starples', 'Rojo', 'XL', 'Salida', 1, '2023-06-15'),
                                                                                                                (41, 'Vestido Indira', 'Negro', 'XL', 'Salida', 1, '2023-06-15'),
                                                                                                                (42, 'Sueter Lisboa', 'Marron', 'XL', 'Salida', 1, '2023-06-15'),
                                                                                                                (43, 'Sueter Ponchiito Nabi', 'Marron', 'U', 'Salida', 1, '2023-06-15'),
                                                                                                                (44, 'Tapado Anezka', 'Camel', 'XL', 'Salida', 1, '2023-06-15'),
                                                                                                                (48, 'Tapado Anezka', 'Negro', 'M', 'Salida', 1, '2023-06-16'),
                                                                                                                (49, 'Vestido Bianka', 'Marron', 'XL', 'Salida', 1, '2023-06-16'),
                                                                                                                (56, 'Vestido Starples', 'Negro', 'XL', 'Salida', 1, '2023-06-21'),
                                                                                                                (57, 'Vestido Starples', 'Verde claro', 'XL', 'Salida', 1, '2023-06-21'),
                                                                                                                (58, 'Vestido Starples', 'Rojo', 'XL', 'Salida', 1, '2023-06-21'),
                                                                                                                (59, 'Vestido Bianka', 'Negro', 'XL', 'Salida', 1, '2023-06-21'),
                                                                                                                (60, 'Vestido Gretta', 'Negro', 'M', 'Salida', 1, '2023-06-21'),
                                                                                                                (61, 'Tapado Roma', 'Natural', 'U', 'Salida', 1, '2023-06-21'),
                                                                                                                (62, 'Chaleco Ethna', 'Natural', 'S', 'Salida', 1, '2023-06-21'),
                                                                                                                (63, 'Vestido Gretta', 'Negro', 'S', 'Salida', 1, '2023-06-21'),
                                                                                                                (64, 'Tapado Anezka', 'Negro', 'M', 'Salida', 1, '2023-06-21'),
                                                                                                                (66, 'Chaleco Ethna', 'Natural', 'S', 'Salida', 1, '2023-06-21'),
                                                                                                                (67, 'Vestido Gretta', 'Negro', 'L', 'Salida', 1, '2023-06-21'),
                                                                                                                (68, 'Tapado Anezka', 'Gris oscuro', 'XL', 'Salida', 1, '2023-06-21'),
                                                                                                                (69, 'Vestido Starples', 'Negro', 'XXL', 'Salida', 1, '2023-06-21'),
                                                                                                                (70, 'Vestido Gretta', 'Negro', 'L', 'Salida', 1, '2023-06-21'),
                                                                                                                (71, 'Vestido Indira', 'Negro', 'XXL', 'Salida', 1, '2023-06-22'),
                                                                                                                (73, 'Vestido corto Dhara', 'Gris oscuro', 'M', 'Salida', 1, '2023-06-22'),
                                                                                                                (74, 'Vestido Gretta', 'Negro', 'L', 'Salida', 1, '2023-06-22'),
                                                                                                                (75, 'Tapado Anezka', 'Marron', 'XXL', 'Salida', 1, '2023-06-22'),
                                                                                                                (76, 'Tapado Roma', 'Negro', 'U', 'Salida', 1, '2023-06-23'),
                                                                                                                (77, 'Tapado Roma', 'Gris claro', 'U', 'Salida', 1, '2023-06-23'),
                                                                                                                (78, 'Poncho en Picos Yamilet', 'Negro', 'XXL', 'Salida', 1, '2023-06-23'),
                                                                                                                (81, 'Sueter Ibiza', 'Negro', 'XXL', 'Salida', 1, '2023-06-23'),
                                                                                                                (82, 'Tapado Anezka', 'Gris claro', 'XL', 'Salida', 1, '2023-06-26'),
                                                                                                                (83, 'Tapado Anezka', 'Negro', 'M', 'Salida', 1, '2023-06-26'),
                                                                                                                (84, 'Tapado Anezka', 'Negro', 'M', 'Salida', 1, '2023-06-26'),
                                                                                                                (85, 'Tapado Anezka', 'Marron', 'M', 'Salida', 1, '2023-06-26'),
                                                                                                                (86, 'Vestido Gretta', 'Gris claro', 'XXL', 'Salida', 1, '2023-06-26'),
                                                                                                                (88, 'Vestido Gretta', 'Negro', 'XL', 'Salida', 1, '2023-06-26'),
                                                                                                                (89, 'Vestido Indira', 'Negro', 'L', 'Salida', 1, '2023-06-26'),
                                                                                                                (90, 'Chaleco Ethna', 'Natural', 'M', 'Salida', 1, '2023-06-26'),
                                                                                                                (91, 'Tapado Roma', 'Natural', 'U', 'Salida', 1, '2023-06-26'),
                                                                                                                (92, 'Vestido Bianka', 'Marron', 'XL', 'Salida', 1, '2023-06-26'),
                                                                                                                (93, 'Chaleco Ethna', 'Negro', 'S', 'Salida', 1, '2023-06-26'),
                                                                                                                (94, 'Tapado Roma', 'Natural', 'U', 'Salida', 1, '2023-06-26'),
                                                                                                                (95, 'Vestido Remeron Fiorella', 'Gris claro', 'S', 'Salida', 1, '2023-06-26'),
                                                                                                                (96, 'Vestido Starples', 'Camel', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (97, 'Vestido Starples', 'Camel', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (98, 'Vestido Starples', 'Camel', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (99, 'Vestido Starples', 'Camel', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (100, 'Vestido Starples', 'Marron', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (101, 'Vestido Starples', 'Marron', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (102, 'Vestido Starples', 'Marron', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (103, 'Vestido Starples', 'Marron', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (104, 'Vestido Starples', 'Negro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (105, 'Vestido Starples', 'Negro', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (106, 'Vestido Starples', 'Negro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (107, 'Vestido Starples', 'Negro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (108, 'Vestido Starples', 'Rojo', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (109, 'Vestido Starples', 'Rojo', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (110, 'Vestido Starples', 'Rojo', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (111, 'Vestido Starples', 'Rojo', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (112, 'Vestido Starples', 'Verde hoja', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (113, 'Vestido Starples', 'Verde hoja', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (114, 'Vestido Starples', 'Verde hoja', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (115, 'Vestido Starples', 'Verde hoja', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (116, 'Vestido Remeron Fiorella', 'Gris claro', 'S', 'Entrada', 3, '2023-06-28'),
                                                                                                                (117, 'Vestido Remeron Fiorella', 'Gris claro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (118, 'Vestido Remeron Fiorella', 'Gris claro', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (119, 'Vestido Remeron Fiorella', 'Gris claro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (120, 'Vestido Remeron Fiorella', 'Gris claro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (121, 'Vestido Remeron Fiorella', 'Negro', 'S', 'Entrada', 3, '2023-06-28'),
                                                                                                                (122, 'Vestido Remeron Fiorella', 'Negro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (123, 'Vestido Remeron Fiorella', 'Negro', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (125, 'Vestido Remeron Fiorella', 'Negro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (126, 'Vestido Remeron Fiorella', 'Negro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (127, 'Tapado Channel', 'Beige', 'S', 'Entrada', 4, '2023-06-28'),
                                                                                                                (128, 'Tapado Channel', 'Beige', 'M', 'Entrada', 1, '2023-06-28'),
                                                                                                                (129, 'Tapado Channel', 'Beige', 'L', 'Entrada', 1, '2023-06-28'),
                                                                                                                (130, 'Tapado Channel', 'Beige', 'XL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (131, 'Tapado Channel', 'Beige', 'XXL', 'Entrada', 2, '2023-06-28'),
                                                                                                                (132, 'Tapado Channel', 'Habano', 'S', 'Entrada', 5, '2023-06-28'),
                                                                                                                (133, 'Tapado Channel', 'Habano', 'M', 'Entrada', 5, '2023-06-28'),
                                                                                                                (134, 'Tapado Channel', 'Habano', 'L', 'Entrada', 5, '2023-06-28'),
                                                                                                                (135, 'Tapado Channel', 'Habano', 'XL', 'Entrada', 5, '2023-06-28'),
                                                                                                                (136, 'Tapado Channel', 'Habano', 'XXL', 'Entrada', 5, '2023-06-28'),
                                                                                                                (137, 'Tapado Channel', 'Militar', 'S', 'Entrada', 5, '2023-06-28'),
                                                                                                                (138, 'Tapado Channel', 'Militar', 'M', 'Entrada', 5, '2023-06-28'),
                                                                                                                (140, 'Tapado Channel', 'Militar', 'XL', 'Entrada', 5, '2023-06-28'),
                                                                                                                (141, 'Tapado Channel', 'Militar', 'XXL', 'Entrada', 5, '2023-06-28'),
                                                                                                                (142, 'Tapado Channel', 'Militar', 'L', 'Entrada', 5, '2023-06-28'),
                                                                                                                (143, 'Tapado Channel', 'Natural', 'S', 'Entrada', 4, '2023-06-28'),
                                                                                                                (144, 'Tapado Channel', 'Natural', 'M', 'Entrada', 4, '2023-06-28'),
                                                                                                                (145, 'Tapado Channel', 'Natural', 'L', 'Entrada', 4, '2023-06-28'),
                                                                                                                (146, 'Tapado Channel', 'Natural', 'XL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (147, 'Tapado Channel', 'Natural', 'XXL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (148, 'Tapado Channel', 'Negro', 'S', 'Entrada', 4, '2023-06-28'),
                                                                                                                (149, 'Tapado Channel', 'Negro', 'L', 'Entrada', 4, '2023-06-28'),
                                                                                                                (150, 'Vestido Gretta', 'Francia', 'S', 'Entrada', 3, '2023-06-28'),
                                                                                                                (151, 'Vestido Gretta', 'Francia', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (152, 'Vestido Gretta', 'Francia', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (153, 'Vestido Gretta', 'Francia', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (154, 'Vestido Gretta', 'Francia', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (155, 'Vestido Gretta', 'Gris claro', 'S', 'Entrada', 3, '2023-06-28'),
                                                                                                                (156, 'Vestido Gretta', 'Gris claro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (157, 'Vestido Gretta', 'Gris claro', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (158, 'Vestido Gretta', 'Gris claro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (159, 'Vestido Gretta', 'Gris claro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (160, 'Vestido Gretta', 'Negro', 'S', 'Entrada', 3, '2023-06-28'),
                                                                                                                (161, 'Vestido Gretta', 'Negro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (162, 'Vestido Gretta', 'Negro', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (163, 'Vestido Gretta', 'Negro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (164, 'Vestido Gretta', 'Negro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (165, 'Chaleco Ethna', 'Gris claro', 'M', 'Entrada', 4, '2023-06-28'),
                                                                                                                (166, 'Chaleco Ethna', 'Gris claro', 'L', 'Entrada', 4, '2023-06-28'),
                                                                                                                (167, 'Chaleco Ethna', 'Gris claro', 'XL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (168, 'Chaleco Ethna', 'Gris claro', 'XXL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (169, 'Chaleco Ethna', 'Habano', 'M', 'Entrada', 4, '2023-06-28'),
                                                                                                                (170, 'Chaleco Ethna', 'Habano', 'L', 'Entrada', 4, '2023-06-28'),
                                                                                                                (171, 'Chaleco Ethna', 'Habano', 'XL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (172, 'Chaleco Ethna', 'Habano', 'XXL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (173, 'Chaleco Ethna', 'Natural', 'M', 'Entrada', 4, '2023-06-28'),
                                                                                                                (174, 'Chaleco Ethna', 'Natural', 'L', 'Entrada', 4, '2023-06-28'),
                                                                                                                (175, 'Chaleco Ethna', 'Natural', 'XL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (176, 'Chaleco Ethna', 'Natural', 'XXL', 'Entrada', 4, '2023-06-28'),
                                                                                                                (177, 'Chaleco Ethna', 'Negro', 'L', 'Entrada', 4, '2023-06-28'),
                                                                                                                (178, 'Tapado Anezka', 'Camel', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (179, 'Tapado Anezka', 'Camel', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (180, 'Tapado Anezka', 'Camel', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (181, 'Tapado Anezka', 'Gris claro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (182, 'Tapado Anezka', 'Gris claro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (183, 'Tapado Anezka', 'Gris oscuro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (184, 'Tapado Anezka', 'Gris oscuro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (185, 'Tapado Anezka', 'Gris oscuro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (186, 'Tapado Anezka', 'Negro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (187, 'Tapado Anezka', 'Negro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (188, 'Tapado Anezka', 'Negro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (189, 'Vestido Bianka', 'Marron', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (190, 'Vestido Bianka', 'Marron', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (191, 'Vestido Bianka', 'Marron', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (192, 'Vestido Bianka', 'Marron', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (193, 'Vestido Bianka', 'Militar', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (194, 'Vestido Bianka', 'Militar', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (195, 'Vestido Bianka', 'Militar', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (197, 'Vestido Bianka', 'Militar', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (198, 'Vestido Bianka', 'Natural', 'L', 'Entrada', 3, '2023-06-28'),
                                                                                                                (199, 'Vestido Bianka', 'Natural', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (200, 'Vestido Bianka', 'Negro', 'M', 'Entrada', 3, '2023-06-28'),
                                                                                                                (201, 'Vestido Bianka', 'Negro', 'XL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (202, 'Vestido Bianka', 'Negro', 'XXL', 'Entrada', 3, '2023-06-28'),
                                                                                                                (203, 'Vestido Starples', 'Negro', 'XXL', 'Salida', 1, '2023-06-26'),
                                                                                                                (204, 'Vestido Starples', 'Negro', 'XL', 'Salida', 1, '2023-06-27'),
                                                                                                                (205, 'Tapado Roma', 'Camel', 'U', 'Salida', 1, '2023-06-27'),
                                                                                                                (206, 'Vestido Starples', 'Marron', 'M', 'Salida', 1, '2023-06-27'),
                                                                                                                (207, 'Tapado Channel', 'Beige', 'XL', 'Salida', 1, '2023-06-28'),
                                                                                                                (208, 'Vestido Remeron Fiorella', 'Gris claro', 'S', 'Salida', 1, '2023-06-28'),
                                                                                                                (209, 'Buzo Manta Teddy', 'Negro', 'U', 'Salida', 1, '2023-06-29'),
                                                                                                                (210, 'Buzo Manta Teddy', 'Gris claro', 'U', 'Salida', 1, '2023-06-29'),
                                                                                                                (211, 'Vestido corto Dhara', 'Negro', 'XL', 'Salida', 1, '2023-06-29'),
                                                                                                                (212, 'Tapado Roma', 'Habano', 'U', 'Salida', 1, '2023-06-29'),
                                                                                                                (213, 'Vestido Remeron Fiorella', 'Negro', 'L', 'Salida', 1, '2023-06-29'),
                                                                                                                (214, 'Buzo Manta Teddy', 'Beige', 'U', 'Salida', 1, '2023-06-29'),
                                                                                                                (215, 'Tapado Roma', 'Gris claro', 'U', 'Salida', 1, '2023-06-29'),
                                                                                                                (217, 'Vestido Remeron Fiorella', 'Negro', 'XL', 'Salida', 1, '2023-06-29'),
                                                                                                                (218, 'Tapado Anezka', 'Negro', 'M', 'Salida', 1, '2023-06-30'),
                                                                                                                (219, 'Tapado Roma', 'Natural', 'U', 'Salida', 1, '2023-06-30'),
                                                                                                                (220, 'Tapado Channel', 'Negro', 'S', 'Salida', 1, '2023-06-30'),
                                                                                                                (221, 'Vestido Starples', 'Negro', 'XL', 'Salida', 1, '2023-06-30'),
                                                                                                                (222, 'Tapado Roma', 'Negro', 'U', 'Salida', 1, '2023-06-30'),
                                                                                                                (223, 'Tapado Roma', 'Gris claro', 'U', 'Salida', 1, '2023-06-30'),
                                                                                                                (224, 'Vestido Starples', 'Verde claro', 'XXL', 'Salida', 1, '2023-06-30'),
                                                                                                                (225, 'Buzo Manta Teddy', 'Negro', 'U', 'Salida', 1, '2023-06-30'),
                                                                                                                (226, 'Tapado Anezka', 'Gris claro', 'M', 'Salida', 1, '2023-07-03'),
                                                                                                                (227, 'Vestido Starples', 'Rojo', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (228, 'Tapado Roma', 'Natural', 'U', 'Salida', 1, '2023-07-03'),
                                                                                                                (229, 'Sueter Ponchiito Nabi', 'Gris claro', 'U', 'Salida', 1, '2023-07-03'),
                                                                                                                (230, 'Tapado Anezka', 'Gris claro', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (231, 'Sueter Ibiza', 'Rosa', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (232, 'Sueter Aitana', 'Negro', 'M', 'Salida', 1, '2023-07-03'),
                                                                                                                (233, 'Vestido Starples', 'Marron', 'M', 'Salida', 1, '2023-07-03'),
                                                                                                                (234, 'Vestido Gretta', 'Negro', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (235, 'Vestido Remeron Fiorella', 'Negro', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (236, 'Tapado Channel', 'Beige', 'M', 'Salida', 1, '2023-07-03'),
                                                                                                                (237, 'Vestido Starples', 'Rojo', 'L', 'Salida', 1, '2023-07-03'),
                                                                                                                (238, 'Tapado Julieth', 'Negro', 'U', 'Salida', 1, '2023-07-03'),
                                                                                                                (239, 'Vestido Bianka', 'Marron', 'XL', 'Salida', 1, '2023-07-03'),
                                                                                                                (240, 'Buzo Manta Teddy', 'Negro', 'U', 'Salida', 1, '2023-07-03'),
                                                                                                                (241, 'Chaleco Ethna', 'Negro', 'L', 'Salida', 1, '2023-07-03'),
                                                                                                                (242, 'Chaleco Ethna', 'Gris claro', 'L', 'Salida', 1, '2023-07-03'),
                                                                                                                (243, 'Tapado Channel', 'Natural', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (244, 'Vestido Starples', 'Rojo', 'L', 'Salida', 1, '2023-07-03'),
                                                                                                                (245, 'Tapado Channel', 'Verde claro', 'S', 'Salida', 1, '2023-07-03'),
                                                                                                                (246, 'Tapado Roma', 'Camel', 'U', 'Salida', 1, '2023-07-03'),
                                                                                                                (247, 'Vestido Bianka', 'Negro', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (248, 'Tapado Roma', 'Habano', 'U', 'Salida', 1, '2023-07-03'),
                                                                                                                (249, 'Tapado Anezka', 'Gris claro', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (250, 'Vestido Gretta', 'Negro', 'XL', 'Salida', 1, '2023-07-03'),
                                                                                                                (251, 'Tapado Channel', 'Habano', 'L', 'Salida', 1, '2023-07-03'),
                                                                                                                (252, 'Tapado Channel', 'Habano', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (253, 'Vestido Gretta', 'Negro', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (256, 'Tapado Roma', 'Habano', 'U', 'Salida', 1, '2023-07-03'),
                                                                                                                (257, 'Vestido Starples', 'Rojo', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (258, 'Vestido Starples', 'Camel', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (259, 'Tapado Channel', 'Beige', 'XXL', 'Salida', 1, '2023-07-03'),
                                                                                                                (260, 'Sueter Lisboa', 'Marron', 'L', 'Salida', 1, '2023-07-04'),
                                                                                                                (261, 'Sueter Lisboa', 'Rojo', 'L', 'Salida', 1, '2023-07-04'),
                                                                                                                (262, 'Tapado Channel', 'Habano', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (263, 'Tapado Channel', 'Beige', 'XL', 'Salida', 1, '2023-07-04'),
                                                                                                                (264, 'Chaleco Ethna', 'Gris claro', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (265, 'Vestido Remeron Fiorella', 'Gris claro', 'M', 'Salida', 1, '2023-07-04'),
                                                                                                                (266, 'Tapado Channel', 'Verde claro', 'XL', 'Salida', 1, '2023-07-04'),
                                                                                                                (267, 'Tapado Channel', 'Habano', 'M', 'Salida', 1, '2023-07-04'),
                                                                                                                (268, 'Chaleco Ethna', 'Habano', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (269, 'Vestido Remeron Fiorella', 'Negro', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (270, 'Vestido Gretta', 'Francia', 'S', 'Salida', 1, '2023-07-04'),
                                                                                                                (271, 'Vestido Starples', 'Marron', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (272, 'Vestido Starples', 'Negro', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (273, 'Sueter Lisboa', 'Rojo', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (274, 'Sueter Amelia', 'Negro', 'XXL', 'Salida', 1, '2023-07-04'),
                                                                                                                (275, 'Vestido Bianka', 'Negro', 'XL', 'Salida', 1, '2023-07-04'),
                                                                                                                (276, 'Vestido Bianka', 'Negro', 'XL', 'Salida', 1, '2023-07-05'),
                                                                                                                (277, 'Vestido Bianka', 'Negro', 'XXL', 'Salida', 1, '2023-07-05'),
                                                                                                                (278, 'Sueter Lisboa', 'Negro', 'XXL', 'Salida', 1, '2023-07-05'),
                                                                                                                (279, 'Chaleco Ethna', 'Gris claro', 'L', 'Salida', 1, '2023-07-05'),
                                                                                                                (280, 'Buzo Manta Teddy', 'Gris oscuro', 'U', 'Salida', 1, '2023-07-05'),
                                                                                                                (281, 'Vestido Gretta', 'Negro', 'L', 'Salida', 1, '2023-07-05'),
                                                                                                                (282, 'Vestido Remeron Fiorella', 'Negro', 'L', 'Salida', 2, '2023-07-05'),
                                                                                                                (283, 'Vestido Starples', 'Negro', 'XXL', 'Salida', 1, '2023-07-06'),
                                                                                                                (284, 'Vestido Gretta', 'Francia', 'L', 'Salida', 1, '2023-07-06'),
                                                                                                                (285, 'Vestido Remeron Fiorella', 'Negro', 'XXL', 'Salida', 1, '2023-07-06'),
                                                                                                                (286, 'Tapado Channel', 'Militar', 'XXL', 'Salida', 1, '2023-07-06'),
                                                                                                                (288, 'Vestido Gretta', 'Francia', 'XXL', 'Salida', 1, '2023-07-06'),
                                                                                                                (289, 'Vestido Gretta', 'Negro', 'XL', 'Salida', 1, '2023-07-06'),
                                                                                                                (290, 'Sueter Lisboa', 'Negro', 'XXL', 'Salida', 1, '2023-07-06'),
                                                                                                                (291, 'Vestido Indira', 'Verde hoja', 'XL', 'Salida', 1, '2023-07-06'),
                                                                                                                (292, 'Vestido Starples', 'Negro', 'XL', 'Salida', 1, '2023-07-06'),
                                                                                                                (293, 'Tapado Roma', 'Habano', 'U', 'Salida', 1, '2023-07-06'),
                                                                                                                (294, 'Tapado Channel', 'Verde claro', 'XXL', 'Salida', 1, '2023-07-07'),
                                                                                                                (295, 'Tapado Channel', 'Negro', 'S', 'Salida', 1, '2023-07-07'),
                                                                                                                (296, 'Vestido corto Dhara', 'Negro', 'M', 'Salida', 1, '2023-07-07'),
                                                                                                                (297, 'Vestido Bianka', 'Negro', 'M', 'Salida', 1, '2023-07-07'),
                                                                                                                (298, 'Vestido Bianka', 'Natural', 'XXL', 'Salida', 1, '2023-07-07'),
                                                                                                                (299, 'Vestido Gretta', 'Negro', 'S', 'Salida', 1, '2023-07-07'),
                                                                                                                (300, 'Tapado Channel', 'Verde claro', 'XXL', 'Salida', 1, '2023-07-10'),
                                                                                                                (301, 'Vestido Indira', 'Negro', 'M', 'Salida', 1, '2023-07-10'),
                                                                                                                (302, 'Vestido Gretta', 'Negro', 'M', 'Salida', 1, '2023-07-10'),
                                                                                                                (303, 'Tapado Anezka', 'Negro', 'M', 'Salida', 1, '2023-07-10'),
                                                                                                                (304, 'Tapado Anezka', 'Marron', 'XXL', 'Salida', 1, '2023-07-10'),
                                                                                                                (305, 'Tapado Channel', 'Habano', 'XXL', 'Salida', 1, '2023-07-10'),
                                                                                                                (306, 'Tapado Anezka', 'Gris claro', 'XXL', 'Salida', 1, '2023-07-10'),
                                                                                                                (307, 'Vestido Remeron Fiorella', 'Gris claro', 'XXL', 'Salida', 1, '2023-07-10'),
                                                                                                                (308, 'Tapado Anezka', 'Negro', 'XL', 'Salida', 1, '2023-07-10'),
                                                                                                                (309, 'Vestido Gretta', 'Negro', 'M', 'Salida', 1, '2023-07-10'),
                                                                                                                (310, 'Buzo Manta Teddy', 'Beige', 'U', 'Salida', 1, '2023-07-10'),
                                                                                                                (311, 'Vestido Bianka', 'Natural', 'L', 'Salida', 1, '2023-07-10'),
                                                                                                                (313, 'Tapado Anezka', 'Gris claro', 'XL', 'Salida', 1, '2023-07-10'),
                                                                                                                (314, 'Tapado Julieth', 'Negro', 'U', 'Salida', 1, '2023-07-10'),
                                                                                                                (315, 'Tapado Roma', 'Habano', 'U', 'Salida', 1, '2023-07-10'),
                                                                                                                (316, 'Vestido Gretta', 'Negro', 'S', 'Salida', 1, '2023-07-10'),
                                                                                                                (317, 'Vestido Starples', 'Rojo', 'L', 'Salida', 1, '2023-07-10'),
                                                                                                                (318, 'Tapado Roma', 'Camel', 'U', 'Salida', 1, '2023-07-10'),
                                                                                                                (319, 'Chaleco Ethna', 'Gris claro', 'XXL', 'Salida', 1, '2023-07-10'),
                                                                                                                (320, 'Tapado Channel', 'Beige', 'S', 'Salida', 1, '2023-07-10'),
                                                                                                                (321, 'Chaleco Ethna', 'Natural', 'M', 'Salida', 1, '2023-07-10'),
                                                                                                                (322, 'Vestido Indira', 'Verde claro', 'XL', 'Salida', 1, '2023-07-10'),
                                                                                                                (323, 'Tapado Channel', 'Negro', 'L', 'Salida', 1, '2023-07-10'),
                                                                                                                (324, 'Vestido Gretta', 'Francia', 'XXL', 'Salida', 1, '2023-07-12'),
                                                                                                                (325, 'Vestido Bianka', 'Negro', 'M', 'Salida', 1, '2023-07-12'),
                                                                                                                (326, 'Tapado Anezka', 'Negro', 'M', 'Salida', 1, '2023-07-12'),
                                                                                                                (327, 'Tapado Anezka', 'Gris oscuro', 'M', 'Salida', 1, '2023-07-12'),
                                                                                                                (328, 'Tapado Channel', 'Habano', 'M', 'Salida', 1, '2023-07-12'),
                                                                                                                (329, 'Vestido Gretta', 'Negro', 'XXL', 'Salida', 1, '2023-07-12'),
                                                                                                                (330, 'Tapado Channel', 'Verde claro', 'L', 'Salida', 1, '2023-07-12'),
                                                                                                                (331, 'Chaleco Ethna', 'Gris claro', 'XL', 'Salida', 1, '2023-07-12'),
                                                                                                                (332, 'Vestido Gretta', 'Gris claro', 'S', 'Salida', 1, '2023-07-12'),
                                                                                                                (333, 'Vestido Gretta', 'Negro', 'M', 'Salida', 1, '2023-07-12'),
                                                                                                                (334, 'Vestido Starples', 'Negro', 'XL', 'Salida', 1, '2023-07-12'),
                                                                                                                (335, 'Vestido Starples', 'Verde claro', 'XXL', 'Salida', 1, '2023-07-12'),
                                                                                                                (336, 'Vestido Gretta', 'Negro', 'XL', 'Salida', 1, '2023-07-12'),
                                                                                                                (337, 'Vestido Indira', 'Negro', 'XXL', 'Salida', 1, '2023-07-12'),
                                                                                                                (338, 'Vestido Starples', 'Rojo', 'XL', 'Salida', 1, '2023-07-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialpagos`
--

CREATE TABLE `historialpagos` (
                                  `id` smallint(6) NOT NULL,
                                  `cantidadSalidas` int(11) NOT NULL,
                                  `saldoPagado` float NOT NULL,
                                  `fechaPagada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historialpagos`
--

INSERT INTO `historialpagos` (`id`, `cantidadSalidas`, `saldoPagado`, `fechaPagada`) VALUES
                                                                                         (1, 109, 367015, '2023-06-15'),
                                                                                         (2, 36, 125550, '2023-06-24'),
                                                                                         (3, 101, 357925, '2023-07-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vestido`
--

CREATE TABLE `vestido` (
                           `id` smallint(6) DEFAULT NULL,
                           `nombre` varchar(100) NOT NULL,
                           `entrada` int(11) DEFAULT NULL,
                           `salida` int(11) DEFAULT NULL,
                           `saldoTotalMercaderia` int(11) DEFAULT NULL,
                           `precio` float DEFAULT NULL,
                           `saldoTotal` float DEFAULT NULL,
                           `estado` varchar(30) DEFAULT NULL,
                           `fechaPago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vestido`
--

INSERT INTO `vestido` (`id`, `nombre`, `entrada`, `salida`, `saldoTotalMercaderia`, `precio`, `saldoTotal`, `estado`, `fechaPago`) VALUES
                                                                                                                                       (13, 'Buzo Manta Teddy', 8, 1, 7, 4080, 4080, 'No pagado', '2023-07-09'),
                                                                                                                                       (7, 'Chaleco Ethna', 50, 3, 47, 2640, 7920, 'No pagado', '2023-07-09'),
                                                                                                                                       (6, 'Poncho en Picos Yamilet', 17, 0, 17, 3910, 0, 'No pagado', '2023-07-09'),
                                                                                                                                       (9, 'Sueter Aitana', 23, 0, 23, 2520, 0, 'No pagado', '2023-07-09'),
                                                                                                                                       (12, 'Sueter Amelia', 43, 0, 43, 2300, 0, 'No pagado', '2023-07-09'),
                                                                                                                                       (10, 'Sueter Ibiza', 54, 0, 54, 2930, 0, 'No pagado', '2023-07-09'),
                                                                                                                                       (8, 'Sueter Lisboa', 81, 0, 81, 3510, 0, 'No pagado', '2023-07-09'),
                                                                                                                                       (15, 'Sueter Ponchiito Nabi', 8, 0, 8, 4230, 0, 'No pagado', '2023-07-09'),
                                                                                                                                       (11, 'Tapado Anezka', 46, 7, 39, 4080, 28560, 'No pagado', '2023-07-09'),
                                                                                                                                       (4, 'Tapado Channel', 75, 4, 71, 4180, 16720, 'No pagado', '2023-07-09'),
                                                                                                                                       (17, 'Tapado Julieth', 14, 1, 13, 4030, 4030, 'No pagado', '2023-07-09'),
                                                                                                                                       (18, 'Tapado Roma', 7, 2, 5, 3610, 7220, 'No pagado', '2023-07-09'),
                                                                                                                                       (16, 'Vestido Bianka', 71, 2, 69, 4460, 8920, 'No pagado', '2023-07-09'),
                                                                                                                                       (1, 'Vestido corto Dhara', 21, 0, 21, 2685, 0, 'No pagado', '2023-07-09'),
                                                                                                                                       (5, 'Vestido Gretta', 54, 8, 46, 2790, 22320, 'No pagado', '2023-07-09'),
                                                                                                                                       (14, 'Vestido Indira', 21, 3, 18, 3240, 9720, 'No pagado', '2023-07-09'),
                                                                                                                                       (3, 'Vestido Remeron Fiorella', 21, 1, 20, 3360, 3360, 'No pagado', '2023-07-09'),
                                                                                                                                       (2, 'Vestido Starples', 75, 3, 72, 3250, 9750, 'No pagado', '2023-07-09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `vestidosDetalle`
    ADD PRIMARY KEY (`id`),
    ADD KEY `nombre_vestido` (`nombre_vestido`);

--
-- Indices de la tabla `fecha`
--
ALTER TABLE `registros`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historialpagos`
--
ALTER TABLE `historialpagos`
    ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vestido`
--
ALTER TABLE `vestido`
    ADD PRIMARY KEY (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `vestidosDetalle`
    MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de la tabla `fecha`
--
ALTER TABLE `registros`
    MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT de la tabla `historialpagos`
--
ALTER TABLE `historialpagos`
    MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones`
--
ALTER TABLE `vestidosDetalle`
    ADD CONSTRAINT `acciones_ibfk_1` FOREIGN KEY (`nombre_vestido`) REFERENCES `vestido` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

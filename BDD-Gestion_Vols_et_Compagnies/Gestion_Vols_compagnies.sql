-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 07 jan. 2021 à 19:42
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE Gestion_Vols_compagnies;
use Gestion_Vols_compagnies; 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Gestion_Vols_compagnies`
--

-- --------------------------------------------------------

--
-- Structure de la table `Affecter`
--

CREATE TABLE `Affecter` (
  `num_employe` int(11) NOT NULL,
  `num_vol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Affecter`
--

INSERT INTO `Affecter` (`num_employe`, `num_vol`) VALUES
(15000, 4000),
(15001, 4000),
(15002, 4000),
(15003, 4000),
(15004, 4000),
(15005, 4000),
(15020, 4000),
(15021, 4000),
(16001, 4010),
(16002, 4010),
(16003, 4010),
(16014, 4010),
(16015, 4010),
(16020, 4010),
(16024, 4010),
(16027, 4010),
(17002, 4004),
(17003, 4004),
(17005, 4004),
(17006, 4004),
(17017, 4004),
(17020, 4004),
(17021, 4004),
(17028, 4004);

-- --------------------------------------------------------

--
-- Structure de la table `Avion`
--

CREATE TABLE `Avion` (
  `num_avion` int(11) NOT NULL,
  `type_avion` varchar(30) NOT NULL,
  `nb_places` int(11) NOT NULL,
  `nom_compagnie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Avion`
--

INSERT INTO `Avion` (`num_avion`, `type_avion`, `nb_places`, `nom_compagnie`) VALUES
(100, 'AirBus A330', 375, 'Air Algerie'),
(101, 'AirBus A330', 375, 'Air Algerie'),
(102, 'AirBus A330', 375, 'Air Algerie'),
(103, 'AirBus A330', 375, 'Air Algerie'),
(104, 'AirBus A380', 516, 'Air France'),
(105, 'AirBus A380', 516, 'Air France'),
(106, 'AirBus A330', 375, 'Air France'),
(107, 'AirBus A330', 375, 'Air France'),
(108, 'AirBus A330', 375, 'Royal Air Maroc'),
(109, 'AirBus A330', 375, 'Royal Air Maroc'),
(110, 'AirBus A380', 516, 'Royal Air Maroc'),
(111, 'AirBus A380', 516, 'Royal Air Maroc');

-- --------------------------------------------------------

--
-- Structure de la table `Bagages`
--

CREATE TABLE `Bagages` (
  `num_bagages` int(11) NOT NULL,
  `poids` int(11) NOT NULL,
  `num_passeport` int(11) NOT NULL,
  `num_reservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Bagages`
--

INSERT INTO `Bagages` (`num_bagages`, `poids`, `num_passeport`, `num_reservation`) VALUES
(1000, 30, 219000, 50000),
(1001, 24, 219001, 50001),
(1002, 22, 219002, 50002),
(1003, 28, 219003, 50003),
(1004, 26, 219004, 50004),
(1005, 28, 219005, 50005),
(1006, 21, 219006, 50006),
(1007, 29, 219007, 50007),
(1008, 30, 219008, 50008),
(1009, 30, 219009, 50009),
(1010, 25, 219010, 50010),
(1011, 23, 219011, 50011),
(1012, 23, 219012, 50012),
(1013, 25, 219013, 50013),
(1014, 22, 219014, 50014),
(1015, 24, 219015, 50015),
(1016, 30, 219016, 50016),
(1017, 20, 219017, 50017),
(1018, 30, 219018, 50018),
(1019, 20, 219019, 50019),
(1020, 30, 219020, 50020),
(1021, 24, 219021, 50021),
(1022, 22, 219022, 50022),
(1023, 28, 219023, 50023),
(1024, 26, 219024, 50024),
(1025, 28, 219025, 50025),
(1026, 21, 219026, 50026),
(1027, 29, 219027, 50027),
(1028, 30, 219028, 50028),
(1029, 30, 219029, 50029),
(1030, 25, 219030, 50030),
(1031, 23, 219031, 50031),
(1032, 23, 219032, 50032),
(1033, 25, 219033, 50033),
(1034, 22, 219034, 50034),
(1035, 24, 219035, 50035),
(1036, 30, 219036, 50036),
(1037, 20, 219037, 50037),
(1038, 30, 219038, 50038),
(1039, 20, 219039, 50039),
(1040, 30, 219040, 50040),
(1041, 24, 219041, 50041),
(1042, 22, 219042, 50042),
(1043, 28, 219023, 50043),
(1044, 26, 219024, 50044),
(1045, 28, 219025, 50045),
(1046, 21, 219026, 50046),
(1047, 29, 219027, 50047),
(1048, 30, 219028, 50048),
(1049, 30, 219029, 50049),
(1050, 25, 219030, 50050),
(1051, 23, 219031, 50051),
(1052, 23, 219032, 50052),
(1053, 25, 219033, 50053),
(1054, 22, 219034, 50054),
(1055, 24, 219035, 50055),
(1056, 30, 219036, 50056),
(1057, 20, 219037, 50057),
(1058, 30, 219038, 50058),
(1059, 20, 219039, 50059),
(1060, 30, 219020, 50060),
(1061, 24, 219021, 50061),
(1062, 22, 219022, 50062),
(1063, 28, 219023, 50063),
(1064, 26, 219024, 50064),
(1065, 28, 219025, 50065),
(1066, 21, 219026, 50066),
(1067, 29, 219027, 50067),
(1068, 30, 219028, 50068),
(1069, 30, 219029, 50069),
(1070, 25, 219030, 50070),
(1071, 23, 219031, 50071),
(1072, 23, 219032, 50072),
(1073, 25, 219033, 50073),
(1074, 22, 219034, 50074),
(1075, 24, 219035, 50075),
(1076, 30, 219036, 50076),
(1077, 20, 219037, 50077),
(1078, 30, 219038, 50078),
(1079, 20, 219039, 50079),
(1080, 30, 219040, 50080),
(1081, 24, 219041, 50081),
(1082, 22, 219042, 50082),
(1083, 28, 219043, 50083),
(1084, 26, 219044, 50084),
(1085, 28, 219045, 50085),
(1086, 21, 219046, 50086),
(1087, 29, 219047, 50087),
(1088, 30, 219048, 50088),
(1089, 30, 219049, 50089),
(1090, 25, 219050, 50090),
(1091, 23, 219051, 50091),
(1092, 23, 219052, 50092),
(1093, 25, 219053, 50093),
(1094, 22, 219054, 50094),
(1095, 24, 219055, 50095),
(1096, 30, 219056, 50096),
(1097, 20, 219057, 50097),
(1098, 30, 219058, 50098),
(1099, 20, 219059, 50099),
(1100, 30, 219060, 50100),
(1101, 24, 219061, 50101),
(1102, 22, 219062, 50102),
(1103, 28, 219063, 50103),
(1104, 26, 219064, 50104),
(1105, 28, 219065, 50105),
(1106, 21, 219066, 50106),
(1107, 29, 219067, 50107),
(1108, 30, 219068, 50108),
(1109, 30, 219069, 50109),
(1110, 25, 219070, 50110),
(1111, 23, 219071, 50111),
(1112, 23, 219072, 50112),
(1113, 25, 219073, 50113),
(1114, 22, 219074, 50114),
(1115, 24, 219075, 50115),
(1116, 30, 219076, 50116),
(1117, 20, 219077, 50117),
(1118, 30, 219078, 50118),
(1119, 20, 219079, 50119),
(1120, 30, 219080, 50120),
(1121, 24, 219081, 50121),
(1122, 22, 219082, 50122),
(1123, 28, 219083, 50123),
(1124, 26, 219084, 50124),
(1125, 28, 219085, 50125),
(1126, 21, 219086, 50126),
(1127, 29, 219087, 50127),
(1128, 30, 219088, 50128),
(1129, 30, 219089, 50129),
(1130, 25, 219090, 50130),
(1131, 23, 219091, 50131),
(1132, 23, 219092, 50132),
(1133, 25, 219093, 50133),
(1134, 22, 219094, 50134),
(1135, 24, 219095, 50135),
(1136, 30, 219096, 50136),
(1137, 20, 219097, 50137),
(1138, 30, 219098, 50138),
(1139, 20, 219099, 50139),
(1140, 30, 219100, 50140),
(1141, 24, 219101, 50141),
(1142, 22, 219102, 50142),
(1143, 28, 219103, 50143),
(1144, 26, 219104, 50144),
(1145, 28, 219105, 50145),
(1146, 21, 219106, 50146),
(1147, 29, 219107, 50147),
(1148, 30, 219108, 50148),
(1149, 30, 219109, 50149),
(1150, 25, 219110, 50150),
(1151, 23, 219111, 50151),
(1152, 23, 219112, 50152),
(1153, 25, 219113, 50153),
(1154, 22, 219114, 50154),
(1155, 24, 219115, 50155),
(1156, 30, 219116, 50156),
(1157, 20, 219117, 50157),
(1158, 30, 219118, 50158),
(1159, 20, 219119, 50159),
(1160, 30, 219120, 50160),
(1161, 24, 219121, 50161),
(1162, 22, 219122, 50162),
(1163, 28, 219123, 50163),
(1164, 26, 219124, 50164),
(1165, 28, 219125, 50165),
(1166, 21, 219126, 50166),
(1167, 29, 219127, 50167),
(1168, 30, 219128, 50168),
(1169, 30, 219129, 50169),
(1170, 25, 219130, 50170),
(1171, 23, 219131, 50171),
(1172, 23, 219132, 50172),
(1173, 25, 219133, 50173),
(1174, 22, 219134, 50174),
(1175, 24, 219135, 50175),
(1176, 30, 219136, 50176),
(1177, 20, 219137, 50177),
(1178, 30, 219138, 50178),
(1179, 20, 219139, 50179),
(1180, 30, 219140, 50180),
(1181, 24, 219141, 50181),
(1182, 22, 219142, 50182),
(1183, 28, 219143, 50183),
(1184, 26, 219144, 50184),
(1185, 28, 219145, 50185),
(1186, 21, 219146, 50186),
(1187, 29, 219147, 50187),
(1188, 30, 219148, 50188),
(1189, 30, 219149, 50189),
(1190, 25, 219150, 50190),
(1191, 23, 219151, 50191),
(1300, 27, 219200, 50300),
(1301, 26, 219201, 50301),
(1302, 25, 219202, 50302),
(1303, 29, 219203, 50303),
(1304, 26, 219204, 50304),
(1305, 25, 219205, 50305),
(1306, 27, 219206, 50306),
(1307, 25, 219207, 50307),
(1308, 30, 219208, 50308),
(1309, 30, 219209, 50309),
(1310, 29, 219210, 50310),
(1311, 26, 219211, 50311),
(1312, 25, 219212, 50312),
(1313, 27, 219213, 50313),
(1314, 27, 219214, 50314),
(1315, 30, 219215, 50315),
(1316, 25, 219216, 50316),
(1317, 25, 219217, 50317),
(1318, 30, 219218, 50318),
(1319, 27, 219219, 50319),
(1320, 26, 219220, 50320),
(1321, 26, 219221, 50321),
(1322, 27, 219222, 50322),
(1323, 27, 219223, 50323),
(1324, 26, 219224, 50324),
(1325, 27, 219225, 50325),
(1326, 28, 219226, 50326),
(1327, 26, 219227, 50327),
(1328, 25, 219228, 50328),
(1329, 25, 219229, 50329),
(1330, 30, 219230, 50330),
(1331, 26, 219231, 50331),
(1332, 25, 219232, 50332),
(1333, 27, 219233, 50333),
(1334, 26, 219234, 50334),
(1335, 27, 219235, 50335),
(1336, 29, 219236, 50336),
(1337, 26, 219237, 50337),
(1338, 29, 219238, 50338),
(1339, 28, 219239, 50339),
(1340, 27, 219240, 50340),
(1341, 26, 219241, 50341),
(1342, 26, 219242, 50342),
(1343, 25, 219243, 50343),
(1344, 25, 219244, 50344),
(1345, 29, 219245, 50345),
(1346, 30, 219246, 50346),
(1347, 25, 219247, 50347),
(1348, 25, 219248, 50348),
(1349, 26, 219249, 50349),
(1500, 10, 219000, 50000),
(1501, 8, 219001, 50001),
(1502,15,219020,50020),
(1503,15,219020,50060);

-- --------------------------------------------------------

--
-- Structure de la table `Billet`
--

CREATE TABLE `Billet` (
  `num_reservation` int(11) NOT NULL,
  `type_billet` varchar(20) NOT NULL,
  `prix` int(11) NOT NULL,
  `nb_kg_autorisees` int(11) NOT NULL,
  `etat_reservation` varchar(10) DEFAULT NULL,
  `date_reservation` date NOT NULL,
  `num_passeport` int(11) NOT NULL,
  `nom_compagnie` varchar(50) NOT NULL,
  `num_vol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Billet`
--

INSERT INTO `Billet` (`num_reservation`, `type_billet`, `prix`, `nb_kg_autorisees`, `etat_reservation`, `date_reservation`, `num_passeport`, `nom_compagnie`, `num_vol`) VALUES
(50000, 'Economic Class', 322, 30, 'Confirme', '2020-10-12', 219000, 'Air Algerie', 4000),
(50001, 'Economic Class', 218, 30, 'Confirme', '2020-10-12', 219001, 'Air Algerie', 4000),
(50002, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219002, 'Air Algerie', 4000),
(50003, 'Economic Class', 220, 30, 'Confirme', '2020-10-12', 219003, 'Air Algerie', 4000),
(50004, 'Economic Class', 267, 30, 'Confirme', '2020-09-12', 219004, 'Air Algerie', 4000),
(50005, 'Economic Class', 299, 30, 'Confirme', '2020-09-12', 219005, 'Air Algerie', 4000),
(50006, 'Economic Class', 220, 30, 'Confirme', '2020-10-12', 219006, 'Air Algerie', 4000),
(50007, 'Economic Class', 325, 30, 'Confirme', '2020-10-12', 219007, 'Air Algerie', 4000),
(50008, 'Economic Class', 303, 30, 'Confirme', '2020-10-12', 219008, 'Air Algerie', 4000),
(50009, 'Economic Class', 292, 30, 'Confirme', '2020-10-12', 219009, 'Air Algerie', 4000),
(50010, 'Economic Class', 200, 30, 'Confirme', '2020-10-12', 219010, 'Air Algerie', 4000),
(50011, 'Economic Class', 209, 30, 'Confirme', '2020-10-01', 219011, 'Air Algerie', 4000),
(50012, 'Economic Class', 205, 30, 'Confirme', '2020-10-01', 219012, 'Air Algerie', 4000),
(50013, 'Economic Class', 230, 30, 'Confirme', '2020-09-04', 219013, 'Air Algerie', 4000),
(50014, 'Economic Class', 302, 30, 'Confirme', '2020-09-04', 219014, 'Air Algerie', 4000),
(50015, 'Economic Class', 236, 30, 'Confirme', '2020-12-16', 219015, 'Air Algerie', 4000),
(50016, 'Economic Class', 214, 30, 'Confirme', '2020-11-12', 219016, 'Air Algerie', 4000),
(50017, 'Economic Class', 211, 30, 'Confirme', '2020-10-10', 219017, 'Air Algerie', 4000),
(50018, 'First Class', 350, 30, 'Confirme', '2020-09-12', 219018, 'Air Algerie', 4000),
(50019, 'First Class', 400, 30, 'Confirme', '2020-12-12', 219019, 'Air Algerie', 4000),
(50020, 'Economic Class', 222, 30, 'Confirme', '2020-12-12', 219020, 'Royal Air Maroc', 4004),
(50021, 'Economic Class', 258, 30, 'Confirme', '2020-10-12', 219021, 'Royal Air Maroc', 4004),
(50022, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219022, 'Royal Air Maroc', 4004),
(50023, 'Economic Class', 250, 30, 'Confirme', '2020-12-12', 219023, 'Royal Air Maroc', 4004),
(50024, 'First Class', 337, 30, 'Confirme', '2020-11-12', 219024, 'Royal Air Maroc', 4004),
(50025, 'Economic Class', 279, 30, 'Confirme', '2020-09-12', 219025, 'Royal Air Maroc', 4004),
(50026, 'Economic Class', 250, 30, 'Confirme', '2020-01-01', 219026, 'Royal Air Maroc', 4004),
(50027, 'First Class', 335, 30, 'Confirme', '2020-12-12', 219027, 'Royal Air Maroc', 4004),
(50028, 'Economic Class', 303, 30, 'Confirme', '2020-10-12', 219028, 'Royal Air Maroc', 4004),
(50029, 'Economic Class', 302, 30, 'Confirme', '2020-10-12', 219029, 'Royal Air Maroc', 4004),
(50030, 'First Class', 420, 30, 'Confirme', '2020-10-12', 219030, 'Royal Air Maroc', 4004),
(50031, 'Economic Class', 219, 30, 'Confirme', '2020-12-01', 219031, 'Royal Air Maroc', 4004),
(50032, 'Economic Class', 235, 30, 'Confirme', '2020-01-01', 219032, 'Royal Air Maroc', 4004),
(50033, 'First Class', 350, 30, 'Confirme', '2020-09-04', 219033, 'Royal Air Maroc', 4004),
(50034, 'Economic Class', 292, 30, 'Confirme', '2020-09-04', 219034, 'Royal Air Maroc', 4004),
(50035, 'Economic Class', 276, 30, 'Confirme', '2020-12-16', 219035, 'Royal Air Maroc', 4004),
(50036, 'First Class', 354, 30, 'Confirme', '2020-11-12', 219036, 'Royal Air Maroc', 4004),
(50037, 'Economic Class', 211, 30, 'Confirme', '2020-10-10', 219037, 'Royal Air Maroc', 4004),
(50038, 'First Class', 350, 30, 'Confirme', '2020-09-12', 219038, 'Royal Air Maroc', 4004),
(50039, 'First Class', 400, 30, 'Confirme', '2020-12-12', 219039, 'Royal Air Maroc', 4004),
(50040, 'Economic Class', 322, 30, 'Confirme', '2020-12-12', 219040, 'Air France', 4010),
(50041, 'Economic Class', 248, 30, 'Confirme', '2020-10-12', 219041, 'Air France', 4010),
(50042, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219042, 'Air France', 4010),
(50043, 'Economic Class', 260, 30, 'Confirme', '2020-12-12', 219023, 'Air France', 4010),
(50044, 'First Class', 327, 30, 'Confirme', '2020-11-12', 219024, 'Air France', 4010),
(50045, 'Economic Class', 309, 30, 'Confirme', '2020-09-12', 219025, 'Air France', 4010),
(50046, 'Economic Class', 250, 30, 'Confirme', '2020-01-01', 219026, 'Air France', 4010),
(50047, 'First Class', 315, 30, 'Confirme', '2020-12-12', 219027, 'Air France', 4010),
(50048, 'Economic Class', 313, 30, 'Confirme', '2020-10-12', 219028, 'Air France', 4010),
(50049, 'Economic Class', 302, 30, 'Confirme', '2020-10-12', 219029, 'Air France', 4010),
(50050, 'First Class', 410, 30, 'Confirme', '2020-10-12', 219030, 'Air France', 4010),
(50051, 'Economic Class', 249, 30, 'Confirme', '2020-12-01', 219031, 'Air France', 4010),
(50052, 'Economic Class', 305, 30, 'Confirme', '2020-01-01', 219032, 'Air France', 4010),
(50053, 'First Class', 430, 30, 'Confirme', '2020-09-04', 219033, 'Air France', 4010),
(50054, 'Economic Class', 232, 30, 'Confirme', '2020-09-04', 219034, 'Air France', 4010),
(50055, 'Economic Class', 336, 30, 'Confirme', '2020-12-16', 219035, 'Air France', 4010),
(50056, 'First Class', 414, 30, 'Confirme', '2020-11-12', 219036, 'Air France', 4010),
(50057, 'Economic Class', 251, 30, 'Confirme', '2020-10-10', 219037, 'Air France', 4010),
(50058, 'First Class', 330, 30, 'Confirme', '2020-09-12', 219038, 'Air France', 4010),
(50059, 'First Class', 430, 30, 'Confirme', '2020-12-12', 219039, 'Air France', 4010),
(50060, 'Economic Class', 222, 30, 'Confirme', '2020-12-12', 219020, 'Air France', 4010),
(50061, 'Economic Class', 258, 30, 'Confirme', '2020-10-12', 219021, 'Air France', 4010),
(50062, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219022, 'Air France', 4010),
(50063, 'Economic Class', 250, 30, 'Confirme', '2020-12-12', 219023, 'Air France', 4010),
(50064, 'First Class', 337, 30, 'Confirme', '2020-11-12', 219024, 'Air France', 4010),
(50065, 'Economic Class', 279, 30, 'Confirme', '2020-09-12', 219025, 'Air France', 4010),
(50066, 'Economic Class', 250, 30, 'Confirme', '2020-01-01', 219026, 'Air France', 4010),
(50067, 'First Class', 335, 30, 'Confirme', '2020-12-12', 219027, 'Air France', 4010),
(50068, 'Economic Class', 303, 30, 'Confirme', '2020-10-12', 219028, 'Air France', 4010),
(50069, 'Economic Class', 302, 30, 'Confirme', '2020-10-12', 219029, 'Air France', 4010),
(50070, 'First Class', 420, 30, 'Confirme', '2020-10-12', 219030, 'Air France', 4010),
(50071, 'Economic Class', 219, 30, 'Confirme', '2020-12-01', 219031, 'Air France', 4010),
(50072, 'Economic Class', 235, 30, 'Confirme', '2020-01-01', 219032, 'Air France', 4010),
(50073, 'First Class', 350, 30, 'Confirme', '2020-09-04', 219033, 'Air France', 4010),
(50074, 'Economic Class', 292, 30, 'Confirme', '2020-09-04', 219034, 'Air France', 4010),
(50075, 'Economic Class', 276, 30, 'Confirme', '2020-12-16', 219035, 'Air France', 4010),
(50076, 'First Class', 354, 30, 'Confirme', '2020-11-12', 219036, 'Air France', 4010),
(50077, 'Economic Class', 211, 30, 'Confirme', '2020-10-10', 219037, 'Air France', 4010),
(50078, 'First Class', 350, 30, 'Confirme', '2020-09-12', 219038, 'Air France', 4010),
(50079, 'First Class', 400, 30, 'Confirme', '2020-12-12', 219039, 'Air France', 4010),
(50080, 'Economic Class', 322, 30, 'Confirme', '2020-12-12', 219040, 'Air France', 4010),
(50081, 'Economic Class', 248, 30, 'Confirme', '2020-10-12', 219041, 'Air France', 4010),
(50082, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219042, 'Air France', 4010),
(50083, 'Economic Class', 260, 30, 'Confirme', '2020-12-12', 219043, 'Air France', 4010),
(50084, 'First Class', 327, 30, 'Confirme', '2020-11-12', 219044, 'Air France', 4010),
(50085, 'Economic Class', 309, 30, 'Confirme', '2020-09-12', 219045, 'Air France', 4010),
(50086, 'Economic Class', 250, 30, 'Confirme', '2020-01-01', 219046, 'Air France', 4010),
(50087, 'First Class', 315, 30, 'Confirme', '2020-12-12', 219047, 'Air France', 4010),
(50088, 'Economic Class', 313, 30, 'Confirme', '2020-10-12', 219048, 'Air France', 4010),
(50089, 'Economic Class', 302, 30, 'Confirme', '2020-10-12', 219049, 'Air France', 4010),
(50090, 'First Class', 410, 30, 'Confirme', '2020-10-12', 219050, 'Air France', 4010),
(50091, 'Economic Class', 249, 30, 'Confirme', '2020-12-01', 219051, 'Air France', 4010),
(50092, 'Economic Class', 305, 30, 'Confirme', '2020-01-01', 219052, 'Air France', 4010),
(50093, 'First Class', 430, 30, 'Confirme', '2020-09-04', 219053, 'Air France', 4010),
(50094, 'Economic Class', 232, 30, 'Confirme', '2020-09-04', 219054, 'Air France', 4010),
(50095, 'Economic Class', 336, 30, 'Confirme', '2020-12-16', 219055, 'Air France', 4010),
(50096, 'First Class', 414, 30, 'Confirme', '2020-11-12', 219056, 'Air France', 4010),
(50097, 'Economic Class', 251, 30, 'Confirme', '2020-10-10', 219057, 'Air France', 4010),
(50098, 'First Class', 330, 30, 'Confirme', '2020-09-12', 219058, 'Air France', 4010),
(50099, 'First Class', 430, 30, 'Confirme', '2020-12-12', 219059, 'Air France', 4010),
(50100, 'Economic Class', 322, 30, 'Confirme', '2020-10-12', 219060, 'Air France', 4010),
(50101, 'Economic Class', 218, 30, 'Confirme', '2020-10-12', 219061, 'Air France', 4010),
(50102, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219062, 'Air France', 4010),
(50103, 'Economic Class', 220, 30, 'Confirme', '2020-10-12', 219063, 'Air France', 4010),
(50104, 'Economic Class', 267, 30, 'Confirme', '2020-09-12', 219064, 'Air France', 4010),
(50105, 'Economic Class', 299, 30, 'Confirme', '2020-09-12', 219065, 'Air France', 4010),
(50106, 'Economic Class', 220, 30, 'Confirme', '2020-10-12', 219066, 'Air France', 4010),
(50107, 'Economic Class', 325, 30, 'Confirme', '2020-10-12', 219067, 'Air France', 4010),
(50108, 'Economic Class', 303, 30, 'Confirme', '2020-10-12', 219068, 'Air France', 4010),
(50109, 'Economic Class', 292, 30, 'Confirme', '2020-10-12', 219069, 'Air France', 4010),
(50110, 'Economic Class', 200, 30, 'Confirme', '2020-10-12', 219070, 'Air France', 4010),
(50111, 'Economic Class', 209, 30, 'Confirme', '2020-10-01', 219071, 'Air France', 4010),
(50112, 'Economic Class', 205, 30, 'Confirme', '2020-10-01', 219072, 'Air France', 4010),
(50113, 'Economic Class', 230, 30, 'Confirme', '2020-09-04', 219073, 'Air France', 4010),
(50114, 'Economic Class', 302, 30, 'Confirme', '2020-09-04', 219074, 'Air France', 4010),
(50115, 'Economic Class', 236, 30, 'Confirme', '2020-12-16', 219075, 'Air France', 4010),
(50116, 'Economic Class', 214, 30, 'Confirme', '2020-11-12', 219076, 'Air France', 4010),
(50117, 'Economic Class', 211, 30, 'Confirme', '2020-10-10', 219077, 'Air France', 4010),
(50118, 'First Class', 350, 30, 'Confirme', '2020-09-12', 219078, 'Air France', 4010),
(50119, 'First Class', 400, 30, 'Confirme', '2020-12-12', 219079, 'Air France', 4010),
(50120, 'Economic Class', 222, 30, 'Confirme', '2020-12-12', 219080, 'Air France', 4010),
(50121, 'Economic Class', 258, 30, 'Confirme', '2020-10-12', 219081, 'Air France', 4010),
(50122, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219082, 'Air France', 4010),
(50123, 'Economic Class', 250, 30, 'Confirme', '2020-12-12', 219083, 'Air France', 4010),
(50124, 'First Class', 337, 30, 'Confirme', '2020-11-12', 219084, 'Air France', 4010),
(50125, 'Economic Class', 279, 30, 'Confirme', '2020-09-12', 219085, 'Air France', 4010),
(50126, 'Economic Class', 250, 30, 'Confirme', '2020-01-01', 219086, 'Air France', 4010),
(50127, 'First Class', 335, 30, 'Confirme', '2020-12-12', 219087, 'Air France', 4010),
(50128, 'Economic Class', 303, 30, 'Confirme', '2020-10-12', 219088, 'Air France', 4010),
(50129, 'Economic Class', 302, 30, 'Confirme', '2020-10-12', 219089, 'Air France', 4010),
(50130, 'First Class', 420, 30, 'Confirme', '2020-10-12', 219090, 'Air France', 4010),
(50131, 'Economic Class', 219, 30, 'Confirme', '2020-12-01', 219091, 'Air France', 4010),
(50132, 'Economic Class', 235, 30, 'Confirme', '2020-01-01', 219092, 'Air France', 4010),
(50133, 'First Class', 350, 30, 'Confirme', '2020-09-04', 219093, 'Air France', 4010),
(50134, 'Economic Class', 292, 30, 'Confirme', '2020-09-04', 219094, 'Air France', 4010),
(50135, 'Economic Class', 276, 30, 'Confirme', '2020-12-16', 219095, 'Air France', 4010),
(50136, 'First Class', 354, 30, 'Confirme', '2020-11-12', 219096, 'Air France', 4010),
(50137, 'Economic Class', 211, 30, 'Confirme', '2020-10-10', 219097, 'Air France', 4010),
(50138, 'First Class', 350, 30, 'Confirme', '2020-09-12', 219098, 'Air France', 4010),
(50139, 'First Class', 400, 30, 'Confirme', '2020-12-12', 219099, 'Air France', 4010),
(50140, 'Economic Class', 322, 30, 'Confirme', '2020-10-12', 219100, 'Air France', 4010),
(50141, 'Economic Class', 218, 30, 'Confirme', '2020-10-12', 219101, 'Air France', 4010),
(50142, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219102, 'Air France', 4010),
(50143, 'Economic Class', 220, 30, 'Confirme', '2020-10-12', 219103, 'Air France', 4010),
(50144, 'Economic Class', 267, 30, 'Confirme', '2020-09-12', 219104, 'Air France', 4010),
(50145, 'Economic Class', 299, 30, 'Confirme', '2020-09-12', 219105, 'Air France', 4010),
(50146, 'Economic Class', 220, 30, 'Confirme', '2020-10-12', 219106, 'Air France', 4010),
(50147, 'Economic Class', 325, 30, 'Confirme', '2020-10-12', 219107, 'Air France', 4010),
(50148, 'Economic Class', 303, 30, 'Confirme', '2020-10-12', 219108, 'Air France', 4010),
(50149, 'Economic Class', 292, 30, 'Confirme', '2020-10-12', 219109, 'Air France', 4010),
(50150, 'Economic Class', 200, 30, 'Confirme', '2020-10-12', 219110, 'Air France', 4010),
(50151, 'Economic Class', 209, 30, 'Confirme', '2020-10-01', 219111, 'Air France', 4010),
(50152, 'Economic Class', 205, 30, 'Confirme', '2020-10-01', 219112, 'Air France', 4010),
(50153, 'Economic Class', 230, 30, 'Confirme', '2020-09-04', 219113, 'Air France', 4010),
(50154, 'Economic Class', 302, 30, 'Confirme', '2020-09-04', 219114, 'Air France', 4010),
(50155, 'Economic Class', 236, 30, 'Confirme', '2020-12-16', 219115, 'Air France', 4010),
(50156, 'Economic Class', 214, 30, 'Confirme', '2020-11-12', 219116, 'Air France', 4010),
(50157, 'Economic Class', 211, 30, 'Confirme', '2020-10-10', 219117, 'Air France', 4010),
(50158, 'First Class', 350, 30, 'Confirme', '2020-09-12', 219118, 'Air France', 4010),
(50159, 'First Class', 400, 30, 'Confirme', '2020-12-12', 219119, 'Air France', 4010),
(50160, 'Economic Class', 222, 30, 'Confirme', '2020-12-12', 219120, 'Air France', 4010),
(50161, 'Economic Class', 258, 30, 'Confirme', '2020-10-12', 219121, 'Air France', 4010),
(50162, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219122, 'Air France', 4010),
(50163, 'Economic Class', 250, 30, 'Confirme', '2020-12-12', 219123, 'Air France', 4010),
(50164, 'First Class', 337, 30, 'Confirme', '2020-11-12', 219124, 'Air France', 4010),
(50165, 'Economic Class', 279, 30, 'Confirme', '2020-09-12', 219125, 'Air France', 4010),
(50166, 'Economic Class', 250, 30, 'Confirme', '2020-01-01', 219126, 'Air France', 4010),
(50167, 'First Class', 335, 30, 'Confirme', '2020-12-12', 219127, 'Air France', 4010),
(50168, 'Economic Class', 303, 30, 'Confirme', '2020-10-12', 219128, 'Air France', 4010),
(50169, 'Economic Class', 302, 30, 'Confirme', '2020-10-12', 219129, 'Air France', 4010),
(50170, 'First Class', 420, 30, 'Confirme', '2020-10-12', 219130, 'Air France', 4010),
(50171, 'Economic Class', 219, 30, 'Confirme', '2020-12-01', 219131, 'Air France', 4010),
(50172, 'Economic Class', 235, 30, 'Confirme', '2020-01-01', 219132, 'Air France', 4010),
(50173, 'First Class', 350, 30, 'Confirme', '2020-09-04', 219133, 'Air France', 4010),
(50174, 'Economic Class', 292, 30, 'Confirme', '2020-09-04', 219134, 'Air France', 4010),
(50175, 'Economic Class', 276, 30, 'Confirme', '2020-12-16', 219135, 'Air France', 4010),
(50176, 'First Class', 354, 30, 'Confirme', '2020-11-12', 219136, 'Air France', 4010),
(50177, 'Economic Class', 211, 30, 'Confirme', '2020-10-10', 219137, 'Air France', 4010),
(50178, 'First Class', 350, 30, 'Confirme', '2020-09-12', 219138, 'Air France', 4010),
(50179, 'First Class', 400, 30, 'Confirme', '2020-12-12', 219139, 'Air France', 4010),
(50180, 'Economic Class', 322, 30, 'Confirme', '2020-12-12', 219140, 'Air France', 4010),
(50181, 'Economic Class', 248, 30, 'Confirme', '2020-10-12', 219141, 'Air France', 4010),
(50182, 'Economic Class', 236, 30, 'Confirme', '2020-10-12', 219142, 'Air France', 4010),
(50183, 'Economic Class', 260, 30, 'Confirme', '2020-12-12', 219143, 'Air France', 4010),
(50184, 'First Class', 327, 30, 'Confirme', '2020-11-12', 219144, 'Air France', 4010),
(50185, 'Economic Class', 309, 30, 'Confirme', '2020-09-12', 219145, 'Air France', 4010),
(50186, 'Economic Class', 250, 30, 'Confirme', '2020-01-01', 219146, 'Air France', 4010),
(50187, 'First Class', 315, 30, 'Confirme', '2020-12-12', 219147, 'Air France', 4010),
(50188, 'Economic Class', 313, 30, 'Confirme', '2020-10-12', 219148, 'Air France', 4010),
(50189, 'Economic Class', 302, 30, 'Confirme', '2020-10-12', 219149, 'Air France', 4010),
(50190, 'First Class', 410, 30, 'Confirme', '2020-10-12', 219150, 'Air France', 4010),
(50191, 'Economic Class', 249, 30, 'Confirme', '2020-12-01', 219151, 'Air France', 4010),
(50300, 'Economic Class', 489, 30, 'Confirme', '2020-11-01', 219200, 'Air Algerie', 4000),
(50301, 'Economic Class', 402, 30, 'Confirme', '2020-10-25', 219201, 'Air Algerie', 4000),
(50302, 'Economic Class', 430, 30, 'Confirme', '2020-10-25', 219202, 'Air Algerie', 4000),
(50303, 'Economic Class', 334, 30, 'Confirme', '2020-10-25', 219203, 'Air Algerie', 4000),
(50304, 'Economic Class', 435, 30, 'Confirme', '2020-10-25', 219204, 'Air Algerie', 4000),
(50305, 'Economic Class', 487, 30, 'Confirme', '2020-10-25', 219205, 'Air Algerie', 4000),
(50306, 'Economic Class', 480, 30, 'Confirme', '2020-10-25', 219206, 'Air Algerie', 4000),
(50307, 'Economic Class', 329, 30, 'Confirme', '2020-10-25', 219207, 'Air Algerie', 4000),
(50308, 'Economic Class', 446, 30, 'Confirme', '2020-10-25', 219208, 'Air Algerie', 4000),
(50309, 'Economic Class', 376, 30, 'Confirme', '2020-10-25', 219209, 'Air Algerie', 4000),
(50310, 'Economic Class', 334, 30, 'Confirme', '2020-11-01', 219210, 'Air Algerie', 4000),
(50311, 'Economic Class', 328, 30, 'Confirme', '2020-06-06', 219211, 'Air Algerie', 4000),
(50312, 'Economic Class', 478, 30, 'Confirme', '2020-06-06', 219212, 'Air Algerie', 4000),
(50313, 'Economic Class', 453, 30, 'Confirme', '2020-06-06', 219213, 'Air Algerie', 4000),
(50314, 'Economic Class', 316, 30, 'Confirme', '2020-06-06', 219214, 'Air Algerie', 4000),
(50315, 'Economic Class', 446, 30, 'Confirme', '2020-06-06', 219215, 'Air Algerie', 4000),
(50316, 'Economic Class', 359, 30, 'Confirme', '2020-06-06', 219216, 'Air Algerie', 4000),
(50317, 'Economic Class', 301, 30, 'Confirme', '2020-06-06', 219217, 'Air Algerie', 4000),
(50318, 'Economic Class', 341, 30, 'Confirme', '2020-06-06', 219218, 'Air Algerie', 4000),
(50319, 'Economic Class', 442, 30, 'Confirme', '2020-06-06', 219219, 'Air Algerie', 4000),
(50320, 'Economic Class', 463, 30, 'Confirme', '2020-05-15', 219220, 'Air Algerie', 4000),
(50321, 'Economic Class', 451, 30, 'Confirme', '2020-08-30', 219221, 'Air Algerie', 4000),
(50322, 'Economic Class', 449, 30, 'Confirme', '2020-08-30', 219222, 'Air Algerie', 4000),
(50323, 'Economic Class', 481, 30, 'Confirme', '2020-08-30', 219223, 'Air Algerie', 4000),
(50324, 'Economic Class', 500, 30, 'Confirme', '2020-08-30', 219224, 'Air Algerie', 4000),
(50325, 'Economic Class', 426, 30, 'Confirme', '2020-08-30', 219225, 'Air Algerie', 4000),
(50326, 'Economic Class', 302, 30, 'Confirme', '2020-08-30', 219226, 'Air Algerie', 4000),
(50327, 'Economic Class', 316, 30, 'Confirme', '2020-08-30', 219227, 'Air Algerie', 4000),
(50328, 'Economic Class', 395, 30, 'Confirme', '2020-08-30', 219228, 'Air Algerie', 4000),
(50329, 'Economic Class', 325, 30, 'Confirme', '2020-08-30', 219229, 'Air Algerie', 4000),
(50330, 'Economic Class', 322, 30, 'Confirme', '2020-08-16', 219230, 'Air Algerie', 4000),
(50331, 'Economic Class', 309, 30, 'Confirme', '2020-07-07', 219231, 'Air Algerie', 4000),
(50332, 'Economic Class', 435, 30, 'Confirme', '2020-07-07', 219232, 'Air Algerie', 4000),
(50333, 'Economic Class', 454, 30, 'Confirme', '2020-07-07', 219233, 'Air Algerie', 4000),
(50334, 'Economic Class', 360, 30, 'Confirme', '2020-07-07', 219234, 'Air Algerie', 4000),
(50335, 'Economic Class', 489, 30, 'Confirme', '2020-07-07', 219235, 'Air Algerie', 4000),
(50336, 'Economic Class', 311, 30, 'Confirme', '2020-07-07', 219236, 'Air Algerie', 4000),
(50337, 'Economic Class', 417, 30, 'Confirme', '2020-07-07', 219237, 'Air Algerie', 4000),
(50338, 'Economic Class', 489, 30, 'Confirme', '2020-07-07', 219238, 'Air Algerie', 4000),
(50339, 'Economic Class', 308, 30, 'Confirme', '2020-07-07', 219239, 'Air Algerie', 4000),
(50340, 'Economic Class', 330, 30, 'Confirme', '2020-11-06', 219240, 'Air Algerie', 4000),
(50341, 'Economic Class', 335, 30, 'Confirme', '2020-09-17', 219241, 'Air Algerie', 4000),
(50342, 'Economic Class', 498, 30, 'Confirme', '2020-09-17', 219242, 'Air Algerie', 4000),
(50343, 'Economic Class', 334, 30, 'Confirme', '2020-09-17', 219243, 'Air Algerie', 4000),
(50344, 'Economic Class', 320, 30, 'Confirme', '2020-09-17', 219244, 'Air Algerie', 4000),
(50345, 'Economic Class', 477, 30, 'Confirme', '2020-09-17', 219245, 'Air Algerie', 4000),
(50346, 'Economic Class', 353, 30, 'Confirme', '2020-09-17', 219246, 'Air Algerie', 4000),
(50347, 'Economic Class', 474, 30, 'Confirme', '2020-09-17', 219247, 'Air Algerie', 4000),
(50348, 'Economic Class', 359, 30, 'Confirme', '2020-09-17', 219248, 'Air Algerie', 4000),
(50349, 'Economic Class', 439, 30, 'Confirme', '2020-09-17', 219249, 'Air Algerie', 4000);

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `num_passeport` int(11) NOT NULL,
  `est_passager` int(1) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `tel` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Client`
--

INSERT INTO `Client` (`num_passeport`, `est_passager`, `nom`, `prenom`, `adresse`, `tel`) VALUES
(219000, 1, 'Mahrez', 'Riyad', '1 rue Manchester', '0645103500'),
(219001, 1, 'Slimani', 'Islam', 'Everton', '0645103550'),
(219002, 1, 'Delort', 'Andy', '7 boulvard Montpellier', '0645183500'),
(219003, 1, 'Bennacer', 'Ismail', 'Milan centre', '0645103880'),
(219004, 1, 'Hamroune', 'Rezki', 'Tizi Ouzou', '0685103500'),
(219005, 1, 'Boundjah', 'Baghdad', 'Sedd Qatar', '0745103500'),
(219006, 1, 'Attal', 'Youcef', 'Nice sur mer', '0545103500'),
(219007, 1, 'Mbolhi', 'Rais', '79 Rue du gardien', '0645103589'),
(219008, 1, 'Brahimi', 'Yacine', 'Porto center', '0645103508'),
(219009, 1, 'Bensebaini', 'Samy', 'Monchengladbach ville', '0645108500'),
(219010, 1, 'Benlamri', 'Djamel', 'Lyon', '0585103500'),
(219011, 1, 'Ounas', 'Adam', 'Napoli', '0645303500'),
(219012, 1, 'Boudaoui', 'Hicham', 'Nice ville', '0645103500'),
(219013, 1, 'Saifi', 'Rafik', 'Alger', '0525103500'),
(219014, 1, 'Medjani', 'Carl', 'Seville', '0645803500'),
(219015, 1, 'Lacene', 'Mehdi', 'Paris', '0645163500'),
(219016, 1, 'Ziani', 'Karim', 'Tizi Ouzou', '0645103600'),
(219017, 1, 'Melal', 'Cherif', 'Tizi Ouzou', '0645153500'),
(219018, 1, 'Halliche', 'Rafik', 'Tizi Ouzou', '0585103500'),
(219019, 1, 'Mandi', 'Aissa', 'Betis', '0645103588'),
(219020, 1, 'Anter', 'Yaya', 'Alger', '0645103555'),
(219021, 1, 'Victor', 'Cordier', 'Agadir', '0645135462'),
(219022, 1, 'Benoît-Isaac', 'Dias', 'Tiznit', '0645135456'),
(219023, 1, 'Rémy-Paul', 'Lesage', 'Marrakech', '0645135476'),
(219024, 1, 'Hélène', 'Dupont', 'Rabat', '0645136476'),
(219025, 1, 'Marie', 'Brunel-Lecoq', 'Agadir', '0645796476'),
(219026, 1, 'Patricia', 'Renard', 'Agadir', '0649896476'),
(219027, 1, 'Yves', 'Weber', 'Tiznit', '0643696476'),
(219028, 1, 'Alfred', 'Cyr', 'Tiznit', '0643350276'),
(219029, 1, 'Eugénie', 'Roy', 'Marrakech', '0798550276'),
(219030, 1, 'Philippe', 'Lepage', 'Marrakech', '0798554561'),
(219031, 1, 'Éric', 'Beaulieu', 'Rabat', '0793561561'),
(219032, 1, 'Joséphine', 'Tessier', 'Rabat', '0743975561'),
(219033, 1, 'Danielle', 'Nguyen', 'Agadir', '0743946398'),
(219034, 1, 'Noémie-Gabrielle', 'Dionne', 'Agadir', '0744398598'),
(219035, 1, 'Audrey', 'Fillion', 'Tiznit', '0744345309'),
(219036, 1, 'Thérèse', 'Legault-Côté', 'Tiznit', '0745631209'),
(219037, 1, 'Étienne', 'Gosselin', 'Rabat', '0747634009'),
(219038, 1, 'Yves', 'Caron', 'Rabat', '0747634532'),
(219039, 1, 'Jeannine', 'Bernard', 'Rabat', '0747674232'),
(219040, 1, 'Patrick', 'Dionne', 'Agadir', '0747430962'),
(219041, 1, 'Dominique', 'Drouin', 'Agadir', '0747487503'),
(219042, 1, 'Jeannine', 'Desjardins', 'Marrakech', '0765297503'),
(219043, 1, 'Mahrez', 'Vaillancourt', 'Manchester', '0634523500'),
(219044, 1, 'Émanuelle', 'Islam', 'Everton', '0645143980'),
(219045, 1, 'Thomas-Alphonse', 'Andy', '12 boulvard Montpellier', '0645184176'),
(219046, 1, 'Bennacer', 'Guay', 'Milan centre', '0764303880'),
(219047, 1, 'Catherine', 'Rezki', 'Tizi Ouzou', '0685381500'),
(219048, 1, 'Boundjah', 'Bolduc', 'Sedd Qatar', '0745165840'),
(219049, 1, 'Hugues', 'Youcef', 'Nice sur mer', '0674533500'),
(219050, 1, 'Mbolhi', 'Parent', '67 Rue du gardien', '0654398589'),
(219051, 1, 'Camille-Noémie', 'Yacine', 'Porto center', '0649854308'),
(219052, 1, 'Bensebaini', 'Boudreau', 'Monchengladbach ville', '0656342500'),
(219053, 1, 'Patrick', 'Djamel', 'Lyon', '0674573500'),
(219054, 1, 'Ounas', 'Perron', 'Napoli', '0789543500'),
(219055, 1, 'Dominic', 'Hicham', 'Nice ville', '0645176543'),
(219056, 1, 'Saifi', 'Giroux', 'Alger', '0786343500'),
(219057, 1, 'Jacques', 'Carl', 'Seville', '0678430500'),
(219058, 1, 'Lacene', 'Fontaine', 'Paris', '0564784500'),
(219059, 1, 'Brigitte', 'Karim', 'Tizi Ouzou', '0648745300'),
(219060, 1, 'Melal', 'Fortin', 'Tizi Ouzou', '0656498500'),
(219061, 1, 'Bertrand', 'Rafik', 'Tizi Ouzou', '0765403500'),
(219062, 1, 'Mandi', 'Lemay', 'Betis', '0689621588'),
(219063, 1, 'Madeleine', 'Yaya', 'Alger', '0645467755'),
(219064, 1, 'Victor', 'Blais', 'Agadir', '0645645462'),
(219065, 1, 'Denise', 'Dias', 'Tiznit', '0645135454'),
(219066, 1, 'Rémy-Paul', 'Leduc', 'Marrakech', '0689765476'),
(219067, 1, 'Albert', 'Dupont', 'Rabat', '0646578476'),
(219068, 1, 'Marie', 'Gaudreault-Boucher', 'Agadir', '0687643476'),
(219069, 1, 'Simone', 'Renard', 'Agadir', '0649765896'),
(219070, 1, 'Yves', 'Roy', 'Tiznit', '0643563216'),
(219071, 1, 'Alfred', 'Cyr', 'Tiznit', '0643350276'),
(219072, 1, 'Eugénie', 'Roy', 'Marrakech', '0798550276'),
(219073, 1, 'Marianne-Jacqueline', 'Lepage', 'Marrakech', '0798789561'),
(219074, 1, 'Éric', 'Gravel', 'Rabat', '0796751561'),
(219075, 1, 'Renée', 'Tessier', 'Rabat', '0776975561'),
(219076, 1, 'Danielle', 'Labelle', 'Agadir', '0743947458'),
(219077, 1, 'Benoît', 'Dionne', 'Agadir', '0744378998'),
(219078, 1, 'Audrey', 'Bertrand', 'Tiznit', '0776235309'),
(219079, 1, 'Michel-Philippe', 'Legault-Côté', 'Tiznit', '0783231209'),
(219080, 1, 'Étienne', 'Bilodeau', 'Rabat', '0747638979'),
(219081, 1, 'Maggie-Nicole', 'Caron', 'Rabat', '0771234532'),
(219082, 1, 'Jeannine', 'Desrosiers', 'Rabat', '0747800232'),
(219083, 1, 'Amélie', 'Dionne', 'Agadir', '0749000962'),
(219084, 1, 'Dominique', 'Boucher', 'Agadir', '0788887503'),
(219085, 1, 'Agathe', 'Desjardins', 'Marrakech', '0777697503'),
(219086, 1, 'Victor', 'Carrier', 'Agadir', '0745135462'),
(219087, 1, 'Jules', 'Dias', 'Tiznit', '0745135456'),
(219088, 1, 'Rémy-Paul', 'Gagnon', 'Marrakech', '0745135476'),
(219089, 1, 'Émanuelle', 'Dupont', 'Rabat', '0745136476'),
(219090, 1, 'Marie', 'Villeneuve', 'Agadir', '0745796476'),
(219091, 1, 'Gilbert', 'Renard', 'Agadir', '0749896476'),
(219092, 1, 'Yves', 'Gilbert', 'Tiznit', '0743696476'),
(219093, 1, 'Grégory', 'Cyr', 'Tiznit', '0743350276'),
(219094, 1, 'Eugénie', 'Gravel', 'Marrakech', '0698550276'),
(219095, 1, 'Jacques', 'Lepage', 'Marrakech', '0698554561'),
(219096, 1, 'Éric', 'Leduc', 'Rabat', '0693561561'),
(219097, 1, 'Marthe', 'Tessier', 'Rabat', '0643975561'),
(219098, 1, 'Danielle', 'Blanchette', 'Agadir', '0643946398'),
(219099, 1, 'Guy', 'Dionne', 'Agadir', '0644398598'),
(219100, 1, 'Audrey', 'Tessier', 'Tiznit', '0644345309'),
(219101, 1, 'Denis-Simone', 'Legault-Côté', 'Tiznit', '0645631209'),
(219102, 1, 'Étienne', 'Beaudoin', 'Rabat', '0647634009'),
(219103, 1, 'Alain-Hugues', 'Caron', 'Rabat', '0647634532'),
(219104, 1, 'Jeannine', 'Bilodeau', 'Rabat', '0647674232'),
(219105, 1, 'Robert', 'Dionne', 'Agadir', '0647430962'),
(219106, 1, 'Dominique', 'Audet-Leduc', 'Agadir', '0647487503'),
(219107, 1, 'Aimé', 'Desjardins', 'Marrakech', '0665297503'),
(219108, 1, 'Mahrez', 'Raymond', 'Manchester', '0734523500'),
(219109, 1, 'Édouard', 'Islam', 'Everton', '0745143980'),
(219110, 1, 'Thomas-Alphonse', 'Legault', '12 boulvard Montpellier', '0745184176'),
(219111, 1, 'Jacqueline', 'Guay', 'Milan centre', '0664303880'),
(219112, 1, 'Catherine', 'Thibault-Proulx', 'Tizi Ouzou', '0785381500'),
(219113, 1, 'Julien', 'Bolduc', 'Sedd Qatar', '0645165840'),
(219114, 1, 'Hugues', 'Lauzon', 'Nice sur mer', '0774533500'),
(219115, 1, 'Monique', 'Parent', '67 Rue du gardien', '0754398589'),
(219116, 1, 'Camille-Noémie', 'Bélanger', 'Porto center', '0749854308'),
(219117, 1, 'Gilles', 'Boudreau', 'Monchengladbach ville', '0756342500'),
(219118, 1, 'Patrick', 'Villeneuve', 'Lyon', '0774573500'),
(219119, 1, 'Benoît-Noël', 'Perron', 'Napoli', '0689543500'),
(219120, 1, 'Dominic', 'Hébert', 'Nice ville', '0745176543'),
(219121, 1, 'Ann-Arianne', 'Giroux', 'Alger', '0686343500'),
(219122, 1, 'Jacques', 'Gingras', 'Seville', '0778430500'),
(219123, 1, 'Patricia', 'Fontaine', 'Paris', '0664784500'),
(219124, 1, 'Brigitte', 'Gauthier', 'Tizi Ouzou', '0748745300'),
(219125, 1, 'Nancy', 'Fortin', 'Tizi Ouzou', '0756498500'),
(219126, 1, 'Bertrand', 'Richard', 'Tizi Ouzou', '0665403500'),
(219127, 1, 'Aimé', 'Lemay', 'Betis', '0789621588'),
(219128, 1, 'Madeleine', 'Langlois', 'Alger', '0745467755'),
(219129, 1, 'Luc', 'Blais', 'Agadir', '0745645462'),
(219130, 1, 'Denise', 'Moreau', 'Tiznit', '0745135454'),
(219131, 1, 'Antoine', 'Leduc', 'Marrakech', '0789765476'),
(219132, 1, 'Pauline', 'Leduc', 'Rabat', '0746578476'),
(219133, 1, 'Marie', 'Turcotte', 'Agadir', '0787643476'),
(219134, 1, 'Élise', 'Renard', 'Agadir', '0749765896'),
(219135, 1, 'Yves', 'Plante', 'Tiznit', '0743563216'),
(219136, 1, 'Anaïs', 'Cyr', 'Tiznit', '0743350276'),
(219137, 1, 'Eugénie', 'Bélanger', 'Marrakech', '0698550276'),
(219138, 1, 'Guy', 'Lepage', 'Marrakech', '0698789561'),
(219139, 1, 'Guyane', 'Farpage', 'Marrakech', '0698689561'),
(219140, 1, 'Éric', 'Boisvert', 'Rabat', '0696751561'),
(219141, 1, 'Gabriel', 'Tessier', 'Rabat', '0676975561'),
(219142, 1, 'Danielle', 'Charbonneau', 'Agadir', '0643947458'),
(219143, 1, 'Nicole-Françoise', 'Dionne', 'Agadir', '0644378998'),
(219144, 1, 'Audrey', 'Lemieux', 'Tiznit', '0676235309'),
(219145, 1, 'Henri', 'Legault-Côté', 'Tiznit', '0683231209'),
(219146, 1, 'Étienne', 'Proulx', 'Rabat', '0647638979'),
(219147, 1, 'Louise-Isabelle', 'Caron', 'Rabat', '0671234532'),
(219148, 1, 'Jeannine', 'Bélanger', 'Rabat', '0647800232'),
(219149, 1, 'Isaac', 'Dionne', 'Agadir', '0649000962'),
(219150, 1, 'Dominique', 'Giguère-Leblanc', 'Agadir', '0688887503'),
(219151, 1, 'Honoré', 'Desjardins', 'Marrakech', '0677697503'),
(219200, 1, 'Lucius', 'Aaron', 'Quebec', '0918750258'),
(219201, 1, 'Orson', 'Thomas', 'Tamazirt', '0957121996'),
(219202, 1, 'Jamal', 'Timon', 'Tizi Ouzou', '0124034991'),
(219203, 1, 'Tate', 'Orson', 'Alger', '0369314485'),
(219204, 1, 'Cruz', 'Vaughan', 'Bejaia', '0521675524'),
(219205, 1, 'Omar', 'Zeus', 'Tizi Ouzou', '0349295052'),
(219206, 1, 'Wyatt', 'Abdul', 'Tizi Ouzou', '0828962559'),
(219207, 1, 'Harrison', 'Addison', 'Bejaia', '0910799083'),
(219208, 1, 'Ira', 'Steven', 'Alger', '0346303751'),
(219209, 1, 'Kevin', 'Abbot', 'Alger', '0812672140'),
(219210, 1, 'Shad', 'Tobias', 'Andhra Pradesh', '0110281079'),
(219211, 1, 'Jeremy', 'Brody', 'Tipaza', '0408163982'),
(219212, 1, 'Ulysses', 'Aristotle', 'Larbaa nath irathen', '0829890012'),
(219213, 1, 'Clarke', 'Hyatt', 'Larbaa nath irathen', '0882867581'),
(219214, 1, 'Scott', 'Rogan', 'Michelet', '0268642043'),
(219215, 1, 'Armand', 'Palmer', 'Larbaa nath irathen', '0578445958'),
(219216, 1, 'Cameron', 'Abbot', 'Michelet', '0140296777'),
(219217, 1, 'Merritt', 'Stephen', 'Michelet', '0651078764'),
(219218, 1, 'Lucius', 'Tucker', 'Boughni', '0576859562'),
(219219, 1, 'Theodore', 'Phillip', 'Michelet', '0284548984'),
(219220, 1, 'Xanthus', 'Griffin', 'Ifarhounen', '0543085475'),
(219221, 1, 'Kirk', 'Nathaniel', 'Ait mimoun', '0390010782'),
(219222, 1, 'Ferris', 'Merritt', 'Lvav', '0465360539'),
(219223, 1, 'Prescott', 'Ray', 'Lvav', '0337087436'),
(219224, 1, 'Ferris', 'Ishmael', 'Lvav', '0570076084'),
(219225, 1, 'Cedric', 'Darius', 'Lvav', '0599922781'),
(219226, 1, 'Davis', 'Chaney', 'Lvav', '0267343661'),
(219227, 1, 'Oliver', 'Palmer', 'Adni', '0786446785'),
(219228, 1, 'Geoffrey', 'Cadman', 'Taourirt Ait Manguellet', '0861705554'),
(219229, 1, 'Adrian', 'Chaney', 'Taourirt Ait Manguellet', '0467879647'),
(219230, 1, 'Elijah', 'Hamish', 'Taourirt Ait Manguellet', '0726253800'),
(219231, 1, 'Mohammad', 'Steel', 'Taourirt Ait Manguellet', '0156505293'),
(219232, 1, 'Colton', 'Rogan', 'Taourirt Ait Manguellet', '0762834791'),
(219233, 1, 'Brian', 'Jordan', 'Taourirt Ait Manguellet', '0372356427'),
(219234, 1, 'Brett', 'Brendan', 'Taourirt Ait Manguellet', '0134175590'),
(219235, 1, 'Louis', 'Trevor', 'Ahechad', '0837865238'),
(219236, 1, 'Labchri', 'Koceila', 'Ahechad', '0276810576'),
(219237, 1, 'Gage', 'Wallace', 'Larbaa nath irathen', '0291700439'),
(219238, 1, 'Hoyt', 'Hu', 'Larbaa nath irathen', '0430609076'),
(219239, 1, 'Edan', 'Gary', 'Larbaa nath irathen', '0124183194'),
(219240, 1, 'Talon', 'Yardley', 'Larbaa nath irathen', '0339224756'),
(219241, 1, 'Rooney', 'Jerome', 'Larbaa nath irathen', '0756520885'),
(219242, 1, 'Cain', 'Carson', 'Tizi Ouzou', '0982322343'),
(219243, 1, 'Colin', 'Eric', 'Bejaia', '0397539294'),
(219244, 1, 'Kennan', 'Davis', 'Bouira', '048638511'),
(219245, 1, 'Tanner', 'Armando', 'Bouira', '0306750091'),
(219246, 1, 'Kane', 'Samson', 'Bouira', '0947139357'),
(219247, 1, 'Marsden', 'Kelly', 'Boumerdas', '0529834864'),
(219248, 1, 'Leonard', 'Kevin', 'Boumerdas', '0201543320'),
(219249, 1, 'Stewart', 'Dieter', 'Boumerdas', '0702294597');

-- --------------------------------------------------------

--
-- Structure de la table `Compagnie`
--

CREATE TABLE `Compagnie` (
  `nom_compagnie` varchar(50) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Compagnie`
--

INSERT INTO `Compagnie` (`nom_compagnie`, `date_creation`, `pays`) VALUES
('Air Algerie', '1947-03-15', 'Algerie'),
('Air France', '1933-10-07', 'France'),
('Royal Air Maroc', '1955-06-11', 'Maroc');

-- --------------------------------------------------------

--
-- Structure de la table `Ligne_vol`
--

CREATE TABLE `Ligne_vol` (
  `num_ligne` int(11) NOT NULL,
  `Aeroport_depart` varchar(50) NOT NULL,
  `Aeroport_arrivee` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Ligne_vol`
--

INSERT INTO `Ligne_vol` (`num_ligne`, `Aeroport_depart`, `Aeroport_arrivee`) VALUES
(300, 'HB-Alger', 'CDG-Paris'),
(301, 'CDG-Paris', 'HB-Alger'),
(302, 'HB-Alger', 'ORLY-Paris'),
(303, 'ORLY-Paris', 'HB-Alger'),
(304, 'HB-Alger', 'AS-Madrid'),
(305, 'AS-Madrid', 'HB-Alger'),
(306, 'HB-Alger', 'LDV-Rome'),
(307, 'LDV-Rome', 'HB-Alger'),
(308, 'CDG-Paris', 'LDV-Rome'),
(309, 'LDV-Rome', 'CDG-Paris'),
(310, 'ORLY-Paris', 'AS-Madrid'),
(311, 'AS-Madrid', 'ORLY-Paris'),
(312, 'ORLY-Paris', 'AGA-Al Massira'),
(313, 'AGA-Al Massira', 'ORLY-Paris'),
(314, 'AGA-Al Massira', 'CDG-Paris'),
(315, 'CDG-Paris', 'AGA-Al Massira'),
(316, 'RAK-Menara', 'CDG-Paris'),
(317, 'CDG-Paris', 'RAK-Menara'),
(318, 'ORLY-Paris', 'RAK-Menara'),
(319, 'RAK-Menara', 'ORLY-Paris'),
(320, 'ORLY-Paris', 'RBA-Sale'),
(321, 'RBA-Sale', 'ORLY-Paris'),
(322, 'RBA-Sale', 'CDG-Paris'),
(323, 'CDG-Paris-Paris', 'RBA-Sale'),
(324, 'RBA-Sale', 'AS-Madrid'),
(325, 'AS-Madrid', 'RBA-Sale'),
(326, 'AGA-Al Massira', 'AS-Madrid'),
(327, 'AS-Madrid', 'AGA-Al Massira'),
(328, 'AGA-Al Massira', 'HB-Alger'),
(329, 'HB-Alger', 'AGA-Al Massira');

-- --------------------------------------------------------

--
-- Structure de la table `Membres_equipages`
--

CREATE TABLE `Membres_equipages` (
  `num_employe` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `date_embauche` date DEFAULT NULL,
  `nom_compagnie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Membres_equipages`
--

INSERT INTO `Membres_equipages` (`num_employe`, `nom`, `prenom`, `date_embauche`, `nom_compagnie`) VALUES
(15000, 'Eaton', 'Eric', '2007-05-26', 'Air Algerie'),
(15001, 'Clark', 'Timon', '2007-04-26', 'Air Algerie'),
(15002, 'Stewart', 'Marah', '2007-05-26', 'Air Algerie'),
(15003, 'Maxwell', 'Amela', '2007-03-26', 'Air Algerie'),
(15004, 'Brendan', 'Emery', '2007-01-26', 'Air Algerie'),
(15005, 'Kasimir', 'Carlos', '2007-08-26', 'Air Algerie'),
(15006, 'Warren', 'Oscar', '2007-12-16', 'Air Algerie'),
(15007, 'Merritt', 'Deirdre', '2008-05-26', 'Air Algerie'),
(15008, 'Timon', 'Signe', '2006-04-26', 'Air Algerie'),
(15009, 'Linus', 'Abbot', '2009-05-26', 'Air Algerie'),
(15010, 'Nicholas', 'Zachary', '2007-05-26', 'Air Algerie'),
(15011, 'Tobias', 'Jonah', '2010-05-26', 'Air Algerie'),
(15012, 'Lawrence', 'Shad', '2007-12-26', 'Air Algerie'),
(15013, 'Jack', 'Bert', '2007-05-20', 'Air Algerie'),
(15014, 'Carson', 'Jason', '2009-05-26', 'Air Algerie'),
(15015, 'William', 'Julian', '2008-05-26', 'Air Algerie'),
(15016, 'Chaim', 'Dalton', '2011-05-26', 'Air Algerie'),
(15017, 'Alvin', 'Jasmine', '2012-05-26', 'Air Algerie'),
(15018, 'Flynn', 'Anthony', '2010-04-20', 'Air Algerie'),
(15019, 'Chaim', 'Wing', '2002-04-19', 'Air Algerie'),
(15020, 'Maatoub', 'Lounes', '2000-12-26', 'Air Algerie'),
(15021, 'Ait Manguellet', 'Lounis', '2004-05-26', 'Air Algerie'),
(15022, 'Aissat', 'Idir', '2007-05-26', 'Air Algerie'),
(15023, 'Benbout', 'Samir', '2007-02-16', 'Air Algerie'),
(15024, 'Labchri', 'Amayas', '2001-12-26', 'Air Algerie'),
(15025, 'Labchri', 'Yacine', '2005-05-26', 'Air Algerie'),
(15026, 'Ait Ahmed', 'Hocine', '2000-02-26', 'Air Algerie'),
(15027, 'Abban', 'Ramdan', '2003-05-26', 'Air Algerie'),
(16000, 'Lyle', 'Carly', '2007-05-26', 'Air France'),
(16001, 'Amos', 'Harper', '2001-01-26', 'Air France'),
(16002, 'August', 'Wylie', '2007-02-26', 'Air France'),
(16003, 'Keefe', 'Grady', '2011-03-26', 'Air France'),
(16004, 'Trevor', 'Clementine', '2007-05-26', 'Air France'),
(16005, 'Caleb', 'Isaac', '2007-05-26', 'Air France'),
(16006, 'Kareem', 'Brett', '2007-05-26', 'Air France'),
(16007, 'Brock', 'Kevyn', '2007-05-26', 'Air France'),
(16008, 'Duncan', 'Haviva', '2010-03-26', 'Air France'),
(16009, 'Tyler', 'Coby', '2010-05-26', 'Air France'),
(16010, 'Upton', 'Brandon', '2007-05-26', 'Air France'),
(16011, 'Buckminster', 'Aretha', '2007-05-26', 'Air France'),
(16012, 'Ralph', 'Marvin', '2007-05-23', 'Air France'),
(16013, 'Dillon', 'Hakeem', '2003-03-23', 'Air France'),
(16014, 'Cody', 'Ryan', '2007-05-21', 'Air France'),
(16015, 'Seth', 'April', '2006-08-22', 'Air France'),
(16016, 'Arsenio', 'Scott', '2004-12-26', 'Air France'),
(16017, 'Todd', 'Anika', '2007-05-26', 'Air France'),
(16018, 'Aquila', 'Serena', '2007-05-26', 'Air France'),
(16019, 'Bert', 'May', '2007-05-26', 'Air France'),
(16020, 'Clark', 'Nicole', '2007-05-26', 'Air France'),
(16021, 'Fitzgerald', 'Macaulay', '2007-05-26', 'Air France'),
(16022, 'Carl', 'Byron', '2007-05-26', 'Air France'),
(16023, 'Aladdin', 'Bradley', '2009-06-26', 'Air France'),
(16024, 'Balzac', 'Henre', '2007-06-20', 'Air France'),
(16025, 'Hugo', 'Victor', '2004-07-26', 'Air France'),
(16026, 'Mouliere', 'Jean', '2004-05-26', 'Air France'),
(16027, 'Anchelotti', 'Carl', '2003-03-26', 'Air France'),
(16028, 'Stephane', 'Curry', '2002-06-16', 'Air France'),
(16029, 'Blatter', 'Joseph', '2001-05-26', 'Air France'),
(17000, 'Nicolas-Gilles', 'Lachance', '2007-05-26', 'Royal Air Maroc'),
(17001, 'Bernard', 'Arsenault', '2002-01-26', 'Royal Air Maroc'),
(17002, 'Michèle', 'Drouin', '2005-02-26', 'Royal Air Maroc'),
(17003, 'Keefe', 'Grady', '2013-03-26', 'Royal Air Maroc'),
(17004, 'Mathieu', 'Desjardins', '2007-05-26', 'Royal Air Maroc'),
(17005, 'Hélène', 'Leclerc-Vaillancourt', '2007-05-26', 'Royal Air Maroc'),
(17006, 'Pénélope', 'Beaudoin', '2006-05-26', 'Royal Air Maroc'),
(17007, 'Timothée', 'Champagne', '2007-05-26', 'Royal Air Maroc'),
(17008, 'Charles', 'Bernier-Renaud', '2012-03-26', 'Royal Air Maroc'),
(17009, 'Philippe', 'Martin-Landry', '2011-05-26', 'Royal Air Maroc'),
(17010, 'Stéphane', 'Boisvert', '2007-05-26', 'Royal Air Maroc'),
(17011, 'Martin', 'Aretha', '2004-05-26', 'Royal Air Maroc'),
(17012, 'Nathalie', 'Boucher-Thériault', '2008-05-23', 'Royal Air Maroc'),
(17013, 'Michelle', 'Langlois', '2003-03-23', 'Royal Air Maroc'),
(17014, 'Eugénie', 'Rousseau', '2007-05-21', 'Royal Air Maroc'),
(17015, 'Alain', 'Blanchette', '2006-08-22', 'Royal Air Maroc'),
(17016, 'Eve', 'Drouin', '2004-12-26', 'Royal Air Maroc'),
(17017, 'Frédérique', 'Richard', '2007-05-26', 'Royal Air Maroc'),
(17018, 'Sylvie', 'Nadeau', '2007-05-26', 'Royal Air Maroc'),
(17019, 'Alfred', 'Bélanger', '2007-05-26', 'Royal Air Maroc'),
(17020, 'Jules', 'Nicole', '2007-05-26', 'Royal Air Maroc'),
(17021, 'Laurent', 'Nguyen-Jean', '2007-05-26', 'Royal Air Maroc'),
(17022, 'Pierre', 'Lauzon', '2007-05-26', 'Royal Air Maroc'),
(17023, 'Nicole', 'Grenier', '2009-06-26', 'Royal Air Maroc'),
(17024, 'Patrice', 'Harvey', '2007-06-20', 'Royal Air Maroc'),
(17025, 'Julie', 'Ménard', '2006-07-26', 'Royal Air Maroc'),
(17026, 'Aimé', 'Poirier', '2004-05-26', 'Royal Air Maroc'),
(17027, 'Frédéric', 'Carl', '2004-03-26', 'Royal Air Maroc'),
(17028, 'Stephane', 'Bélanger-Drouin', '2004-06-16', 'Royal Air Maroc'),
(17029, 'Vincent', 'Cyr', '2005-05-26', 'Royal Air Maroc');

-- --------------------------------------------------------

--
-- Structure de la table `Pilote`
--

CREATE TABLE `Pilote` (
  `num_pilote` int(11) NOT NULL,
  `nb_vol_effectues` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Pilote`
--

INSERT INTO `Pilote` (`num_pilote`, `nb_vol_effectues`) VALUES
(15020, 1),
(15021, 1),
(15022, 0),
(15023, 0),
(15024, 0),
(15025, 0),
(15026, 0),
(15027, 0),
(16024, 1),
(16025, 0),
(16026, 0),
(16027, 1),
(16028, 0),
(16029, 0),
(17004, 0),
(17008, 0),
(17012, 0),
(17017, 1),
(17023, 0),
(17028, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Piloter`
--

CREATE TABLE `Piloter` (
  `num_pilote` int(11) NOT NULL,
  `num_vol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Piloter`
--

INSERT INTO `Piloter` (`num_pilote`, `num_vol`) VALUES
(15020, 4000),
(15021, 4000),
(16024, 4010),
(16027, 4010),
(17017, 4004),
(17028, 4004);

-- --------------------------------------------------------

--
-- Structure de la table `Vol`
--

CREATE TABLE `Vol` (
  `num_vol` int(11) NOT NULL,
  `date_heure_dep` datetime NOT NULL,
  `date_heure_arv` datetime NOT NULL,
  `num_ligne` int(11) NOT NULL,
  `num_avion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Vol`
--

INSERT INTO `Vol` (`num_vol`, `date_heure_dep`, `date_heure_arv`, `num_ligne`, `num_avion`) VALUES
(4000, '2020-12-20 17:45:00', '2020-12-20 19:20:00', 300, 100),
(4001, '2020-12-20 17:45:00', '2020-12-20 19:20:00', 301, 101),
(4002, '2020-02-20 16:40:00', '2020-11-20 18:40:00', 302, 100),
(4003, '2020-02-20 15:40:00', '2020-11-20 18:40:00', 303, 103),
(4004, '2021-04-24 11:35:00', '2021-04-24 14:40:00', 312, 110),
(4005, '2021-04-24 12:40:00', '2021-04-24 15:55:00', 313, 108),
(4006, '2021-01-14 06:15:00', '2021-01-14 10:00:00', 320, 109),
(4007, '2021-01-14 13:10:00', '2021-01-14 16:20:00', 321, 111),
(4008, '2021-02-09 00:30:00', '2021-02-09 04:40:00', 318, 111),
(4009, '2021-02-09 23:15:00', '2021-02-09 03:05:00', 319, 110),
(4010, '2021-07-05 09:55:00', '2021-07-05 13:05:00', 316, 106),
(4011, '2021-07-05 17:40:00', '2021-07-05 22:00:00', 317, 108);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Affecter`
--
ALTER TABLE `Affecter`
  ADD PRIMARY KEY (`num_employe`,`num_vol`),
  ADD KEY `num_vol` (`num_vol`);

--
-- Index pour la table `Avion`
--
ALTER TABLE `Avion`
  ADD PRIMARY KEY (`num_avion`),
  ADD KEY `nom_compagnie` (`nom_compagnie`);

--
-- Index pour la table `Bagages`
--
ALTER TABLE `Bagages`
  ADD PRIMARY KEY (`num_bagages`),
  ADD KEY `num_passeport` (`num_passeport`),
  ADD KEY `num_reservation` (`num_reservation`);

--
-- Index pour la table `Billet`
--
ALTER TABLE `Billet`
  ADD PRIMARY KEY (`num_reservation`),
  ADD KEY `num_passeport` (`num_passeport`),
  ADD KEY `nom_compagnie` (`nom_compagnie`),
  ADD KEY `num_vol` (`num_vol`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`num_passeport`);

--
-- Index pour la table `Compagnie`
--
ALTER TABLE `Compagnie`
  ADD PRIMARY KEY (`nom_compagnie`);

--
-- Index pour la table `Ligne_vol`
--
ALTER TABLE `Ligne_vol`
  ADD PRIMARY KEY (`num_ligne`);

--
-- Index pour la table `Membres_equipages`
--
ALTER TABLE `Membres_equipages`
  ADD PRIMARY KEY (`num_employe`),
  ADD KEY `nom_compagnie` (`nom_compagnie`);

--
-- Index pour la table `Pilote`
--
ALTER TABLE `Pilote`
  ADD PRIMARY KEY (`num_pilote`);

--
-- Index pour la table `Piloter`
--
ALTER TABLE `Piloter`
  ADD PRIMARY KEY (`num_pilote`,`num_vol`),
  ADD KEY `num_vol` (`num_vol`);

--
-- Index pour la table `Vol`
--
ALTER TABLE `Vol`
  ADD PRIMARY KEY (`num_vol`),
  ADD KEY `num_ligne` (`num_ligne`),
  ADD KEY `num_avion` (`num_avion`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Affecter`
--
ALTER TABLE `Affecter`
  ADD CONSTRAINT `Affecter_ibfk_1` FOREIGN KEY (`num_employe`) REFERENCES `Membres_equipages` (`num_employe`),
  ADD CONSTRAINT `Affecter_ibfk_2` FOREIGN KEY (`num_vol`) REFERENCES `Vol` (`num_vol`);

--
-- Contraintes pour la table `Avion`
--
ALTER TABLE `Avion`
  ADD CONSTRAINT `Avion_ibfk_1` FOREIGN KEY (`nom_compagnie`) REFERENCES `Compagnie` (`nom_compagnie`);

--
-- Contraintes pour la table `Bagages`
--
ALTER TABLE `Bagages`
  ADD CONSTRAINT `Bagages_ibfk_1` FOREIGN KEY (`num_passeport`) REFERENCES `Client` (`num_passeport`),
  ADD CONSTRAINT `Bagages_ibfk_2` FOREIGN KEY (`num_reservation`) REFERENCES `Billet` (`num_reservation`);

--
-- Contraintes pour la table `Billet`
--
ALTER TABLE `Billet`
  ADD CONSTRAINT `Billet_ibfk_1` FOREIGN KEY (`num_passeport`) REFERENCES `Client` (`num_passeport`),
  ADD CONSTRAINT `Billet_ibfk_2` FOREIGN KEY (`nom_compagnie`) REFERENCES `Compagnie` (`nom_compagnie`),
  ADD CONSTRAINT `Billet_ibfk_3` FOREIGN KEY (`num_vol`) REFERENCES `Vol` (`num_vol`);

--
-- Contraintes pour la table `Membres_equipages`
--
ALTER TABLE `Membres_equipages`
  ADD CONSTRAINT `Membres_equipages_ibfk_1` FOREIGN KEY (`nom_compagnie`) REFERENCES `Compagnie` (`nom_compagnie`);

--
-- Contraintes pour la table `Pilote`
--
ALTER TABLE `Pilote`
  ADD CONSTRAINT `Pilote_ibfk_1` FOREIGN KEY (`num_pilote`) REFERENCES `Membres_equipages` (`num_employe`);

--
-- Contraintes pour la table `Piloter`
--
ALTER TABLE `Piloter`
  ADD CONSTRAINT `Piloter_ibfk_1` FOREIGN KEY (`num_pilote`) REFERENCES `Pilote` (`num_pilote`),
  ADD CONSTRAINT `Piloter_ibfk_2` FOREIGN KEY (`num_vol`) REFERENCES `Vol` (`num_vol`);

--
-- Contraintes pour la table `Vol`
--
ALTER TABLE `Vol`
  ADD CONSTRAINT `Vol_ibfk_1` FOREIGN KEY (`num_ligne`) REFERENCES `Ligne_vol` (`num_ligne`),
  ADD CONSTRAINT `Vol_ibfk_2` FOREIGN KEY (`num_avion`) REFERENCES `Avion` (`num_avion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

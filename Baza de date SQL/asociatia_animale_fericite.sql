-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Feb 01, 2021 at 05:11 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asociatia_animale_fericite`
--

-- --------------------------------------------------------

--
-- Table structure for table `adaposturi`
--

DROP TABLE IF EXISTS `adaposturi`;
CREATE TABLE IF NOT EXISTS `adaposturi` (
  `Id_Adapost` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(255) NOT NULL,
  `Numar_Telefon` int(10) NOT NULL,
  `Adresa_Mail` varchar(100) NOT NULL,
  `Capacitate_Maxima` int(11) NOT NULL,
  `Responsabil_Adoptii` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Adapost`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adaposturi`
--

INSERT INTO `adaposturi` (`Id_Adapost`, `Nume`, `Numar_Telefon`, `Adresa_Mail`, `Capacitate_Maxima`, `Responsabil_Adoptii`) VALUES
(1, 'CFS – BUCOV', 244275702, 'adapostploiesti@yahoo.com', 300, 'Aron Andrei'),
(4, 'ANCA HELPS ANIMALS', 748515886, 'ANCAHELPSANIMALS@yahoo.com', 400, 'Marcel Pavel'),
(5, 'VETERIMED CONTEL SRL', 729470562, 'VETERIMED@yahoo.com', 360, 'Oprea Alexandru'),
(6, 'CFS BOLDESTI -SCAENI', 244211468, 'emiliaherescu@yahoo.com', 250, 'Carol Andrei'),
(7, 'ALEXTIB CONS. SRL', 729470562, 'alex.chirobocea@gmail.com', 460, 'Sava Andrei'),
(8, 'HOPE FOR ROMANIAN STRAYS', 725949288, 'hopeforstrays@yahoo.com', 420, 'Dinca Marius'),
(9, 'SPGA CONSILIUL LOCAL BRASOV', 268543815, 'spgabv@yahoo.com', 350, 'Homeghi Gabriel'),
(10, 'MILIOANE DE PRIETENI', 268471202, 'milioanedeprieteni@gmail.com', 350, 'David Ioana'),
(11, 'SC ANIMALE FARA STAPAN', 723658816, 'NăstaseGheorghe@yahoo.com', 120, 'Năstase Gheorghe'),
(12, 'DMPA CODLEA', 758100511, 'dpmpa_bv@yahoo.com', 290, 'Tehn. Damian Liviu'),
(13, 'Centrul Teritorial De Adăpostire şi Protecţie Temporară a Animalelor', 214904007, 'politiaanimalelor@politialocalasector1.ro', 900, 'Ene Graţiela'),
(14, 'ASOCIATIA DOG RESCUE ROMANIA', 751113815, 'hofmannrudolf76@gmail.com', 300, 'Hofmann Rudolf'),
(15, 'ASPA BUCURESTI', 213452740, 'DumitruDaniel@aspa.ro', 200, 'Dumitru Daniel'),
(16, 'PRIETENII ANIMALELOR ROMANIA', 765416100, 'aparomania@yahoo.com', 600, 'dr. Moise Ionut'),
(17, 'CENTRUL DE ECARISAJ TURDA', 742010480, 'aceturda2016@yahoo.ro', 250, 'dr. Ciobanu Nicolae'),
(18, 'CGCFS CLUJ', 264415788, 'cgcfs@centru-caini.radpcj.ro', 280, 'dr. Mioara Macrinici'),
(19, 'SC ADP GHERLA SA', 264241912, 'adpgherla@yahoo.com', 120, 'dr. Roxana Dobocan'),
(20, 'SC NOVAVET SRL TURDA', 742010480, 'aceturda2016@yahoo.ro', 180, ' dr. Ciobanu Nicolae');

-- --------------------------------------------------------

--
-- Table structure for table `adoptii`
--

DROP TABLE IF EXISTS `adoptii`;
CREATE TABLE IF NOT EXISTS `adoptii` (
  `Id_Adoptie` int(11) NOT NULL AUTO_INCREMENT,
  `Status_Adoptie` enum('In Curs De Verificare','Aprobata','Refuzata') NOT NULL,
  `Id_Client` int(11) NOT NULL,
  `Data_Adoptie` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_Adoptie`),
  KEY `clienti` (`Id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adoptii`
--

INSERT INTO `adoptii` (`Id_Adoptie`, `Status_Adoptie`, `Id_Client`) VALUES
(1, 'In Curs De Verificare', 1),
(2, 'Aprobata', 2),
(3, 'Refuzata', 3),
(4, 'Aprobata', 4),
(5, 'In Curs De Verificare', 5),
(6, 'Aprobata', 6),
(7, 'Refuzata', 7),
(8, 'In Curs De Verificare', 8),
(9, 'Aprobata', 9),
(10, 'Aprobata', 10),
(11, 'In Curs De Verificare', 11),
(12, 'Aprobata', 12),
(13, 'Refuzata', 13),
(14, 'In Curs De Verificare', 14),
(15, 'Aprobata', 15),
(16, 'In Curs De Verificare', 16),
(17, 'Refuzata', 17),
(18, 'Aprobata', 18),
(19, 'Aprobata', 19),
(20, 'In Curs De Verificare', 20);

-- --------------------------------------------------------

--
-- Table structure for table `adrese`
--

DROP TABLE IF EXISTS `adrese`;
CREATE TABLE IF NOT EXISTS `adrese` (
  `Id_Adresa` int(11) NOT NULL AUTO_INCREMENT,
  `Nr_Adresa` int(11) NOT NULL,
  `Cod_Postal` int(11) NOT NULL,
  `Judet` varchar(30) NOT NULL,
  `Strada` varchar(255) NOT NULL,
  `Localitate` varchar(255) NOT NULL,
  `Id_Adapost` int(11) NOT NULL,
  PRIMARY KEY (`Id_Adresa`),
  KEY `adaposturi` (`Id_Adapost`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adrese`
--

INSERT INTO `adrese` (`Id_Adresa`, `Nr_Adresa`, `Cod_Postal`, `Judet`, `Strada`, `Localitate`, `Id_Adapost`) VALUES
(7, 535, 689452, 'Pragova', 'D.N. 1B  Km 11', 'Bucov', 1),
(8, 12, 6594, 'Prahova', 'Valea Pietrii', 'Urlati', 4),
(9, 30, 658589, 'Prahova', 'Fabricii', 'Campina', 5),
(10, 1, 56423, 'Prahova', 'Calea Unirii', 'Boldești Scăeni', 6),
(11, 14, 6555465, 'Prahova', 'Fabricii', 'Campina', 7),
(12, 1, 65485, 'Prahova', 'Principală', 'Târgşoru Vechi', 8),
(13, 6, 885213, 'Brasov', 'Merilor', 'Brasov', 9),
(14, 10, 654825, 'Brasov', 'Fundatura Harmanului', 'Braşov', 10),
(15, 25, 522154, 'Brasov', 'Baraj Turcu', 'Zărneşti', 11),
(16, 101, 54813, 'Brasov', 'Hălchiului', 'Codlea', 12),
(17, 3, 545451, 'Bucuresti', 'Șos. Odăii', 'Sector 1', 13),
(18, 4, 6545216, 'Bucuresti', 'Releului', 'Sector 3', 14),
(19, 262, 245654, 'Bucuresti', 'Bd. Theodor Pallady', 'Sector 3', 15),
(20, 69, 44545541, 'Bucuresti', 'Drumul Săbăreni', 'Sector 6', 16),
(21, 12, 65448, 'Cluj', 'Bogata', 'Turda', 17),
(22, 65, 546510, 'Cluj', ' Bobalnei', 'Cluj Napoca', 18),
(23, 10, 5461, 'Cluj', 'Gelu', 'Gherla', 19),
(24, 12, 6451, 'Cluj', 'Bogata', 'Turda', 20);

-- --------------------------------------------------------

--
-- Table structure for table `animale`
--

DROP TABLE IF EXISTS `animale`;
CREATE TABLE IF NOT EXISTS `animale` (
  `Id_Animal` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(50) NOT NULL,
  `Talie` enum('Mica','Medie','Mare','Urias') NOT NULL,
  `Culoare` varchar(40) NOT NULL,
  `Adult/Pui` enum('Adult','Pui') NOT NULL,
  `Rasa/Specie` varchar(50) NOT NULL,
  `Stare_Sanatate` enum('Sanatos','Bolnav','Sub_Tratament') NOT NULL,
  `Temperament` enum('Prietenos','Sperios','Agresiv','Somnoros','Vulcanic','Energic') NOT NULL,
  `Sex` enum('Masculin','Feminin') NOT NULL,
  `Id_Adapost` int(11) NOT NULL,
  `Id_Adoptie` int(11) NOT NULL,
  PRIMARY KEY (`Id_Animal`),
  KEY `Adaposturi` (`Id_Adapost`),
  KEY `Adoptii` (`Id_Adoptie`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `animale`
--

INSERT INTO `animale` (`Id_Animal`, `Nume`, `Talie`, `Culoare`, `Adult/Pui`, `Rasa/Specie`, `Stare_Sanatate`, `Temperament`, `Sex`, `Id_Adapost`, `Id_Adoptie`) VALUES
(1, 'Bingo', 'Mica', 'Marou', '', 'Bishon', 'Sanatos', 'Prietenos', 'Masculin', 1, 1),
(2, 'Alvin', 'Medie', 'rosie', '', 'Birmaneza', 'Sub_Tratament', 'Sperios', 'Feminin', 4, 2),
(3, 'Angel', 'Mare', 'Multicolor', '', 'Stacojiu', 'Sanatos', 'Energic', 'Masculin', 5, 3),
(4, 'Azor', 'Urias', 'Negru', '', 'Ciobanesc Caucazian', 'Bolnav', 'Somnoros', 'Masculin', 6, 4),
(5, 'Boto', 'Mica', 'Alb', '', 'Balineza', 'Sanatos', 'Agresiv', 'Masculin', 7, 5),
(6, 'Buddy', 'Medie', 'rosu', '', 'Amorez', 'Sub_Tratament', 'Energic', 'Feminin', 8, 6),
(7, 'Bruno', 'Medie', 'Alb', '', 'water dog', 'Sanatos', 'Sperios', 'Feminin', 9, 7),
(8, 'Coco', 'Mare', 'Neagra', '', 'Albastra de rusia', 'Sanatos', 'Prietenos', 'Masculin', 10, 8),
(9, 'Tweety', 'Urias', 'Multicolor', '', 'Amazonian', 'Sanatos', 'Prietenos', 'Feminin', 11, 9),
(10, 'Sunny', 'Mica', 'Galben', '', 'Perusii', 'Sanatos', 'Vulcanic', 'Masculin', 12, 10),
(11, 'Charlie', 'Mica', 'Auriu', '', 'Cu capul auriu', 'Sub_Tratament', 'Prietenos', 'Feminin', 13, 11),
(12, 'Dora', 'Mica', 'Rosiatic', '', 'Bichon Havanez', 'Sanatos', 'Sperios', 'Feminin', 14, 12),
(13, 'Dino', 'Mica', 'Alb', '', 'Bichon Maltese', 'Sanatos', 'Energic', 'Masculin', 15, 13),
(14, 'Hara', 'Mare', 'Marou', '', 'Boxer', 'Sanatos', 'Vulcanic', 'Feminin', 16, 14),
(15, 'Hector', 'Mare', 'Negru', '', 'Bulldog American', 'Sanatos', 'Prietenos', 'Masculin', 17, 15),
(16, 'Nero', 'Mica', 'Maroniu', '', 'Chihuahua', 'Sanatos', 'Somnoros', 'Masculin', 18, 16),
(17, 'Felix', 'Medie', 'Alba', '', 'Burmeza', 'Sub_Tratament', 'Sperios', 'Masculin', 19, 17),
(18, 'Burmi', 'Medie', 'Gri', '', 'Burmilla', 'Sub_Tratament', 'Somnoros', 'Feminin', 20, 18),
(19, 'Fifi', 'Medie', 'Tigrata', '', 'Bengaleza', 'Sanatos', 'Sperios', 'Feminin', 9, 19),
(20, 'Figo', 'Mare', 'Alb', 'Adult', 'Umbrela', 'Sanatos', 'Prietenos', 'Masculin', 12, 20);

-- --------------------------------------------------------

--
-- Table structure for table `catei`
--

DROP TABLE IF EXISTS `catei`;
CREATE TABLE IF NOT EXISTS `catei` (
  `Castrat` enum('Castrat','Necastrat') NOT NULL,
  `Alergeni` enum('Da','Nu') NOT NULL,
  `Tipui_Caini` enum('Caini_lupta','caini_apartament','Caini_buzunar','Caini_paza','Caini_vanatoare','Caini_apa','Caini_ciobanesti') NOT NULL,
  `Id_Animal` int(11) NOT NULL,
  KEY `animale` (`Id_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catei`
--

INSERT INTO `catei` (`Castrat`, `Alergeni`, `Tipui_Caini`, `Id_Animal`) VALUES
('Necastrat', '', 'caini_apartament', 1),
('Castrat', '', 'Caini_ciobanesti', 4),
('Necastrat', 'Nu', 'Caini_apa', 7),
('Necastrat', 'Nu', 'caini_apartament', 12),
('Castrat', 'Nu', 'caini_apartament', 13),
('Castrat', 'Da', 'Caini_lupta', 14),
('Necastrat', 'Da', 'Caini_lupta', 15),
('Castrat', 'Nu', 'Caini_buzunar', 16);

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
CREATE TABLE IF NOT EXISTS `clienti` (
  `Id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(100) NOT NULL,
  `Prenume` varchar(100) NOT NULL,
  `Nr_Telefon` int(10) NOT NULL,
  `Adresa_Mail` varchar(30) NOT NULL,
  `Oras` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`Id_Client`, `Nume`, `Prenume`, `Nr_Telefon`, `Adresa_Mail`, `Oras`) VALUES
(1, 'Manea', 'Robert', 730006185, 'manearobert@yahoo.com', 'Ploiesti'),
(2, 'Aron', 'Andrei', 730006185, 'aronandrei@gmail.com', 'Campina'),
(3, 'Savu', 'Andrei', 730006185, 'savuandrei@yahoo.com', 'Campina'),
(4, 'Stoica', 'Marin', 730006185, 'stoicamarin@yahoo.com', 'Valeni De Munte'),
(5, 'Alexe', 'Viorel', 730006185, 'alexeviorel@gamil.com', 'Urziceni'),
(6, 'Matei', 'Cristi', 730006185, 'mateicristi@yahoo.com', 'Bucuresti'),
(7, 'Onofrei', 'Alexandru', 730006185, 'onofreialex@gmail.com', 'Ilfov'),
(8, 'Niculescu ', 'Petre', 730006183, 'petren@gmail.com', 'Ploiesti'),
(9, 'Lungu', 'Marius', 730006183, 'lungum@yahoo.com', 'Brasov'),
(10, 'Banica', 'Alexandra', 730006183, 'banicaalx@gmail.com', 'Bucuresti'),
(11, 'Salam', 'Florin', 730006183, 'salamflo@yahoo.com', 'Ilfov'),
(12, 'Mares', 'Cristina', 730006183, 'marescri@yahoo.com', 'Ploiesti'),
(13, 'Fomete', 'Alexandru', 730006183, 'fometealx@yahoo.com', 'Cluj'),
(14, 'Tuci', 'Florentina', 730006179, 'tuciflori@gmail.com', 'Turda'),
(15, 'Fasole', 'Andrei', 730006179, 'fasoleand@yahoo.com', 'Codlea'),
(16, 'Covid', 'Raluca', 730006179, 'covidral@yahoo.com', 'Bucuresti'),
(17, 'Donald', 'Trump', 730006179, 'donaldduck@yahoo.com', 'Bucuresti'),
(18, 'Furtuna ', 'Crina', 730006179, 'furtunatropicala@yahoo.com', 'Bistrita'),
(19, 'Malamuc', 'Alexei', 730006179, 'malamucalexei@gmail.com', 'Arges'),
(20, 'Dumitrache', 'Irinel', 730006179, 'dumitrachebolo@yahoo.com', 'Timisoara');

-- --------------------------------------------------------

--
-- Table structure for table `donatii`
--

DROP TABLE IF EXISTS `donatii`;
CREATE TABLE IF NOT EXISTS `donatii` (
  `Id_Donatie` int(11) NOT NULL AUTO_INCREMENT,
  `Tip_Donatie` enum('Hrana','Bani','Animale') NOT NULL,
  `Data_Donatie` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_Donator` int(11) NOT NULL,
  `Id_Adapost` int(11) NOT NULL,
  PRIMARY KEY (`Id_Donatie`,`Data_Donatie`),
  KEY `Donatori` (`Id_Donator`),
  KEY `Adaposturi` (`Id_Adapost`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `donatii`
--

INSERT INTO `donatii` (`Id_Donatie`, `Tip_Donatie`, `Id_Donator`, `Id_Adapost`) VALUES
(2, 'Hrana', 1, 1),
(3, 'Bani', 2, 4),
(4, 'Animale', 4, 5),
(5, 'Bani', 3, 6),
(6, 'Hrana', 5, 7),
(7, 'Animale', 7, 8),
(8, 'Hrana', 9, 9),
(9, 'Bani', 11, 11),
(10, 'Bani', 8, 10),
(11, 'Animale', 10, 11),
(12, 'Bani', 12, 12),
(13, 'Bani', 13, 13),
(14, 'Hrana', 14, 14),
(15, 'Bani', 15, 15),
(16, 'Animale', 16, 15),
(17, 'Bani', 17, 17),
(18, 'Hrana', 18, 18),
(19, 'Hrana', 19, 19),
(20, 'Hrana', 7, 20),
(21, 'Bani', 6, 11),
(22, 'Bani', 2, 10),
(23, 'Animale', 10, 17),
(24, 'Bani', 15, 17);

-- --------------------------------------------------------

--
-- Table structure for table `donatori`
--

DROP TABLE IF EXISTS `donatori`;
CREATE TABLE IF NOT EXISTS `donatori` (
  `Id_Donator` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(100) NOT NULL,
  `Prenume` varchar(100) NOT NULL,
  `Oras` varchar(50) NOT NULL,
  `Nr_Telefon` int(10) NOT NULL,
  `Tip_Donatori` enum('Persoana_Fizica','Persoana_Juridica') NOT NULL,
  PRIMARY KEY (`Id_Donator`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `donatori`
--

INSERT INTO `donatori` (`Id_Donator`, `Nume`, `Prenume`, `Oras`, `Nr_Telefon`, `Tip_Donatori`) VALUES
(1, 'Dumitru', 'Vasile', 'Ploiesti', 742010481, 'Persoana_Fizica'),
(2, 'Manea', 'Robert', 'Campina', 742010486, 'Persoana_Juridica'),
(3, 'Olaru', 'Larisa', 'Sinaia', 742010484, 'Persoana_Fizica'),
(4, 'Dumitru', 'Alexandru', 'Valeni De Munte', 742010487, 'Persoana_Juridica'),
(5, 'Aron', 'Robert', 'Ploiesti', 742010480, 'Persoana_Fizica'),
(6, 'Dinca', 'Marius', 'Barcanesti', 742010480, 'Persoana_Juridica'),
(7, 'Mihai', 'Andrei', 'Brasov', 742010480, 'Persoana_Fizica'),
(8, 'Olaru ', 'Marius', 'Cluj', 742010480, 'Persoana_Fizica'),
(9, 'Stoica', 'Marius', 'Bucuresti', 742010480, 'Persoana_Juridica'),
(10, 'Petre', 'Marian', 'Cluj', 742010480, 'Persoana_Fizica'),
(11, 'Ardeleanu', 'Viorel', 'Brasov', 742010480, 'Persoana_Juridica'),
(12, 'Lungu', 'Mariana', 'Turda', 742010480, 'Persoana_Fizica'),
(13, 'Niculaescu', 'Petre', 'Brasov', 742010480, 'Persoana_Juridica'),
(14, 'Sava', 'Andrei', 'Bucuresti', 742010480, 'Persoana_Fizica'),
(15, 'Salam', 'Florin', 'Cluj', 742010480, 'Persoana_Juridica'),
(16, 'Alexandru', 'Ion', 'Ploiesti', 742010480, 'Persoana_Fizica'),
(17, 'Necula', 'Marius', 'Ploiesti', 742010480, 'Persoana_Juridica'),
(18, 'Zamfir', 'Marian', 'Cluj', 742010480, 'Persoana_Fizica'),
(19, 'Melcu', 'Ion', 'Ploiesti', 742010480, 'Persoana_Juridica');

-- --------------------------------------------------------

--
-- Table structure for table `ingrijesc`
--

DROP TABLE IF EXISTS `ingrijesc`;
CREATE TABLE IF NOT EXISTS `ingrijesc` (
  `id_animal` int(11) NOT NULL,
  `id_veterinar` int(11) NOT NULL,
  PRIMARY KEY (`id_animal`,`id_veterinar`),
  KEY `id_veterinar` (`id_veterinar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ingrijesc`
--

INSERT INTO `ingrijesc` (`id_animal`, `id_veterinar`) VALUES
(1, 1),
(18, 1),
(2, 2),
(11, 2),
(19, 2),
(3, 3),
(17, 3),
(4, 4),
(20, 4),
(6, 5),
(13, 5),
(5, 6),
(15, 6),
(7, 7),
(12, 7),
(8, 8),
(18, 8),
(9, 9),
(16, 9),
(10, 10),
(14, 10);

-- --------------------------------------------------------

--
-- Table structure for table `papagali`
--

DROP TABLE IF EXISTS `papagali`;
CREATE TABLE IF NOT EXISTS `papagali` (
  `Vorbitor` enum('Da','Nu') NOT NULL,
  `Id_Animal` int(11) NOT NULL,
  KEY `animale` (`Id_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `papagali`
--

INSERT INTO `papagali` (`Vorbitor`, `Id_Animal`) VALUES
('Nu', 20),
('Nu', 3),
('Nu', 6),
('Da', 9),
('Da', 10),
('Nu', 11);

-- --------------------------------------------------------

--
-- Table structure for table `pisici`
--

DROP TABLE IF EXISTS `pisici`;
CREATE TABLE IF NOT EXISTS `pisici` (
  `Castrate` enum('Castrata','Necastrata') NOT NULL,
  `Alergeni` enum('Da','Nu') NOT NULL,
  `Id_Animal` int(11) NOT NULL,
  KEY `animale` (`Id_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pisici`
--

INSERT INTO `pisici` (`Castrate`, `Alergeni`, `Id_Animal`) VALUES
('Castrata', '', 2),
('Necastrata', 'Nu', 5),
('Necastrata', 'Nu', 8),
('Castrata', 'Nu', 17),
('Castrata', 'Nu', 18),
('Castrata', 'Nu', 19);

-- --------------------------------------------------------

--
-- Table structure for table `veterinari`
--

DROP TABLE IF EXISTS `veterinari`;
CREATE TABLE IF NOT EXISTS `veterinari` (
  `Id_Veterinar` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(100) NOT NULL,
  `Prenume` varchar(100) NOT NULL,
  `Nr_Telefon` int(10) NOT NULL,
  PRIMARY KEY (`Id_Veterinar`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `veterinari`
--

INSERT INTO `veterinari` (`Id_Veterinar`, `Nume`, `Prenume`, `Nr_Telefon`) VALUES
(1, 'Dumitru', 'Vasile', 742010481),
(2, 'Manea', 'Robert', 742010486),
(3, 'Olaru', 'Larisa', 742010484),
(4, 'Dumitru', 'Alexandru', 742010487),
(5, 'Aron', 'Robert', 742010480),
(6, 'Dinca', 'Marius', 742010480),
(7, 'Mihai', 'Andrei', 742010480),
(8, 'Olaru ', 'Marius', 742010480),
(9, 'Stoica', 'Marius', 742010480),
(10, 'Petre', 'Marian', 742010480);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoptii`
--
ALTER TABLE `adoptii`
  ADD CONSTRAINT `adoptii_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `clienti` (`Id_Client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `adrese`
--
ALTER TABLE `adrese`
  ADD CONSTRAINT `adrese_ibfk_1` FOREIGN KEY (`Id_Adapost`) REFERENCES `adaposturi` (`Id_Adapost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `animale`
--
ALTER TABLE `animale`
  ADD CONSTRAINT `animale_ibfk_1` FOREIGN KEY (`Id_Adoptie`) REFERENCES `adoptii` (`Id_Adoptie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `animale_ibfk_2` FOREIGN KEY (`Id_Adapost`) REFERENCES `adaposturi` (`Id_Adapost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catei`
--
ALTER TABLE `catei`
  ADD CONSTRAINT `catei_ibfk_1` FOREIGN KEY (`Id_Animal`) REFERENCES `animale` (`Id_Animal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donatii`
--
ALTER TABLE `donatii`
  ADD CONSTRAINT `donatii_ibfk_1` FOREIGN KEY (`Id_Donator`) REFERENCES `donatori` (`Id_Donator`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donatii_ibfk_2` FOREIGN KEY (`Id_Adapost`) REFERENCES `adaposturi` (`Id_Adapost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ingrijesc`
--
ALTER TABLE `ingrijesc`
  ADD CONSTRAINT `ingrijesc_ibfk_1` FOREIGN KEY (`id_veterinar`) REFERENCES `veterinari` (`Id_Veterinar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingrijesc_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animale` (`Id_Animal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `papagali`
--
ALTER TABLE `papagali`
  ADD CONSTRAINT `papagali_ibfk_1` FOREIGN KEY (`Id_Animal`) REFERENCES `animale` (`Id_Animal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pisici`
--
ALTER TABLE `pisici`
  ADD CONSTRAINT `pisici_ibfk_1` FOREIGN KEY (`Id_Animal`) REFERENCES `animale` (`Id_Animal`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

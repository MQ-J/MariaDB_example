-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.6.4-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para a lenda de aang
CREATE DATABASE IF NOT EXISTS `a lenda de aang` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `a lenda de aang`;

-- Copiando estrutura para tabela a lenda de aang.dominação
CREATE TABLE IF NOT EXISTS `dominação` (
  `tipo` varchar(6) NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela a lenda de aang.dominação: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `dominação` DISABLE KEYS */;
INSERT INTO `dominação` (`tipo`) VALUES
	('água'),
	('ar'),
	('fogo'),
	('nenhum'),
	('terra'),
	('todos');
/*!40000 ALTER TABLE `dominação` ENABLE KEYS */;

-- Copiando estrutura para tabela a lenda de aang.lugares
CREATE TABLE IF NOT EXISTS `lugares` (
  `idlugar` varchar(40) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`idlugar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela a lenda de aang.lugares: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` (`idlugar`, `nome`) VALUES
	('44e6a61e-2314-11ec-82e4-38839ab32bd7', 'templo do ar do sul'),
	('cd911d92-2319-11ec-82e4-38839ab32bd7', 'templo do ar do norte'),
	('cd91e2f8-2319-11ec-82e4-38839ab32bd7', 'ba sing se'),
	('cd91e614-2319-11ec-82e4-38839ab32bd7', 'omachu'),
	('cd91e6c0-2319-11ec-82e4-38839ab32bd7', 'tribo da água do sul'),
	('cd91e762-2319-11ec-82e4-38839ab32bd7', 'tribo da água do norte');
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;

-- Copiando estrutura para tabela a lenda de aang.personagens
CREATE TABLE IF NOT EXISTS `personagens` (
  `idpersonagem` varchar(40) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `dobra` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idpersonagem`) USING BTREE,
  KEY `fk_dominação` (`dobra`),
  CONSTRAINT `fk_dominação` FOREIGN KEY (`dobra`) REFERENCES `dominação` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela a lenda de aang.personagens: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `personagens` DISABLE KEYS */;
INSERT INTO `personagens` (`idpersonagem`, `nome`, `dobra`) VALUES
	('65acf311-2318-11ec-82e4-38839ab32bd7', 'Aang', 'todos'),
	('d98e73f6-2318-11ec-82e4-38839ab32bd7', 'Katara', 'água'),
	('d990fa81-2318-11ec-82e4-38839ab32bd7', 'Sokka', 'nenhum'),
	('d990fce3-2318-11ec-82e4-38839ab32bd7', 'Zuko', 'fogo'),
	('d990fd50-2318-11ec-82e4-38839ab32bd7', 'Azula', 'fogo');
/*!40000 ALTER TABLE `personagens` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

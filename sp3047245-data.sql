-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.6.5-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bd2
CREATE DATABASE IF NOT EXISTS `bd2` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `bd2`;

-- Copiando estrutura para tabela bd2.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `disciplina_uuid` binary(16) NOT NULL,
  `sigla_seq` char(5) NOT NULL,
  `nome_name` varchar(50) NOT NULL,
  PRIMARY KEY (`disciplina_uuid`),
  UNIQUE KEY `varSilga` (`sigla_seq`),
  UNIQUE KEY `varSilga_2` (`sigla_seq`),
  UNIQUE KEY `sigla_nome` (`sigla_seq`),
  UNIQUE KEY `sigla_seq` (`sigla_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd2.disciplina: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`disciplina_uuid`, `sigla_seq`, `nome_name`) VALUES
	(_binary 0x13f5f1165adc11ecbf6b42010a9e0004, 'HO3A3', 'Historia dos Ornitorrincos 3'),
	(_binary 0x1fc7f1925adc11ecbf6b42010a9e0004, 'BD2A3', 'Banco de Dados 2'),
	(_binary 0x2b5d980b5adc11ecbf6b42010a9e0004, 'LB1A6', 'Libras 1'),
	(_binary 0x3eef722e5adc11ecbf6b42010a9e0004, 'FB1A2', 'Fritagem de Batatas 1'),
	(_binary 0xf44113e95adb11ecbf6b42010a9e0004, 'LG1A1', 'Lingua dos Galdeses 1');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;

-- Copiando estrutura para tabela bd2.docente
CREATE TABLE IF NOT EXISTS `docente` (
  `docente_uuid` binary(16) NOT NULL,
  `prontuario_seq` char(7) NOT NULL,
  `nome_name` varchar(50) NOT NULL,
  `escolar_seq` enum('fundamental','medio','tecnologo','bacharelado','licenciatura','mestrado','doutorado','posgraduacao','livredocencia') NOT NULL,
  `nasc_date` date NOT NULL,
  PRIMARY KEY (`docente_uuid`),
  UNIQUE KEY `varProntuario` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_2` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_3` (`prontuario_seq`),
  UNIQUE KEY `prontuario_name` (`prontuario_seq`),
  UNIQUE KEY `prontuario_seq` (`prontuario_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd2.docente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` (`docente_uuid`, `prontuario_seq`, `nome_name`, `escolar_seq`, `nasc_date`) VALUES
	(_binary 0x41999ba45adb11ecbf6b42010a9e0004, '5665767', 'Professor Real 1', 'licenciatura', '1900-11-24'),
	(_binary 0x5b4e55495adb11ecbf6b42010a9e0004, '0998987', 'Maria Antonieta', 'posgraduacao', '1970-11-11'),
	(_binary 0x7462eb5a5adb11ecbf6b42010a9e0004, '3432321', 'Professor Real 2', 'mestrado', '1981-02-07'),
	(_binary 0x9a780bbf5adb11ecbf6b42010a9e0004, '7665456', 'Josep Sampaio', 'tecnologo', '1990-05-14');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;

-- Copiando estrutura para tabela bd2.estudante
CREATE TABLE IF NOT EXISTS `estudante` (
  `estudante_uuid` binary(16) NOT NULL,
  `prontuario_seq` char(7) NOT NULL,
  `nome_name` varchar(50) NOT NULL,
  `nasc_date` date NOT NULL,
  PRIMARY KEY (`estudante_uuid`),
  UNIQUE KEY `estudante_prontuario` (`prontuario_seq`),
  UNIQUE KEY `varProntuario` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_2` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_3` (`prontuario_seq`),
  UNIQUE KEY `varProntuario_4` (`prontuario_seq`),
  UNIQUE KEY `prontuario_name` (`prontuario_seq`),
  UNIQUE KEY `prontuario_seq` (`prontuario_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd2.estudante: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
INSERT INTO `estudante` (`estudante_uuid`, `prontuario_seq`, `nome_name`, `nasc_date`) VALUES
	(_binary 0x8584204a5adc11ecbf6b42010a9e0004, '5665432', 'Benedita Golcalvez Ledo', '1995-06-18'),
	(_binary 0x9b6283655adc11ecbf6b42010a9e0004, '3047245', 'Marcos Querino', '1500-05-27'),
	(_binary 0xbb4894185adc11ecbf6b42010a9e0004, '1234567', 'Aluno nota 10', '2002-05-27'),
	(_binary 0xd0ef2fdb5adc11ecbf6b42010a9e0004, '7234098', 'Ednaldo Pereira', '1111-11-11'),
	(_binary 0xf2e1847f5adc11ecbf6b42010a9e0004, '9447854', 'Nathan Ajudou Bastante', '2021-12-01');
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;

-- Copiando estrutura para tabela bd2.estudos
CREATE TABLE IF NOT EXISTS `estudos` (
  `estudante_uuid` binary(16) NOT NULL,
  `turma_uuid` binary(16) NOT NULL,
  UNIQUE KEY `estudante_uuid` (`estudante_uuid`,`turma_uuid`),
  KEY `turma_uuid` (`turma_uuid`),
  CONSTRAINT `estudos_ibfk_1` FOREIGN KEY (`estudante_uuid`) REFERENCES `estudante` (`estudante_uuid`),
  CONSTRAINT `estudos_ibfk_2` FOREIGN KEY (`turma_uuid`) REFERENCES `turma` (`turma_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd2.estudos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estudos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudos` ENABLE KEYS */;

-- Copiando estrutura para tabela bd2.lecionação
CREATE TABLE IF NOT EXISTS `lecionação` (
  `docente_uuid` binary(16) NOT NULL,
  `disciplina_uuid` binary(16) NOT NULL,
  UNIQUE KEY `docente_uuid` (`docente_uuid`,`disciplina_uuid`),
  KEY `disciplina_uuid` (`disciplina_uuid`),
  CONSTRAINT `lecionação_ibfk_1` FOREIGN KEY (`docente_uuid`) REFERENCES `docente` (`docente_uuid`),
  CONSTRAINT `lecionação_ibfk_2` FOREIGN KEY (`disciplina_uuid`) REFERENCES `disciplina` (`disciplina_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd2.lecionação: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lecionação` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecionação` ENABLE KEYS */;

-- Copiando estrutura para tabela bd2.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `turma_uuid` binary(16) NOT NULL,
  `dia_seq` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') NOT NULL,
  `periodo_seq` enum('matutino','verspertino','noturno') NOT NULL,
  PRIMARY KEY (`turma_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd2.turma: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`turma_uuid`, `dia_seq`, `periodo_seq`) VALUES
	(_binary 0x392aa2415add11ecbf6b42010a9e0004, 'segunda', 'noturno'),
	(_binary 0x45124e6f5add11ecbf6b42010a9e0004, 'terca', 'noturno'),
	(_binary 0x4b4b4dc05add11ecbf6b42010a9e0004, 'quarta', 'noturno'),
	(_binary 0x524659aa5add11ecbf6b42010a9e0004, 'quinta', 'noturno'),
	(_binary 0x5ba5776d5add11ecbf6b42010a9e0004, 'sexta', 'noturno'),
	(_binary 0x681fcda25add11ecbf6b42010a9e0004, 'sabado', 'matutino'),
	(_binary 0x7406212d5add11ecbf6b42010a9e0004, 'domingo', 'verspertino');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;

-- Copiando estrutura para tabela bd2.turma_disciplina
CREATE TABLE IF NOT EXISTS `turma_disciplina` (
  `turma_uuid` binary(16) NOT NULL,
  `disciplina_uuid` binary(16) NOT NULL,
  `cria_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `turma_uuid` (`turma_uuid`),
  KEY `disciplina_uuid` (`disciplina_uuid`),
  CONSTRAINT `turma_disciplina_ibfk_1` FOREIGN KEY (`turma_uuid`) REFERENCES `turma` (`turma_uuid`),
  CONSTRAINT `turma_disciplina_ibfk_2` FOREIGN KEY (`disciplina_uuid`) REFERENCES `disciplina` (`disciplina_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela bd2.turma_disciplina: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `turma_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_disciplina` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

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

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd2.estudos
CREATE TABLE IF NOT EXISTS `estudos` (
  `estudante_uuid` binary(16) NOT NULL,
  `turma_uuid` binary(16) NOT NULL,
  UNIQUE KEY `estudante_uuid` (`estudante_uuid`,`turma_uuid`),
  KEY `turma_uuid` (`turma_uuid`),
  CONSTRAINT `estudos_ibfk_1` FOREIGN KEY (`estudante_uuid`) REFERENCES `estudante` (`estudante_uuid`),
  CONSTRAINT `estudos_ibfk_2` FOREIGN KEY (`turma_uuid`) REFERENCES `turma` (`turma_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd2.lecionação
CREATE TABLE IF NOT EXISTS `lecionação` (
  `docente_uuid` binary(16) NOT NULL,
  `disciplina_uuid` binary(16) NOT NULL,
  UNIQUE KEY `docente_uuid` (`docente_uuid`,`disciplina_uuid`),
  KEY `disciplina_uuid` (`disciplina_uuid`),
  CONSTRAINT `lecionação_ibfk_1` FOREIGN KEY (`docente_uuid`) REFERENCES `docente` (`docente_uuid`),
  CONSTRAINT `lecionação_ibfk_2` FOREIGN KEY (`disciplina_uuid`) REFERENCES `disciplina` (`disciplina_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para procedure bd2.prCriarDisciplina
DELIMITER //
CREATE PROCEDURE `prCriarDisciplina`(
	IN sigla CHAR(5),
	IN nome VARCHAR(50))
INSERT INTO disciplina VALUES(
	UNHEX(REPLACE(UUID(), '-', '')),
	sigla,
	nome)//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prCriarDocente
DELIMITER //
CREATE PROCEDURE `prCriarDocente`(
	IN prontuario CHAR(7),
	IN nome VARCHAR(50),
	IN escolar ENUM('fundamental','medio','tecnologo','bacharelado','licenciatura','mestrado','doutorado','posgraduacao','livredocencia'),
	IN nascimento DATE)
INSERT INTO docente VALUES(
	UNHEX(REPLACE(UUID(), '-', '')),
	prontuario,
	nome,
	escolar,
	nascimento)//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prCriarEstudante
DELIMITER //
CREATE PROCEDURE `prCriarEstudante`(
	IN prontuario CHAR(7),
	IN nome VARCHAR(50),
	IN nascimento date)
INSERT INTO estudante VALUES(
	UNHEX(REPLACE(UUID(), '-', '')),
	prontuario,
	nome,
	nascimento)//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prCriarTurma
DELIMITER //
CREATE PROCEDURE `prCriarTurma`(
	IN dia ENUM('segunda','terca','quarta','quinta','sexta','sabado','domingo'),
	IN periodo ENUM('matutino','verspertino','noturno'))
INSERT INTO turma VALUES(
	UNHEX(REPLACE(UUID(), '-', '')),
	dia,
	periodo)//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prDeletarDisciplina
DELIMITER //
CREATE PROCEDURE `prDeletarDisciplina`(IN sigla CHAR(5))
DELETE FROM disciplina WHERE sigla_seq = sigla//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prDeletarDocente
DELIMITER //
CREATE PROCEDURE `prDeletarDocente`(IN prontuario CHAR(7))
DELETE FROM Docente WHERE prontuario_seq = prontuario//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prDeletarEstudante
DELIMITER //
CREATE PROCEDURE `prDeletarEstudante`(IN prontuario CHAR(7))
DELETE FROM Estudante WHERE prontuario_seq = prontuario//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prDeletarTurma
DELIMITER //
CREATE PROCEDURE `prDeletarTurma`(
IN dia ENUM('segunda','terca','quarta','quinta','sexta','sabado','domingo'), 
IN periodo ENUM('matutino','verspertino','noturno'))
DELETE FROM turma WHERE dia_seq = dia AND periodo_seq = periodo//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prEditarDisciplina
DELIMITER //
CREATE PROCEDURE `prEditarDisciplina`(
	IN sigla CHAR(5),
	IN novo_nome VARCHAR(50))
UPDATE disciplina SET nome_name = novo_nome WHERE sigla_seq = sigla//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prEditarDocente
DELIMITER //
CREATE PROCEDURE `prEditarDocente`(
	IN prontuario CHAR(7),
	IN nome VARCHAR(50),
	IN escolar ENUM('fundamental','medio','tecnologo','bacharelado','licenciatura','mestrado','doutorado','posgraduacao','livredocencia'),
	IN nascimento DATE)
UPDATE docente SET nome_name = nome, escolar_seq = escolar, nasc_date = nascimento WHERE prontuario_seq = prontuario//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prEditarEstudante
DELIMITER //
CREATE PROCEDURE `prEditarEstudante`(
	IN prontuario CHAR(7),
	IN nome VARCHAR(50),
	IN nascimento DATE)
UPDATE estudante SET nome_name = nome, nasc_date = nascimento WHERE prontuario_seq = prontuario//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prEditarTurma
DELIMITER //
CREATE PROCEDURE `prEditarTurma`(
	IN dia ENUM('segunda','terca','quarta','quinta','sexta','sabado','domingo'),
	IN periodo ENUM('matutino','verspertino','noturno'),
	IN novo_dia ENUM('segunda','terca','quarta','quinta','sexta','sabado','domingo'),
	IN novo_periodo ENUM('matutino','verspertino','noturno'))
UPDATE turma SET dia_seq = novo_dia, periodo_seq = novo_periodo WHERE dia_seq = dia and periodo_seq = periodo//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prListarDisciplina
DELIMITER //
CREATE PROCEDURE `prListarDisciplina`()
SELECT sigla_seq, nome_name FROM disciplina//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prListarDocente
DELIMITER //
CREATE PROCEDURE `prListarDocente`()
BEGIN
select prontuario_seq, nome_name, nasc_date, escolar_seq
FROM docente;
END//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prListarEstudante
DELIMITER //
CREATE PROCEDURE `prListarEstudante`()
SELECT prontuario_seq, nome_name, nasc_date FROM estudante//
DELIMITER ;

-- Copiando estrutura para procedure bd2.prListarTurma
DELIMITER //
CREATE PROCEDURE `prListarTurma`()
SELECT dia_seq, periodo_seq FROM turma//
DELIMITER ;

-- Copiando estrutura para tabela bd2.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `turma_uuid` binary(16) NOT NULL,
  `dia_seq` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') NOT NULL,
  `periodo_seq` enum('matutino','verspertino','noturno') NOT NULL,
  PRIMARY KEY (`turma_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportação de dados foi desmarcado.

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

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

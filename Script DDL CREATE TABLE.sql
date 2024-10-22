SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escolademusica_sql` DEFAULT CHARACTER SET utf8 ;
USE escolademusica_sql;

-- -----------------------------------------------------
-- Table Instrumento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Instrumento (
  idInstrumento INT NOT NULL,
  nome VARCHAR(20) NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  fabricante VARCHAR(45) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  datFabricacao DATE NOT NULL,
  PRIMARY KEY (idInstrumento))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Escolademusica.Funcao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Funcao (
  idFuncao INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  datAssuncao DATE NOT NULL,
  PRIMARY KEY (idFuncao))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Escolademusica. Sinfonia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sinfonia (
  idSinfonia INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  compositor VARCHAR(45) NOT NULL,
  PRIMARY KEY (idSinfonia))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Escola de Música. Orquestra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Orquestra (
  idOrquestra INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  país VARCHAR(20) NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  dataCriacao DATE NOT NULL,
  PRIMARY KEY (idOrquestra))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Escolademusica. Musico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Musico (
  cpf VARCHAR(14) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  nacionalidade VARCHAR(20) NOT NULL,
  dataNasc DATE NOT NULL,
  Instrumento_idInstrumento INT NOT NULL,
  Orquestra_idOrquestra INT NOT NULL,
  PRIMARY KEY (cpf),
  INDEX fk_Musico_Instrumento_idx (Instrumento_idInstrumento ASC) VISIBLE,
  INDEX fk_Musico_Orquestra1_idx (Orquestra_idOrquestra ASC) VISIBLE,
  CONSTRAINT fk_Musico_Instrumento
    FOREIGN KEY (Instrumento_idInstrumento)
    REFERENCES Instrumento (idInstrumento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Musico_Orquestra1
    FOREIGN KEY (Orquestra_idOrquestra)
    REFERENCES Orquestra (idOrquestra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Escolademusica. Desempenha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Desempenha (
  idDesempenha INT NOT NULL,
  Musico_cpf VARCHAR(14) NOT NULL,
  Funcao_idFuncao INT NOT NULL,
  Sinfonia_idSinfonia INT NOT NULL,
  PRIMARY KEY (idDesempenha),
  INDEX fk_Desempenha_Musico1_idx (Musico_cpf ASC) VISIBLE,
  INDEX fk_Desempenha_Funcao1_idx (Funcao_idFuncao ASC) VISIBLE,
  INDEX fk_Desempenha_Sinfonia1_idx (Sinfonia_idSinfonia ASC) VISIBLE,
  CONSTRAINT fk_Desempenha_Musico1
    FOREIGN KEY (Musico_cpf)
    REFERENCES Musico (cpf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Desempenha_Funcao1
    FOREIGN KEY (Funcao_idFuncao)
    REFERENCES Funcao (idFuncao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Desempenha_Sinfonia1
    FOREIGN KEY (Sinfonia_idSinfonia)
    REFERENCES Sinfonia (idSinfonia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Escolademusica. OrquestraSinfonia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrquestraSinfonia (
  Orquestra_idOrquestra INT NOT NULL,
  Sinfonia_idSinfonia INT NOT NULL,
  PRIMARY KEY (Orquestra_idOrquestra, Sinfonia_idSinfonia),
  INDEX fk_Orquestra_has_Sinfonia_Sinfonia1_idx (Sinfonia_idSinfonia ASC) VISIBLE,
  INDEX fk_Orquestra_has_Sinfonia_Orquestra1_idx (Orquestra_idOrquestra ASC) VISIBLE,
  CONSTRAINT fk_Orquestra_has_Sinfonia_Orquestra1
    FOREIGN KEY (Orquestra_idOrquestra)
    REFERENCES Orquestra (idOrquestra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Orquestra_has_Sinfonia_Sinfonia1
    FOREIGN KEY (Sinfonia_idSinfonia)
    REFERENCES Sinfonia (idSinfonia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
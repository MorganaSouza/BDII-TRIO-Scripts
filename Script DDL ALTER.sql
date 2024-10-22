-- 10 scripts DDL para alterar as estruturas das tabelas do seu banco de dados. --
-- -----------------------------------------------------

-- -----------------------------------------------------
-- 1. Adicionar uma coluna descricao à tabela Instrumento--

ALTER TABLE Instrumento 
ADD COLUMN descricao TEXT;


-- 2. Alterar o tipo da coluna status na tabela Instrumento para ENUM--

ALTER TABLE Instrumento 
MODIFY COLUMN status ENUM('Ativo', 'Inativo', 'Manutenção') NOT NULL;


-- 3. Adicionar uma coluna email à tabela Musico--

ALTER TABLE Musico 
ADD COLUMN email VARCHAR(100);


-- 4. Adicionar um índice à coluna dataNasc na tabela Musico--

ALTER TABLE Musico 
ADD INDEX idx_dataNasc (dataNasc);


-- 5. Adicionar uma coluna duracao à tabela Sinfonia--

ALTER TABLE Sinfonia 
ADD COLUMN duracao INT NOT NULL;  -- duração em minutos


-- 6. Renomear a coluna país na tabela Orquestra para pais--

ALTER TABLE Orquestra 
CHANGE COLUMN país pais VARCHAR(20) NOT NULL;


-- 7. Adicionar uma coluna endereco à tabela Orquestra--

ALTER TABLE Orquestra 
ADD COLUMN endereco VARCHAR(100);


-- 8. Adicionar uma chave estrangeira à tabela Desempenha para referência à tabela Funcao--

ALTER TABLE Desempenha 
ADD CONSTRAINT fk_Desempenha_Funcao2
FOREIGN KEY (Funcao_idFuncao) 
REFERENCES Funcao (idFuncao)
ON DELETE CASCADE;


-- 9. Alterar a coluna nome na tabela Funcao para permitir um tamanho maior--

ALTER TABLE Funcao 
MODIFY COLUMN nome VARCHAR(100) NOT NULL;


-- 10. Removendo a coluna descricao da tabela Instrumento--

ALTER TABLE Instrumento 
DROP COLUMN descricao;

-- corrigindo coluna status --

ALTER TABLE Instrumento MODIFY status VARCHAR(45);

-- removendo coluna --
ALTER TABLE sinfonia 
DROP COLUMN duracao;

ALTER TABLE orquestra 
DROP COLUMN endereco;

ALTER TABLE Musico 
ADD COLUMN status VARCHAR(45) NOT NULL;


-- Comandos SQL: DML Insert

-- -----------------------------------------------------
-- Inserting data into Instrumento
-- -----------------------------------------------------
INSERT INTO Instrumento (idInstrumento, nome, tipo, fabricante, modelo, status, datFabricacao) VALUES
(1, 'Violino', 'Cordas', 'Yamaha', 'SV-130', 'Disponível', '2015-05-20'),
(2, 'Flauta', 'Sopros', 'Yamaha', 'YFL-222', 'Em uso', '2018-03-15'),
(3, 'Trompete', 'Metais', 'Bach', 'TR-300', 'Disponível', '2017-08-10'),
(4, 'Piano', 'Teclas', 'Yamaha', 'P-125', 'Em uso', '2020-01-25'),
(5, 'Guitarra', 'Cordas', 'Fender', 'Stratocaster', 'Disponível', '2019-07-30'),
(6, 'Bateria', 'Percussão', 'Pearl', 'Export Series', 'Em uso', '2021-04-12'),
(7, 'Saxofone', 'Sopros', 'Selmer', 'Super Action 80', 'Disponível', '2016-09-05'),
(8, 'Contrabaixo', 'Cordas', 'Ibanez', 'SR Series', 'Em uso', '2018-11-23'),
(9, 'Trombone', 'Metais', 'Getzen', '900 Series', 'Disponível', '2017-02-14'),
(10, 'Harpa', 'Cordas', 'Lyon & Healy', 'Style 23', 'Em uso', '2014-12-02');

-- -----------------------------------------------------
-- Inserting data into Funcao
-- -----------------------------------------------------
INSERT INTO Funcao (idFuncao, nome, datAssuncao) VALUES
(1, 'Concertino', '2020-01-01'),
(2, 'Solista', '2019-05-15'),
(3, 'Coordenador', '2021-03-10'),
(4, 'Regente', '2018-08-20'),
(5, 'Assistente', '2017-02-28'),
(6, 'Mestre de Cerimônias', '2019-06-12'),
(7, 'Compositor', '2022-09-05'),
(8, 'Arranjador', '2021-12-15'),
(9, 'Produtor', '2023-01-20'),
(10, 'Educador Musical', '2016-07-18');

-- -----------------------------------------------------
-- Inserting data into Sinfonia
-- -----------------------------------------------------
INSERT INTO Sinfonia (idSinfonia, nome, compositor) VALUES
(1, 'Sinfonia No. 5', 'Beethoven'),
(2, 'Sinfonia No. 9', 'Beethoven'),
(3, 'Sinfonia No. 40', 'Mozart'),
(4, 'Sinfonia do Novo Mundo', 'Dvořák'),
(5, 'Sinfonia No. 1', 'Mahler'),
(6, 'Sinfonia Clássica', 'Prokofiev'),
(7, 'Sinfonia No. 6', 'Tchaikovsky'),
(8, 'Sinfonia Italiana', 'Mendelssohn'),
(9, 'Sinfonia No. 7', 'Beethoven'),
(10, 'Sinfonia da Requiem', 'Brahms');

-- -----------------------------------------------------
-- Inserting data into Orquestra
-- -----------------------------------------------------
INSERT INTO Orquestra (idOrquestra, nome, pais, cidade, dataCriacao) VALUES
(1, 'Orquestra Sinfônica de São Paulo', 'Brasil', 'São Paulo', '1950-06-01'),
(2, 'Orquestra Filarmônica de Berlim', 'Alemanha', 'Berlim', '1882-10-10'),
(3, 'Orquestra Metropolitana de Lisboa', 'Portugal', 'Lisboa', '1999-03-15'),
(4, 'Orquestra Sinfônica do Rio de Janeiro', 'Brasil', 'Rio de Janeiro', '1910-05-20'),
(5, 'Orquestra Nacional da França', 'França', 'Paris', '1934-06-25'),
(6, 'Orquestra Sinfônica de Chicago', 'EUA', 'Chicago', '1891-10-16'),
(7, 'Orquestra de Londres', 'Reino Unido', 'Londres', '1904-09-09'),
(8, 'Orquestra de Amsterdam', 'Holanda', 'Amsterdã', '1940-02-14'),
(9, 'Orquestra de Montreal', 'Canadá', 'Montreal', '1934-04-25'),
(10, 'Orquestra Sinfônica de Moscovo', 'Rússia', 'Moscovo', '1925-11-30');

-- -----------------------------------------------------
-- Inserting data into Musico
-- -----------------------------------------------------
INSERT INTO Musico (cpf, nome, nacionalidade, dataNasc, Instrumento_idInstrumento, Orquestra_idOrquestra, email, status) VALUES
('12345678900', 'Ana Paula', 'Brasileira', '1990-05-12', 1, 1, 'ana.paula@example.com', 'ativo'),
('09876543211', 'Carlos Alberto', 'Brasileira', '1985-08-21', 2, 4, 'carlos.alberto@example.com', 'ativo'),
('23456789012', 'Julia Mendes', 'Brasileira', '1995-01-14', 3, 2, 'julia.mendes@example.com', 'ativo'),
('34567890123', 'Marcos Silva', 'Brasileira', '1980-11-03', 4, 3, 'marcos.silva@example.com', 'ativo'),
('45678901234', 'Fernanda Costa', 'Brasileira', '1992-09-07', 5, 5, 'fernanda.costa@example.com', 'ativo'),
('56789012345', 'Roberto Santos', 'Brasileira', '1988-02-25', 6, 6, 'roberto.santos@example.com', 'ativo'),
('67890123456', 'Tatiane Lima', 'Brasileira', '1991-03-18', 7, 7, 'tatiane.lima@example.com', 'ativo'),
('78901234567', 'Ricardo Oliveira', 'Brasileira', '1983-12-30', 8, 8, 'ricardo.oliveira@example.com', 'ativo'),
('89012345678', 'Vanessa Rocha', 'Brasileira', '1994-04-17', 9, 9, 'vanessa.rocha@example.com', 'ativo'),
('90123456789', 'Luiz Fernando', 'Brasileira', '1987-07-22', 10, 10, 'luiz.fernando@example.com', 'ativo');


-- -----------------------------------------------------
-- Inserting data into Desempenha
-- -----------------------------------------------------
INSERT INTO Desempenha (idDesempenha, Musico_cpf, Funcao_idFuncao, Sinfonia_idSinfonia) VALUES
(1, '12345678900', 1, 1),
(2, '09876543211', 2, 2),
(3, '23456789012', 3, 3),
(4, '34567890123', 4, 4),
(5, '45678901234', 5, 5),
(6, '56789012345', 6, 6),
(7, '67890123456', 7, 7),
(8, '78901234567', 8, 8),
(9, '89012345678', 9, 9),
(10, '90123456789', 10, 10);

-- -----------------------------------------------------
-- Inserting data into OrquestraSinfonia
-- -----------------------------------------------------
INSERT INTO OrquestraSinfonia (Orquestra_idOrquestra, Sinfonia_idSinfonia) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10);

-- Comando SQL: DML UPDATE

-- Crie scripts (no mínimo 20) para deletar ou atualizar (DML)
-- os dados inseridos nas tabelas. --

-- ------------------------------- --
-- Atualizações para a tabela Instrumento --

UPDATE Instrumento SET status = 'Em uso' WHERE idInstrumento = 1;
UPDATE Instrumento SET fabricante = 'Yamaha' WHERE idInstrumento = 2;
UPDATE Instrumento SET datFabricacao = '2016-05-15' WHERE idInstrumento = 3;
UPDATE Instrumento SET tipo = 'Cordas' WHERE idInstrumento = 4;
UPDATE Instrumento SET modelo = 'SRV-100' WHERE idInstrumento = 5;

-- Atualizações para a tabela Funcao --

UPDATE Funcao SET nome = 'Regente' WHERE idFuncao = 1;
UPDATE Funcao SET datAssuncao = '2022-01-10' WHERE idFuncao = 2;
UPDATE Funcao SET nome = 'Violonista' WHERE idFuncao = 3;
UPDATE Funcao SET datAssuncao = '2023-02-15' WHERE idFuncao = 4;
UPDATE Funcao SET nome = 'Flautista' WHERE idFuncao = 5;

-- Atualizações para a tabela Sinfonia--

UPDATE Sinfonia SET compositor = 'Mahler' WHERE idSinfonia = 1;
UPDATE Sinfonia SET nome = 'Sinfonia No. 9 de Beethoven' WHERE idSinfonia = 2;
UPDATE Sinfonia SET compositor = 'Brahms' WHERE idSinfonia = 3;
UPDATE Sinfonia SET nome = 'Sinfonia de Nova York' WHERE idSinfonia = 4;
UPDATE Sinfonia SET compositor = 'Mozart' WHERE idSinfonia = 5;

-- Atualizações para a tabela Orquestra --

UPDATE Orquestra SET cidade = 'Rio de Janeiro' WHERE idOrquestra = 1;
UPDATE Orquestra SET pais = 'Argentina' WHERE idOrquestra = 2;
UPDATE Orquestra SET nome = 'Orquestra Sinfônica de São Paulo' WHERE idOrquestra = 3;
UPDATE Orquestra SET dataCriacao = '2000-06-15' WHERE idOrquestra = 4;
UPDATE Orquestra SET nome = 'Orquestra Filarmônica de Berlim' WHERE idOrquestra = 5;

-- Atualizações para a tabela Musico --

UPDATE Musico SET status = 'Inativo' WHERE cpf = '12345678900';
UPDATE Musico SET nacionalidade = 'Argentina' WHERE cpf = '09876543211';
UPDATE Musico SET dataNasc = '1992-12-31' WHERE cpf = '23456789012';
UPDATE Musico SET Instrumento_idInstrumento = 3 WHERE cpf = '34567890123';
UPDATE Musico SET Orquestra_idOrquestra = 2 WHERE cpf = '45678901234';

-- Atualizações para a tabela Desempenha --

UPDATE Desempenha SET Funcao_idFuncao = 3 WHERE idDesempenha = 1;
UPDATE Desempenha SET Sinfonia_idSinfonia = 4 WHERE idDesempenha = 2;
UPDATE Desempenha SET Musico_cpf = '67890123456' WHERE idDesempenha = 3;
UPDATE Desempenha SET Funcao_idFuncao = 1 WHERE idDesempenha = 4;
UPDATE Desempenha SET Sinfonia_idSinfonia = 5 WHERE idDesempenha = 5;

-- Atualizações para a tabela OrquestraSinfonia --

UPDATE OrquestraSinfonia SET Orquestra_idOrquestra = 3 WHERE Sinfonia_idSinfonia = 1;
UPDATE OrquestraSinfonia SET Sinfonia_idSinfonia = 2 WHERE Orquestra_idOrquestra = 1;













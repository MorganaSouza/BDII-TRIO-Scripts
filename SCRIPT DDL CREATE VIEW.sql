-- 1. View para listar músicos e seus instrumentos 

CREATE VIEW vw_MusicosInstrumentos AS 

SELECT m.nome AS nome_musico, i.nome AS nome_instrumento 

FROM Musico AS m 

JOIN Instrumento AS i ON m.Instrumento_idInstrumento = i.idInstrumento; 

  

-- 2. View para listar sinfonias e seus compositores 

CREATE VIEW vw_SinfoniasCompositores AS 

SELECT s.nome AS nome_sinfonia, s.compositor 

FROM Sinfonia AS s; 

  

-- 3. View para listar orquestras e seus países 

CREATE VIEW vw_OrquestrasPaises AS 

SELECT o.nome AS nome_orquestra, o.pais 

FROM Orquestra AS o; 

  

-- 4. View para listar músicos e suas orquestras 

CREATE VIEW vw_MusicosOrquestras AS 

SELECT m.nome AS nome_musico, o.nome AS nome_orquestra 

FROM Musico AS m 

JOIN Orquestra AS o ON m.Orquestra_idOrquestra = o.idOrquestra; 

  

  

-- 5. View para listar as funções e os músicos que as desempenham 

CREATE VIEW vw_FuncoesMusicos AS 

SELECT f.nome AS nome_funcao, m.nome AS nome_musico 

FROM Funcao AS f 

JOIN Desempenha AS d ON f.idFuncao = d.Funcao_idFuncao 

JOIN Musico AS m ON d.Musico_cpf = m.cpf; 

  

-- 6. View para listar sinfonias e as orquestras que as executaram 

CREATE VIEW vw_SinfoniasOrquestras AS 

SELECT s.nome AS nome_sinfonia, o.nome AS nome_orquestra 

FROM Sinfonia AS s 

JOIN OrquestraSinfonia AS os ON s.idSinfonia = os.Sinfonia_idSinfonia 

JOIN Orquestra AS o ON os.Orquestra_idOrquestra = o.idOrquestra; 

  

-- 7. View para listar músicos que nasceram depois de 1990 

CREATE VIEW vw_MusicosNascidosDepois1990 AS 

SELECT nome 

FROM Musico 

WHERE dataNasc > '1990-01-01'; 

  

-- 8. View para listar instrumentos fabricados pela Yamaha 

CREATE VIEW vw_InstrumentosYamaha AS 

SELECT nome 

FROM Instrumento 

WHERE fabricante = 'Yamaha'; 

  

  

-- 9. View para listar as orquestras do Brasil 

CREATE VIEW vw_OrquestrasBrasil AS 

SELECT nome 

FROM Orquestra 

WHERE pais = 'Brasil'; 

  

  

-- 10. View que lista o nome do músico, a função que desempenha e a sinfonia correspondente 

CREATE VIEW vw_MusicoFuncaoSinfonia AS 

SELECT m.nome AS nome_musico, f.nome AS nome_funcao, s.nome AS nome_sinfonia 

FROM Musico AS m 

JOIN Desempenha AS d ON m.cpf = d.Musico_cpf 

JOIN Funcao AS f ON d.Funcao_idFuncao = f.idFuncao 

JOIN Sinfonia AS s ON d.Sinfonia_idSinfonia = s.idSinfonia; 

 

 

-- SCRIPTS consultas/perguntas/relatórios (DQL) 

-- 1. Listagem de músicos por orquestra 

SELECT m.nome AS musico, m.cpf, o.nome AS orquestra, i.nome AS instrumento 

FROM Musico m 

JOIN Orquestra o ON m.Orquestra_idOrquestra = o.idOrquestra 

JOIN Instrumento i ON m.Instrumento_idInstrumento = i.idInstrumento; 

  

-- 2. Músicos por nacionalidade 

SELECT m.nome, m.cpf, m.nacionalidade, i.nome AS instrumento 

FROM Musico m 

JOIN Instrumento i ON m.Instrumento_idInstrumento = i.idInstrumento 

 

WHERE m.nacionalidade = 'Brasileiro';  -- Substituir pela nacionalidade desejada 

  

-- 3. Aniversariantes do mês 

SELECT nome, cpf, dataNasc, Orquestra_idOrquestra 

FROM Musico 

WHERE MONTH(dataNasc) = MONTH(CURRENT_DATE); 

  

-- 4. Instrumentos mais tocados pelos músicos 

SELECT i.nome AS instrumento, COUNT(m.cpf) AS qtd_musicos 

FROM Instrumento i 

JOIN Musico m ON m.Instrumento_idInstrumento = i.idInstrumento 

GROUP BY i.nome 

ORDER BY qtd_musicos DESC; 

  

-- 5. Músicos por função 

SELECT m.nome, m.cpf, f.nome AS funcao, o.nome AS orquestra 

FROM Musico m 

JOIN Desempenha d ON m.cpf = d.Musico_cpf 

JOIN Funcao f ON d.Funcao_idFuncao = f.idFuncao 

JOIN Orquestra o ON m.Orquestra_idOrquestra = o.idOrquestra; 

  

  

-- 6. Histórico de participação dos músicos em sinfonias 

SELECT m.nome AS musico, s.nome AS sinfonia, f.nome AS funcao, d.idDesempenha AS desempenho 

FROM Desempenha d 

JOIN Musico m ON d.Musico_cpf = m.cpf 

 

JOIN Sinfonia s ON d.Sinfonia_idSinfonia = s.idSinfonia 

JOIN Funcao f ON d.Funcao_idFuncao = f.idFuncao; 

  

  

-- 7. Listagem de instrumentos por orquestra 

SELECT i.nome AS instrumento, i.modelo, i.fabricante, o.nome AS orquestra 

FROM Instrumento i 

JOIN Musico m ON m.Instrumento_idInstrumento = i.idInstrumento 

JOIN Orquestra o ON m.Orquestra_idOrquestra = o.idOrquestra; 

  

-- 8. Instrumentos mais antigos 

SELECT nome, modelo, fabricante, datFabricacao 

FROM Instrumento 

ORDER BY datFabricacao ASC; 

  

-- 9. Status de instrumentos 

SELECT status, COUNT(idInstrumento) AS qtd_instrumentos 

FROM Instrumento 

GROUP BY status; 

  

-- 10. Instrumentos por tipo 

SELECT tipo, COUNT(idInstrumento) AS qtd_instrumentos 

FROM Instrumento 

GROUP BY tipo; 

  

-- 11. Orquestras por país e cidade 

SELECT o.nome AS orquestra, o.cidade, o.pais 

FROM Orquestra o 

WHERE o.pais = 'Brasil';  -- Substituir pelo país desejado 

  

 -- 12. Orquestras e sinfonias executadas 

SELECT o.nome AS orquestra, s.nome AS sinfonia, s.compositor 

FROM OrquestraSinfonia os 

JOIN Orquestra o ON os.Orquestra_idOrquestra = o.idOrquestra 

JOIN Sinfonia s ON os.Sinfonia_idSinfonia = s.idSinfonia; 

 

-- 13. Datas de criação de orquestras 

SELECT nome, cidade, pais, dataCriacao 

FROM Orquestra; 

  

-- 14. Orquestras com mais sinfonias executadas 

SELECT o.nome AS orquestra, COUNT(os.Sinfonia_idSinfonia) AS qtd_sinfonias 

FROM OrquestraSinfonia os 

JOIN Orquestra o ON os.Orquestra_idOrquestra = o.idOrquestra 

GROUP BY o.nome 

ORDER BY qtd_sinfonias DESC; 

  

-- 15. Sinfonias por compositor 

SELECT compositor, COUNT(idSinfonia) AS qtd_sinfonias 

FROM Sinfonia 

GROUP BY compositor; 

  

-- 16. Sinfonias por orquestra e função desempenhada 

SELECT s.nome AS sinfonia, o.nome AS orquestra, m.nome AS musico, f.nome AS funcao 

FROM Desempenha d 

JOIN Sinfonia s ON d.Sinfonia_idSinfonia = s.idSinfonia 

JOIN Musico m ON d.Musico_cpf = m.cpf 

JOIN Funcao f ON d.Funcao_idFuncao = f.idFuncao 

JOIN Orquestra o ON m.Orquestra_idOrquestra = o.idOrquestra; 

 

-- 17. Histórico de execuções de sinfonias por ano 

SELECT s.nome AS sinfonia, s.compositor, YEAR(d.dataAssuncao) AS ano_execucao 

FROM Desempenha d 

JOIN Sinfonia s ON d.Sinfonia_idSinfonia = s.idSinfonia 

WHERE YEAR(d.datAssuncao) = 2024;  -- Substituir pelo ano desejado 

  

-- 18. Compositores mais executados 

SELECT s.compositor, COUNT(d.Sinfonia_idSinfonia) AS qtd_execucoes 

FROM Desempenha d 

JOIN Sinfonia s ON d.Sinfonia_idSinfonia = s.idSinfonia 

GROUP BY s.compositor 

ORDER BY qtd_execucoes DESC; 

 

-- 19. Sinfonias e seus desempenhos 

SELECT s.nome AS sinfonia, m.nome AS musico, f.nome AS funcao 

FROM Desempenha d 

JOIN Sinfonia s ON d.Sinfonia_idSinfonia = s.idSinfonia 

JOIN Musico m ON d.Musico_cpf = m.cpf 

JOIN Funcao f ON d.Funcao_idFuncao = f.idFuncao; 

  

-- 20. Músicos por orquestra e idade 


SELECT m.nome AS musico, o.nome AS orquestra,  

       YEAR(CURDATE()) - YEAR(m.dataNasc) AS idade 

FROM Musico m 

JOIN Orquestra o ON m.Orquestra_idOrquestra = o.idOrquestra 

ORDER BY idade DESC; 

 
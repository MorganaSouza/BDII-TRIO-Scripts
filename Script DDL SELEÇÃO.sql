-- 1. Listar todos os músicos e seus respectivos instrumentos 

SELECT m.nome AS nome_musico, i.nome AS nome_instrumento 

FROM Musico AS m 

JOIN Instrumento AS i ON m.Instrumento_idInstrumento = i.idInstrumento; 

  

-- 2. Listar os músicos que tocam 'Violino' 

SELECT m.nome 

FROM Musico AS m 

JOIN Instrumento AS i ON m.Instrumento_idInstrumento = i.idInstrumento 

WHERE i.nome = 'Violino'; 

  

-- 3. Listar as sinfonias compostas por 'Beethoven' 

SELECT nome 

FROM Sinfonia 

WHERE compositor = 'Beethoven'; 

  

-- 4. Listar todos os músicos da orquestra 'Orquestra Sinfônica de São Paulo' 

SELECT m.nome 

FROM Musico AS m 

JOIN Orquestra AS o ON m.Orquestra_idOrquestra = o.idOrquestra 

WHERE o.nome = 'Orquestra Sinfônica de São Paulo'; 

  

-- 5. Listar todas as funções desempenhadas na sinfonia 'Sinfonia No. 5' 

SELECT f.nome 

FROM Funcao AS f 

JOIN Desempenha AS d ON f.idFuncao = d.Funcao_idFuncao 

JOIN Sinfonia AS s ON d.Sinfonia_idSinfonia = s.idSinfonia 

WHERE s.nome = 'Sinfonia No. 5'; 

  

-- 6. Listar os músicos que nasceram depois de 1990 

SELECT nome 

FROM Musico 

 

WHERE dataNasc > '1990-01-01'; 

  

-- 7. Listar os instrumentos fabricados pela 'Yamaha' 

SELECT nome 

FROM Instrumento 

WHERE fabricante = 'Yamaha'; 

 

-- 8. Listar as orquestras do Brasil 

SELECT nome 

FROM Orquestra 

WHERE pais = 'Brasil'; 

  

-- 9. Listar os músicos que desempenham a função de 'Regente' 

SELECT m.nome 

FROM Musico AS m 

JOIN Desempenha AS d ON m.cpf = d.Musico_cpf 

JOIN Funcao AS f ON d.Funcao_idFuncao = f.idFuncao 

WHERE f.nome = 'Regente'; 

  

-- 10. Listar as sinfonias que foram executadas pela 'Orquestra Filarmônica de Berlim' 

SELECT s.nome 

FROM Sinfonia AS s 

JOIN OrquestraSinfonia AS os ON s.idSinfonia = os.Sinfonia_idSinfonia 

JOIN Orquestra AS o ON os.Orquestra_idOrquestra = o.idOrquestra 

WHERE o.nome = 'Orquestra Filarmônica de Berlim'; 

  

-- 11. Listar o nome e o país das orquestras que executaram a 'Sinfonia No. 9' 

SELECT o.nome, o.pais 

FROM Orquestra AS o 

JOIN OrquestraSinfonia AS os ON o.idOrquestra = os.Orquestra_idOrquestra 

JOIN Sinfonia AS s ON os.Sinfonia_idSinfonia = s.idSinfonia 

WHERE s.nome = 'Sinfonia No. 9'; 

  

-- 12.  Listar todos os músicos e a quantidade de sinfonias que eles executaram 

SELECT m.nome, COUNT(d.Sinfonia_idSinfonia) AS quantidade_sinfonias 

FROM Musico AS m 

LEFT JOIN Desempenha AS d ON m.cpf = d.Musico_cpf 

GROUP BY m.nome; 

  

-- 13. Listar os instrumentos e os músicos que os tocam, ordenados pelo nome do instrumento 

SELECT i.nome AS nome_instrumento, m.nome AS nome_musico 

FROM Instrumento AS i 

LEFT JOIN Musico AS m ON i.idInstrumento = m.Instrumento_idInstrumento 

ORDER BY i.nome; 

  

-- 14. Listar as orquestras que não executaram nenhuma sinfonia 

SELECT o.nome 

FROM Orquestra AS o 

LEFT JOIN OrquestraSinfonia AS os ON o.idOrquestra = os.Orquestra_idOrquestra 

WHERE os.Sinfonia_idSinfonia IS NULL; 

  

-- 15. Listar os músicos brasileiros que tocam instrumentos de corda 

SELECT m.nome 

FROM Musico AS m 

JOIN Instrumento AS i ON m.Instrumento_idInstrumento = i.idInstrumento 

WHERE m.nacionalidade = 'Brasileira' AND i.tipo = 'Cordas'; 

  

-- 16. Listar o nome dos músicos e as funções que desempenharam, mesmo que não tenham desempenhado nenhuma função 

SELECT m.nome, f.nome AS nome_funcao 

FROM Musico AS m 

LEFT JOIN Desempenha AS d ON m.cpf = d.Musico_cpf 

LEFT JOIN Funcao AS f ON d.Funcao_idFuncao = f.idFuncao; 

  

-- 17. Listar o CPF dos músicos que não participaram de nenhuma sinfonia 

SELECT m.cpf 

FROM Musico AS m 

LEFT JOIN Desempenha AS d ON m.cpf = d.Musico_cpf 

WHERE d.idDesempenha IS NULL; 

  

-- 18.  Listar o nome das sinfonias e a quantidade de músicos que a executaram 

SELECT s.nome, COUNT(d.Musico_cpf) AS qtd_musicos 

FROM Sinfonia AS s 

LEFT JOIN Desempenha AS d ON s.idSinfonia = d.Sinfonia_idSinfonia 

GROUP BY s.nome; 

   

 

 

-- 19. Listar os músicos que tocam mais de um instrumento (precisa adaptar o banco para tabela MusicoInstrumento) 

SELECT m.nome 

FROM Musico AS m 

JOIN MusicoInstrumento AS mi ON m.cpf = mi.Musico_cpf 

GROUP BY m.nome 

HAVING COUNT(mi.Instrumento_idInstrumento) > 1; 

  

-- 20. Listar as orquestras e seus músicos, ordenados pelo nome da orquestra (precisa adaptar o banco para tabela MusicoOrquestra) 

SELECT o.nome AS nome_orquestra, m.nome AS nome_musico 

FROM Orquestra AS o 

LEFT JOIN MusicoOrquestra AS mo ON o.idOrquestra = mo.Orquestra_idOrquestra 

LEFT JOIN Musico AS m ON mo.Musico_cpf = m.cpf 

ORDER BY o.nome; 

 

 
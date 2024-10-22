-- Comando SQL: DML DROP 

-- Deixei por último e não rodei pois, iria apagar as tables -- 

-- Crie um script para destruir (DDL) todas as tabelas, views, procedimentos, funções e dependências do seu banco de dados -- 

-- ------------------------------------ 

-- Remover as tabelas na ordem correta para evitar problemas de dependência 

DROP TABLE IF EXISTS OrquestraSinfonia; 

DROP TABLE IF EXISTS Desempenha; 

DROP TABLE IF EXISTS Musico; 

DROP TABLE IF EXISTS Sinfonia; 

DROP TABLE IF EXISTS Funcao; 

DROP TABLE IF EXISTS Orquestra; 

DROP TABLE IF EXISTS Instrumento; 

 

-- Remover o schema, se necessário 

DROP SCHEMA IF EXISTS escolademusica_sql; 

 

-- Reabilitar verificações de chaves estrangeiras 

SET FOREIGN_KEY_CHECKS = 1; 
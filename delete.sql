-- Deletar um cliente específico pelo ID
DELETE FROM Clientes
WHERE ClienteID = 1;

-- Deletar um cliente pelo nome
DELETE FROM Clientes
WHERE Nome = 'Andre';

-- Deletar todos os clientes (⚠️ cuidado!)
DELETE FROM Clientes;

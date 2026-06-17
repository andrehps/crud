-- Atualizar o email de um cliente específico pelo ID
UPDATE Clientes
SET Email = 'andresql@example.com'
WHERE ClienteID = 1;

-- Atualizar o telefone de um cliente pelo nome
UPDATE Clientes
SET Telefone = '++34 000 820 456'
WHERE Nome = 'Andre';

-- Atualizar múltiplos campos de uma vez
UPDATE Clientes
SET Nome = 'Andre Luiz',
    Telefone = '+34 000 820 456'
WHERE ClienteID = 2;

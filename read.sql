-- Improved read.sql
-- Parameterized read with optional filters, ordering, and pagination.
-- Replace parameter syntax (:param, @param, ?) with the one your DB/driver uses.

-- Generic template (adapt CONCAT/placeholder syntax for your DB):
SELECT
	ClienteID,
	Nome,
	Email,
	Telefone,
	DataCadastro
FROM Clientes
WHERE 1=1
	-- Optional: filter by exact ID
	AND (:ClienteID IS NULL OR ClienteID = :ClienteID)
	-- Optional: partial name search. Replace CONCAT if your DB uses a different function/operator.
	AND (:Nome IS NULL OR Nome LIKE CONCAT('%', :Nome, '%'))
	-- Optional: exact email match
	AND (:Email IS NULL OR Email = :Email)
ORDER BY DataCadastro DESC
LIMIT :Limit OFFSET :Offset; -- Use OFFSET/FETCH for SQL Server

-- SQL Server example (use @ parameters and string concatenation with +):
-- SELECT ClienteID, Nome, Email, Telefone, DataCadastro
-- FROM Clientes
-- WHERE 1=1
--   AND (@ClienteID IS NULL OR ClienteID = @ClienteID)
--   AND (@Nome IS NULL OR Nome LIKE '%' + @Nome + '%')
--   AND (@Email IS NULL OR Email = @Email)
-- ORDER BY DataCadastro DESC
-- OFFSET @Offset ROWS FETCH NEXT @Limit ROWS ONLY;

-- Simple non-parameterized example (quick ad-hoc):
-- SELECT ClienteID, Nome, Email, Telefone, DataCadastro
-- FROM Clientes
-- ORDER BY DataCadastro DESC
-- LIMIT 100;

-- Notes:
-- - Use your client library's parameter binding to supply values for :ClienteID, :Nome, :Email, :Limit, :Offset.
-- - For MySQL, use CONCAT('%', ?, '%') or CONCAT('%', :Nome, '%'). For Postgres use '%' || :Nome || '%'.
-- - Adjust LIMIT/OFFSET or OFFSET/FETCH according to your SQL dialect.
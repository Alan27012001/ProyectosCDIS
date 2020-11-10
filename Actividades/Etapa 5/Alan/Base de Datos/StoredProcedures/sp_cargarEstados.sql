USE Escuela
GO

IF(OBJECT_ID('sp_cargarEstados')IS NOT NULL)
	DROP PROCEDURE sp_cargarEstados
GO

CREATE PROCEDURE sp_cargarEstados

AS
BEGIN
	SELECT * FROM Estado
END
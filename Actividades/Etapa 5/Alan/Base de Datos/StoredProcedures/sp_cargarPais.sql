USE Escuela
GO

IF(OBJECT_ID('sp_cargarPais')IS NOT NULL)
	DROP PROCEDURE sp_cargarPais
GO

CREATE PROCEDURE sp_cargarPais
AS
BEGIN
	SELECT * FROM Pais
END
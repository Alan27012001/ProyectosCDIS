USE [Escuela]
GO

CREATE PROCEDURE sp_cargarEstadosPorPais
	@pPais		INT
AS
BEGIN
	SELECT * FROM Estado
	WHERE IdPais = @pPais
END
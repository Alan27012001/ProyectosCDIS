USE Escuela
GO

IF(OBJECT_ID('sp_eliminarfacultad')IS NOT NULL)
	DROP PROCEDURE sp_eliminarfacultad
GO

CREATE PROCEDURE sp_eliminarfacultad
	@pIdFacultad		INT
AS
BEGIN
	DELETE FROM Facultad
	WHERE Id_Facultad = @pIdFacultad
END
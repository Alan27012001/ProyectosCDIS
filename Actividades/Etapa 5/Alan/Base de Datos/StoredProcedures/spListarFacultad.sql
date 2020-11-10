USE Escuela
GO
CREATE PROCEDURE spListarFacultad
AS
BEGIN
	SELECT Id_Facultad,Codigo,Nombre,FechaCreacion FROM Facultad 
END

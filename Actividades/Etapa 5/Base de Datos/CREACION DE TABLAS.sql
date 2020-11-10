CREATE DATABASE Escuela

USE Escuela
								/*CREACION DE TABLAS*/
CREATE TABLE Alumno
(
	Matricula			INT NOT NULL,
	Nombre				VARCHAR(100) NOT NULL,
	FechaNacimiento		DATE NOT NULL,
	Semestre			INT NOT NULL,
	Facultad			INT NOT NULL,
	CONSTRAINT PK_Alumno_Matricula PRIMARY KEY(Matricula),
	CONSTRAINT FK_Alumno_Facultad_Facultad FOREIGN KEY(Facultad)
	REFERENCES Facultad(Id_Facultad)
)

CREATE TABLE Facultad
(
	Id_Facultad			INT IDENTITY(1,1),
	Codigo				VARCHAR(10) NOT NULL,
	Nombre				VARCHAR(100) NOT NULL,
	FechaCreacion		DATE NOT NULL,
	Universidad			INT NOT NULL,
	CONSTRAINT PK_Facultad_Id PRIMARY KEY(Id_Facultad),
	CONSTRAINT FK_Facultad_Universidad_Universidad FOREIGN KEY(Universidad)
	REFERENCES Universidad(Id_Universidad)
)

CREATE TABLE Universidad
(
	Id_Universidad		INT IDENTITY(1,1),
	Nombre				VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Universidad_Id PRIMARY KEY(Id_Universidad)
)


									/*INSERCIÓN DE DATOS DE LAS TABLAS*/
/*Universidad*/
INSERT Universidad VALUES('Universidad de Nuevo Leon')
INSERT Universidad VALUES('Universidad de Monterrey')

/*Facultad*/
INSERT Facultad VALUES('FIME001','Facultad de Ingeneria','1940-05-05',1)
INSERT Facultad VALUES('FARQ002','Facultad de Arquitectura','1950-06-06',2)

/*Alumno*/
INSERT Alumno VALUES('1223211','James Aranda','1992-05-05',10,2)
INSERT Alumno VALUES('1232134','Manuel Perez','1994-02-03',8,1)

SELECT * FROM Universidad
SELECT * FROM Facultad
SELECT * FROM Alumno
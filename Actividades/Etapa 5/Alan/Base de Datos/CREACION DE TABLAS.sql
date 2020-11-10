CREATE DATABASE Escuela
USE Escuela

DROP TABLE Alumno
DROP TABLE MateriaFacultad
DROP TABLE Facultad
DROP TABLE Universidad
DROP TABLE Ciudad
DROP TABLE Estado
DROP TABLE Pais
DROP TABLE Materia


								/*CREACION DE TABLAS*/
CREATE TABLE Pais
(
	Id				INT IDENTITY(1,1),
	Nombre			VARCHAR(50)NOT NULL,
	CONSTRAINT PK_Pais_Id PRIMARY KEY(Id)
)

CREATE TABLE Estado
(
	Id				INT IDENTITY(1,1),
	Nombre			VARCHAR(50)NOT NULL,
	IdPais			INT NOT NULL,
	CONSTRAINT PK_Estado_Id PRIMARY KEY(Id),
	CONSTRAINT FK_Estado_Pais FOREIGN KEY(IdPais)
	REFERENCES Pais(Id)
)

CREATE TABLE Ciudad
(
	Id				INT IDENTITY(1,1),
	Nombre			VARCHAR(50)NOT NULL,
	IdEstado		INT,
	CONSTRAINT Pk_Ciudad_Id PRIMARY KEY(Id),
	CONSTRAINT FK_Ciudad_Estado_IdEstado FOREIGN KEY(IdEstado)
	REFERENCES Estado(Id)
)

CREATE TABLE Universidad
(
	Id_Universidad		INT IDENTITY(1,1),
	Nombre				VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Universidad_Id PRIMARY KEY(Id_Universidad)
)

CREATE TABLE Facultad
(
	Id_Facultad			INT IDENTITY(1,1),
	Codigo				VARCHAR(10) NOT NULL,
	Nombre				VARCHAR(100) NOT NULL,
	FechaCreacion		DATE NOT NULL,
	Universidad			INT NOT NULL,
	IdCiudad			INT NOT NULL,
	CONSTRAINT PK_Facultad_Id PRIMARY KEY(Id_Facultad),
	CONSTRAINT FK_Facultad_Universidad_Universidad FOREIGN KEY(Universidad)
	REFERENCES Universidad(Id_Universidad),
	CONSTRAINT FK_Facultad_Ciudad_IdCiudad FOREIGN KEY(IdCiudad)
	REFERENCES Ciudad(Id)
)

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

CREATE TABLE Usuario
(
	Id				INT IDENTITY(1,1),
	Nombre			VARCHAR(50) NOT NULL,
	Contrasena		VARCHAR(10) NOT NULL,
	Tipo			VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Usuario_Id PRIMARY KEY(Id)
)

CREATE TABLE Materia
(
	Id				INT IDENTITY(1,1),
	Nombre			VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Materia_Id PRIMARY KEY(Id)
)

CREATE TABLE MateriaFacultad
(
	Id				INT IDENTITY(1,1),
	IdMateria		INT NOT NULL,
	IdFacultad		INT NOT NULL,
	CONSTRAINT PK_MateriaFacultad_Id PRIMARY KEY(Id),
	CONSTRAINT FK_MateriaFacultad_Materia FOREIGN KEY(IdMateria)
	REFERENCES Materia(Id),
	CONSTRAINT FK_MateriaFacultad_Facultad_IdFacultad FOREIGN KEY(IdFacultad)
	REFERENCES Facultad(Id_Facultad)
)


									/*INSERCIÓN DE DATOS DE LAS TABLAS*/
/*Pais*/
INSERT Pais VALUES('Mexico')

/*Estado*/
INSERT Estado VALUES('Nuevo León',1)
INSERT Estado VALUES('Tamaulipas',1)

/*Ciudad*/
INSERT Ciudad VALUES('Monterrey',1)
INSERT Ciudad VALUES('San Nicolas',1)
INSERT Ciudad VALUES('Victoria',2)
INSERT Ciudad VALUES('Reynosa',2)

/*Universidad*/
INSERT Universidad VALUES('Universidad de Nuevo Leon')
INSERT Universidad VALUES('Universidad de Monterrey')

/*Facultad*/
INSERT Facultad VALUES('FIME001','Facultad de Ingeneria','1940-05-05',1,1)
INSERT Facultad VALUES('FARQ002','Facultad de Arquitectura','1950-06-06',2,1)

/*Alumno*/
INSERT Alumno VALUES('1223211','James Aranda','1992-05-05',10,2)
INSERT Alumno VALUES('1232134','Manuel Perez','1994-02-03',8,1)

/*Usuario*/
INSERT Usuario VALUES('Alan','1234','Administrador')
INSERT Usuario VALUES('Brandon','1234','Maestro')

/*Materia*/
INSERT Materia VALUES('Programación')
INSERT Materia VALUES('Base de Datos')

/*Nota: el 4 puede cambiar segun el ID de la facultad que se encuentre*/
/*MateriaFacultad*/
INSERT MateriaFacultad VALUES(1,1)
INSERT MateriaFacultad VALUES(2,2)


SELECT * FROM Usuario
SELECT * FROM Alumno
SELECT * FROM Universidad
SELECT * FROM Ciudad
SELECT * FROM Estado
SELECT * FROM Pais
SELECT * FROM Materia
SELECT * FROM MateriaFacultad
SELECT * FROM Facultad




/*SCRIP PARA EL SERVICIO DEL PROYECTO*/
CREATE TABLE facultad
(
	Id_Facultad		INT NOT NULL PRIMARY KEY identity,
	Codigo			VARCHAR(50)NOT NULL,
	Nombre			VARCHAR(80)NOT NULL,
	FechaCreacion	DATE NOT NULL
)

INSERT facultad VALUES('FIME001','Facultad de Ingeneria','1940-05-05')
INSERT facultad VALUES('FARQ002','Facultad de Arquitectura','1950-06-06')
INSERT facultad VALUES('FACPYA003','Facultad de Contaduria Publica y Administracion','1917-07-18')

SELECT * FROM facultad
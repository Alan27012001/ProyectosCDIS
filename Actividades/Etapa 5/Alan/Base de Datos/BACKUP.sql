/****** Object:  Database [Escuela]    Script Date: 05/08/2020 11:29:37 a. m. ******/
CREATE DATABASE [Escuela]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Escuela', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Escuela.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Escuela_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Escuela_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Escuela] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Escuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Escuela] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Escuela] SET ARITHABORT OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Escuela] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Escuela] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Escuela] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Escuela] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Escuela] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Escuela] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Escuela] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Escuela] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Escuela] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Escuela] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Escuela] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Escuela] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Escuela] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Escuela] SET RECOVERY FULL 
GO
ALTER DATABASE [Escuela] SET  MULTI_USER 
GO
ALTER DATABASE [Escuela] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Escuela] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Escuela] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Escuela] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Escuela] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Escuela', N'ON'
GO
ALTER DATABASE [Escuela] SET QUERY_STORE = OFF
GO
USE [Escuela]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 05/08/2020 11:29:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Matricula] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Semestre] [int] NOT NULL,
	[Facultad] [int] NOT NULL,
 CONSTRAINT [PK_Alumno_Matricula] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdEstado] [int] NULL,
 CONSTRAINT [Pk_Ciudad_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdPais] [int] NOT NULL,
 CONSTRAINT [PK_Estado_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facultad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facultad](
	[Id_Facultad] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[Universidad] [int] NOT NULL,
	[IdCiudad] [int] NOT NULL,
 CONSTRAINT [PK_Facultad_Id] PRIMARY KEY CLUSTERED 
(
	[Id_Facultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Materia_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MateriaFacultad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MateriaFacultad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMateria] [int] NOT NULL,
	[IdFacultad] [int] NOT NULL,
 CONSTRAINT [PK_MateriaFacultad_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universidad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universidad](
	[Id_Universidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Universidad_Id] PRIMARY KEY CLUSTERED 
(
	[Id_Universidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contrasena] [varchar](10) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [FechaNacimiento], [Semestre], [Facultad]) VALUES (1223211, N'James Aranda', CAST(N'1992-05-05' AS Date), 10, 2)
GO
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [FechaNacimiento], [Semestre], [Facultad]) VALUES (1232134, N'Manuel Perez', CAST(N'1994-02-03' AS Date), 8, 1)
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([Id], [Nombre], [IdEstado]) VALUES (1, N'Monterrey', 1)
GO
INSERT [dbo].[Ciudad] ([Id], [Nombre], [IdEstado]) VALUES (2, N'San Nicolas', 1)
GO
INSERT [dbo].[Ciudad] ([Id], [Nombre], [IdEstado]) VALUES (3, N'Victoria', 2)
GO
INSERT [dbo].[Ciudad] ([Id], [Nombre], [IdEstado]) VALUES (4, N'Reynosa', 2)
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 
GO
INSERT [dbo].[Estado] ([Id], [Nombre], [IdPais]) VALUES (1, N'Nuevo León', 1)
GO
INSERT [dbo].[Estado] ([Id], [Nombre], [IdPais]) VALUES (2, N'Tamaulipas', 1)
GO
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Facultad] ON 
GO
INSERT [dbo].[Facultad] ([Id_Facultad], [Codigo], [Nombre], [FechaCreacion], [Universidad], [IdCiudad]) VALUES (1, N'FIME001', N'Facultad de Ingeneria', CAST(N'1940-05-05' AS Date), 1, 1)
GO
INSERT [dbo].[Facultad] ([Id_Facultad], [Codigo], [Nombre], [FechaCreacion], [Universidad], [IdCiudad]) VALUES (2, N'FARQ002', N'Facultad de Arquitectura', CAST(N'1950-06-06' AS Date), 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Facultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 
GO
INSERT [dbo].[Materia] ([Id], [Nombre]) VALUES (1, N'Programación')
GO
INSERT [dbo].[Materia] ([Id], [Nombre]) VALUES (2, N'Base de Datos')
GO
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
SET IDENTITY_INSERT [dbo].[MateriaFacultad] ON 
GO
INSERT [dbo].[MateriaFacultad] ([Id], [IdMateria], [IdFacultad]) VALUES (1, 1, 1)
GO
INSERT [dbo].[MateriaFacultad] ([Id], [IdMateria], [IdFacultad]) VALUES (10, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[MateriaFacultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 
GO
INSERT [dbo].[Pais] ([Id], [Nombre]) VALUES (1, N'Mexico')
GO
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Universidad] ON 
GO
INSERT [dbo].[Universidad] ([Id_Universidad], [Nombre]) VALUES (1, N'Universidad de Nuevo Leon')
GO
INSERT [dbo].[Universidad] ([Id_Universidad], [Nombre]) VALUES (2, N'Universidad de Monterrey')
GO
SET IDENTITY_INSERT [dbo].[Universidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Contrasena], [Tipo]) VALUES (1, N'Alan', N'1234', N'Administrador')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Contrasena], [Tipo]) VALUES (2, N'James', N'1234', N'Maestro')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Contrasena], [Tipo]) VALUES (3, N'Alan', N'1234', N'Administrador')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Contrasena], [Tipo]) VALUES (4, N'Brandon', N'1234', N'Maestro')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Facultad_Facultad] FOREIGN KEY([Facultad])
REFERENCES [dbo].[Facultad] ([Id_Facultad])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Facultad_Facultad]
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Estado_IdEstado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_Estado_IdEstado]
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD  CONSTRAINT [FK_Estado_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([Id])
GO
ALTER TABLE [dbo].[Estado] CHECK CONSTRAINT [FK_Estado_Pais]
GO
ALTER TABLE [dbo].[Facultad]  WITH CHECK ADD  CONSTRAINT [FK_Facultad_Ciudad_IdCiudad] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[Ciudad] ([Id])
GO
ALTER TABLE [dbo].[Facultad] CHECK CONSTRAINT [FK_Facultad_Ciudad_IdCiudad]
GO
ALTER TABLE [dbo].[Facultad]  WITH CHECK ADD  CONSTRAINT [FK_Facultad_Universidad_Universidad] FOREIGN KEY([Universidad])
REFERENCES [dbo].[Universidad] ([Id_Universidad])
GO
ALTER TABLE [dbo].[Facultad] CHECK CONSTRAINT [FK_Facultad_Universidad_Universidad]
GO
ALTER TABLE [dbo].[MateriaFacultad]  WITH CHECK ADD  CONSTRAINT [FK_MateriaFacultad_Facultad_IdFacultad] FOREIGN KEY([IdFacultad])
REFERENCES [dbo].[Facultad] ([Id_Facultad])
GO
ALTER TABLE [dbo].[MateriaFacultad] CHECK CONSTRAINT [FK_MateriaFacultad_Facultad_IdFacultad]
GO
ALTER TABLE [dbo].[MateriaFacultad]  WITH CHECK ADD  CONSTRAINT [FK_MateriaFacultad_Materia] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materia] ([Id])
GO
ALTER TABLE [dbo].[MateriaFacultad] CHECK CONSTRAINT [FK_MateriaFacultad_Materia]
GO
/****** Object:  StoredProcedure [dbo].[sp_agregarfacultad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_agregarfacultad]
	@pCodigo				VARCHAR(10),
	@pNombre				VARCHAR(100),
	@pFechaCreacion			DATE,
	@pUniversidad			INT,
	@pCiudad				INT
AS
BEGIN
	INSERT INTO Facultad VALUES(@pCodigo,@pNombre,@pFechaCreacion,@pUniversidad,@pCiudad)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarCiudadesPorEstado]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarCiudadesPorEstado]
	@pEstado		INT
AS
BEGIN
	SELECT * FROM Ciudad
	WHERE IdEstado = @pEstado
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarEstadosPorPais]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarEstadosPorPais]
	@pPais		INT
AS
BEGIN
	SELECT * FROM Estado
	WHERE IdPais = @pPais
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarFacultades]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarFacultades]	
AS
BEGIN
	SELECT f.Id_Facultad,f.Codigo,f.Nombre,f.FechaCreacion,
	u.Nombre AS NombreUniversidad,
	c.Nombre AS NombreCiudad
	FROM Facultad f 
	INNER JOIN Universidad u ON f.Universidad=u.Id_Universidad
	INNER JOIN Ciudad c ON f.IdCiudad = c.Id 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarFacultadPorId]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cargarFacultadPorId]
	@pIdFacultad		INT
AS
BEGIN 
	SELECT f.Id_Facultad, f.Codigo, F.Nombre,F.FechaCreacion, f.Universidad, f.IdCiudad, c.IdEstado, e.IdPais
	FROM Facultad f 
	JOIN Ciudad c ON f.IdCiudad = c.Id JOIN Estado e ON e.Id = c.IdEstado
	WHERE Id_Facultad = @pIdFacultad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarPais]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarPais]
AS
BEGIN
	SELECT * FROM Pais
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarUniversidades]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarUniversidades]
AS
BEGIN
	SELECT * FROM Universidad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarUsuario]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consultarUsuario]
	@pNombre		VARCHAR(50),
	@pContrasena	VARCHAR(10)
AS
BEGIN
	SELECT * FROM Usuario
	WHERE Nombre = @pNombre AND Contrasena = @pContrasena
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarfacultad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_eliminarfacultad]
	@pIdFacultad		INT
AS
BEGIN
	DELETE FROM Facultad
	WHERE Id_Facultad = @pIdFacultad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarfacultad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_modificarfacultad]
	@pIdFacultad			INT,
	@pCodigo				VARCHAR(10),
	@pNombre				VARCHAR(100),
	@pFechaCreacion			DATE,
	@pUniversidad			INT,
	@pCiudad				INT
AS
BEGIN
	UPDATE Facultad SET Codigo = @pCodigo, Nombre = @pNombre, FechaCreacion = @pFechaCreacion, Universidad =  @pUniversidad, IdCiudad = @pCiudad
	WHERE Id_Facultad = @pIdFacultad
END
GO
/****** Object:  StoredProcedure [dbo].[spListarFacultad]    Script Date: 05/08/2020 11:29:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarFacultad]
AS
BEGIN
	SELECT Id_Facultad,Codigo,Nombre,FechaCreacion FROM Facultad 
END
GO
USE [master]
GO
ALTER DATABASE [Escuela] SET  READ_WRITE 
GO

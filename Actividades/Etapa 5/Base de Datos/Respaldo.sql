Use [Escuela]
GO
/****** Object:  Database [Escuela]    Script Date: 09/07/2020 02:01:55 p. m. ******/
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
/****** Object:  Table [dbo].[Alumno]    Script Date: 09/07/2020 02:01:56 p. m. ******/
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
/****** Object:  Table [dbo].[Facultad]    Script Date: 09/07/2020 02:01:57 p. m. ******/
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
 CONSTRAINT [PK_Facultad_Id] PRIMARY KEY CLUSTERED 
(
	[Id_Facultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universidad]    Script Date: 09/07/2020 02:01:57 p. m. ******/
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
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [FechaNacimiento], [Semestre], [Facultad]) VALUES (123456, N'Brandon Vargas', CAST(N'2001-04-20' AS Date), 5, 2)
GO
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [FechaNacimiento], [Semestre], [Facultad]) VALUES (234334, N'Priscila Buentello', CAST(N'2001-02-05' AS Date), 5, 2)
GO
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [FechaNacimiento], [Semestre], [Facultad]) VALUES (1234567, N'AlanRoberto', CAST(N'2001-01-27' AS Date), 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Facultad] ON 
GO
INSERT [dbo].[Facultad] ([Id_Facultad], [Codigo], [Nombre], [FechaCreacion], [Universidad]) VALUES (1, N'FIME001', N'Facultad de Ingeneria', CAST(N'1940-05-05' AS Date), 1)
GO
INSERT [dbo].[Facultad] ([Id_Facultad], [Codigo], [Nombre], [FechaCreacion], [Universidad]) VALUES (2, N'FARQ002', N'Facultad de Arquitectura', CAST(N'1950-06-06' AS Date), 2)
GO
SET IDENTITY_INSERT [dbo].[Facultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Universidad] ON 
GO
INSERT [dbo].[Universidad] ([Id_Universidad], [Nombre]) VALUES (1, N'Universidad de Nuevo Leon')
GO
INSERT [dbo].[Universidad] ([Id_Universidad], [Nombre]) VALUES (2, N'Universidad de Monterrey')
GO
SET IDENTITY_INSERT [dbo].[Universidad] OFF
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Facultad_Facultad] FOREIGN KEY([Facultad])
REFERENCES [dbo].[Facultad] ([Id_Facultad])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Facultad_Facultad]
GO
ALTER TABLE [dbo].[Facultad]  WITH CHECK ADD  CONSTRAINT [FK_Facultad_Universidad_Universidad] FOREIGN KEY([Universidad])
REFERENCES [dbo].[Universidad] ([Id_Universidad])
GO
ALTER TABLE [dbo].[Facultad] CHECK CONSTRAINT [FK_Facultad_Universidad_Universidad]
GO
/****** Object:  StoredProcedure [dbo].[sp_agregarAlumno]    Script Date: 09/07/2020 02:01:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_agregarAlumno]
	@pMatricula			INT,
	@pNombre			VARCHAR(100),
	@pFecha				DATE,
	@pSemestre			INT,
	@pFacultad			INT
AS
BEGIN
	INSERT INTO Alumno VALUES(@pMatricula,@pNombre,@pFecha,@pSemestre,@pFacultad)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarAlumnoPorMtricula]    Script Date: 09/07/2020 02:01:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarAlumnoPorMtricula]
	@pMatricula		INT
AS
BEGIN 
	SELECT * FROM Alumno
	WHERE Matricula = @pMatricula
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarAlumnos]    Script Date: 09/07/2020 02:01:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarAlumnos]	
AS
BEGIN
	SELECT a.Matricula,a.Nombre,a.FechaNacimiento,a.Semestre,f.Nombre AS NombreFacultad
	FROM Alumno a INNER JOIN Facultad f ON a.Facultad=f.Id_Facultad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarFacultades]    Script Date: 09/07/2020 02:01:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarFacultades]
AS
BEGIN
	SELECT * FROM Facultad
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarAlumno]    Script Date: 09/07/2020 02:01:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_eliminarAlumno]
	@pMatricula		INT
AS
BEGIN
	DELETE FROM Alumno
	WHERE Matricula = @pMatricula
END
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarAlumno]    Script Date: 09/07/2020 02:01:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_modificarAlumno]
	@pMatricula			INT,
	@pNombre			VARCHAR(100),
	@pFecha				DATE,
	@pSemestre			INT,
	@pFacultad			INT
AS
BEGIN
	UPDATE Alumno SET Nombre=@pNombre,FechaNacimiento=@pFecha,Semestre=@pSemestre,Facultad=@pFacultad
	WHERE Matricula = @pMatricula
END
GO
USE [master]
GO
ALTER DATABASE [Escuela] SET  READ_WRITE 
GO

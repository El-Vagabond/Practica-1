USE [master]
GO
/****** Object:  Database [HappinessCo]    Script Date: 26/03/2025 11:50:40 ******/
CREATE DATABASE [HappinessCo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HappinessCo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HappinessCo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HappinessCo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HappinessCo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HappinessCo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HappinessCo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HappinessCo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HappinessCo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HappinessCo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HappinessCo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HappinessCo] SET ARITHABORT OFF 
GO
ALTER DATABASE [HappinessCo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HappinessCo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HappinessCo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HappinessCo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HappinessCo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HappinessCo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HappinessCo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HappinessCo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HappinessCo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HappinessCo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HappinessCo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HappinessCo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HappinessCo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HappinessCo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HappinessCo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HappinessCo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HappinessCo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HappinessCo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HappinessCo] SET  MULTI_USER 
GO
ALTER DATABASE [HappinessCo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HappinessCo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HappinessCo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HappinessCo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HappinessCo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HappinessCo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HappinessCo] SET QUERY_STORE = OFF
GO
USE [HappinessCo]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[ubicacion] [varchar](200) NOT NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galerias]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galerias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[id_evento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GaleriasAnteriores]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Creacion de Vistas 

--Creacion  de vista que devuelva las galerias anteriorires  al 28-02-2025
CREATE VIEW [dbo].[GaleriasAnteriores] AS
SELECT galerias.id, galerias.titulo
FROM Galerias 
JOIN Eventos  ON id_evento = Eventos.id
WHERE eventos.fecha < '2025-02-28';
GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[id_usuario] [int] NOT NULL,
	[id_evento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FavoritosUsu1]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FavoritosUsu1] AS
SELECT  eventos.titulo
FROM Eventos 
JOIN Favoritos  ON eventos.id = Favoritos.id_evento
WHERE Favoritos.id_usuario = 1;
GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[imagen] [varchar](255) NOT NULL,
	[id_galeria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Imagenes1201]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Imagenes1201] AS
SELECT  Imagenes.imagen
FROM Imagenes 
JOIN Galerias  ON Imagenes.id_galeria = Galerias.id
WHERE Galerias.id_evento = 2;
GO
/****** Object:  View [dbo].[FavoritosUsu2]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FavoritosUsu2] AS
SELECT Eventos.titulo
FROM Eventos
JOIN Favoritos ON eventos.id = Favoritos.id_evento
WHERE Favoritos.id_usuario=2 and Eventos.fecha >'28-02-2025';
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/03/2025 11:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD FOREIGN KEY([id_evento])
REFERENCES [dbo].[Eventos] ([id])
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Galerias]  WITH CHECK ADD FOREIGN KEY([id_evento])
REFERENCES [dbo].[Eventos] ([id])
GO
ALTER TABLE [dbo].[Imagenes]  WITH CHECK ADD FOREIGN KEY([id_galeria])
REFERENCES [dbo].[Galerias] ([id])
GO
USE [master]
GO
ALTER DATABASE [HappinessCo] SET  READ_WRITE 
GO

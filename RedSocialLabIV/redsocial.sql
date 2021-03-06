USE [master]
GO
/****** Object:  Database [RedSocial]    Script Date: 09/11/2020 17:58:32 ******/
CREATE DATABASE [RedSocial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RedSocial', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RedSocial.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RedSocial_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RedSocial_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RedSocial] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RedSocial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RedSocial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RedSocial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RedSocial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RedSocial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RedSocial] SET ARITHABORT OFF 
GO
ALTER DATABASE [RedSocial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RedSocial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RedSocial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RedSocial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RedSocial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RedSocial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RedSocial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RedSocial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RedSocial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RedSocial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RedSocial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RedSocial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RedSocial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RedSocial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RedSocial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RedSocial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RedSocial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RedSocial] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RedSocial] SET  MULTI_USER 
GO
ALTER DATABASE [RedSocial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RedSocial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RedSocial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RedSocial] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RedSocial] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RedSocial]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 09/11/2020 17:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[idComentario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[idComercio] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[valoracion] [int] NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comercios]    Script Date: 09/11/2020 17:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comercios](
	[idComercio] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [nvarchar](20) NOT NULL,
	[idRubro] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Comercios] PRIMARY KEY CLUSTERED 
(
	[idComercio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ofertas]    Script Date: 09/11/2020 17:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ofertas](
	[idOferta] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_oferta] [decimal](10, 2) NOT NULL,
	[fecha_inicio_oferta] [nvarchar](20) NOT NULL,
	[dias_vigencia] [int] NOT NULL,
	[titulo] [nvarchar](100) NOT NULL,
	[estado] [bit] NOT NULL,
	[idComercio] [int] NOT NULL,
 CONSTRAINT [PK_Ofertas] PRIMARY KEY CLUSTERED 
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 09/11/2020 17:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[respuesta] [nvarchar](100) NOT NULL,
	[idComentario] [int] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rubros]    Script Date: 09/11/2020 17:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubros](
	[idRubro] [int] IDENTITY(1,1) NOT NULL,
	[rubro] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Rubros] PRIMARY KEY CLUSTERED 
(
	[idRubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Comentarios] ON 

INSERT [dbo].[Comentarios] ([idComentario], [descripcion], [idComercio], [estado], [valoracion]) VALUES (1, N'hfhnf', 2, 1, 5)
INSERT [dbo].[Comentarios] ([idComentario], [descripcion], [idComercio], [estado], [valoracion]) VALUES (2, N'tghtrgh', 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Comentarios] OFF
SET IDENTITY_INSERT [dbo].[Comercios] ON 

INSERT [dbo].[Comercios] ([idComercio], [fecha_inicio], [idRubro], [estado], [nombre]) VALUES (1, N'02-01-2020', 1, 1, N'La negrita')
INSERT [dbo].[Comercios] ([idComercio], [fecha_inicio], [idRubro], [estado], [nombre]) VALUES (2, N'08-11-2020', 8, 0, N'nico')
INSERT [dbo].[Comercios] ([idComercio], [fecha_inicio], [idRubro], [estado], [nombre]) VALUES (3, N'08-11-2020', 8, 1, N'HH')
INSERT [dbo].[Comercios] ([idComercio], [fecha_inicio], [idRubro], [estado], [nombre]) VALUES (4, N'09-11-2020', 1, 1, N'Dave')
INSERT [dbo].[Comercios] ([idComercio], [fecha_inicio], [idRubro], [estado], [nombre]) VALUES (5, N'08-11-2020', 8, 0, N'San Carlos')
INSERT [dbo].[Comercios] ([idComercio], [fecha_inicio], [idRubro], [estado], [nombre]) VALUES (6, N'08-11-2020', 1, 1, N'Fedes')
INSERT [dbo].[Comercios] ([idComercio], [fecha_inicio], [idRubro], [estado], [nombre]) VALUES (7, N'09-11-2020', 4, 1, N'Lynn')
SET IDENTITY_INSERT [dbo].[Comercios] OFF
SET IDENTITY_INSERT [dbo].[Ofertas] ON 

INSERT [dbo].[Ofertas] ([idOferta], [cantidad], [precio_oferta], [fecha_inicio_oferta], [dias_vigencia], [titulo], [estado], [idComercio]) VALUES (1, 2, CAST(700.00 AS Decimal(10, 2)), N'09-11-2020', 5, N'Promo Noviembre', 1, 5)
SET IDENTITY_INSERT [dbo].[Ofertas] OFF
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [respuesta], [idComentario]) VALUES (2, N'dfhdhdd', 1)
INSERT [dbo].[Respuestas] ([idRespuesta], [respuesta], [idComentario]) VALUES (3, N'gfdgdfg', 1)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
SET IDENTITY_INSERT [dbo].[Rubros] ON 

INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (1, N'perfumeria', N'woman ', 0)
INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (2, N'peluqueria', N'corte y peinado', 1)
INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (3, N'peluqueria', N'Limpieza facial', 1)
INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (4, N'peluqueria', N'manicura', 1)
INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (5, N'peluqueria', N'corte y peinado', 0)
INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (6, N'peluqueria', N'Tintura', 1)
INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (7, N'peluqueria', N'corte y peinado', 1)
INSERT [dbo].[Rubros] ([idRubro], [rubro], [descripcion], [estado]) VALUES (8, N'Carniceria', N'pepe', 0)
SET IDENTITY_INSERT [dbo].[Rubros] OFF
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Comercios1] FOREIGN KEY([idComercio])
REFERENCES [dbo].[Comercios] ([idComercio])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Comercios1]
GO
ALTER TABLE [dbo].[Comercios]  WITH CHECK ADD  CONSTRAINT [FK_Comercios_Rubros] FOREIGN KEY([idRubro])
REFERENCES [dbo].[Rubros] ([idRubro])
GO
ALTER TABLE [dbo].[Comercios] CHECK CONSTRAINT [FK_Comercios_Rubros]
GO
ALTER TABLE [dbo].[Ofertas]  WITH CHECK ADD  CONSTRAINT [FK_Ofertas_Comercios] FOREIGN KEY([idComercio])
REFERENCES [dbo].[Comercios] ([idComercio])
GO
ALTER TABLE [dbo].[Ofertas] CHECK CONSTRAINT [FK_Ofertas_Comercios]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Comentarios] FOREIGN KEY([idComentario])
REFERENCES [dbo].[Comentarios] ([idComentario])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Comentarios]
GO
USE [master]
GO
ALTER DATABASE [RedSocial] SET  READ_WRITE 
GO

﻿USE [master]
GO

/****** Object:  Database [MiIngresoHitss]    Script Date: 10/07/2024 7:02:47 a. m. ******/
CREATE DATABASE [MiIngresoHitss]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiIngresoHitss', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MiIngresoHitss.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MiIngresoHitss_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MiIngresoHitss_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiIngresoHitss].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [MiIngresoHitss] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET ARITHABORT OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [MiIngresoHitss] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [MiIngresoHitss] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET  DISABLE_BROKER 
GO

ALTER DATABASE [MiIngresoHitss] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [MiIngresoHitss] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET RECOVERY FULL 
GO

ALTER DATABASE [MiIngresoHitss] SET  MULTI_USER 
GO

ALTER DATABASE [MiIngresoHitss] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [MiIngresoHitss] SET DB_CHAINING OFF 
GO

ALTER DATABASE [MiIngresoHitss] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [MiIngresoHitss] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [MiIngresoHitss] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [MiIngresoHitss] SET QUERY_STORE = OFF
GO

USE [MiIngresoHitss]
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE [MiIngresoHitss] SET  READ_WRITE 
GO

USE [MiIngresoHitss]
GO

/****** Object:  Table [dbo].[Producto]    Script Date: 10/07/2024 7:04:14 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Producto](
	[IdProducto] [varchar](50) NOT NULL,
	[CodigoProducto] [int] NOT NULL,
	[NombreProducto] [varchar](max) NOT NULL,
	[Imagen] [varbinary](max) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [MiIngresoHitss]
GO

/****** Object:  Table [dbo].[Compra]    Script Date: 10/07/2024 7:04:07 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Compra](
	[IdCompra] [varchar](50) NOT NULL,
	[IdCliente] [varchar](50) NOT NULL,
	[IdProducto] [varchar](50) NOT NULL,
	[FechaCompra] [date] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO

ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Cliente]
GO

ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO

ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Producto]
GO

USE [MiIngresoHitss]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 10/07/2024 7:04:00 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cliente](
	[IdCliente] [varchar](50) NOT NULL,
	[CodigoCliente] [int] NOT NULL,
	[NombreCliente] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [MiIngresoHitss]
GO

/****** Object:  StoredProcedure [dbo].[listarVentas]    Script Date: 10/07/2024 7:05:24 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[listarVentas]
(
	@fechaInicial DATE,
	@fechaFinal DATE
)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT P.NombreProducto,Cli.NombreCliente FROM Compra C
	INNER JOIN Cliente Cli ON C.IdCliente = Cli.IdCliente
	INNER JOIN Producto P ON C.IdProducto = P.IdProducto
	WHERE 
	FechaCompra BETWEEN CAST(@fechaInicial AS nvarchar(50))
	AND 
	CAST(@fechaFinal AS nvarchar(50))
END
GO
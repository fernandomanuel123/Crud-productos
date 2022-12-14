USE [master]
GO
/****** Object:  Database [parte2]    Script Date: 8/09/2022 04:26:54 ******/
CREATE DATABASE [parte2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'parte2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\parte2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'parte2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\parte2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [parte2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [parte2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [parte2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [parte2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [parte2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [parte2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [parte2] SET ARITHABORT OFF 
GO
ALTER DATABASE [parte2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [parte2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [parte2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [parte2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [parte2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [parte2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [parte2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [parte2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [parte2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [parte2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [parte2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [parte2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [parte2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [parte2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [parte2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [parte2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [parte2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [parte2] SET RECOVERY FULL 
GO
ALTER DATABASE [parte2] SET  MULTI_USER 
GO
ALTER DATABASE [parte2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [parte2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [parte2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [parte2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [parte2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'parte2', N'ON'
GO
ALTER DATABASE [parte2] SET QUERY_STORE = OFF
GO
USE [parte2]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 8/09/2022 04:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
	[Stock] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 8/09/2022 04:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateProduct] @Nombre varchar(50), @Precio float, @Stock int, @FechaRegistro DateTime
AS
INSERT INTO Productos (Nombre, Precio,Stock, FechaRegistro) 
                            VALUES (@Nombre, @Precio, @Stock,@FechaRegistro)                           
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 8/09/2022 04:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct] @Id int
AS
DELETE FROM Productos WHERE Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 8/09/2022 04:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAll]
AS
SELECT Id, Nombre, Precio, Stock, FechaRegistro FROM Productos
GO;
GO
/****** Object:  StoredProcedure [dbo].[GetById]    Script Date: 8/09/2022 04:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetById] @Id int
AS
SELECT Id, Nombre, Precio, Stock, FechaRegistro FROM Productos WHERE Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 8/09/2022 04:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct] @Nombre varchar(50), @Precio float, @Stock int, @FechaRegistro DateTime, @Id Int
AS
UPDATE Productos SET Nombre=@Nombre, Precio=@Precio, Stock=@Stock, FechaRegistro= @FechaRegistro
                            WHERE Id=@Id
GO
USE [master]
GO
ALTER DATABASE [parte2] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [datosclientes]    Script Date: 25/10/2018 16:33:24 ******/
CREATE DATABASE [datosclientes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'datosclientes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\datosclientes.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'datosclientes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\datosclientes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [datosclientes] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [datosclientes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [datosclientes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [datosclientes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [datosclientes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [datosclientes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [datosclientes] SET ARITHABORT OFF 
GO
ALTER DATABASE [datosclientes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [datosclientes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [datosclientes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [datosclientes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [datosclientes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [datosclientes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [datosclientes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [datosclientes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [datosclientes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [datosclientes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [datosclientes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [datosclientes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [datosclientes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [datosclientes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [datosclientes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [datosclientes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [datosclientes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [datosclientes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [datosclientes] SET  MULTI_USER 
GO
ALTER DATABASE [datosclientes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [datosclientes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [datosclientes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [datosclientes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [datosclientes] SET DELAYED_DURABILITY = DISABLED 
GO
USE [datosclientes]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 25/10/2018 16:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Documento] [varchar](20) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NOT NULL,
	[Celular] [varchar](30) NOT NULL,
	[Correo] [varchar](30) NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
	[Contrasena] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ActualizaCliente]    Script Date: 25/10/2018 16:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizaCliente]
	-- Add the parameters for the stored procedure here
	@Documento varchar(20),
	@Nombre varchar(30),
	@Apellido varchar(30),
	@Celular varchar(30),
	@Correo varchar(30),
	@Usuario varchar(30),
	@Contrasena varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Cliente SET Nombre = @Nombre, Apellido = @Apellido, Celular = @Celular, Correo = @Correo, Usuario = @Usuario, Contrasena = @Contrasena WHERE Documento = @Documento
END

GO
/****** Object:  StoredProcedure [dbo].[EliminaCliente]    Script Date: 25/10/2018 16:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EliminaCliente]
	-- Add the parameters for the stored procedure here
	@Documento varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Cliente WHERE Documento = @Documento
END

GO
/****** Object:  StoredProcedure [dbo].[InsertaRegistro]    Script Date: 25/10/2018 16:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertaRegistro] 
	-- Add the parameters for the stored procedure here
	@Documento varchar(20),
	@Nombre varchar(30),
	@Apellido varchar(30),
	@Celular varchar(30),
	@Correo varchar(30),
	@Usuario varchar(30),
	@Contrasena varchar(30)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Cliente (Documento, Nombre, Apellido, Celular, Correo, Usuario, Contrasena) VALUES 
	(@Documento, @Nombre, @Apellido, @Celular, @Correo, @Usuario, @Contrasena)
END

GO
/****** Object:  StoredProcedure [dbo].[traeCliente]    Script Date: 25/10/2018 16:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[traeCliente]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

SELECT [Documento]
	  ,[Nombre]
	  ,[Apellido]
      ,[Celular]
      ,[Correo]
      ,[Usuario]
      ,[Contrasena]
  FROM [dbo].[Cliente]

END

GO
/****** Object:  StoredProcedure [dbo].[TraeClienteUnico]    Script Date: 25/10/2018 16:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TraeClienteUnico]
	-- Add the parameters for the stored procedure here
	@Documento varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Documento, Nombre, Apellido, Celular, Correo, Usuario, Contrasena FROM Cliente WHERE Documento = @Documento
END

GO
/****** Object:  StoredProcedure [dbo].[TraeLogin]    Script Date: 25/10/2018 16:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TraeLogin] 
	-- Add the parameters for the stored procedure here
	@Usuario varchar(30),
	@Contrasena varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Documento, Nombre, Correo, Usuario FROM Cliente WHERE Usuario = @Usuario AND Contrasena = @Contrasena
END

GO
USE [master]
GO
ALTER DATABASE [datosclientes] SET  READ_WRITE 
GO

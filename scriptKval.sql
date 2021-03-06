USE [master]
GO
/****** Object:  Database [FriendsBase]    Script Date: 29.06.2021 15:20:16 ******/
CREATE DATABASE [FriendsBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FriendsBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FriendsBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FriendsBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FriendsBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FriendsBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FriendsBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FriendsBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FriendsBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FriendsBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FriendsBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FriendsBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [FriendsBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FriendsBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FriendsBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FriendsBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FriendsBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FriendsBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FriendsBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FriendsBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FriendsBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FriendsBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FriendsBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FriendsBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FriendsBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FriendsBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FriendsBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FriendsBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FriendsBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FriendsBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FriendsBase] SET  MULTI_USER 
GO
ALTER DATABASE [FriendsBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FriendsBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FriendsBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FriendsBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FriendsBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FriendsBase] SET QUERY_STORE = OFF
GO
USE [FriendsBase]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 29.06.2021 15:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[id_Friend] [int] NOT NULL,
	[Surname] [varchar](15) NOT NULL,
	[Name] [varchar](15) NOT NULL,
	[Patronymic] [varchar](15) NOT NULL,
	[Birthday_date] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[id_Phone] [int] NOT NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[id_Friend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 29.06.2021 15:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[id_Phone] [int] NOT NULL,
	[Type_phone] [varchar](20) NOT NULL,
	[Phone] [char](12) NOT NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[id_Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Significant_dates]    Script Date: 29.06.2021 15:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Significant_dates](
	[id_Date] [int] NOT NULL,
	[Date_start] [date] NOT NULL,
	[Date_end] [date] NOT NULL,
	[id_Friend1] [int] NOT NULL,
	[id_Friend2] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Significant dates] PRIMARY KEY CLUSTERED 
(
	[id_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Friends] ([id_Friend], [Surname], [Name], [Patronymic], [Birthday_date], [Gender], [id_Phone]) VALUES (1, N'Угаров', N'Вячеслав', N'Дмитриевич', CAST(N'2002-09-12' AS Date), N'м', 2)
INSERT [dbo].[Friends] ([id_Friend], [Surname], [Name], [Patronymic], [Birthday_date], [Gender], [id_Phone]) VALUES (2, N'Аксянов', N'Дамир', N'Ринатович', CAST(N'2002-03-21' AS Date), N'м', 1)
INSERT [dbo].[Friends] ([id_Friend], [Surname], [Name], [Patronymic], [Birthday_date], [Gender], [id_Phone]) VALUES (3, N'Юнисова', N'Анастасия', N'Кирилловна', CAST(N'2001-12-09' AS Date), N'ж', 3)
GO
INSERT [dbo].[Phones] ([id_Phone], [Type_phone], [Phone]) VALUES (1, N'Домашний', N'+74959269196')
INSERT [dbo].[Phones] ([id_Phone], [Type_phone], [Phone]) VALUES (2, N'Городской', N'+79269689196')
INSERT [dbo].[Phones] ([id_Phone], [Type_phone], [Phone]) VALUES (3, N'Рабочий', N'+79775414202')
GO
INSERT [dbo].[Significant_dates] ([id_Date], [Date_start], [Date_end], [id_Friend1], [id_Friend2], [Name], [Description]) VALUES (1, CAST(N'2021-06-28' AS Date), CAST(N'2021-06-29' AS Date), 1, NULL, N'День рождения', N'Собрание друзей в честь дня рождения')
INSERT [dbo].[Significant_dates] ([id_Date], [Date_start], [Date_end], [id_Friend1], [id_Friend2], [Name], [Description]) VALUES (2, CAST(N'2021-03-14' AS Date), CAST(N'2021-03-14' AS Date), 2, 3, N'Свадьба', N'Празднование свадьбы')
INSERT [dbo].[Significant_dates] ([id_Date], [Date_start], [Date_end], [id_Friend1], [id_Friend2], [Name], [Description]) VALUES (3, CAST(N'2021-03-17' AS Date), CAST(N'2021-03-17' AS Date), 3, NULL, N'День рождения', N'Собрание друзей в честь дня рождения')
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Phones] FOREIGN KEY([id_Phone])
REFERENCES [dbo].[Phones] ([id_Phone])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Phones]
GO
ALTER TABLE [dbo].[Significant_dates]  WITH CHECK ADD  CONSTRAINT [FK_Significant dates_Friends] FOREIGN KEY([id_Friend1])
REFERENCES [dbo].[Friends] ([id_Friend])
GO
ALTER TABLE [dbo].[Significant_dates] CHECK CONSTRAINT [FK_Significant dates_Friends]
GO
USE [master]
GO
ALTER DATABASE [FriendsBase] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [SharovTickets]    Script Date: 22.12.2021 18:42:07 ******/
CREATE DATABASE [SharovTickets] ON  PRIMARY 
( NAME = N'SharovTickets', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\SharovTickets.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SharovTickets_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\SharovTickets_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SharovTickets] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SharovTickets].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SharovTickets] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SharovTickets] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SharovTickets] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SharovTickets] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SharovTickets] SET ARITHABORT OFF 
GO
ALTER DATABASE [SharovTickets] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SharovTickets] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SharovTickets] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SharovTickets] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SharovTickets] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SharovTickets] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SharovTickets] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SharovTickets] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SharovTickets] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SharovTickets] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SharovTickets] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SharovTickets] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SharovTickets] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SharovTickets] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SharovTickets] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SharovTickets] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SharovTickets] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SharovTickets] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SharovTickets] SET  MULTI_USER 
GO
ALTER DATABASE [SharovTickets] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SharovTickets] SET DB_CHAINING OFF 
GO
USE [SharovTickets]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] NOT NULL,
	[Surname] [nchar](10) NULL,
	[Name] [nchar](10) NULL,
	[Patronymic] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
	[Phone] [nchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] NOT NULL,
	[IdOrganizer] [int] NULL,
	[IdPlace] [int] NULL,
	[IdType] [int] NULL,
	[Title] [nchar](10) NULL,
	[CreateDate] [date] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Completed] [bit] NULL,
	[CompletedDate] [date] NULL,
	[Cancelled] [bit] NULL,
	[CancelledDate] [date] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogActions]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogActions](
	[Id] [int] NOT NULL,
	[Action] [nchar](10) NULL,
	[Time] [date] NULL,
 CONSTRAINT [PK_LogActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] NOT NULL,
	[IdSalesman] [int] NULL,
	[IdCustomers] [int] NULL,
	[OrderNumber] [int] NULL,
	[TicketCount] [int] NULL,
	[TotalPrice] [int] NULL,
	[CreateDate] [date] NULL,
	[NotValid] [bit] NULL,
	[NotValidDate] [date] NULL,
	[Refunded] [bit] NULL,
	[RefundedDate] [date] NULL,
 CONSTRAINT [PK_TypeTicket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizers]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizers](
	[Id] [int] NOT NULL,
	[Surname] [nchar](10) NULL,
	[Name] [nchar](10) NULL,
	[Patronymic] [nchar](10) NULL,
	[IdType] [int] NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Organizers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[Id] [int] NOT NULL,
	[Title] [nchar](10) NULL,
	[City] [nchar](10) NULL,
	[Address] [nchar](10) NULL,
	[ManCount] [int] NULL,
	[IdType] [int] NULL,
 CONSTRAINT [PK_Places] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salesmen]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesmen](
	[Id] [int] NOT NULL,
	[Surname] [nchar](10) NULL,
	[Name] [nchar](10) NULL,
	[Patronymic] [nchar](10) NULL,
	[IdType] [int] NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Salesmen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] NOT NULL,
	[UniqueCode] [int] NULL,
	[IdEvent] [int] NULL,
	[IdOrder] [int] NULL,
	[Price] [int] NULL,
	[IdType] [int] NULL,
	[Row] [int] NULL,
	[Seat] [int] NULL,
	[CreateDate] [date] NULL,
	[NotValid] [bit] NULL,
	[NotValidDate] [date] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeEvent]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEvent](
	[Id] [int] NOT NULL,
	[Type] [nchar](10) NULL,
 CONSTRAINT [PK_TypePlace] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOrganizer]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOrganizer](
	[Id] [int] NOT NULL,
	[Title] [nchar](10) NULL,
	[Address] [nchar](10) NULL,
 CONSTRAINT [PK_TypeOrganizer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePlace]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePlace](
	[Id] [int] NOT NULL,
	[Type] [nchar](10) NULL,
 CONSTRAINT [PK_Sectors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeSalesman]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeSalesman](
	[Id] [int] NOT NULL,
	[Title] [nchar](10) NULL,
	[Address] [nchar](10) NULL,
 CONSTRAINT [PK_TypeSalesman] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeTicket]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeTicket](
	[Id] [int] NOT NULL,
	[Type] [nchar](10) NULL,
 CONSTRAINT [PK_TypeSector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.12.2021 18:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Login] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Organizers] FOREIGN KEY([IdOrganizer])
REFERENCES [dbo].[Organizers] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Organizers]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Places] FOREIGN KEY([IdPlace])
REFERENCES [dbo].[Places] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Places]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_TypeEvent] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeEvent] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_TypeEvent]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([IdCustomers])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Salesmen] FOREIGN KEY([IdSalesman])
REFERENCES [dbo].[Salesmen] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Salesmen]
GO
ALTER TABLE [dbo].[Organizers]  WITH CHECK ADD  CONSTRAINT [FK_Organizers_TypeOrganizer] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeOrganizer] ([Id])
GO
ALTER TABLE [dbo].[Organizers] CHECK CONSTRAINT [FK_Organizers_TypeOrganizer]
GO
ALTER TABLE [dbo].[Organizers]  WITH CHECK ADD  CONSTRAINT [FK_Organizers_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Organizers] CHECK CONSTRAINT [FK_Organizers_Users]
GO
ALTER TABLE [dbo].[Places]  WITH CHECK ADD  CONSTRAINT [FK_Places_TypePlace] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypePlace] ([Id])
GO
ALTER TABLE [dbo].[Places] CHECK CONSTRAINT [FK_Places_TypePlace]
GO
ALTER TABLE [dbo].[Salesmen]  WITH CHECK ADD  CONSTRAINT [FK_Salesmen_TypeSalesman] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeSalesman] ([Id])
GO
ALTER TABLE [dbo].[Salesmen] CHECK CONSTRAINT [FK_Salesmen_TypeSalesman]
GO
ALTER TABLE [dbo].[Salesmen]  WITH CHECK ADD  CONSTRAINT [FK_Salesmen_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Salesmen] CHECK CONSTRAINT [FK_Salesmen_Users]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Events1] FOREIGN KEY([IdEvent])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Events1]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Orders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Orders]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TypeTicket] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeTicket] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TypeTicket]
GO
USE [master]
GO
ALTER DATABASE [SharovTickets] SET  READ_WRITE 
GO

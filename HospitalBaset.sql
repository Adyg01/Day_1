USE [master]
GO
/****** Object:  Database [HospitalBase]    Script Date: 12/11/2021 11:51:18 ******/
CREATE DATABASE [HospitalBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalBase', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HospitalBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalBase_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HospitalBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Cyrillic_General_CI_AS
GO
ALTER DATABASE [HospitalBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalBase] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalBase] SET QUERY_STORE = OFF
GO
USE [HospitalBase]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 12/11/2021 11:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[DoctorScheduleId] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 12/11/2021 11:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Patronymic] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[LastName] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[DateOfBirthday] [date] NOT NULL,
	[GenderCode] [nvarchar](1) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/11/2021 11:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Patronymic] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[LastName] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[CabinetNumber] [int] NOT NULL,
	[SpecializationId] [int] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorSchedule]    Script Date: 12/11/2021 11:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_DoctorSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12/11/2021 11:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nvarchar](1) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Name] [nvarchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 12/11/2021 11:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Id], [ClientId], [DoctorScheduleId], [StartTime], [EndTime]) VALUES (1, 1, 5, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time))
INSERT [dbo].[Appointment] ([Id], [ClientId], [DoctorScheduleId], [StartTime], [EndTime]) VALUES (2, 1, 1, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[Appointment] ([Id], [ClientId], [DoctorScheduleId], [StartTime], [EndTime]) VALUES (3, 1, 5, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time))
INSERT [dbo].[Appointment] ([Id], [ClientId], [DoctorScheduleId], [StartTime], [EndTime]) VALUES (4, 1, 5, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Appointment] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [FirstName], [Patronymic], [LastName], [DateOfBirthday], [GenderCode]) VALUES (1, N'Иван', N'Иванович', N'Иванов', CAST(N'1997-04-02' AS Date), N'M')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Id], [FirstName], [Patronymic], [LastName], [CabinetNumber], [SpecializationId]) VALUES (1, N'Елена', N'Семёновна', N'Гурьба', 6, 1)
INSERT [dbo].[Doctor] ([Id], [FirstName], [Patronymic], [LastName], [CabinetNumber], [SpecializationId]) VALUES (2, N'Татьяна', N'Ивановна', N'Шурова', 14, 1)
INSERT [dbo].[Doctor] ([Id], [FirstName], [Patronymic], [LastName], [CabinetNumber], [SpecializationId]) VALUES (3, N'Александр', N'Анатольевич', N'Степченко', 12, 1)
INSERT [dbo].[Doctor] ([Id], [FirstName], [Patronymic], [LastName], [CabinetNumber], [SpecializationId]) VALUES (4, N'Мария', N'Владимировна', N'Сафонова', 22, 5)
INSERT [dbo].[Doctor] ([Id], [FirstName], [Patronymic], [LastName], [CabinetNumber], [SpecializationId]) VALUES (5, N'Евгения', N'Валерьевна', N'Медведева', 34, 4)
INSERT [dbo].[Doctor] ([Id], [FirstName], [Patronymic], [LastName], [CabinetNumber], [SpecializationId]) VALUES (6, N'Андрей', N'Игоревич', N'Романов', 48, 3)
INSERT [dbo].[Doctor] ([Id], [FirstName], [Patronymic], [LastName], [CabinetNumber], [SpecializationId]) VALUES (7, N'Лидия', N'Рихардовна', N'Каур', 50, 2)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[DoctorSchedule] ON 

INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (1, 1, CAST(N'2021-12-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (2, 1, CAST(N'2021-12-12' AS Date), CAST(N'12:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (5, 1, CAST(N'2021-12-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (6, 1, CAST(N'2021-12-15' AS Date), CAST(N'12:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (7, 1, CAST(N'2021-12-17' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (8, 1, CAST(N'2021-12-18' AS Date), CAST(N'12:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (9, 2, CAST(N'2021-12-13' AS Date), CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (10, 2, CAST(N'2021-12-16' AS Date), CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (11, 2, CAST(N'2021-12-19' AS Date), CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (12, 3, CAST(N'2021-12-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (13, 3, CAST(N'2021-12-12' AS Date), CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (14, 3, CAST(N'2021-12-13' AS Date), CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (15, 3, CAST(N'2021-12-14' AS Date), CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (16, 3, CAST(N'2021-12-15' AS Date), CAST(N'16:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (17, 4, CAST(N'2021-12-13' AS Date), CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (18, 4, CAST(N'2021-12-16' AS Date), CAST(N'12:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (19, 5, CAST(N'2021-12-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (20, 5, CAST(N'2021-12-15' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[DoctorSchedule] ([Id], [DoctorId], [Date], [StartTime], [EndTime]) VALUES (23, 6, CAST(N'2021-12-17' AS Date), CAST(N'12:00:00' AS Time), CAST(N'17:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[DoctorSchedule] OFF
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'F', N'Female')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'M', N'Male')
SET IDENTITY_INSERT [dbo].[Specialization] ON 

INSERT [dbo].[Specialization] ([Id], [Name]) VALUES (1, N'Гастроэнтеролог')
INSERT [dbo].[Specialization] ([Id], [Name]) VALUES (2, N'Кардиолог')
INSERT [dbo].[Specialization] ([Id], [Name]) VALUES (3, N'Терапевт')
INSERT [dbo].[Specialization] ([Id], [Name]) VALUES (4, N'Стоматолог')
INSERT [dbo].[Specialization] ([Id], [Name]) VALUES (5, N'Офтальмолог')
SET IDENTITY_INSERT [dbo].[Specialization] OFF
/****** Object:  Index [IX_DoctorSchedule]    Script Date: 12/11/2021 11:51:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DoctorSchedule] ON [dbo].[DoctorSchedule]
(
	[DoctorId] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Client]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_DoctorSchedule] FOREIGN KEY([DoctorScheduleId])
REFERENCES [dbo].[DoctorSchedule] ([Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_DoctorSchedule]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Specialization] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specialization] ([Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Specialization]
GO
ALTER TABLE [dbo].[DoctorSchedule]  WITH CHECK ADD  CONSTRAINT [FK_DoctorSchedule_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[DoctorSchedule] CHECK CONSTRAINT [FK_DoctorSchedule_Doctor]
GO
USE [master]
GO
ALTER DATABASE [HospitalBase] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 06.03.2025 11:08:17 ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY FULL 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hotel] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hotel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06.03.2025 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRoom]    Script Date: 06.03.2025 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRoom](
	[roomId] [int] NULL,
	[clientId] [int] NULL,
	[dateIn] [date] NULL,
	[dateOut] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06.03.2025 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06.03.2025 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 06.03.2025 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[floorNumber] [int] NOT NULL,
	[roomNumber] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[statusId] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 06.03.2025 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usr]    Script Date: 06.03.2025 11:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usr](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[passwd] [nvarchar](25) NOT NULL,
	[roleId] [int] NOT NULL,
	[lastLogDate] [datetime] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[FirstLogin] [bit] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
 CONSTRAINT [PK_Usr] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [categoryName]) VALUES (1, N'3-местный бюджет
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (2, N'Бизнес с 1 или 2 кроватями
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (3, N'Двухкомнатный двухместный стандарт с 1 или 2 кроватями
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (4, N'Люкс с 2 двуспальными кроватями
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (5, N'Одноместный стандарт
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (6, N'Одноместный эконом
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (7, N'Стандарт двухместный с 2 раздельными кроватями
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (8, N'Студия
')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (9, N'Эконом двухместный с 2 раздельными кроватями
')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (55, 18, CAST(N'2025-02-14' AS Date), CAST(N'2025-03-02' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (56, 9, CAST(N'2025-02-28' AS Date), NULL)
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (58, 15, CAST(N'2025-02-23' AS Date), CAST(N'2025-02-02' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (59, 14, CAST(N'2025-03-01' AS Date), CAST(N'2025-03-07' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (61, 3, CAST(N'2025-02-27' AS Date), CAST(N'2025-04-22' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (61, 2, CAST(N'2025-02-24' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (62, 16, CAST(N'2025-02-15' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (63, 8, CAST(N'2025-02-27' AS Date), CAST(N'2025-03-12' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (64, 1, CAST(N'2025-02-14' AS Date), NULL)
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (65, 10, CAST(N'2025-02-24' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (67, 6, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-07' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (69, 5, CAST(N'2025-03-01' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (70, 4, CAST(N'2025-02-02' AS Date), CAST(N'2025-02-02' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (71, 11, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (72, 7, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (73, 13, CAST(N'2025-02-27' AS Date), NULL)
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (77, 17, CAST(N'2025-02-28' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (79, 12, CAST(N'2025-02-11' AS Date), NULL)
INSERT [dbo].[ClientRoom] ([roomId], [clientId], [dateIn], [dateOut]) VALUES (NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id], [name]) VALUES (1, N'Шевченко Ольга Викторовна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (2, N'Мазалова Ирина Львовна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (3, N'Семеняка Юрий Геннадьевич')
INSERT [dbo].[Clients] ([id], [name]) VALUES (4, N'Савельев Олег Иванович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (5, N'Бунин Эдуард Михайлович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (6, N'Бахшиев Павел Иннокентьевич')
INSERT [dbo].[Clients] ([id], [name]) VALUES (7, N'Тюренкова Наталья Сергеевна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (8, N'Любяшева Галина Аркадьевна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (9, N'Александров Петр Константинович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (10, N'Мазалова Ольга Николаевна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (11, N'Лапшин Виктор Романович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (12, N'Гусев Семен Петрович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (13, N'Гладилина Вера Михайловна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (14, N'Масюк Динара Викторовна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (15, N'Лукин Илья Федорович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (16, N'Петров Станислав Игоревич')
INSERT [dbo].[Clients] ([id], [name]) VALUES (17, N'Филь Марина Федоровна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (18, N'Михайлов Игорь Вадимович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (19, N'Александров Петр Константинович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (20, N'Бахшиев Павел Иннокентьевич')
INSERT [dbo].[Clients] ([id], [name]) VALUES (21, N'Бунин Эдуард Михайлович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (22, N'Гладилина Вера Михайловна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (23, N'Гусев Семен Петрович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (24, N'Лапшин Виктор Романович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (25, N'Лукин Илья Федорович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (26, N'Любяшева Галина Аркадьевна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (27, N'Мазалова Ирина Львовна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (28, N'Мазалова Ольга Николаевна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (29, N'Масюк Динара Викторовна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (30, N'Михайлов Игорь Вадимович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (31, N'Петров Станислав Игоревич')
INSERT [dbo].[Clients] ([id], [name]) VALUES (32, N'Савельев Олег Иванович')
INSERT [dbo].[Clients] ([id], [name]) VALUES (33, N'Семеняка Юрий Геннадьевич')
INSERT [dbo].[Clients] ([id], [name]) VALUES (34, N'Тюренкова Наталья Сергеевна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (35, N'Филь Марина Федоровна')
INSERT [dbo].[Clients] ([id], [name]) VALUES (36, N'Шевченко Ольга Викторовна')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [roleName]) VALUES (2, N'Manager')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (55, 1, 101, 5, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (56, 1, 102, 5, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (57, 1, 103, 6, 4)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (58, 1, 104, 6, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (59, 1, 105, 7, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (60, 1, 106, 7, 4)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (61, 1, 107, 9, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (62, 1, 108, 9, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (63, 1, 109, 1, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (64, 1, 110, 1, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (65, 2, 201, 2, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (66, 2, 202, 2, 4)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (67, 2, 203, 2, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (68, 2, 204, 3, 3)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (69, 2, 205, 3, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (70, 2, 206, 3, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (71, 2, 207, 5, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (72, 2, 208, 5, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (73, 2, 209, 5, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (74, 3, 301, 8, 1)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (75, 3, 302, 8, 1)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (76, 3, 303, 8, 4)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (77, 3, 304, 4, 2)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (78, 3, 305, 4, 4)
INSERT [dbo].[Rooms] ([id], [floorNumber], [roomNumber], [categoryId], [statusId]) VALUES (79, 3, 306, 4, 2)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [statusName]) VALUES (1, N'Грязный
')
INSERT [dbo].[Status] ([id], [statusName]) VALUES (2, N'Занят
')
INSERT [dbo].[Status] ([id], [statusName]) VALUES (3, N'Назначен к уборке
')
INSERT [dbo].[Status] ([id], [statusName]) VALUES (4, N'Чистый
')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Usr] ON 

INSERT [dbo].[Usr] ([id], [login], [passwd], [roleId], [lastLogDate], [name], [FirstLogin], [IsBlocked]) VALUES (2, N'admin', N'admin', 1, CAST(N'2025-03-05T00:00:00.000' AS DateTime), N'Андрей', 0, 0)
INSERT [dbo].[Usr] ([id], [login], [passwd], [roleId], [lastLogDate], [name], [FirstLogin], [IsBlocked]) VALUES (3, N'man', N'man', 2, CAST(N'2025-03-05T00:00:00.000' AS DateTime), N'Василек', 0, 0)
INSERT [dbo].[Usr] ([id], [login], [passwd], [roleId], [lastLogDate], [name], [FirstLogin], [IsBlocked]) VALUES (4, N'somenyam', N'somenyam', 2, CAST(N'2025-03-03T00:00:00.000' AS DateTime), N'Келислав', 0, 0)
INSERT [dbo].[Usr] ([id], [login], [passwd], [roleId], [lastLogDate], [name], [FirstLogin], [IsBlocked]) VALUES (5, N'da', N'sa', 2, CAST(N'2025-03-06T09:18:26.493' AS DateTime), N'dada', 0, 0)
INSERT [dbo].[Usr] ([id], [login], [passwd], [roleId], [lastLogDate], [name], [FirstLogin], [IsBlocked]) VALUES (6, N'dada', N'dada', 2, CAST(N'1970-01-01T00:00:00.000' AS DateTime), N'dadada', 1, 0)
INSERT [dbo].[Usr] ([id], [login], [passwd], [roleId], [lastLogDate], [name], [FirstLogin], [IsBlocked]) VALUES (8, N'aaa', N'aaa', 2, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'aaa', 1, 0)
SET IDENTITY_INSERT [dbo].[Usr] OFF
GO
/****** Object:  Index [IX_FK_ClientRoom_Clients]    Script Date: 06.03.2025 11:08:17 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClientRoom_Clients] ON [dbo].[ClientRoom]
(
	[clientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Rooms_Category]    Script Date: 06.03.2025 11:08:17 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Rooms_Category] ON [dbo].[Rooms]
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Rooms_Status]    Script Date: 06.03.2025 11:08:17 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Rooms_Status] ON [dbo].[Rooms]
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Usr_Role]    Script Date: 06.03.2025 11:08:17 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Usr_Role] ON [dbo].[Usr]
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClientRoom]  WITH CHECK ADD  CONSTRAINT [FK_ClientRoom_Clients] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
GO
ALTER TABLE [dbo].[ClientRoom] CHECK CONSTRAINT [FK_ClientRoom_Clients]
GO
ALTER TABLE [dbo].[ClientRoom]  WITH CHECK ADD  CONSTRAINT [FK_ClientRoom_Rooms] FOREIGN KEY([roomId])
REFERENCES [dbo].[Rooms] ([id])
GO
ALTER TABLE [dbo].[ClientRoom] CHECK CONSTRAINT [FK_ClientRoom_Rooms]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Category]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Status] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Status]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [FK_Usr_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [FK_Usr_Role]
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Healthcheck]    Script Date: 2023-12-26 10:50:32 ******/
CREATE DATABASE [Healthcheck]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Healthcheck', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Healthcheck.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Healthcheck_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Healthcheck_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Healthcheck] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Healthcheck].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Healthcheck] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Healthcheck] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Healthcheck] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Healthcheck] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Healthcheck] SET ARITHABORT OFF 
GO
ALTER DATABASE [Healthcheck] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Healthcheck] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Healthcheck] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Healthcheck] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Healthcheck] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Healthcheck] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Healthcheck] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Healthcheck] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Healthcheck] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Healthcheck] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Healthcheck] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Healthcheck] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Healthcheck] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Healthcheck] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Healthcheck] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Healthcheck] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Healthcheck] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Healthcheck] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Healthcheck] SET  MULTI_USER 
GO
ALTER DATABASE [Healthcheck] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Healthcheck] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Healthcheck] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Healthcheck] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Healthcheck] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Healthcheck] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Healthcheck] SET QUERY_STORE = ON
GO
ALTER DATABASE [Healthcheck] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Healthcheck]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2023-12-26 10:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 2023-12-26 10:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uri] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DiscoveryService] [nvarchar](100) NULL,
 CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Executions]    Script Date: 2023-12-26 10:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Executions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[OnStateFrom] [datetime2](7) NOT NULL,
	[LastExecuted] [datetime2](7) NOT NULL,
	[Uri] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DiscoveryService] [nvarchar](50) NULL,
 CONSTRAINT [PK_Executions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Failures]    Script Date: 2023-12-26 10:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Failures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HealthCheckName] [nvarchar](500) NOT NULL,
	[LastNotified] [datetime2](7) NOT NULL,
	[IsUpAndRunning] [bit] NOT NULL,
 CONSTRAINT [PK_Failures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCheckExecutionEntries]    Script Date: 2023-12-26 10:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCheckExecutionEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [time](7) NOT NULL,
	[HealthCheckExecutionId] [int] NULL,
	[Tags] [nvarchar](max) NULL,
 CONSTRAINT [PK_HealthCheckExecutionEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCheckExecutionHistories]    Script Date: 2023-12-26 10:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCheckExecutionHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[On] [datetime2](7) NOT NULL,
	[HealthCheckExecutionId] [int] NULL,
 CONSTRAINT [PK_HealthCheckExecutionHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200410110604_initial', N'7.0.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200915210355_3.1.2-changes', N'7.0.9')
GO
SET IDENTITY_INSERT [dbo].[Configurations] ON 

INSERT [dbo].[Configurations] ([Id], [Uri], [Name], [DiscoveryService]) VALUES (3, N'/healthcheck', N'Health Checks Dashboard', NULL)
SET IDENTITY_INSERT [dbo].[Configurations] OFF
GO
SET IDENTITY_INSERT [dbo].[Executions] ON 

INSERT [dbo].[Executions] ([Id], [Status], [OnStateFrom], [LastExecuted], [Uri], [Name], [DiscoveryService]) VALUES (1, 2, CAST(N'2023-12-26T07:15:36.5568897' AS DateTime2), CAST(N'2023-12-26T07:15:51.7148827' AS DateTime2), N'/healthcheck', N'Health Checks Dashboard', NULL)
INSERT [dbo].[Executions] ([Id], [Status], [OnStateFrom], [LastExecuted], [Uri], [Name], [DiscoveryService]) VALUES (2, 2, CAST(N'2023-12-20T07:57:54.2536833' AS DateTime2), CAST(N'2023-12-20T13:22:04.8564966' AS DateTime2), N'https://localhost:7040/healthcheck', N'Service 1', NULL)
SET IDENTITY_INSERT [dbo].[Executions] OFF
GO
SET IDENTITY_INSERT [dbo].[Failures] ON 

INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (1, N'Health Checks Dashboard', CAST(N'2023-12-20T13:45:42.7561370' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (2, N'Health Checks Dashboard', CAST(N'2023-12-20T13:46:35.3579898' AS DateTime2), 1)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (3, N'Health Checks Dashboard', CAST(N'2023-12-20T13:47:27.4588904' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (4, N'Health Checks Dashboard', CAST(N'2023-12-20T13:51:47.8974450' AS DateTime2), 1)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (5, N'Health Checks Dashboard', CAST(N'2023-12-22T06:45:09.8646509' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (6, N'Health Checks Dashboard', CAST(N'2023-12-22T06:55:11.0224087' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (7, N'Health Checks Dashboard', CAST(N'2023-12-22T07:05:12.0850920' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (8, N'Health Checks Dashboard', CAST(N'2023-12-22T07:15:13.1046079' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (9, N'Health Checks Dashboard', CAST(N'2023-12-22T07:25:16.2810541' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (10, N'Health Checks Dashboard', CAST(N'2023-12-22T07:35:18.4054574' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (11, N'Health Checks Dashboard', CAST(N'2023-12-22T07:45:18.6130251' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (12, N'Health Checks Dashboard', CAST(N'2023-12-22T07:55:19.4581567' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (13, N'Health Checks Dashboard', CAST(N'2023-12-22T08:05:21.9360851' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (14, N'Health Checks Dashboard', CAST(N'2023-12-22T08:59:30.2023271' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (15, N'Health Checks Dashboard', CAST(N'2023-12-22T09:31:26.2868919' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (16, N'Health Checks Dashboard', CAST(N'2023-12-22T09:43:11.3537476' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (17, N'Health Checks Dashboard', CAST(N'2023-12-22T09:53:14.6865164' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (18, N'Health Checks Dashboard', CAST(N'2023-12-22T11:10:27.6843955' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (19, N'Health Checks Dashboard', CAST(N'2023-12-22T11:26:49.9023610' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (20, N'Health Checks Dashboard', CAST(N'2023-12-22T11:36:54.7507021' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (21, N'Health Checks Dashboard', CAST(N'2023-12-22T11:46:55.4815437' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (22, N'Health Checks Dashboard', CAST(N'2023-12-22T11:56:58.7748459' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (23, N'Health Checks Dashboard', CAST(N'2023-12-22T12:35:15.8474443' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (24, N'Health Checks Dashboard', CAST(N'2023-12-22T12:57:23.6625592' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (25, N'Health Checks Dashboard', CAST(N'2023-12-22T13:07:28.6791161' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (26, N'Health Checks Dashboard', CAST(N'2023-12-22T13:17:13.1658427' AS DateTime2), 1)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (27, N'Health Checks Dashboard', CAST(N'2023-12-22T16:45:57.3631859' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (28, N'Health Checks Dashboard', CAST(N'2023-12-22T17:06:59.9849401' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (29, N'Health Checks Dashboard', CAST(N'2023-12-22T17:07:17.6222737' AS DateTime2), 1)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (30, N'Health Checks Dashboard', CAST(N'2023-12-22T17:08:35.8744156' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (31, N'Health Checks Dashboard', CAST(N'2023-12-22T17:09:02.1518946' AS DateTime2), 1)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (32, N'Health Checks Dashboard', CAST(N'2023-12-22T17:46:55.0219119' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (33, N'Health Checks Dashboard', CAST(N'2023-12-22T17:54:43.8309650' AS DateTime2), 1)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (34, N'Health Checks Dashboard', CAST(N'2023-12-25T14:10:41.5199208' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (35, N'Health Checks Dashboard', CAST(N'2023-12-25T14:20:43.7057114' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (36, N'Health Checks Dashboard', CAST(N'2023-12-25T16:38:11.3518959' AS DateTime2), 1)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (37, N'Health Checks Dashboard', CAST(N'2023-12-26T07:13:26.6364429' AS DateTime2), 0)
INSERT [dbo].[Failures] ([Id], [HealthCheckName], [LastNotified], [IsUpAndRunning]) VALUES (38, N'Health Checks Dashboard', CAST(N'2023-12-26T07:15:36.4336454' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Failures] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthCheckExecutionEntries] ON 

INSERT [dbo].[HealthCheckExecutionEntries] ([Id], [Name], [Status], [Description], [Duration], [HealthCheckExecutionId], [Tags]) VALUES (4, N'MS SQL Server Check', 2, NULL, CAST(N'00:00:00.0007089' AS Time), 2, N'["db","sql","sqlserver"]')
INSERT [dbo].[HealthCheckExecutionEntries] ([Id], [Name], [Status], [Description], [Duration], [HealthCheckExecutionId], [Tags]) VALUES (8, N'MS SQL Server Check', 2, NULL, CAST(N'00:00:00.0009305' AS Time), 1, N'["db","sql","sqlserver"]')
INSERT [dbo].[HealthCheckExecutionEntries] ([Id], [Name], [Status], [Description], [Duration], [HealthCheckExecutionId], [Tags]) VALUES (9, N'HealtCheckDeneme', 2, N'Servis çalışıyor.', CAST(N'00:00:00.0000508' AS Time), 1, N'[]')
SET IDENTITY_INSERT [dbo].[HealthCheckExecutionEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthCheckExecutionHistories] ON 

INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (1, N'HealtCheckDeneme', N'Servis sağlıksız durumda.', 0, CAST(N'2023-12-22T06:45:09.9961920' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (2, N'HealtCheckDeneme', N'Servis çalışıyor.', 2, CAST(N'2023-12-22T13:17:13.2410088' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (3, N'HealtCheckDeneme', N'Servis sağlıksız durumda.', 0, CAST(N'2023-12-22T16:45:57.4901148' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (4, N'HealtCheckDeneme', N'Servis çalışıyor.', 2, CAST(N'2023-12-22T17:07:17.6973587' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (5, N'HealtCheckDeneme', N'Servis sağlıksız durumda.', 0, CAST(N'2023-12-22T17:08:36.0203659' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (6, N'HealtCheckDeneme', N'Servis çalışıyor.', 2, CAST(N'2023-12-22T17:09:02.2245588' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (7, N'HealtCheckDeneme', N'Servis sağlıksız durumda.', 0, CAST(N'2023-12-22T17:46:55.1702101' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (8, N'HealtCheckDeneme', N'Servis çalışıyor.', 2, CAST(N'2023-12-22T17:54:43.9103123' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (9, N'HealtCheckDeneme', N'Servis sağlıksız durumda.', 0, CAST(N'2023-12-25T14:10:41.6476659' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (10, N'HealtCheckDeneme', N'Servis çalışıyor.', 2, CAST(N'2023-12-25T16:38:11.4217935' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (11, N'HealtCheckDeneme', N'Servis sağlıksız durumda.', 0, CAST(N'2023-12-26T07:13:26.7694723' AS DateTime2), 1)
INSERT [dbo].[HealthCheckExecutionHistories] ([Id], [Name], [Description], [Status], [On], [HealthCheckExecutionId]) VALUES (12, N'HealtCheckDeneme', N'Servis çalışıyor.', 2, CAST(N'2023-12-26T07:15:36.5568897' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[HealthCheckExecutionHistories] OFF
GO
/****** Object:  Index [IX_HealthCheckExecutionEntries_HealthCheckExecutionId]    Script Date: 2023-12-26 10:50:32 ******/
CREATE NONCLUSTERED INDEX [IX_HealthCheckExecutionEntries_HealthCheckExecutionId] ON [dbo].[HealthCheckExecutionEntries]
(
	[HealthCheckExecutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HealthCheckExecutionHistories_HealthCheckExecutionId]    Script Date: 2023-12-26 10:50:32 ******/
CREATE NONCLUSTERED INDEX [IX_HealthCheckExecutionHistories_HealthCheckExecutionId] ON [dbo].[HealthCheckExecutionHistories]
(
	[HealthCheckExecutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HealthCheckExecutionEntries]  WITH CHECK ADD  CONSTRAINT [FK_HealthCheckExecutionEntries_Executions_HealthCheckExecutionId] FOREIGN KEY([HealthCheckExecutionId])
REFERENCES [dbo].[Executions] ([Id])
GO
ALTER TABLE [dbo].[HealthCheckExecutionEntries] CHECK CONSTRAINT [FK_HealthCheckExecutionEntries_Executions_HealthCheckExecutionId]
GO
ALTER TABLE [dbo].[HealthCheckExecutionHistories]  WITH CHECK ADD  CONSTRAINT [FK_HealthCheckExecutionHistories_Executions_HealthCheckExecutionId] FOREIGN KEY([HealthCheckExecutionId])
REFERENCES [dbo].[Executions] ([Id])
GO
ALTER TABLE [dbo].[HealthCheckExecutionHistories] CHECK CONSTRAINT [FK_HealthCheckExecutionHistories_Executions_HealthCheckExecutionId]
GO
USE [master]
GO
ALTER DATABASE [Healthcheck] SET  READ_WRITE 
GO

USE [FinalReport]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/30/2023 7:47:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ParentID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](100) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](100) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[NewsID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupID] [uniqueidentifier] NULL,
	[RoleID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Picture] [nvarchar](100) NULL,
	[LoginName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [int] NULL,
	[GroupID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Picture] [nvarchar](100) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](500) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NULL,
	[Category] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrices]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrices](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NULL,
	[ColorID] [uniqueidentifier] NULL,
	[SizeID] [uniqueidentifier] NULL,
	[Price] [real] NULL,
	[Picture] [nvarchar](50) NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_ProductPrices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Information] [nvarchar](100) NULL,
	[Addtional] [nvarchar](100) NULL,
	[Shipping] [nvarchar](100) NULL,
	[Picture] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[BrandID] [uniqueidentifier] NULL,
	[Price] [real] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[GroupName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ParentID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votings]    Script Date: 11/30/2023 7:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votings](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[Star] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Helpful] [int] NULL,
	[Unhelpful] [int] NULL,
 CONSTRAINT [PK_Votings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231113141009_initial', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231129160138_NewDB', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231129170949_NewDB1', N'6.0.21')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'80bf3204-ed80-4bd7-a1a5-5bc93b466103', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGXTdJRNW9fSWtTK1qYo51Qn1tGPdwg16Od6CfqqEDl51LcpcIXLaTd35YwWAaGBrQ==', N'RTWTHFJAWHCYGSOACLPOSSOFCTY3I2HN', N'0a37172e-d871-48f5-8823-53500c382dce', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (N'c77c3389-73b9-4a78-829d-6f0ed3362abe', N'VT Clothing')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'Nike')
GO
INSERT [dbo].[Categories] ([Id], [Name], [ParentID]) VALUES (N'714a8f36-e46b-4ed3-bebc-43a0cb282ec2', N'Phong cách sống', N'7e579e1e-6685-4509-b16d-6bb55d710612')
INSERT [dbo].[Categories] ([Id], [Name], [ParentID]) VALUES (N'75bd49c5-9830-4da9-8e61-772dc797afb8', N'Giày dép', N'b8e34204-c9fe-4ab1-b8cb-cdcd11ad385f')
INSERT [dbo].[Categories] ([Id], [Name], [ParentID]) VALUES (N'c50d2382-45b2-4cc3-9657-c673c3a16627', N'Phụ kiện', N'b8e34204-c9fe-4ab1-b8cb-cdcd11ad385f')
INSERT [dbo].[Categories] ([Id], [Name], [ParentID]) VALUES (N'b8e34204-c9fe-4ab1-b8cb-cdcd11ad385f', N'Sản phẩm', N'6389553e-8754-46d0-b13d-4dc07b179ad6')
INSERT [dbo].[Categories] ([Id], [Name], [ParentID]) VALUES (N'9a65d4c1-3000-4b90-9572-ec30f8d6d918', N'Quần áo', N'b8e34204-c9fe-4ab1-b8cb-cdcd11ad385f')
GO
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'da1dcae4-78d0-4067-bb7c-08a37f0d5782', N'Green', N'#669933')
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'08a9a6d3-c748-4092-a850-289a7cf54fc2', N'Black', N'#080902')
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'd59f24a0-59e8-4a0d-819a-427b0a2cde98', N'White', N'#ebebeb')
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'62cc2a9c-4358-4d74-926d-72c2371e2edd', N'Red', N'#CC3333')
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'eb3ff8fd-32e2-4888-9944-74d5dc6f5ad5', N'Brown', N'#964B00')
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'560b23f0-1973-47a4-b101-92ebfff2eefa', N'Yellow', N'#D7FF11')
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'b8eb1f82-e8d2-4013-b2c3-d3853ac1338b', N'Grey', N'#808080')
INSERT [dbo].[Colors] ([ID], [Name], [Code]) VALUES (N'1610ab5f-c923-4b9d-afca-d8bc69af7e1d', N'Blue', N'#3399cc')
GO
INSERT [dbo].[Credential] ([Id], [GroupID], [RoleID]) VALUES (N'4f4c7ba7-c760-444b-9caa-409821260791', N'11100188-704b-4c9b-bf19-bdc3cdf48d4c', N'ded75d50-ee02-4a66-b1e5-8e9f004010dd')
GO
INSERT [dbo].[Group] ([Id], [Name]) VALUES (N'cbc33d81-d816-4efc-b0f4-427d6482e10b', N'Biên soạn')
INSERT [dbo].[Group] ([Id], [Name]) VALUES (N'11100188-704b-4c9b-bf19-bdc3cdf48d4c', N'Quản trị viên')
GO
INSERT [dbo].[Members] ([Id], [Name], [Picture], [LoginName], [Password], [CreatedDate], [Status], [GroupID]) VALUES (N'6f64df59-fdfa-4c2e-8a93-aeed5e9fbacf', N'Trần Thanh Trường', N'airforce.jpg', N'tttruong', N'Truong_123', CAST(N'2023-11-20T00:00:00.000' AS DateTime), 1, N'11100188-704b-4c9b-bf19-bdc3cdf48d4c')
INSERT [dbo].[Members] ([Id], [Name], [Picture], [LoginName], [Password], [CreatedDate], [Status], [GroupID]) VALUES (N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'Lương Quang Vinh', N'tshirt.jpg', N'lqvinh', N'Abcd_1234', CAST(N'2023-11-20T00:00:00.000' AS DateTime), 1, N'11100188-704b-4c9b-bf19-bdc3cdf48d4c')
GO
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'19e70397-c487-40c6-18d1-08dbf00dee13', N'Tiêu đề mới', N'123', N'anh.jpg', CAST(N'2023-11-28T19:31:22.2301123' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'<p>123456</p>')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'69c10508-6087-4cc6-b4a2-18b169781d27', N'Tiêu đề mới', N'123', NULL, CAST(N'2023-11-27T05:21:24.8048997' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'<p>123</p>')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'0743cb26-bb7d-4a93-97c0-197db6723c5f', N'Tin tức mới hôm nay', N'Tin tức về bóng đá', N'nike9.jpg', CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), N'6f64df59-fdfa-4c2e-8a93-aeed5e9fbacf', N'ABCD')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'0ad18123-08f3-422f-b670-33c265e65efe', N'Tiêu đề mới', N'ABCSD', NULL, CAST(N'2023-11-27T05:20:52.6131753' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'<p>123456</p>')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'42b671de-a848-401c-914f-4ef3ef712634', N'Phong cách thời trang của Ronaldo', N'Tin tức về bóng đá', N'nike9.jpg', CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), N'6f64df59-fdfa-4c2e-8a93-aeed5e9fbacf', N'ABCD')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'dbbe6d02-408b-46db-8e22-6527220bbc79', N'123', N'1234', NULL, CAST(N'2023-11-27T05:26:31.9253030' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'<p>1234</p>')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'c9f1fe33-445e-4025-b6f0-66b3c09adc91', N'Xu hướng giới trẻ', N'Tin tức về bóng đá', N'nike9.jpg', CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'ABCD')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'ed436a48-77d0-48ad-b497-7125808fdee0', N'Tiêu đề mới', N'Mô tả mới', NULL, CAST(N'2023-11-27T05:16:44.2695751' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'<p>123</p>')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'0231dc3a-5abf-4e97-914f-850554cc146d', N'Tin tức mới', N'Tin tức về bóng đá', N'nike9.jpg', CAST(N'2022-11-20T00:00:00.0000000' AS DateTime2), N'6f64df59-fdfa-4c2e-8a93-aeed5e9fbacf', N'ABCD')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'50657c24-37cf-467e-83b9-a1248657b62d', N'Tiêu đề mới', N'123', NULL, CAST(N'2023-11-27T05:17:48.1634680' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'<p>123</p>')
INSERT [dbo].[News] ([Id], [Title], [Description], [Picture], [CreatedDate], [CreatedBy], [Content]) VALUES (N'8ea0d318-0a9f-4e2e-9196-a35229055954', N'Hôm nay trời nắng đẹp thật', N'Tin tức về bóng đá', N'nike9.jpg', CAST(N'2023-11-20T00:00:00.0000000' AS DateTime2), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'ABCDE')
GO
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'ad29a517-48b7-4798-9e49-0d4de15aff08', N'45f49d57-e57f-4e80-b425-10e1837f8394', N'9a65d4c1-3000-4b90-9572-ec30f8d6d918')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'9fb712fe-ae72-470a-82a3-1a898c8556b7', N'afc909b0-a60b-46c1-b05a-158d85c128a4', N'9a65d4c1-3000-4b90-9572-ec30f8d6d918')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'f43c1c3c-7a5f-47b9-91e3-31966872f44e', N'ba67e373-7b26-4192-bfab-3d4585b2836c', N'c50d2382-45b2-4cc3-9657-c673c3a16627')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'f01ab908-079c-415b-a690-3640ca441b8b', N'37836398-68c6-4ac0-8594-8c77294ad81c', N'c50d2382-45b2-4cc3-9657-c673c3a16627')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'349f0acf-8370-46d7-881f-466bb6d11746', N'fe08a10d-ccfa-4cab-a723-ef8422f752fe', N'c50d2382-45b2-4cc3-9657-c673c3a16627')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'354e0c8a-be96-4057-abf5-4c029a0d8b2a', N'e9026474-0359-45af-8ba4-4214acda1a6d', N'9a65d4c1-3000-4b90-9572-ec30f8d6d918')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'16df11ad-724b-4c7e-bc62-6c93f2689bb4', N'04dbdfe3-1f0f-471a-b74c-615cabc8cca2', N'75bd49c5-9830-4da9-8e61-772dc797afb8')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'3b16d52d-992e-41f2-b847-79d36e28a381', N'c4d6e31c-3372-4094-b11a-6f480fb78f07', N'9a65d4c1-3000-4b90-9572-ec30f8d6d918')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'30d0ffe1-344e-4760-ad8e-85595ad2a723', N'57fe2bd3-ba88-446e-8e3d-ceee19b43c72', N'75bd49c5-9830-4da9-8e61-772dc797afb8')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'1c72bf6d-f410-4633-8c4d-8a2482c3df51', N'6b975a63-fa4b-4bef-9955-e5523c780b2e', N'9a65d4c1-3000-4b90-9572-ec30f8d6d918')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'7d4b03f1-8077-4e4f-b83a-aa3ea2ad140d', N'15babb65-eea2-4423-9d9b-c0685c00fe79', N'75bd49c5-9830-4da9-8e61-772dc797afb8')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'f31b384e-63dc-49c9-9a69-e181a82f8c67', N'c8402c70-e3df-4a33-b30f-a97c60c1299a', N'9a65d4c1-3000-4b90-9572-ec30f8d6d918')
INSERT [dbo].[ProductCategories] ([Id], [ProductID], [Category]) VALUES (N'22629503-b653-4c1b-a3f5-ffbc3f7eabe9', N'f171a877-0d0e-4a96-af3b-ef631f2f9ca5', N'9a65d4c1-3000-4b90-9572-ec30f8d6d918')
GO
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'13e9410c-5a48-4b62-b868-0061c16d876e', N'c4d6e31c-3372-4094-b11a-6f480fb78f07', N'da1dcae4-78d0-4067-bb7c-08a37f0d5782', N'12c8547e-d346-4645-ad34-4239849c5177', 10, N'duinu.jpg', 10)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'bb7ff85a-fda6-47b3-ad74-0360168a6897', N'57fe2bd3-ba88-446e-8e3d-ceee19b43c72', N'd59f24a0-59e8-4a0d-819a-427b0a2cde98', N'e49b0dd7-44e2-4084-aec7-0f87ee1b649b', 50, N'nike9.jpg', 5)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'3c33168f-f3b1-4545-ad47-37ff2df5b226', N'f171a877-0d0e-4a96-af3b-ef631f2f9ca5', N'b8eb1f82-e8d2-4013-b2c3-d3853ac1338b', N'1573d110-80f7-4d8c-81a9-7677a333c364', 40, N'hoodienu.jpg', 15)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'2a9918d8-aa67-438d-8b86-4627d307f636', N'45f49d57-e57f-4e80-b425-10e1837f8394', N'da1dcae4-78d0-4067-bb7c-08a37f0d5782', N'1573d110-80f7-4d8c-81a9-7677a333c364', 15, N'tshirt.jpg', 5)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'a090e625-0b8c-40ad-944b-4c65bb1f108b', N'6b975a63-fa4b-4bef-9955-e5523c780b2e', N'62cc2a9c-4358-4d74-926d-72c2371e2edd', N'12c8547e-d346-4645-ad34-4239849c5177', 20, N'khoac.jpg', 5)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'8fd8d093-9b44-4a27-a0e7-6f85383e6b17', N'e9026474-0359-45af-8ba4-4214acda1a6d', N'b8eb1f82-e8d2-4013-b2c3-d3853ac1338b', N'1573d110-80f7-4d8c-81a9-7677a333c364', 10, N'Trousers.jpg', 10)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'5343c2e9-2fff-4964-915d-8700b7f4265a', N'45f49d57-e57f-4e80-b425-10e1837f8394', N'08a9a6d3-c748-4092-a850-289a7cf54fc2', N'e49b0dd7-44e2-4084-aec7-0f87ee1b649b', 15, N'item-5.jpg', 5)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'8b3ef0b2-c147-488c-ad51-9d23b30ff6f3', N'fe08a10d-ccfa-4cab-a723-ef8422f752fe', N'eb3ff8fd-32e2-4888-9944-74d5dc6f5ad5', N'e49b0dd7-44e2-4084-aec7-0f87ee1b649b', 15, N'mu.jpg', 35)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'8abb560c-fef9-40c7-a854-bcd4dd732527', N'45f49d57-e57f-4e80-b425-10e1837f8394', N'62cc2a9c-4358-4d74-926d-72c2371e2edd', N'12c8547e-d346-4645-ad34-4239849c5177', 15, N'tshirt1.jpg', 5)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'2fc5c545-f3e5-4288-a9be-c02953697403', N'afc909b0-a60b-46c1-b05a-158d85c128a4', N'd59f24a0-59e8-4a0d-819a-427b0a2cde98', N'e49b0dd7-44e2-4084-aec7-0f87ee1b649b', 40, N'bomber.jpg', 15)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'3b83c3b1-cf04-487c-a9ab-c68e27027994', N'37836398-68c6-4ac0-8594-8c77294ad81c', N'08a9a6d3-c748-4092-a850-289a7cf54fc2', N'1573d110-80f7-4d8c-81a9-7677a333c364', 20, N'balo.jpg', 20)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'e15882c1-9417-4854-baa8-d6bed2ed092b', N'15babb65-eea2-4423-9d9b-c0685c00fe79', N'62cc2a9c-4358-4d74-926d-72c2371e2edd', N'1573d110-80f7-4d8c-81a9-7677a333c364', 30, N'calm.jpg', 10)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'8bf81efa-26d1-4e13-9837-f06b834d8fde', N'c8402c70-e3df-4a33-b30f-a97c60c1299a', N'eb3ff8fd-32e2-4888-9944-74d5dc6f5ad5', N'12c8547e-d346-4645-ad34-4239849c5177', 45, N'kid.jpg', 0)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'c5dd97db-3814-4800-99d7-fbe5e89ae78e', N'ba67e373-7b26-4192-bfab-3d4585b2836c', N'1610ab5f-c923-4b9d-afca-d8bc69af7e1d', N'12c8547e-d346-4645-ad34-4239849c5177', 30, N'girlkid.jpg', 23)
INSERT [dbo].[ProductPrices] ([Id], [ProductID], [ColorID], [SizeID], [Price], [Picture], [Amount]) VALUES (N'8853721e-d01b-4b00-932c-fcc446cccc1e', N'04dbdfe3-1f0f-471a-b74c-615cabc8cca2', N'd59f24a0-59e8-4a0d-819a-427b0a2cde98', N'1573d110-80f7-4d8c-81a9-7677a333c364', 50, N'airforce.jpg', 30)
GO
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'45f49d57-e57f-4e80-b425-10e1837f8394', N'Áo thể thao nam', N'Mô tả', N'abc', N'ABC', N'ABC', N'tshirt.jpg', CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 5)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'afc909b0-a60b-46c1-b05a-158d85c128a4', N'Áo khoác Bomber', N'Áo khoác Bomber với phong cách trẻ trung, năng động', N'ABCD', N'ABCD', N'ABCD', N'bomber.jpg', CAST(N'2023-11-02T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 15)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'ba67e373-7b26-4192-bfab-3d4585b2836c', N'Đồ thể thao trẻ em', N'Đồ thể thao trẻ em phong cách năng động', N'ABCD', N'ABCD', N'ABCD', N'girlkid.jpg', CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 30)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'e9026474-0359-45af-8ba4-4214acda1a6d', N'Quần', N'Quần hợp thời trang', N'ABCD', N'ABCD', N'ABCD', N'Trousers.jpg', CAST(N'2023-11-04T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'c77c3389-73b9-4a78-829d-6f0ed3362abe', 10)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'04dbdfe3-1f0f-471a-b74c-615cabc8cca2', N'Giày thể thao', N'Giày thể thao phong cách ', N'ABCD', N'ABCD', N'ABCD', N'airforce.jpg', CAST(N'2023-11-04T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'c77c3389-73b9-4a78-829d-6f0ed3362abe', 50)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'e608ea4f-733c-4078-84e3-65d5bde3c49c', N'Áo bóng rổ ', N'Áo bóng rổ ', N'Áo bóng rổ ', N'Áo bóng rổ ', N'Arrived', N'jeysey.jpg', CAST(N'2023-11-30T05:13:11.183' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'c77c3389-73b9-4a78-829d-6f0ed3362abe', 0)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'c4d6e31c-3372-4094-b11a-6f480fb78f07', N'Quần đùi nữ', N'Quần đùi nữ phong cách thể thao', N'ABCD', N'ABCD', N'ABCD', N'duinu.jpg', CAST(N'2023-11-05T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'c77c3389-73b9-4a78-829d-6f0ed3362abe', 10)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'37836398-68c6-4ac0-8594-8c77294ad81c', N'Balo thể thao', N'Balo phong cách đậm chất thể thao', N'ABCD', N'ABCD', N'ABCD', N'balo.jpg', CAST(N'2023-11-05T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 20)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'c8402c70-e3df-4a33-b30f-a97c60c1299a', N'Đồ thể thao trẻ em', N'Đồ thể thao trẻ em phong cách đơn giản, năng động, trẻ trung', N'ABCD', N'ABCD', N'ABCD', N'kid.jpg', CAST(N'2023-11-06T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 45)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'15babb65-eea2-4423-9d9b-c0685c00fe79', N'Dép thể thao', N'Dép thể thao phong cách trẻ trung, năng động', N'ABCD', N'ABCD', N'ABCD', N'calm.jpg', CAST(N'2023-11-07T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'c77c3389-73b9-4a78-829d-6f0ed3362abe', 10)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'57fe2bd3-ba88-446e-8e3d-ceee19b43c72', N'Giày đá bóng', N'Giày đá bóng Nike-Air', N'Giày đá bóng Nike-Air', N'Giày đá bóng Nike-Air', N'Shipping', N'nike9.jpg', CAST(N'2023-11-30T05:07:34.970' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 0)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'6b975a63-fa4b-4bef-9955-e5523c780b2e', N'Áo khoác', N'Áo khoác đẹp', N'ABCD', N'ABCD', N'ABCD', N'khoac.jpg', CAST(N'2023-11-07T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 20)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'be61a5aa-b86a-465f-85f5-eebe323a42e4', N'Giày thể thao Nike Jordan', N'Giày thể thao Nike Jordan', N'Giày thể thao Nike Jordan', N'Giày thể thao Nike Jordan', N'Arrived', N'jordan.jpg', CAST(N'2023-11-30T05:11:21.540' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 0)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'f171a877-0d0e-4a96-af3b-ef631f2f9ca5', N'Áo khoác Hoodie', N'Áo khoác Hoodie phong cách trẻ trung, năng động', N'ABCD', N'ABCD', N'ABCD', N'hoodienu.jpg', CAST(N'2023-11-07T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'c77c3389-73b9-4a78-829d-6f0ed3362abe', 15)
INSERT [dbo].[Products] ([ID], [Name], [Description], [Information], [Addtional], [Shipping], [Picture], [CreatedDate], [CreatedBy], [BrandID], [Price]) VALUES (N'fe08a10d-ccfa-4cab-a723-ef8422f752fe', N'Mũ thể thao đẹp', N'Mũ thể thao hợp thời trang', N'ABCD', N'ABCD', N'ABCD', N'mu.jpg', CAST(N'2023-11-08T00:00:00.000' AS DateTime), N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 15)
GO
INSERT [dbo].[Role] ([ID], [Code], [Name], [GroupName]) VALUES (N'12629130-710d-4949-9c2c-c2528eaf76c0', N'add-edit-productlist', N'Thêm/sửa sản phẩm', N'Sản phẩm')
GO
INSERT [dbo].[Sizes] ([Id], [Name], [ParentID]) VALUES (N'e49b0dd7-44e2-4084-aec7-0f87ee1b649b', N'L', N'dfe8ad7d-2e46-438e-bd5d-2c19daa30c95')
INSERT [dbo].[Sizes] ([Id], [Name], [ParentID]) VALUES (N'1442dedc-9c55-4ec6-9cd8-1da33e8accb8', N'S', N'dfe8ad7d-2e46-438e-bd5d-2c19daa30c95')
INSERT [dbo].[Sizes] ([Id], [Name], [ParentID]) VALUES (N'dfe8ad7d-2e46-438e-bd5d-2c19daa30c95', N'Size', NULL)
INSERT [dbo].[Sizes] ([Id], [Name], [ParentID]) VALUES (N'cde61b33-2249-44f9-8dfd-4172c7e2550b', N'XXL', N'dfe8ad7d-2e46-438e-bd5d-2c19daa30c95')
INSERT [dbo].[Sizes] ([Id], [Name], [ParentID]) VALUES (N'12c8547e-d346-4645-ad34-4239849c5177', N'XS', N'dfe8ad7d-2e46-438e-bd5d-2c19daa30c95')
INSERT [dbo].[Sizes] ([Id], [Name], [ParentID]) VALUES (N'1573d110-80f7-4d8c-81a9-7677a333c364', N'M', N'dfe8ad7d-2e46-438e-bd5d-2c19daa30c95')
INSERT [dbo].[Sizes] ([Id], [Name], [ParentID]) VALUES (N'ed903698-51be-4722-85c9-83112d1648ab', N'XL', N'dfe8ad7d-2e46-438e-bd5d-2c19daa30c95')
GO
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'6cc1f020-cada-4a81-b173-3d9f360fbe6e', N'45f49d57-e57f-4e80-b425-10e1837f8394', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 5, N'Sản phẩm chất lượng', 3, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'2c4e60ff-187c-4daf-be99-4c63bf535695', N'6b975a63-fa4b-4bef-9955-e5523c780b2e', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 4, N'Sản phẩm chất lượng', 4, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'186c9dd8-a5f0-43c0-9699-5e9b08e00591', N'afc909b0-a60b-46c1-b05a-158d85c128a4', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 4, N'Sản phẩm chất lượng', 5, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'd0828f96-aa0b-4368-b7cf-5f49eb4e9546', N'e608ea4f-733c-4078-84e3-65d5bde3c49c', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 4, N'Sản phẩm chất lượng', 2, 2)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'84426bf5-5f04-4e63-acf7-747e10b69265', N'ba67e373-7b26-4192-bfab-3d4585b2836c', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 3, N'Sản phẩm chất lượng', 6, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'7274d70e-8cf5-40fc-81fe-76cc98fc9d6d', N'e9026474-0359-45af-8ba4-4214acda1a6d', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 2, N'Sản phẩm chất lượng', 7, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'0c2351b1-bdc9-46f8-81be-77ff76c513b6', N'04dbdfe3-1f0f-471a-b74c-615cabc8cca2', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 5, N'Sản phẩm chất lượng', 8, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'd058a24c-85c4-4969-af1b-892a02c3b853', N'c4d6e31c-3372-4094-b11a-6f480fb78f07', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 4, N'Sản phẩm chất lượng', 9, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'50474f02-56ca-4673-8ee3-9860c6b7b5a1', N'37836398-68c6-4ac0-8594-8c77294ad81c', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 4, N'Sản phẩm chất lượng', 3, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'5009347a-3288-4bb9-8a05-a02b82f9c677', N'c8402c70-e3df-4a33-b30f-a97c60c1299a', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 3, N'Sản phẩm chất lượng', 4, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'78992caa-61d7-4119-a993-a0e5dcf24ac2', N'15babb65-eea2-4423-9d9b-c0685c00fe79', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 5, N'Sản phẩm chất lượng', 1, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'5b960ef9-2895-40b6-9183-a4d3ef54c4fb', N'f171a877-0d0e-4a96-af3b-ef631f2f9ca5', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 5, N'Sản phẩm chất lượng', 2, 1)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'b0f95e67-0546-44cb-bf3d-ba0dcade210d', N'57fe2bd3-ba88-446e-8e3d-ceee19b43c72', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 3, N'Sản phẩm chất lượng', 2, 2)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'830a4085-4b16-4728-8fb7-dd4f1f6caebd', N'be61a5aa-b86a-465f-85f5-eebe323a42e4', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 5, N'Sản phẩm chất lượng', 3, 2)
INSERT [dbo].[Votings] ([Id], [ProductID], [CreatedBy], [Star], [Content], [Helpful], [Unhelpful]) VALUES (N'eaef21a3-efae-444d-8bc4-e50f2399b6a2', N'fe08a10d-ccfa-4cab-a723-ef8422f752fe', N'6b11bd0a-d4c4-47ef-b3de-fb0be61f3b3a', 5, N'Sản phẩm chất lượng', 0, 1)
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Categories] FOREIGN KEY([Category])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Categories]
GO

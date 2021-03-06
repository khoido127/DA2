USE [master]
GO
/****** Object:  Database [Ass]    Script Date: 7/30/2018 12:54:19 PM ******/
CREATE DATABASE [Ass]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ass.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ass_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ass_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ass] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ass].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ass] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ass] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ass] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ass] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ass] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ass] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ass] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Ass] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ass] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ass] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ass] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ass] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ass] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ass] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ass] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ass] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ass] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ass] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ass] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ass] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ass] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ass] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ass] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ass] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ass] SET  MULTI_USER 
GO
ALTER DATABASE [Ass] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ass] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ass] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ass] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ass', N'ON'
GO
USE [Ass]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/30/2018 12:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[moTa] [ntext] NULL,
	[IDSP] [varchar](50) NULL,
	[Email] [varchar](30) NULL,
	[NgayCM] [datetime] NULL,
	[URL] [varchar](50) NULL,
	[reply] [nvarchar](200) NULL,
	[ngayReply] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTSP]    Script Date: 7/30/2018 12:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTSP](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[IDSP] [varchar](50) NULL,
	[motaCT] [ntext] NULL,
	[HinhCTSP] [ntext] NULL,
	[tieudeCTSP] [ntext] NULL,
 CONSTRAINT [PK_CTSP] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/30/2018 12:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHD] [varchar](50) NOT NULL,
	[tenSP] [ntext] NULL,
	[SL] [varchar](100) NULL,
	[Size] [varchar](100) NULL,
	[Gia] [varchar](200) NULL,
	[tenKH] [nvarchar](200) NULL,
	[SDT] [nchar](11) NULL,
	[diaChi] [nvarchar](200) NULL,
	[idSP] [ntext] NULL,
	[Email] [varchar](100) NULL,
	[trangThai] [nvarchar](50) NULL,
	[ngay] [datetime] NULL,
	[hinhThucTT] [nchar](10) NULL,
	[loaiHD] [nvarchar](10) NULL,
	[tongTien] [float] NULL,
 CONSTRAINT [PK_CTHD_1] PRIMARY KEY CLUSTERED 
(
	[IDHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 7/30/2018 12:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kho](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[IDSP] [varchar](50) NULL,
	[SL] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 7/30/2018 12:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loai](
	[IDLoai] [varchar](50) NOT NULL,
	[tenLoai] [nvarchar](200) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[IDLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 7/30/2018 12:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[isAdmin] [bit] NULL,
	[info] [nvarchar](300) NULL,
	[img] [varchar](100) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 7/30/2018 12:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[IDSP] [varchar](50) NOT NULL,
	[TenSP] [nvarchar](200) NULL,
	[GiaSPKM] [float] NULL,
	[GiaSP] [float] NULL,
	[isHot] [nchar](10) NULL,
	[IDLoai] [varchar](50) NULL,
	[MoTa] [ntext] NULL,
	[HinhSP] [ntext] NULL,
	[hinhDaiDien] [varchar](200) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 7/30/2018 12:54:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKe](
	[STT] [nchar](10) NOT NULL,
	[SLHD] [nchar](10) NULL,
	[Ngay] [nchar](10) NULL,
 CONSTRAINT [PK_ThongKe] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (1, N'Yukata', N'Arigato', N'NKAVMFU-GR', N'yukt@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'thank you', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (2, N'Natalia', N'Very Good, beautiful.', N'NKAVMFU-GR', N'visible.mask@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'Yup', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (3, N'Obama', N'Send me this sample
', N'NKAVMFU-GR', N'ma@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'Ok your Address', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (4, N'Khoi', N'This pair of shoes is great', N'JD13R-BLK', N'khoi@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'thank you', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (5, N'Khanh', N'No, You are beautiful.', N'JD13R-BLK', N'khanh@gmail.com', CAST(0x0000A8F3008EB2DC AS DateTime), N'user.png', N'Thank so much.', CAST(0x0000A92401669632 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (6, N'Tin', N'Wow, no comment.', N'JD14R-SD', N'tin@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', N'I like.', CAST(0x0000A91D0102C221 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (7, N'Dante', N'i mind you store good', N'ADNMDRPS-PNK', N'Dan@gmail.com', CAST(0x0000A8F50013527C AS DateTime), N'user.png', N'So hard.', CAST(0x0000A91D00E2F555 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (8, N'John', N'5 stars
', N'NKAM270F-WH-BLU', N'cc@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'love ya', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (9, N'Khoi', N'You are great.', N'ADNMD-CS2PS-BLK', N'khoi@gmail.com', CAST(0x0000A90A0065769C AS DateTime), N'user.png', N'Thank so much', CAST(0x0000A926012EBA9F AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (10, N'Hinata', N'Ano na mai wa', N'ADNMD-CS2PS-BLK', N'khanh@gmail.com', CAST(0x0000A92600340FBC AS DateTime), N'user.png', N'Oh Yeah', CAST(0x0000A92600FD5608 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (11, N'Pladimia', N'высокое качество
', N'ADNMD-CS2PS-BLK', N'tin@gmail.com', CAST(0x0000A92600348D20 AS DateTime), N'user.png', N'what you say', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (12, N'Halulu', N'alta qualidade
', N'NKHDB-BLK', N'ha@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'yeah thanh you', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (13, N'Karruga', N'im from Japan', N'NKHDB-BLK', N'ka@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'welcome we store', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (14, N'Miho', N'im from Korea', N'NKAVMFU-GR', N'ho@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'nice to meet you', CAST(0x0000A92D004609B0 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (15, N'Hari', N'I look forward to one day coming to your store', N'NKAM97-BLK', N'hari@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'where are you from', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (16, N'Tran Thanh', N'My wife bought a pair of shoes at this store and she was very happy
', N'NKAM97-BLK', N'thanht@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'Anh Thành phải không ạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (17, N'La Thanh', N'Thành nói tiếng Việt đi Thành', N'NKAM97-BLK', N'thanhl@gmail.com', CAST(0x0000A92D00568470 AS DateTime), N'user.png', N'hihi anh vui tinh qua', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (18, N'Viet Huong', N'mẫu này đẹp nè', N'NKAM95SB-BRW', N'thuong@gmail.com', CAST(0x0000A92B004609B0 AS DateTime), N'user.png', N'dạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (19, N'Anh Duc', N'Củng được ship cho anh 1 đôi nhé', N'NKAM270F-WH-BLU', N'duc@gmail.com', CAST(0x0000A914004609B0 AS DateTime), N'user.png', N'em biết ạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (20, N'Hoài Linh', N'Chú thấy mẫu này cho Hoài Lâm', N'NKAM95SB-BRW', N'linh@gmail.com', CAST(0x0000A916004609B0 AS DateTime), N'user.png', N'dạ chú', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (21, N'Chi Tai', N'Được đó', N'NKAM270F-WH-BLU', N'tai@gmail.com', CAST(0x0000A910004609B0 AS DateTime), N'user.png', N'dạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (22, N'DungCT', N'Giỏi', N'NKAM270-BLU', N'ct@gmail.com', CAST(0x0000A918004609B0 AS DateTime), N'user.png', N'hihi', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (23, N'DungCN', N'Khá đấy', N'JDXXXII-BLK-WH', N'cn@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (24, N'Tello', N'Oh my god', N'NKAM270-BLU', N'lo@gmail.com', CAST(0x0000A91A004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (25, N'Ran mori', N'yata ma do', N'JDXXXII-BLK-WH', N'mori@gmail.com', CAST(0x0000A91B004609B0 AS DateTime), N'user.png', N'', NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (26, N'Kasuke Honda', N'send me this sample
', N'JDTLXH-PLA', N'honda@gmail.com', CAST(0x0000A91D004609B0 AS DateTime), N'user.png', N'yes. your address ?', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (27, N'Bokuradot', N'send me this sample
', N'JDS-DBLU', N'dot@gmail.com', CAST(0x0000A921004609B0 AS DateTime), N'user.png', N'yes. your address ?', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (28, N'Bach Tu Hoa', N'Shop Việt Nam à', N'JDTLXH-PLA', N'hoa@gmail.com', CAST(0x0000A922004609B0 AS DateTime), N'user.png', N'dạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (29, N'Osaht', N'Tôi đã đến Việt Nam vì shop', N'JDS-DBLU', N'os@gmail.com', CAST(0x0000A923004609B0 AS DateTime), N'user.png', N'cảm ơn nhiều ạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (30, N'Trump', N'send me this sample
', N'JDFE23-RD', N'trump@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'yes. your address ?', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (31, N'Michael Mun', N'Mai ship cho anh được không', N'JD14R-SD', N'mun@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'dạ ok anh', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (32, N'Suzuki', N'Great', N'JDFE23-RD', N'suki@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (33, N'Anh Da Den', N'Đẹp đó các em hàng Real giá mềm', N'JD14R-SD', N'den@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'dạ cảm ơn anh', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (34, N'Neil', N'Real ???', N'JD13R-BLK', N'neil@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'Yes', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (35, N'Ute', N'Fake', N'ADXRCUBA-TS-GR', N'ute@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'no', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (36, N'Miku', N'i want it', N'JD13R-BLK', N'mk@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (37, N'Shop Giay Z4', N'Hợp tác không sop ơi', N'ADXRCUBA-TS-GR', N'z4@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (38, N'Mark Dolnan', N'Store Address', N'ADUBUS-BLK', N'mado@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'88 Nam Kỳ Khởi Ngĩa TP HCM VN', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (39, N'Lehm', N'Store so far', N'ADUBCS-BLK', N'lehm@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (40, N'Ronaldo', N'i like runing shoes
', N'ADUBUS-BLK', N'cr7@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'ya thank my idol', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (41, N'Oliver Can', N'yeah me too. Ronaldo', N'ADUBCS-BLK', N'ocan@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (42, N'Heo con xinh xan', N'Shop ở đâu vậy ạ', N'ADSMS-WH', N'hcxx@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'88 Nam Kỳ Khởi Ngĩa TP HCM VN', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (43, N'Anh chang co don', N'Xấu', N'ADSBS-BLK', N'accd@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (44, N'Yeu giay', N'Chúc shop thành công', N'ADSMS-WH', N'yg@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'cảm ơn ạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (45, N'Tim can co em', N'tr0i 0i gjAy ', N'ADSBS-BLK', N'tcce@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (46, N'Toi khong can', N'Giày đắt quá', N'ADNMDRPS-PNK', N'tkc@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (47, N'Neymar', N'This is very nice but its price is too low
', N'ADNMD-R1S-GRN', N'ney@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'thank you', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (48, N'Messi', N'This is very nice but its price is too low
', N'ADNMDRPS-PNK', N'mes@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (49, N'Sir Alex', N'I will buy it
', N'ADNMD-R1S-GRN', N'alex@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'thank you', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (50, N'Matic', N'Wow', N'ADNMD-CS2PS-BLK', N'matic@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (52, N'Gome', N'I will buy it
', N'ADNMD-CS2PS-BLK', N'go@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (53, N'Tim', N'I will buy it
', N'ADNMD-R1S-GRN', N'tim@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (54, N'Wiliam', N'Cheap', N'ADNMDRPS-PNK', N'am@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (55, N'Bùi Tiến Dũng', N'3 ngày rồi sao chưa có hàng', N'ADSBS-BLK', N'dung@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', N'mai sẽ đến ạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (56, N'Bùi Kiệm', N'Giày gì mà đắt thế', N'ADNMDRPS-PNK', N'kim@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (58, N'Van Der Sa', N'i from serbia , you sell ???', N'ADSMS-WH', N'sa@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', N'yeah', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (59, N'Van Nister Roy', N'I can take it play ball
', N'ADUBCS-BLK', N'roy@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (60, N'Lee Nguyễn', N'Hợp nhãn , hợp túi tiền', N'ADSMS-WH', N'lee@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (61, N'Par Ji Sung', N'Sa rang he yo', N'ADUBCS-BLK', N'sung@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', N'love ya', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (62, N'Son Han Min', N'otoke', N'ADUBUS-BLK', N'Min@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (63, N'SNSD', N'We love store', N'ADXRCUBA-TS-GR', N'snsd@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'thank you', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (64, N'Sơn Tùng Ôm Tivi', N'mai tớ ghé các cậu nhé', N'ADUBUS-BLK', N'mtp@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', N'ok mai qua đi cậu', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (65, N'Vũ Hà', N'Anh thích nhân viên shop', N'ADXRCUBA-TS-GR', N'vh@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'dạ em cảm ơn', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (66, N'Đàm Vĩnh Hưng', N'Nhân viên nhiệt tình', N'JD13R-BLK', N'dvh@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', N'hihi', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (67, N'Shop cùi', N'dẹp tiệm đi buôn bán kiểu gì giá trên trời ai mà mua', N'JD14R-SD', N'sc@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (68, N'1 sao', N'tôi chỉ 98kg nhân viên bảo tôi béo và không có size vừa quá thất vọng', N'JD13R-BLK', N'aaa@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (69, N'Biber', N'Bibar mua giày cho em đi học', N'JD14R-SD', N'be@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (70, N'Be care full', N'shop cẩn thận những thành phần bất hão nhé', N'JDFE23-RD', N'hainam@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (71, N'Dẹp tiệm đi', N'shop như ....', N'JDS-DBLU', N'qq@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (72, N'HKT', N'tuần sau tụi em về nước tụi em ghé nha', N'JDFE23-RD', N'hkt@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (73, N'Bù nhìn', N'shop bán hàng fake đó bà con', N'JDS-DBLU', N'bun@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (74, N'BTS', N'we want 12 shoes tomorrow', N'JDTLXH-PLA', N'bts@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (75, N'Royal', N'never give up', N'JDXXXII-BLK-WH', N'royal@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (76, N'Người yêu cũ', N'Anh K dạo này làm ăn tốt nhỉ', N'JDTLXH-PLA', N'nyc@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (77, N'Tao', N'Mấy anh chủ shop đẹp trai quá', N'JDXXXII-BLK-WH', N'tao@gmail.com', CAST(0x0000A917004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (78, N'Bon', N'Chiều em qua lấy đôi này nha shop', N'NKAM270-BLU', N'bon@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (79, N'Black Bi', N'Anh đen quá mang giày trắng hợp không', N'NKAM270F-WH-BLU', N'bbi@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'hihi không đâu anh anh qua shop thử nhé', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (80, N'Thái Vũ', N'Ship cho anh đôi này anh tặng thăng black bi', N'NKAM270-BLU', N'tvu@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'dạ ok anh', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (81, N'Huỳnh Phương', N'Gửi đôi này tới địa chỉ nhà anh nhé. em biết rồi phải không', N'NKAM270F-WH-BLU', N'hfu@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'ok anh', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (82, N'Vinh Dâu', N'tháng sau em đi lấy hàng thì lấy cho anh mẫu này màu khác', N'NKAM95SB-BRW', N'vd@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'không thành vấn đề ạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (83, N'Ribi', N'có size 35 nữ không, chị mua cho con bé em nhà chị', N'NKAM97-BLK', N'rb@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'dạ có ạ chị qua shop nhé', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (84, N'Nhật Hạ', N'Sao em search trên Google k ra địa chỉ ạ', N'NKAM95SB-BRW', N'nh@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', N'88 Nam Kỳ Khởi Ngĩa TP HCM VN', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (85, N'Thủy Top', N'cho em đặt đôi này sáng mai em qua lấy', N'NKAM97-BLK', N'tt@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'dạ ok ạ', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (86, N'Conan', N'coming son', N'NKAVMFU-GR', N'cnan@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (87, N'Canno', N'Na próxima semana vou ao Vietnã', N'NKHDB-BLK', N'cann@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (88, N'Lyliana', N'não tem desconto
', N'NKAVMFU-GR', N'lyli@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (89, N'Tulen', N'Next week is my birthday', N'NKHDB-BLK', N'tu@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (90, N'Maloch', N'Sáng nay lên shop thấy anh chủ đánh liên quân', N'JDS-DBLU', N'loch@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'hihi', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (91, N'Rouker', N'Fan cứng của shop', N'JD14R-SD', N'rou@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (92, N'Arum', N'Khi nào Việt Nam vô địch WC thì em không mua giày của shop nữa', N'JDS-DBLU', N'Ar@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'thật không em cảm ơn em nhiều', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (93, N'Moren', N'I will buy it
', N'JD14R-SD', N'mor@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (94, N'Yorn', N'when is the new product coming?', N'ADUBCS-BLK', N'yo@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (95, N'Ashe', N'send me this shoe
', N'NKAM95SB-BRW', N'Ashe@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (96, N'Lula', N'I will buy it
', N'ADUBCS-BLK', N'lulu@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (97, N'Kassadin', N'size 45 ???', N'NKAM95SB-BRW', N'kass@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', N'yes', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (98, N'Kaisa', N'You have branches in the United States', N'NKAM270F-WH-BLU', N'kai@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (99, N'Nakrot', N'Very good shoes I will recommend to friends', N'ADNMD-CS2PS-BLK', N'nar@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (100, N'Mukrap', N'You have a branch in Australia', N'ADUBCS-BLK', N'mu@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (101, N'Alice', N'Very good shoes I will recommend to family', N'ADNMD-CS2PS-BLK', N'ali@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
GO
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (102, N'Krixi', N'You have a branch in Australia', N'NKAM270-BLU', N'kri@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (103, N'Yuka', N'I should lower the price of the shoes', N'NKAM270F-WH-BLU', N'yuka@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (104, N'Roxie', N'You have branches in the UK', N'NKAM270F-WH-BLU', N'roxi@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (105, N'Skud', N'You have branches in the United States', N'ADNMD-R1S-GRN', N'sku@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (106, N'Payna', N'it expensive
', N'NKAM270-BLU', N'pay@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (107, N'Max', N'You have a branch in Australia', N'ADNMD-R1S-GRN', N'maxx@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (108, N'Teemee', N'what material', N'NKAM270-BLU', N'tee@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', N'cowhide', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (109, N'Xeniel', N'I will buy it
', N'ADXRCUBA-TS-GR', N'xeni@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (110, N'Zill', N'You have branches in the UK', N'NKAM270F-WH-BLU', N'zill@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (111, N'Thane', N'You have branches in the United States', N'JD13R-BLK', N'thane@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (112, N'Violet', N'This dress looks quite hot', N'ADXRCUBA-TS-GR', N'vio@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (113, N'Wisp', N'This dress looks quite hot', N'ADSBS-BLK', N'wi@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (114, N'Omen', N'what material', N'JDXXXII-BLK-WH', N'ome@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', N'cowhide', CAST(0x0000A92D00986F70 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (115, N'Lindis', N'I do not like the store too far', N'ADXRCUBA-TS-GR', N'lin@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (116, N'Slimz', N'
I think you should open more branches in countries around the world', N'ADSBS-BLK', N'lim@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (117, N'Raz', N'what material', N'JD13R-BLK', N'raz@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (118, N'Lauriel', N'I will buy it
', N'ADUBCS-BLK', N'lau@gmail.com', CAST(0x0000A92D004609B0 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (119, N'Marija', N'I do not like the store too far', N'ADSBS-BLK', N'marija@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (120, N'Airi', N'I will buy it
', N'JDXXXII-BLK-WH', N'airi@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', N'thank you', CAST(0x0000A92D0099CF00 AS DateTime))
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (121, N'Kahlii', N'I will buy it
', N'ADUBCS-BLK', N'kah@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (122, N'Taara', N'This dress looks quite hot', N'JDXXXII-BLK-WH', N'tara@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png', NULL, NULL)
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL], [reply], [ngayReply]) VALUES (123, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[CTSP] ON 

INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (1, N'ADNMD-CS2PS-BLK', N'The meeting point of adidas heritage and adidas innovation, NMD leads 3-Stripes into the future. These slip-on shoes combine an ultra-lightweight sock-like upper with a responsive cushioned midsole.   Minimalist knit adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Distinctive Boost midsole Boost is our most responsive cushioning ever  Signature NMD details A signature heel pull plus an EVA midsole plug^The meeting point of adidas heritage and adidas innovation.^', N'CT1.jpg;CT2.jpg;', N'A MODERN SLIP-ON SNEAKER WITH INNOVATIVE STYLE.^A MODERN SLIP-ON SNEAKER WITH INNOVATIVE STYLE.^')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (2, N'ADNMD-R1S-GRN', N'Streamlined and modern, these NMD shoes combine ''80s racing heritage with style cues taken from outdoor trail gear. The foot-hugging knit upper rides on a responsive cushioned midsole.   Distinctive Boost midsole Boost is our most responsive cushioning ever  Signature NMD details A signature heel pull plus EVA midsole plugs  Outdoor gear style Technical welded 3-Stripes and a gum-colored outsole add a trail gear vibe', N'CT1.jpg;CT2.jpg;CT3.jpg', N'A MODERN NMD SNEAKER WITH A SNUG, SUPPORTIVE KNIT UPPER.')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (3, N'ADNMDRPS-PNK', N'Progressive, premium, pioneering. NMD blends pure adidas heritage with advanced materials for futuristic style that resonates on the streets. These shoes have a sock-like adidas Primeknit upper that follows the shape of your foot for a snug, adaptive fit. The responsive Boost midsole features multicolored Quickstrike inserts for lightweight flexibility.^^^', N'CT1.jpg;CT2.jpg;CT3.jpg;', N'A RACING-INSPIRED NMD THAT''S FASTER AND SLEEKER THAN EVER BEFORE.^^^')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (4, N'ADSBS-BLK', N'These versatile running shoes are designed for comfort that goes the distance. They have an upper that hugs your foot in compressive support, and a flexible outsole that adapts to your unique foot strike.  Runner type Neutral shoes for the long distance runner  Energy return Boost is our most responsive cushioning ever: The more energy you give, the more you get  Precision support  Tailored Fiber Placement offers stitched-in reinforcement for targeted support at the midfoot  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Heel-to-toe stability Solar Propulsion Rail helps guide and propel the foot; Torsion System between the heel and forefoot for a stable ride^Susu^^^', N'CT1.jpg;CT2.jpg;CT3.jpg;CT4.jpg;', N'A GO-TO SHOE DESIGNED FOR LONG DISTANCES.^HuHu^Hot.^Cool.^')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (5, N'ADSMS-WH', N'Back in the day, Stan Smith won big on the tennis court. The shoe that bears his name has been winning on the streets ever since. Top to bottom, these shoes capture the essential style of the 1972 original, with the artful leather build, low-profile cupsole and clean trim that have always been its hallmark.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'AN AUTHENTIC VERSION OF THE ICONIC 1972 TENNIS CLASSIC.')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (6, N'ADUBCS-BLK', N'These running shoes are designed to keep you performing at your best in the heat. They''re made with a breathable, open-weave knit upper that features sweat-wicking yarn. A knit-in midfoot cage offers support, and a heel counter allows your Achilles to move freely.   Runner type Neutral shoes for the ultimate running experience  Enhanced breathability adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort; Clima yarns wick moisture away to help keep feet cool and dry  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction^These running shoes are designed to keep you performing at your best in the heat. They''re made with a breathable, open-weave knit upper that features sweat-wicking yarn. A knit-in midfoot cage offers support, and a heel counter allows your Achilles to move freely. ^^', N'CT1.jpg;CT2.jpg;CT3.jpg;', N'LIGHTWEIGHT AND BREATHABLE SHOES MADE WITH MOISTURE-WICKING YARN.^LIGHTWEIGHT AND BREATHABLE SHOES MADE WITH MOISTURE-WICKING YARN.^^')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (7, N'ADUBUS-BLK', N'These running shoes have a simplified design to give you a feeling of free and unrestricted movement. The shoes are built with an internally reinforced knit upper for a supportive fit. The responsive midsole and flexible outsole deliver a smooth and comfortable ride.   Runner type Neutral shoes for the ultimate running experience  Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction  Natural feel and support Aramis 3D motion capture system maps runners'' movements to create a fit without pressure points or irritation', N'CT1.jpg;CT2.jpg;CT3.jpg', N'RUNNING SHOES WITH INTERNAL MIDFOOT SUPPORT FOR AN UNRESTRICTED STRIDE.')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (8, N'ADXRCUBA-TS-GR', N'Explore paths less traveled in these all-terrain running shoes designed in collaboration with Canadian label Reigning Champ. A water-repellent coating and high ankle collar give you an edge over the elements, and an integrated cage and molded heel counter secure a locked-down fit. Responsive cushioning delivers a burst of energy with every push-off and touchdown.  Runner type Neutral shoes for the ultimate runner  Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction', N'CT1.jpg;CT2.jpg;CT3.jpg', N'RESPONSIVE SHOES FOR A SMOOTH AND ENERGIZED RUN, MADE IN COLLABORATION WITH REIGNING CHAMP.')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (9, N'JD13R-BLK', N'The Air Jordan 13 Retro Men''s Shoe celebrates the original with court-inspired cushioning and classic design details.^ Genuine leather, synthetic leather or textile upper depending on colourway
Foam midsole with encapsulated Zoom Air units in the heel and forefoot
Shank plate
Rubber outsole
Colour Shown: Black/Light Olive/White/True Red
Style: 414571-006
Country/Region of Origin: China^ Since his game-winning shot that brought the National Championship to North Carolina, Michael Jordan has been at the forefront of basketball consciousness. He took the court in 1985 wearing the original Air Jordan I, setting a new standard for performance and style, simultaneously breaking league rules and his opponents'' will while capturing the imagination of fans worldwide. Ever evolving, ever at the pinnacle of imagination, the Air Jordan line is the ultimate in basketball footwear.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'A CLASSIC, REINVENTED.^ Benefits^ Air Jordan Origins')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (10, N'JD14R-SD', N'Hot girls. Very cool.^Surf.^No.^', N'CT1.jpg;CT2.jpg;CT3.jpg;', N'Great^BENEFITS^HiHiHoHo^')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (11, N'JDFE23-RD', N'The Jordan Flyknit Elevation 23 Men''s Shoe combines a premium Flyknit constructed upper with Air cushioning for dynamic comfort.


Foot-hugging Flyknit is snug, lightweight and breathable
Air cushioning provides responsive impact protection
Durable rubber tread delivers excellent grip
Colour Shown: University Red/Black
Style: AJ8207-601
Country/Region of Origin: China^ Nike Flyknit technology was inspired by feedback from runners craving a shoe with the snug (and virtually unnoticed) fit of a sock. Nike embarked on a four-year mission with teams of programmers, engineers and designers to create the technology needed to make the knit upper with static properties for structure and durability. Then the precise placement of support, flexibility and breathability—all in one layer—was refined. The result is a featherweight, form-fitting and virtually seamless upper. This unprecedented precision maximises performance while reducing the material waste of traditional cut and sew by an average of 60%. The equivalent of six recycled plastic bottles are used in every pair of Flyknit shoes, saving millions of kilos of material from reaching landfills.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'LIGHTWEIGHT COMFORT^ Flyknit Origins')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (12, N'JDS-DBLU', N'Following announcement that the Jordan Spizike OG in Black/Red-Green will be making its return later this year. We now give you news of another upcoming colorway dressed in White and Navy.

Going with a more simple approach. This Jordan Spizike features a Navy Blue-based upper with White overlays. It’ll also replace the traditional elephant print on the toe and heel with a textured material also dressed in White. Adding for a nice contrast is the shoe’s Grey rubber outsole.^ Look for the Jordan Spizike White Navy to release later this fall at select Jordan Brand retailers and Nike.com.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'JORDAN SPIZIKE RELEASING SOON IN WHITE/NAVY^ JORDAN SPIZIKE WHITE NAVY RELEASE DATE')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (13, N'JDTLXH-PLA', N'Jordan Brand brought back the Jordan Trunner LX training model from the early 2000s around the same time that they gave us a retro release of the Jordan 15 for the perfect wave of nostalgia during Mike’s return to the game of basketball as a Washington Wizard. Plenty of people have since slept on the model featuring a woven upper and unique straps, but if you’re a fan of the look then you already know about Travis Scott’s design and Drake’s OVO exclusive. Now Jordan Brand will be updating the training turned lifestyle offering with the introduction of the Jordan Trunner LX High featuring a near-identical ankle collar extension to the Presto Mids. What results is a look that reminds us of the retro Nike ACG days with the likes of the Mowabb. So far, three colorways have appeared in GS sizes and we expect more to come this Fall 2017 season.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'Jordan Trunner LX High')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (14, N'JDXXXII-BLK-WH', N'The Air Jordan XXXII Men''s Basketball Shoe features light, breathable Flyknit fabric that wraps your foot like a sock, plus powerful cushioning that helps you explode off the hardwood.^ Breathable Flyknit fabric offers areas of stretch and support where you need it most. It conforms to the shape of your foot for a comfortable, lightweight feel.^ Low-profile Nike Zoom Air cushioning in the heel and forefoot provides lightweight responsiveness.^ Over the forefoot Nike Zoom Air, FlightSpeed technology distributes the compression of your force. This maximises responsiveness to give you an explosive step.^ Laces integrate with the Flyknit fabric for comfortable support
Internal foam in the heel and collar for comfort
Solid rubber sole for durability and multi-surface traction
Colour Shown: Black/White/Wolf Grey/University Red
Style: AA1253-002
Country/Region of Origin: Vietnam', N'CT1.jpg;CT2.jpg;CT3.jpg', N'FLY ABOVE^ Lightweight Support^ Responsive Cushioning^ Explosive Step^ More Details')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (15, N'NKAM270-BLU', N'The Nike Air Max 270 Men''s Shoe is inspired by two icons of big Air: the Air Max 180 and Air Max 93. It features Nike''s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks.^ The shoe''s bootie construction feels snug and flexes with your foot. It''s made with solid and mesh areas, giving you structure and ventilation where you need them most.^ A dual-density foam sole and large Max Air heel unit deliver plush cushioning for casual, everyday comfort.^ Knit upper with no-sew overlays for comfort and support
Asymmetrical lacing for a secure fit
Heel pull tab for easy on and off
Solid rubber outsole in the forefoot, clear rubber on the heel
Colour Shown: White/Hot Punch/White
Style: AH8050-103
Country/Region of Origin: Vietnam^ Nike''s revolutionary Air-Sole unit made its way into Nike footwear in 1978. In 1987, the Nike Air Max 1 debuted with visible air in its heel, allowing fans more than just the feel of Air-Sole comfort—suddenly they could see it. Since then, next-generation Nike Air Max shoes have become a hit with athletes and collectors by offering striking colour combinations and reliable, lightweight cushioning.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'BIG AIR^ FLEXIBLE AND BREATHABLE^ SUPER-SOFT CUSHIONING^ MORE DETAILS^ Nike Air Max Origins')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (16, N'NKAM270F-WH-BLU', N'Feel the Air, both above and below, with the Nike Air Max 270 Flyknit Men''s Shoe. It features Nike''s biggest heel Air unit yet, plus an ultra-breathable Flyknit upper that helps keep you cool when the temperatures rise. Classic colour combinations nod to iconic Air Max models of the past, delivering a modern, streamlined look that''s rooted in Nike sneaker heritage.^ The upper is made from Flyknit material, which wraps your foot for a snug, sock-like feel. It''s lightweight and breathable, and gives you a comfortable combination of stretch and support.^ A dual-density foam sole and large Max Air heel unit deliver plush cushioning for casual, everyday comfort.^ Foot-hugging Flyknit is snug, lightweight and breathable
Max Air cushioning provides maximum comfort upon impact
Durable rubber tread delivers excellent traction^ Nike''s revolutionary Air-Sole unit made its way into Nike footwear in 1978. In 1987, the Nike Air Max 1 debuted with visible air in its heel, allowing fans more than just the feel of Air-Sole comfort—suddenly they could see it. Since then, next-generation Nike Air Max shoes have become a hit with athletes and collectors by offering striking colour combinations and reliable, lightweight cushioning.^ Nike Flyknit technology was inspired by feedback from runners craving a shoe with the snug (and virtually unnoticed) fit of a sock. Nike embarked on a four-year mission with teams of programmers, engineers and designers to create the technology needed to make the knit upper with static properties for structure and durability. Then the precise placement of support, flexibility and breathability—all in one layer—was refined. The result is a featherweight, form-fitting and virtually seamless upper. This unprecedented precision maximises performance while reducing the material waste of traditional cut and sew by an average of 60%. The equivalent of six recycled plastic bottles are used in every pair of Flyknit shoes, saving millions of kilos of material from reaching landfills.

Country of Origin: China', N'CT1.jpg;CT2.jpg;CT3.jpg', N'FEEL BIG AIR^ AIR ABOVE^ AIR BELOW^ BENEFITS^ NIKE AIR MAX ORIGINS^ FLYKNIT ORIGINS')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (17, N'NKAM95SB-BRW', N'Say goodbye to summer. It’s that time of year when we start seeing all of the major footwear brands bulk up some of their most popular retro models to help you survive the coming winter season in style. For Nike, they’ve been taking the Nike Air Max 95 and extending the ankle support with a neoprene and zipper construction for a sleek and effective tooling known as the Nike Air Max 95 Sneakerboot for the past couple of years. It looks like the Air Max 95 Sneakerboot will be returning for Fall/Winter 2017 in a murdered out Triple Black too, featuring weather resistant materials and the traditional visible air midsole for that patented comfort. Check out more photos below and we’ll keep you updated on availability right here on Sneaker News.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'The Nike Air Max 95 Sneakerboot Returns This Winter')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (18, N'NKAM97-BLK', N'The Nike Air Max 97 shook up the running world with its revolutionary full-length Nike Air unit. The Nike Air Max 97 Ultra ''17 Men''s Shoe remasters the original design with a mesh and knit construction for a lighter feel and sleeker look.^ Mesh and knit upper
Foam sole with Max Air cushioning
Rubber outsole
Reflective piping
Colour Shown: Pure Platinum/White/Wolf Grey/Pure Platinum
Style: 918356-008
Country/Region of Origin: Vietnam^ Nike''s revolutionary Air-Sole unit made its way into Nike footwear in 1978. In 1987, the Nike Air Max 1 debuted with visible air in its heel, allowing fans more than just the feel of Air-Sole comfort—suddenly they could see it. Two years after the Nike Air Max 95 brought Visible Air to the forefoot, the Nike Air Max 97 arrived with the very first full-length unit. The shoe made a huge splash in the running world, as anticipated by its ripple-effect design lines. It''s still making waves over two decades later.', N'CT1.jpg;CT2.jpg;CT3.jpg', N'SLEEK COMFORT^ Product Features^ Air Max 97 Origins')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (19, N'NKAVMFU-GR', N'The Nike Air VaporMax Flyknit Utility Running Shoe puts function at the forefront. A functional design makes it easier and faster to lace up, while the mid-height collar hugs your ankle for total comfort. Building on the original, this take features added cushioning between your foot and the innovative VaporMax cushioning. It''s a bold look for a quick run.^ A full-length layer of foam between your foot and the VaporMax unit provides a softer and more supportive feel than the original. As you run, you still get the lightweight, bouncy feeling, but with more stability.^ Two stretchy straps across the midfoot work with the laces to help keep your foot from shifting within the shoe. A toggle lets you quickly cinch and lock the laces, so you can adjust and go.^ In conjunction with the foam, the latest innovation of Max Air cushioning helps protect against the impact of your foot landing as you run.^ Mid-cut Flyknit upper hugs the foot from ankle to toe for a light, sock-like feel
Loops on the collar help you pull the shoe onto your foot
Reflective details on the heel and sides help you stand out
Supportive overlap wraps the heel to help keep your foot stable
Rubber outsole sections on the heel and forefoot for durability
Offset: 10mm^ The Air VaporMax represents a new era in Nike innovation. "It''s changed our whole philosophy on how we design for Air", says Cushioning Innovation Designer Zachary Elder. With the VaporMax, the designers wanted to truly capture the feeling of "running on air". The designers started by restructuring the Air unit so they could attach it directly to the upper. "That was the biggest challenge", says Tom Minami, Senior Footwear Designer—but it was worth it. "Without any midsole or sockliner, you get to feel the Air in a whole new way". In previous Air Max models, the goal was to fill the sole with as much Air as possible, but with the VaporMax, the focus is on using the Air efficiently. "As you step down, each lug gets pushed into the Air unit, ramping up the pressure", Elder explains. "As you step off, the pressure releases, creating that springy bounce". After the seven-year journey from ideation to release, Elder and Minami are excited for what''s to come. "I''m super-proud of the product", Elder says. "This new approach is going to be a huge turning point for Air – and for Nike".^ Nike Flyknit technology was inspired by feedback from runners craving a shoe with the snug (and virtually unnoticed) fit of a sock. Nike embarked on a four-year mission with teams of programmers, engineers and designers to create the technology needed to make the knit upper with static properties for structure and durability. Then the precise placement of support, flexibility and breathability—all in one layer—was refined. The result is a featherweight, form-fitting and virtually seamless upper. This unprecedented precision maximises performance while reducing the material waste of traditional cut and sew by an average of 60%. The equivalent of six recycled plastic bottles are used in every pair of Flyknit shoes, saving millions of kilos of material from reaching landfills.

Country of Origin: China', N'CT1.jpg;CT2.jpg;CT3.jpg', N'AIR, UPGRADED.^ ADDED CUSHIONING^ EASY ADJUSTABILITY^ REVOLUTIONARY CUSHIONING^ MORE DETAILS^ BEHIND THE DESIGN^ FLYKNIT ORIGINS')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (20, N'NKHDB-BLK', N'A mesh upper optimises airflow in this remix of iconic ''90s styles. The Nike Air Huarache Drift Breathe Men''s Shoe blends inspiration from icons like the Huarache Run, Huarache Racer and Huarache International.^ Mesh upper for lightweight breathability
Contoured foam midsole features Air-Sole cushioning
Rubber outsole provides durability and traction
Includes an extra pair of laces
Colour Shown: Racer Blue/Black/Total Crimson/Racer Blue
Style: AO1133-400
Country/Region of Origin: Vietnam', N'CT1.jpg;CT2.jpg;CT3.jpg', N'LIGHTWEIGHT BREATHABILITY^ Benefits')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (21, N'JD14R-SD', N'The Air Jordan 14 Retro Men''s Shoe combines class and comfort with a premium look and Nike Air cushioning.', N'CT1.jpg;CT2.jpg;CT3.jpg;', N'ICONIC SINCE 9888')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (25, N'PA2', N'', N'', N'PALLABROUSE')
SET IDENTITY_INSERT [dbo].[CTSP] OFF
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD1', N'NMD_Racer Primeknit Shoes Pink^', N'2^', N'35^', N'180.0^', N'Nguyễn Trọng Tín', N'07889988121', N'Hà Nội', N'ADNMDRPS-PNK^', N'cc@gmail.com', N'Payed', CAST(0x0000A91800000000 AS DateTime), N'COD       ', N'Xuất', 180)
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD11', N'Air Jordan 13 Retro Black^Stan Smith Shoes White^', N'1^2^', N'36^37^', N'170.0^150.0^', N'Angela', N'01223456123', N'Mỹ Tho', N'JD13R-BLK^ADSMS-WH^', N'visible.mask@gmail.com', N'In Process', CAST(0x0000A92B00000000 AS DateTime), N'COD       ', N'Xuất', 320)
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD2', N'Jordan Spizike Dark Blue^', N'2^', N'36^', N'280.0^', N'Đỗ Quang Khôi', N'07889988111', N'Tân Phú', N'JDS-DBLU^', N'khoi@gmail.com', N'Payed', CAST(0x0000A91800000000 AS DateTime), N'COD       ', N'Xuất', 280)
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD3', N'NMD_CS2 Primeknit Shoes Black^', N'1^', N'35^', N'150.0^', N'Nguyễn Vũ Hòa', N'01866688892', N'Trại rắn Đồng Tâm', N'ADNMD-CS2PS-BLK^', N'hoacodon@gmail.com', N'Done', CAST(0x0000A92600000000 AS DateTime), N'COD       ', N'Xuất', 150)
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD4', N'Nike Air Max 270 Blue^Nike Air Max 270 Blue^NMD_R1 Shoes Green^', N'1^1^1^', N'35^37^36^', N'150.0^150.0^130.0^', N'Visible', N'01688668503', N'Gò vấp', N'NKAM270-BLU^NKAM270-BLU^ADNMD-R1S-GRN^', N'mask@gmail.com', N'Payed', CAST(0x0000A92600000000 AS DateTime), N'COD       ', N'Xuất', 430)
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD5', N'NMD_Racer Primeknit Shoes Pink^NMD_R1 Shoes Green^', N'2^1^', N'35^37^', N'40.0^130.0^', N'Tèo', N'01699668503', N'Nguyễn Hồng Đào', N'ADNMDRPS-PNK^ADNMD-R1S-GRN^', N'tintaoton@gmail.com', N'In Process', CAST(0x0000A92900000000 AS DateTime), N'COD       ', N'Xuất', 170)
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD8', N'Air Jordan 13 Retro Black^NMD_R1 Shoes Green^', N'1^1^', N'35^37^', N'170.0^130.0^', N'Phạm Băng Băng', N'0198866778 ', N'Nguyễn Tri Phương', N'JD13R-BLK^ADNMD-R1S-GRN^', N'visible.mask@gmail.com', N'In Process', CAST(0x0000A92C00000000 AS DateTime), N'COD       ', N'Xuất', 300)
INSERT [dbo].[HoaDon] ([IDHD], [tenSP], [SL], [Size], [Gia], [tenKH], [SDT], [diaChi], [idSP], [Email], [trangThai], [ngay], [hinhThucTT], [loaiHD], [tongTien]) VALUES (N'HD9', N'Nike Air VaporMax Flyknit Utility Grey^UltraBoost Clima Shoes Black^', N'1^1^', N'37^38^', N'225.0^220.0^', N'Yasuo', N'0908786543 ', N'Long An', N'NKAVMFU-GR^ADUBCS-BLK^', N'tinntps05163@fpt.edu.vn', N'In Process', CAST(0x0000A92B00000000 AS DateTime), N'COD       ', N'Xuất', 445)
SET IDENTITY_INSERT [dbo].[Kho] ON 

INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (1, N'ADNMD-CS2PS-BLK', N'11;15;14;16;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (2, N'ADNMD-R1S-GRN', N'12;10;14;11;8;6;9;', N'35;36;37;38;39;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (3, N'ADNMDRPS-PNK', N'6;12;10;', N'35;36;37;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (4, N'ADSBS-BLK', N'15;14;12;11;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (5, N'ADSMS-WH', N'13;15;17;21;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (6, N'ADUBCS-BLK', N'14;15;14;11;13;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (7, N'ADUBUS-BLK', N'9;11;10;13;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (8, N'ADXRCUBA-TS-GR', N'12;16;', N'35;36;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (9, N'JD13R-BLK', N'15;17;19;21;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (10, N'JD14R-SD', N'13;10;14;', N'35;36;37;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (11, N'JDFE23-RD', N'18;15;16;12;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (12, N'JDS-DBLU', N'17;17;', N'35;36;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (13, N'JDTLXH-PLA', N'15;17;12;', N'35;36;37;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (14, N'JDXXXII-BLK-WH', N'11;13;15;', N'35;36;37;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (15, N'NKAM270-BLU', N'10;12;12;16;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (16, N'NKAM270F-WH-BLU', N'14;17;', N'35;36;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (17, N'NKAM95SB-BRW', N'17;18;13;12;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (18, N'NKAM97-BLK', N'19;16;', N'35;36;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (19, N'NKAVMFU-GR', N'13;14;13;15;', N'35;36;37;38;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (20, N'NKHDB-BLK', N'16;17;11;', N'35;36;37;')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (22, N'PA2', N'12;14;', N'35;36;')
SET IDENTITY_INSERT [dbo].[Kho] OFF
INSERT [dbo].[Loai] ([IDLoai], [tenLoai]) VALUES (N'AD', N'Adidas')
INSERT [dbo].[Loai] ([IDLoai], [tenLoai]) VALUES (N'JD', N'Jordan')
INSERT [dbo].[Loai] ([IDLoai], [tenLoai]) VALUES (N'NK', N'Nike')
INSERT [dbo].[Loai] ([IDLoai], [tenLoai]) VALUES (N'PA', N'Palladium')
INSERT [dbo].[NhanVien] ([username], [password], [isAdmin], [info], [img]) VALUES (N' sa', N'123', 0, N' Chicken', N'1.PNG')
INSERT [dbo].[NhanVien] ([username], [password], [isAdmin], [info], [img]) VALUES (N'admin', N'admin', 1, N'Oppa', N't2.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADNMD-CS2PS-BLK', N'NMD_CS2 Primeknit Shoes Black', 0, 150, NULL, N'AD', N'The meeting point of adidas heritage and adidas innovation, NMD leads 3-Stripes into the future. These slip-on shoes combine an ultra-lightweight sock-like upper with a responsive cushioned midsole.   Minimalist knit adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Distinctive Boost midsole Boost is our most responsive cushioning ever  Signature NMD details A signature heel pull plus an EVA midsole plug', N'1.jpg;2.jpg;3.jpg;', NULL)
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADNMD-R1S-GRN', N'NMD_R1 Shoes Green', 0, 130, NULL, N'AD', N'A pioneer of contemporary street style, NMD is futuristic and fearless. Taking design cues from technical outerwear, these shoes seamlessly blend adidas heritage with the latest innovations. They feature a sock-like knit upper riding on responsive Boost cushioning for a light, fast feel.  Distinctive Boost midsole  Boost is our most responsive cushioning ever  Signature NMD details A signature heel pull plus EVA midsole plugs', N'1.jpg;2.jpg;3.jpg;', N'https://i.imgur.com/TbaLLQk.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADNMDRPS-PNK', N'NMD_Racer Primeknit Shoes Pink', 20, 180, NULL, N'AD', N'Progressive, premium, pioneering. NMD blends pure adidas heritage with advanced materials for futuristic style that resonates on the streets. These shoes have a sock-like adidas Primeknit upper that follows the shape of your foot for a snug, adaptive fit. ', N'1.jpg;2.jpg;3.jpg;', N'https://i.imgur.com/5CxVWRk.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADSBS-BLK', N'SolarBoost Shoes Black', 0, 160, NULL, N'AD', N'These versatile running shoes are designed for comfort that goes the distance. They have an upper that hugs your foot in compressive support, and a flexible outsole that adapts to your unique foot strike.  Runner type Neutral shoes for the long distance runner  Energy return Boost is our most responsive cushioning ever: The more energy you give, the more you get  Precision support  Tailored Fiber Placement offers stitched-in reinforcement for targeted support at the midfoot  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Heel-to-toe stability Solar Propulsion Rail helps guide and propel the foot; Torsion System between the heel and forefoot for a stable ride', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/qvi3H9R.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADSMS-WH', N'Stan Smith Shoes White', 0, 75, NULL, N'AD', N'Back in the day, Stan Smith won big on the tennis court. The shoe that bears his name has been winning on the streets ever since. Top to bottom, these shoes capture the essential style of the 1972 original, with the artful leather build, low-profile cupsole and clean trim that have always been its hallmark.', N'1.jpg;2.jpg;3.jpg;', N'https://i.imgur.com/iAvRL66.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADUBCS-BLK', N'UltraBoost Clima Shoes Black', 0, 220, NULL, N'AD', N'These running shoes are designed to keep you performing at your best in the heat. They''re made with a breathable, open-weave knit upper that features sweat-wicking yarn. A knit-in midfoot cage offers support, and a heel counter allows your Achilles to move freely.   Runner type Neutral shoes for the ultimate running experience  Enhanced breathability adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort; Clima yarns wick moisture away to help keep feet cool and dry  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/ND6Siwl.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADUBUS-BLK', N'UltraBoost Uncaged Shoes Black', 0, 180, NULL, N'AD', N'These running shoes have a simplified design to give you a feeling of free and unrestricted movement. The shoes are built with an internally reinforced knit upper for a supportive fit. The responsive midsole and flexible outsole deliver a smooth and comfortable ride. Runner type Neutral shoes for the ultimate running experience Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort ', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/3TFpnL0.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'ADXRCUBA-TS-GR', N'Adidas X Reigning Champ UltraBoost All-Terrain Shoes', 0, 240, NULL, N'AD', N'Explore paths less traveled in these all-terrain running shoes designed in collaboration with Canadian label Reigning Champ. A water-repellent coating and high ankle collar give you an edge over the elements, and an integrated cage and molded heel counter secure a locked-down fit. Responsive cushioning delivers a burst of energy with every push-off and touchdown.  Runner type Neutral shoes for the ultimate runner  Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/N6vm9oS.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'JD13R-BLK', N'Air Jordan 13 Retro Black', 170, 190, NULL, N'JD', N'The Air Jordan 13 Retro Men''s Shoe celebrates the original with court-inspired cushioning and classic design details. ', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/NTrCKZK.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'JD14R-SD', N'Air Jordan 14 Retro Sand', 0, 190, NULL, N'JD', N'The Air Jordan 14 Retro Men''s Shoe combines class and comfort with a premium look and Nike Air cushioning.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/7awqtdY.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'JDFE23-RD', N'Jordan Flyknit Elevation 23 Red', 0, 170, NULL, N'JD', N'The Jordan Flyknit Elevation 23 Men''s Shoe combines a premium Flyknit constructed upper with Air cushioning for dynamic  comfort.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/ES8Gyhq.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'JDS-DBLU', N'Jordan Spizike Dark Blue', 140, 175, NULL, N'JD', N'The Jordan Spizike Men''s Shoe is inspired by a legendary line-up, including the Jordan III, IV, V and VI. Elephant print trim, grid mesh panels, dual Nike Air units and other iconic Jordan elements come together for a sleek look that honors Spike Lee and a famous Hollywood/hoops pairing.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/Y9LmW8Y.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'JDTLXH-PLA', N'Jordan Trunner LX High Platinum', 106, 130, NULL, N'JD', N'The Jordan Trunner LX High Men''s Shoe features adjustable straps and lightweight foam cushioning for a comfortable feel.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/VAdrSFC.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'JDXXXII-BLK-WH', N'Air Jordan XXXII Black White', 0, 185, NULL, N'JD', N'Free standard shipping and 30-day free returns, only with NikePlus. Exclusions apply.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/A5dHbBx.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'NKAM270-BLU', N'Nike Air Max 270 Blue', 0, 150, NULL, N'NK', N'The Nike Air Max 270 Men''s Shoe is inspired by two icons of big Air: the Air Max 180 and Air Max 93. It features Nike’s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/QMa0MEN.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'NKAM270F-WH-BLU', N'Nike Air Max 270 Flyknit White Blue', 0, 170, NULL, N'NK', N'Feel the Air, both above and below, with the Nike Air Max 270 Flyknit Men''s Shoe. It features Nike’s biggest heel Air unit yet, plus an ultra-breathable Flyknit upper that helps keep you cool when the temperatures rise. Classic color combinations nod to iconic Air Max models of the past, delivering a modern, streamlined look that''s rooted in Nike sneaker heritage.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/njN43gw.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'NKAM95SB-BRW', N'Nike Air Max 95 SneakerBoot Brown', 120, 200, NULL, N'NK', N'The Nike Air Max 95 SneakerBoot Men''s Boot updates the iconic ''90s runner for cold-weather comfort with warm, water-resistant materials, aggressive traction and reflective details that shine in low light.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/AoYGDuG.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'NKAM97-BLK', N'Nike Air Max 97 Black', 0, 160, NULL, N'NK', N'The Nike Air Max 97 Men''s Shoe keeps the sneaker favorite going strong with the same design details that made it famous: water-ripple lines, reflective piping and full-length Max Air cushioning.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/lcnnYDG.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'NKAVMFU-GR', N'Nike Air VaporMax Flyknit Utility Grey', 0, 225, NULL, N'NK', N'The Nike Air VaporMax Flyknit Utility Running Shoe puts function at the forefront. A functional design makes it easier and faster to lace up, while the mid-height collar hugs your ankle for total comfort. Building on the original, this take features added cushioning between your foot and the innovative VaporMax cushioning. It''s a bold look for a quick run.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/PG3T2sn.jpg?1')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'NKHDB-BLK', N'Nike Air Huarache Drift Breathe Black', 0, 130, NULL, N'NK', N'A mesh upper optimizes airflow in this remix of iconic ‘90s styles. The Nike Air Huarache Drift Breathe Men''s Shoe blends inspiration from icons like the Huarache Run, Huarache Racer and Huarache International.', N'1.jpg;2.jpg;3.jpg', N'https://i.imgur.com/0Hl8QQR.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP], [hinhDaiDien]) VALUES (N'PA2', N'PALLABROUSE', 0, 125, NULL, N'PA', N'Benefits.', N'1.jpg;2.jpg;3.jpg;', NULL)
ALTER TABLE [dbo].[CTSP]  WITH CHECK ADD  CONSTRAINT [FK_CTSP_SanPham] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([IDSP])
GO
ALTER TABLE [dbo].[CTSP] CHECK CONSTRAINT [FK_CTSP_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([IDLoai])
REFERENCES [dbo].[Loai] ([IDLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
USE [master]
GO
ALTER DATABASE [Ass] SET  READ_WRITE 
GO

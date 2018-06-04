USE [master]
GO
/****** Object:  Database [Ass]    Script Date: 6/4/2018 6:20:37 PM ******/
CREATE DATABASE [Ass]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ass.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ass_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Ass_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Comment]    Script Date: 6/4/2018 6:20:38 PM ******/
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
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 6/4/2018 6:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTHD](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[IDHD] [varchar](50) NULL,
	[TenSP] [nchar](10) NULL,
	[SL] [int] NULL,
	[Size] [varchar](100) NULL,
	[Gia] [int] NULL,
	[TenKH] [nvarchar](200) NULL,
	[SDT] [nchar](10) NULL,
	[DiaChi] [nchar](10) NULL,
	[Email] [ntext] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTSP]    Script Date: 6/4/2018 6:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTSP](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[IDSP] [varchar](50) NULL,
	[MoTaCT] [ntext] NULL,
	[HinhCTSP] [ntext] NULL,
 CONSTRAINT [PK_CTSP] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/4/2018 6:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHD] [varchar](50) NOT NULL,
	[LoaiHD] [nvarchar](100) NULL,
	[Ngay] [date] NULL,
	[HinhThucTT] [nchar](10) NULL,
	[IDSP] [varchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[IDHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 6/4/2018 6:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kho](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[IDSP] [varchar](50) NULL,
	[SL] [int] NULL,
	[Size] [varchar](50) NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 6/4/2018 6:20:38 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/4/2018 6:20:38 PM ******/
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
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/4/2018 6:20:38 PM ******/
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
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 6/4/2018 6:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKe](
	[STT] [nchar](10) NOT NULL,
	[IDHD] [nchar](10) NULL,
	[LoaiHD] [nchar](10) NULL,
	[Ngay] [nchar](10) NULL,
	[HinhThucTT] [nchar](10) NULL,
	[TenSP] [nchar](10) NULL,
	[SL] [nchar](10) NULL,
	[Size] [nchar](10) NULL,
	[Gia] [nchar](10) NULL,
	[TenKH] [nchar](10) NULL,
	[SDT] [nchar](10) NULL,
 CONSTRAINT [PK_ThongKe] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (1, N'abc', N'Hello', N'NKAVMFU-GR', N'kienit238@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (2, N'Visible', N'Very Good, beautiful.', N'NKAVMFU-GR', N'visible.mask@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (3, N'Tin', N'HiHi', N'NKAVMFU-GR', N'tin@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (4, N'Khoi', N'Very Bad.', N'JD13R-BLK', N'khoi@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (5, N'Khánh', N'No, You are beautiful.', N'JD13R-BLK', N'khanh@gmail.com', CAST(0x0000A8F3008EB2DC AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (6, N'Tin', N'Wow, fuck you.', N'JD14R-SD', N'tin@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (7, N'Khoi', N'Fuck you.', N'ADNMDRPS-PNK', N'khoi@gmail.com', CAST(0x0000A8F50013527C AS DateTime), N'user.png')
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[CTSP] ON 

INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (1, N'ADNMD-CS2PS-BLK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (2, N'ADNMD-R1S-GRN', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (3, N'ADNMDRPS-PNK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (4, N'ADSBS-BLK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (5, N'ADSMS-WH', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (6, N'ADUBCS-BLK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (7, N'ADUBUS-BLK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (8, N'ADXRCUBA-TS-GR', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (9, N'JD13R-BLK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (10, N'JD14R-SD', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (11, N'JDFE23-RD', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (12, N'JDS-DBLU', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (13, N'JDTLXH-PLA', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (14, N'JDXXXII-BLK-WH', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (15, N'NKAM270-BLU', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (16, N'NKAM270F-WH-BLU', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (17, N'NKAM95SB-BRW', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (18, N'NKAM97-BLK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (19, N'NKAVMFU-GR', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
INSERT [dbo].[CTSP] ([STT], [IDSP], [MoTaCT], [HinhCTSP]) VALUES (20, N'NKHDB-BLK', NULL, N'CT1.jpg;CT2.jpg;CT3.jpg')
SET IDENTITY_INSERT [dbo].[CTSP] OFF
SET IDENTITY_INSERT [dbo].[Kho] ON 

INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (1, N'ADNMD-CS2PS-BLK', 10, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (2, N'ADNMD-R1S-GRN', 12, N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (3, N'ADNMDRPS-PNK', 8, N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (4, N'ADSBS-BLK', 16, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (5, N'ADSMS-WH', 13, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (6, N'ADUBCS-BLK', 14, N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (7, N'ADUBUS-BLK', 9, N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (8, N'ADXRCUBA-TS-GR', 12, N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (9, N'JD13R-BLK', 15, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (10, N'JD14R-SD', 13, N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (11, N'JDFE23-RD', 18, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (12, N'JDS-DBLU', 17, N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (13, N'JDTLXH-PLA', 15, N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (14, N'JDXXXII-BLK-WH', 11, N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (15, N'NKAM270-BLU', 10, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (16, N'NKAM270F-WH-BLU', 14, N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (17, N'NKAM95SB-BRW', 17, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (18, N'NKAM97-BLK', 19, N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (19, N'NKAVMFU-GR', 13, N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (20, N'NKHDB-BLK', 16, N'35;36;37')
SET IDENTITY_INSERT [dbo].[Kho] OFF
INSERT [dbo].[Loai] ([IDLoai], [tenLoai]) VALUES (N'AD', N'Adidas')
INSERT [dbo].[Loai] ([IDLoai], [tenLoai]) VALUES (N'JD', N'Jordan')
INSERT [dbo].[Loai] ([IDLoai], [tenLoai]) VALUES (N'NK', N'Nike')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADNMD-CS2PS-BLK', N'NMD_CS2 Primeknit Shoes Black', 0, 190, NULL, N'AD', N'The meeting point of adidas heritage and adidas innovation, NMD leads 3-Stripes into the future. These slip-on shoes combine an ultra-lightweight sock-like upper with a responsive cushioned midsole.   Minimalist knit adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Distinctive Boost midsole Boost is our most responsive cushioning ever  Signature NMD details A signature heel pull plus an EVA midsole plug', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADNMD-R1S-GRN', N'NMD_R1 Shoes Green', 0, 130, NULL, N'AD', N'A pioneer of contemporary street style, NMD is futuristic and fearless. Taking design cues from technical outerwear, these shoes seamlessly blend adidas heritage with the latest innovations. They feature a sock-like knit upper riding on responsive Boost cushioning for a light, fast feel.  Distinctive Boost midsole  Boost is our most responsive cushioning ever  Signature NMD details A signature heel pull plus EVA midsole plugs', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADNMDRPS-PNK', N'NMD_Racer Primeknit Shoes Pink', 0, 180, NULL, N'AD', N'Progressive, premium, pioneering. NMD blends pure adidas heritage with advanced materials for futuristic style that resonates on the streets. These shoes have a sock-like adidas Primeknit upper that follows the shape of your foot for a snug, adaptive fit. The responsive Boost midsole features multicolored Quickstrike inserts for lightweight flexibility.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADSBS-BLK', N'SolarBoost Shoes Black', 0, 160, NULL, N'AD', N'These versatile running shoes are designed for comfort that goes the distance. They have an upper that hugs your foot in compressive support, and a flexible outsole that adapts to your unique foot strike.  Runner type Neutral shoes for the long distance runner  Energy return Boost is our most responsive cushioning ever: The more energy you give, the more you get  Precision support  Tailored Fiber Placement offers stitched-in reinforcement for targeted support at the midfoot  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Heel-to-toe stability Solar Propulsion Rail helps guide and propel the foot; Torsion System between the heel and forefoot for a stable ride', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADSMS-WH', N'Stan Smith Shoes White', 0, 75, NULL, N'AD', N'Back in the day, Stan Smith won big on the tennis court. The shoe that bears his name has been winning on the streets ever since. Top to bottom, these shoes capture the essential style of the 1972 original, with the artful leather build, low-profile cupsole and clean trim that have always been its hallmark.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADUBCS-BLK', N'UltraBoost Clima Shoes Black', 0, 220, NULL, N'AD', N'These running shoes are designed to keep you performing at your best in the heat. They''re made with a breathable, open-weave knit upper that features sweat-wicking yarn. A knit-in midfoot cage offers support, and a heel counter allows your Achilles to move freely.   Runner type Neutral shoes for the ultimate running experience  Enhanced breathability adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort; Clima yarns wick moisture away to help keep feet cool and dry  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADUBUS-BLK', N'UltraBoost Uncaged Shoes Black', 0, 180, NULL, N'AD', N'These running shoes have a simplified design to give you a feeling of free and unrestricted movement. The shoes are built with an internally reinforced knit upper for a supportive fit. The responsive midsole and flexible outsole deliver a smooth and comfortable ride. Runner type Neutral shoes for the ultimate running experience Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort ', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'ADXRCUBA-TS-GR', N'Adidas X Reigning Champ UltraBoost All-Terrain Shoes', 0, 240, NULL, N'AD', N'Explore paths less traveled in these all-terrain running shoes designed in collaboration with Canadian label Reigning Champ. A water-repellent coating and high ankle collar give you an edge over the elements, and an integrated cage and molded heel counter secure a locked-down fit. Responsive cushioning delivers a burst of energy with every push-off and touchdown.  Runner type Neutral shoes for the ultimate runner  Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'JD13R-BLK', N'Air Jordan 13 Retro Black', 170, 190, NULL, N'JD', N'The Air Jordan 13 Retro Men''s Shoe celebrates the original with court-inspired cushioning and classic design details. ', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'JD14R-SD', N'Air Jordan 14 Retro Sand', 0, 190, NULL, N'JD', N'The Air Jordan 14 Retro Men''s Shoe combines class and comfort with a premium look and Nike Air cushioning.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'JDFE23-RD', N'Jordan Flyknit Elevation 23 Red', 0, 170, NULL, N'JD', N'The Jordan Flyknit Elevation 23 Men''s Shoe combines a premium Flyknit constructed upper with Air cushioning for dynamic  comfort.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'JDS-DBLU', N'Jordan Spizike Dark Blue', 140, 175, NULL, N'JD', N'The Jordan Spizike Men''s Shoe is inspired by a legendary line-up, including the Jordan III, IV, V and VI. Elephant print trim, grid mesh panels, dual Nike Air units and other iconic Jordan elements come together for a sleek look that honors Spike Lee and a famous Hollywood/hoops pairing.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'JDTLXH-PLA', N'Jordan Trunner LX High Platinum', 106, 130, NULL, N'JD', N'The Jordan Trunner LX High Men''s Shoe features adjustable straps and lightweight foam cushioning for a comfortable feel.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'JDXXXII-BLK-WH', N'Air Jordan XXXII Black White', 0, 185, NULL, N'JD', N'Free standard shipping and 30-day free returns, only with NikePlus. Exclusions apply.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'NKAM270-BLU', N'Nike Air Max 270 Blue', 0, 150, NULL, N'NK', N'The Nike Air Max 270 Men''s Shoe is inspired by two icons of big Air: the Air Max 180 and Air Max 93. It features Nike’s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'NKAM270F-WH-BLU', N'Nike Air Max 270 Flyknit White Blue', 0, 170, NULL, N'NK', N'Feel the Air, both above and below, with the Nike Air Max 270 Flyknit Men''s Shoe. It features Nike’s biggest heel Air unit yet, plus an ultra-breathable Flyknit upper that helps keep you cool when the temperatures rise. Classic color combinations nod to iconic Air Max models of the past, delivering a modern, streamlined look that''s rooted in Nike sneaker heritage.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'NKAM95SB-BRW', N'Nike Air Max 95 SneakerBoot Brown', 120, 200, NULL, N'NK', N'The Nike Air Max 95 SneakerBoot Men''s Boot updates the iconic ''90s runner for cold-weather comfort with warm, water-resistant materials, aggressive traction and reflective details that shine in low light.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'NKAM97-BLK', N'Nike Air Max 97 Black', 0, 160, NULL, N'NK', N'The Nike Air Max 97 Men''s Shoe keeps the sneaker favorite going strong with the same design details that made it famous: water-ripple lines, reflective piping and full-length Max Air cushioning.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'NKAVMFU-GR', N'Nike Air VaporMax Flyknit Utility Grey', 0, 225, NULL, N'NK', N'The Nike Air VaporMax Flyknit Utility Running Shoe puts function at the forefront. A functional design makes it easier and faster to lace up, while the mid-height collar hugs your ankle for total comfort. Building on the original, this take features added cushioning between your foot and the innovative VaporMax cushioning. It''s a bold look for a quick run.', N'1.jpg;2.jpg;3.jpg')
INSERT [dbo].[SanPham] ([IDSP], [TenSP], [GiaSPKM], [GiaSP], [isHot], [IDLoai], [MoTa], [HinhSP]) VALUES (N'NKHDB-BLK', N'Nike Air Huarache Drift Breathe Black', 0, 130, NULL, N'NK', N'A mesh upper optimizes airflow in this remix of iconic ‘90s styles. The Nike Air Huarache Drift Breathe Men''s Shoe blends inspiration from icons like the Huarache Run, Huarache Racer and Huarache International.', N'1.jpg;2.jpg;3.jpg')
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HoaDon] FOREIGN KEY([IDHD])
REFERENCES [dbo].[HoaDon] ([IDHD])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HoaDon]
GO
ALTER TABLE [dbo].[CTSP]  WITH CHECK ADD  CONSTRAINT [FK_CTSP_SanPham] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([IDSP])
GO
ALTER TABLE [dbo].[CTSP] CHECK CONSTRAINT [FK_CTSP_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_SanPham] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([IDSP])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_SanPham]
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

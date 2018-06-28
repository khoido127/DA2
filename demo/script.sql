USE [master]
GO
/****** Object:  Database [Ass]    Script Date: 6/28/2018 5:59:49 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 6/28/2018 5:59:49 PM ******/
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
/****** Object:  Table [dbo].[CTHD]    Script Date: 6/28/2018 5:59:49 PM ******/
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
	[SL] [varchar](100) NULL,
	[Size] [varchar](100) NULL,
	[Gia] [varchar](200) NULL,
	[TenKH] [nvarchar](200) NULL,
	[SDT] [nchar](10) NULL,
	[DiaChi] [nchar](10) NULL,
	[IDSP] [varchar](50) NULL,
	[Email] [ntext] NULL,
	[TrangThai] [nchar](10) NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTSP]    Script Date: 6/28/2018 5:59:49 PM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/28/2018 5:59:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHD] [varchar](50) NOT NULL,
	[Ngay] [date] NULL,
	[HinhThucTT] [nchar](10) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[IDHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 6/28/2018 5:59:49 PM ******/
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
/****** Object:  Table [dbo].[Loai]    Script Date: 6/28/2018 5:59:49 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/28/2018 5:59:49 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/28/2018 5:59:49 PM ******/
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
/****** Object:  Table [dbo].[ThongKe]    Script Date: 6/28/2018 5:59:49 PM ******/
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

INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (1, N'abc', N'Hello', N'NKAVMFU-GR', N'kienit238@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (2, N'Visible', N'Very Good, beautiful.', N'NKAVMFU-GR', N'visible.mask@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (3, N'Tin', N'HiHi', N'NKAVMFU-GR', N'tin@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (4, N'Khoi', N'Very Bad.', N'JD13R-BLK', N'khoi@gmail.com', CAST(0x0000A8F300000000 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (5, N'Khánh', N'No, You are beautiful.', N'JD13R-BLK', N'khanh@gmail.com', CAST(0x0000A8F3008EB2DC AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (6, N'Tin', N'Wow, fuck you.', N'JD14R-SD', N'tin@gmail.com', CAST(0x0000A8F400A8FF48 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (7, N'Khoi', N'Fuck you.', N'ADNMDRPS-PNK', N'khoi@gmail.com', CAST(0x0000A8F50013527C AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (8, N'abc', N'Hello.', N'NKAM270F-WH-BLU', N'cc@gmail.com', CAST(0x0000A9040082F2A8 AS DateTime), N'user.png')
INSERT [dbo].[Comment] ([STT], [TenKH], [moTa], [IDSP], [Email], [NgayCM], [URL]) VALUES (9, N'khoi', N'You are great.', N'ADNMD-CS2PS-BLK', N'khoi@gmail.com', CAST(0x0000A90A0065769C AS DateTime), N'user.png')
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[CTSP] ON 

INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (1, N'ADNMD-CS2PS-BLK', N'The meeting point of adidas heritage and adidas innovation, NMD leads 3-Stripes into the future. These slip-on shoes combine an ultra-lightweight sock-like upper with 
a responsive cushioned midsole.   Minimalist knit adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Distinctive Boost midsole Boost is 
our most responsive cushioning ever  Signature NMD details A signature heel pull plus an EVA midsole plug ^ A MODERN SLIP-ON SNEAKER WITH INNOVATIVE STYLE.^ The 
meeting point of adidas heritage and adidas innovation, NMD leads 3-Stripes into the future. These slip-on shoes combine an ultra-lightweight sock-like upper with a 
responsive cushioned midsole.   Minimalist knit adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Distinctive Boost midsole Boost is 
our most responsive cushioning ever  Signature NMD details A signature heel pull plus an EVA midsole plug ^ A MODERN SLIP-ON SNEAKER WITH INNOVATIVE STYLE.^ The 
meeting point of adidas heritage and adidas innovation, NMD leads 3-Stripes into the future. These slip-on shoes combine an ultra-lightweight sock-like upper with a 
responsive cushioned midsole.   Minimalist knit adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Distinctive Boost midsole Boost is 
our most responsive cushioning ever  Signature NMD details A signature heel pull plus an EVA midsole plug ', N'CT1.jpg;CT2.jpg;CT3.jpg;CT2.jpg', N'A MODERN SLIP-ON SNEAKER WITH INNOVATIVE STYLE.; A MODERN SLIP-ON SNEAKER WITH INNOVATIVE STYLE.;A MODERN SLIP-ON SNEAKER WITH INNOVATIVE STYLE.')
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (2, N'ADNMD-R1S-GRN', N'NMD_R1 SHOES^ KNIT STREETWEAR SNEAKERS MADE WITH BOOST.^ A pioneer of contemporary street style, NMD is futuristic and fearless. The sock-like design of these shoes gives them a close, contoured fit. With Boost for soft yet responsive cushioning.   Distinctive Boost midsole  Boost is our most responsive cushioning ever  Signature NMD details A signature heel pull plus EVA midsole plugs ', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (3, N'ADNMDRPS-PNK', N'NMD_RACER PRIMEKNIT SHOES^ A RACING-INSPIRED NMD THAT''''S FASTER AND SLEEKER THAN EVER BEFORE.^ Progressive, premium, pioneering. NMD blends pure adidas heritage with advanced materials for futuristic style that resonates on the streets. These shoes have a sock-like adidas Primeknit upper that follows the shape of your foot for a snug, adaptive fit. The responsive Boost midsole features multicolored Quickstrike inserts for lightweight flexibility.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (4, N'ADSBS-BLK', N'SOLARBOOST SHOES^ A GO-TO SHOE DESIGNED FOR LONG DISTANCES.^ These versatile running shoes are designed for comfort that goes the distance. They have an upper that hugs your foot in compressive support, and a flexible outsole that adapts to your unique foot strike.  Runner type Neutral shoes for the long distance runner  Energy return Boost is our most responsive cushioning ever: The more energy you give, the more you get  Precision support  Tailored Fiber Placement offers stitched-in reinforcement for targeted support at the midfoot  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Heel-to-toe stability Solar Propulsion Rail helps guide and propel the foot; Torsion System between the heel and forefoot for a stable ride', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (5, N'ADSMS-WH', N'STAN SMITH SHOES^ AN AUTHENTIC VERSION OF THE ICONIC 1972 TENNIS CLASSIC.^ Back in the day, Stan Smith won big on the tennis court. The shoe that bears his name has been winning on the streets ever since. Top to bottom, these shoes capture the essential style of the 1972 original, with the artful leather build, low-profile cupsole and clean trim that have always been its hallmark.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (6, N'ADUBCS-BLK', N'ULTRABOOST CLIMA SHOES^ LIGHTWEIGHT AND BREATHABLE SHOES MADE WITH MOISTURE-WICKING YARN.^ These running shoes are designed to keep you performing at your best in the heat. They''''re made with a breathable, open-weave knit upper that features sweat-wicking yarn. A knit-in midfoot cage offers support, and a heel counter allows your Achilles to move freely.   Runner type Neutral shoes for the ultimate running experience  Enhanced breathability adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort; Clima yarns wick moisture away to help keep feet cool and dry  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (7, N'ADUBUS-BLK', N'ULTRABOOST UNCAGED SHOES^ RUNNING SHOES WITH INTERNAL MIDFOOT SUPPORT FOR AN UNRESTRICTED STRIDE.^ These running shoes have a simplified design to give you a feeling of free and unrestricted movement. The shoes are built with an internally reinforced knit upper for a supportive fit. The responsive midsole and flexible outsole deliver a smooth and comfortable ride.   Runner type Neutral shoes for the ultimate running experience  Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Natural movement Fitcounter molded heel counter provides a natural fit that allows optimal movement of the Achilles  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction  Natural feel and support Aramis 3D motion capture system maps runners'''' movements to create a fit without pressure points or irritation', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (8, N'ADXRCUBA-TS-GR', N'ADIDAS X REIGNING CHAMP ULTRABOOST ALL-TERRAIN SHOES^ RESPONSIVE SHOES FOR A SMOOTH AND ENERGIZED RUN, MADE IN COLLABORATION WITH REIGNING CHAMP.^ Explore paths less traveled in these all-terrain running shoes designed in collaboration with Canadian label Reigning Champ. A water-repellent coating and high ankle collar give you an edge over the elements, and an integrated cage and molded heel counter secure a locked-down fit. Responsive cushioning delivers a burst of energy with every push-off and touchdown.  Runner type Neutral shoes for the ultimate runner  Lightweight comfort adidas Primeknit upper wraps the foot in adaptive support and ultralight comfort  Energized cushioning Boost is our most responsive cushioning ever: The more energy you give, the more you get  Reliable traction Stretchweb outsole flexes naturally for an energized ride, while Continental™ Rubber gives you superior traction', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (9, N'JD13R-BLK', N'RETRO AND REVERED^ The Air Jordan 13 Retro Low Older Kids'''' Shoe updates an icon with a lower profile, hoops-inspired cushioning and classic design details.^ Benefits^ Genuine leather, synthetic leather or textile upper depending on colour
Full-length Phylon midsole with Air-Sole unit for lightweight, responsive cushioning
Herringbone outsole pattern placed within several pods that simulate a panther''''s paw
Rubber outsole for traction and durability
Colour Shown: White/Pure Platinum/Metallic Silver/Metallic Silver
Style: 310811-100
Country/Region of Origin: Indonesia', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (10, N'JD14R-SD', N'ICONIC SINCE ''''98^ The Air Jordan 14 Retro Men''''s Shoe combines class and comfort with a premium look and Nike Air cushioning.^ 
BENEFITS^ 
Genuine and synthetic leather upper with EVA reinforcement for comfort and durability
One-piece internal shoe lining for a seamless fit
Phylon midsole with encapsulated Zoom Air sole delivers responsive cushioning
Herringbone-patterned rubber outsole for maximum traction
Country of Origin: China', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (11, N'JDFE23-RD', N'LIGHTWEIGHT COMFORT^ The Jordan Flyknit Elevation 23 Men''''s Shoe combines a premium Flyknit constructed upper with Air cushioning for dynamic comfort.^ Foot-hugging Flyknit is snug, lightweight and breathable
Air cushioning provides responsive impact protection
Durable rubber tread delivers excellent grip
Colour Shown: Black/Metallic Silver/Black
Style: AJ8207-010
Country/Region of Origin: China^ Flyknit Origins^ Nike Flyknit technology was inspired by feedback from runners craving a shoe with the snug (and virtually unnoticed) fit of a sock. Nike embarked on a four-year mission with teams of programmers, engineers and designers to create the technology needed to make the knit upper with static properties for structure and durability. Then the precise placement of support, flexibility and breathability—all in one layer—was refined. The result is a featherweight, form-fitting and virtually seamless upper. This unprecedented precision maximises performance while reducing the material waste of traditional cut and sew by an average of 60%. The equivalent of six recycled plastic bottles are used in every pair of Flyknit shoes, saving millions of kilos of material from reaching landfills.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (12, N'JDS-DBLU', N'Jordan Spizike Midnight Navy^ This Jordan Spiz''''ike is known as the "Midnight Navy" edition. Released for Holiday 2017, they come in a midnight navy, metallic silver and white colorway. Sporting a blue-based nubuck upper with white accents, small hits of silver and a grey outsole. Their release date was November 1st, 2017 where they were available at select Jordan Brand retailers worldwide. Retail was $175 for men and they also came in full-family sizing, running down to toddler. If you like blue kicks, these Jordan Spiz''''ike''''s are perfect for you. Looking to cop a pair? Hit up the marketplace and get your buy on. Have one to sell? List them online today.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (13, N'JDTLXH-PLA', N'Jordan Trunner LX High^ Jordan Brand brought back the Jordan Trunner LX training model from the early 2000s around the same time that they gave us a retro release of the Jordan 15 for the perfect wave of nostalgia during Mike’s return to the game of basketball as a Washington Wizard. Plenty of people have since slept on the model featuring a woven upper and unique straps, but if you’re a fan of the look then you already know about Travis Scott’s design and Drake’s OVO exclusive. Now Jordan Brand will be updating the training turned lifestyle offering with the introduction of the Jordan Trunner LX High featuring a near-identical ankle collar extension to the Presto Mids. What results is a look that reminds us of the retro Nike ACG days with the likes of the Mowabb. So far, three colorways have appeared in GS sizes and we expect more to come this Fall 2017 season.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (14, N'JDXXXII-BLK-WH', N'FLY ABOVE^ The Air Jordan XXXII Men''''s Basketball Shoe features light, breathable Flyknit fabric that wraps your foot like a sock, plus powerful cushioning that helps you explode off the hardwood.^ Lightweight Support^ Breathable Flyknit fabric offers areas of stretch and support where you need it most. It conforms to the shape of your foot for a comfortable, lightweight feel.^ Responsive Cushioning^ Low-profile Nike Zoom Air cushioning in the heel and forefoot provides lightweight responsiveness.^ Explosive Step^ Over the forefoot Nike Zoom Air, FlightSpeed technology distributes the compression of your force. This maximises responsiveness to give you an explosive step.^ More Details^ Laces integrate with the Flyknit fabric for comfortable support
Internal foam in the heel and collar for comfort
Solid rubber sole for durability and multi-surface traction
Colour Shown: Black/White/Wolf Grey/University Red
Style: AA1253-002
Country/Region of Origin: Vietnam', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (15, N'NKAM270-BLU', N'BIG AIR^ The Nike Air Max 270 Men''''s Shoe is inspired by two icons of big Air: the Air Max 180 and Air Max 93. It features Nike''''s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks.^ FLEXIBLE AND BREATHABLE^ The shoe''''s bootie construction feels snug and flexes with your foot. It''''s made with solid and mesh areas, giving you structure and ventilation where you need them most.^ SUPER-SOFT CUSHIONING^ A dual-density foam sole and large Max Air heel unit deliver plush cushioning for casual, everyday comfort.^ MORE DETAILS^ Knit upper with no-sew overlays for comfort and support
Asymmetrical lacing for a secure fit
Heel pull tab for easy on and off
Solid rubber outsole in the forefoot, clear rubber on the heel
Colour Shown: Racer Blue/Black/Hyper Crimson/Hyper Crimson
Style: AH8050-401
Country/Region of Origin: Vietnam', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (16, N'NKAM270F-WH-BLU', N'FEEL BIG AIR^ Feel the Air, both above and below, with the Nike Air Max 270 Flyknit Men''''s Shoe. It features Nike''''s biggest heel Air unit yet, plus an ultra-breathable Flyknit upper that helps keep you cool when the temperatures rise. Classic colour combinations nod to iconic Air Max models of the past, delivering a modern, streamlined look that''''s rooted in Nike sneaker heritage.^ AIR ABOVE^ The upper is made from Flyknit material, which wraps your foot for a snug, sock-like feel. It''''s lightweight and breathable, and gives you a comfortable combination of stretch and support.^ AIR BELOW^ A dual-density foam sole and large Max Air heel unit deliver plush cushioning for casual, everyday comfort.^ Benefits^ Foot-hugging Flyknit is snug, lightweight and breathable
Max Air cushioning provides maximum comfort upon impact
Durable rubber tread delivers excellent traction
Colour Shown: Black/White/Black
Style: AO1023-001
Country/Region of Origin: China^ Nike Air Max Origins^ Nike''''s revolutionary Air-Sole unit made its way into Nike footwear in 1978. In 1987, the Nike Air Max 1 debuted with visible air in its heel, allowing fans more than just the feel of Air-Sole comfort—suddenly they could see it. Since then, next-generation Nike Air Max shoes have become a hit with athletes and collectors by offering striking colour combinations and reliable, lightweight cushioning.^ Flyknit Origins^ Nike Flyknit technology was inspired by feedback from runners craving a shoe with the snug (and virtually unnoticed) fit of a sock. Nike embarked on a four-year mission with teams of programmers, engineers and designers to create the technology needed to make the knit upper with static properties for structure and durability. Then the precise placement of support, flexibility and breathability—all in one layer—was refined. The result is a featherweight, form-fitting and virtually seamless upper. This unprecedented precision maximises performance while reducing the material waste of traditional cut and sew by an average of 60%. The equivalent of six recycled plastic bottles are used in every pair of Flyknit shoes, saving millions of kilos of material from reaching landfills.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (17, N'NKAM95SB-BRW', N'The Nike Air Max 95 Sneakerboot^ Is said to be very sleek and stylish; in fact, a lot of wearers report getting a lot of compliments from friends and colleagues when they go out wearing this pair of kicks.^ According to several reviewers, this shoe is comfortable; some of them even say that this shoe is good for workouts.^ The Nike Air Max 95 Sneakerboot really serves its purpose because a lot of wearers report that this shoe is effective in keeping their feet warm during harsh winters.^ Some purchasers think that this model really is functionally both a sneaker and a boot, and these two functions are effectively integrated.^ Despite the bulky appearance, this pair of shoes is actually light according to some purchasers.^ Several buyers say that the Nike Air Max 95 Sneakerboot looks exactly like the way it appears in its online photos.^ There were a number of buyers who express their willingness to recommend this shoe to friends, colleagues, and family.^ Majority of those who left reviews gave the Nike Air Max 95 Sneakerboot high overall satisfaction scores.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (18, N'NKAM97-BLK', N'SLEEK COMFORT^ The Nike Air Max 97 shook up the running world with its revolutionary full-length Nike Air unit. The Nike Air Max 97 Ultra ''''17 Women''''s Shoe remasters the original design with a mesh and knit construction for a lighter feel and sleeker look.^ Product Features^ Mesh and knit upper
Foam sole with Max Air cushioning
Rubber outsole Reflective piping
Colour Shown: Metallic Mahogany/Summit White/Mahogany
Style: 917704-903
Country/Region of Origin: Vietnam^ Air Max 97 Origins^ Nike''''s revolutionary Air-Sole unit made its way into Nike footwear in 1978. In 1987, the Nike Air Max 1 debuted with visible air in its heel, allowing fans more than just the feel of Air-Sole comfort—suddenly they could see it. Two years after the Nike Air Max 95 brought Visible Air to the forefoot, the Nike Air Max 97 arrived with the very first full-length unit. The shoe made a huge splash in the running world, as anticipated by its ripple-effect design lines. It''''s still making waves over two decades later.', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (19, N'NKAVMFU-GR', N'AIR, UPGRADED.^ The Nike Air VaporMax Flyknit Utility Running Shoe puts function at the forefront. A functional design makes it easier and faster to lace up, while the mid-height collar hugs your ankle for total comfort. Building on the original, this take features added cushioning between your foot and the innovative VaporMax cushioning. It''''s a bold look for a quick run.^ ADDED CUSHIONING^ A full-length layer of foam between your foot and the VaporMax unit provides a softer and more supportive feel than the original. As you run, you still get the lightweight, bouncy feeling, but with more stability.^ EASY ADJUSTABILITY^ Two stretchy straps across the midfoot work with the laces to help keep your foot from shifting within the shoe. A toggle lets you quickly cinch and lock the laces, so you can adjust and go.^ REVOLUTIONARY CUSHIONING^ In conjunction with the foam, the latest innovation of Max Air cushioning helps protect against the impact of your foot landing as you run.^ MORE DETAILS^ Mid-cut Flyknit upper hugs the foot from ankle to toe for a light, sock-like feel
Loops on the collar help you pull the shoe onto your foot
Reflective details on the heel and sides help you stand out
Supportive overlap wraps the heel to help keep your foot stable
Rubber outsole sections on the heel and forefoot for durability
Offset: 10mm^ BEHIND THE DESIGN^ The Air VaporMax represents a new era in Nike innovation. "It''''s changed our whole philosophy on how we design for Air", says Cushioning Innovation Designer Zachary Elder. With the VaporMax, the designers wanted to truly capture the feeling of "running on air". The designers started by restructuring the Air unit so they could attach it directly to the upper. "That was the biggest challenge", says Tom Minami, Senior Footwear Designer—but it was worth it. "Without any midsole or sockliner, you get to feel the Air in a whole new way". In previous Air Max models, the goal was to fill the sole with as much Air as possible, but with the VaporMax, the focus is on using the Air efficiently. "As you step down, each lug gets pushed into the Air unit, ramping up the pressure", Elder explains. "As you step off, the pressure releases, creating that springy bounce". After the seven-year journey from ideation to release, Elder and Minami are excited for what''''s to come. "I''''m super-proud of the product", Elder says. "This new approach is going to be a huge turning point for Air – and for Nike".^ FLYKNIT ORIGINS^ Nike Flyknit technology was inspired by feedback from runners craving a shoe with the snug (and virtually unnoticed) fit of a sock. Nike embarked on a four-year mission with teams of programmers, engineers and designers to create the technology needed to make the knit upper with static properties for structure and durability. Then the precise placement of support, flexibility and breathability—all in one layer—was refined. The result is a featherweight, form-fitting and virtually seamless upper. This unprecedented precision maximises performance while reducing the material waste of traditional cut and sew by an average of 60%. The equivalent of six recycled plastic bottles are used in every pair of Flyknit shoes, saving millions of kilos of material from reaching landfills.^ Country of Origin: China, Vietnam', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
INSERT [dbo].[CTSP] ([STT], [IDSP], [motaCT], [HinhCTSP], [tieudeCTSP]) VALUES (20, N'NKHDB-BLK', N'LIGHTWEIGHT BREATHABILITY^ A mesh upper optimises airflow in this remix of iconic ''''90s styles. The Nike Air Huarache Drift Breathe Men''''s Shoe blends inspiration from icons like the Huarache Run, Huarache Racer and Huarache International.^ Benefits^ Mesh upper for lightweight breathability
Contoured foam midsole features Air-Sole cushioning
Rubber outsole provides durability and traction
Includes an extra pair of laces
Colour Shown: Racer Blue/Black/Total Crimson/Racer Blue
Style: AO1133-400
Country/Region of Origin: Vietnam', N'CT1.jpg;CT2.jpg;CT3.jpg', NULL)
SET IDENTITY_INSERT [dbo].[CTSP] OFF
SET IDENTITY_INSERT [dbo].[Kho] ON 

INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (1, N'ADNMD-CS2PS-BLK', N'10;12;14;16', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (2, N'ADNMD-R1S-GRN', N'12;15', N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (3, N'ADNMDRPS-PNK', N'8;12;10', N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (4, N'ADSBS-BLK', N'16;14;12;11', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (5, N'ADSMS-WH', N'13;15;17;21', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (6, N'ADUBCS-BLK', N'14;15;14', N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (7, N'ADUBUS-BLK', N'9;11;10', N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (8, N'ADXRCUBA-TS-GR', N'12;16', N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (9, N'JD13R-BLK', N'15;17;19;21', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (10, N'JD14R-SD', N'13;10;14', N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (11, N'JDFE23-RD', N'18;15;16;12', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (12, N'JDS-DBLU', N'17;19', N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (13, N'JDTLXH-PLA', N'15;17;12', N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (14, N'JDXXXII-BLK-WH', N'11;13;15', N'35;36;37')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (15, N'NKAM270-BLU', N'10;12;14;16', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (16, N'NKAM270F-WH-BLU', N'14;17', N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (17, N'NKAM95SB-BRW', N'17;18;13;12', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (18, N'NKAM97-BLK', N'19;16', N'35;36')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (19, N'NKAVMFU-GR', N'13;14;13;15', N'35;36;37;38')
INSERT [dbo].[Kho] ([STT], [IDSP], [SL], [Size]) VALUES (20, N'NKHDB-BLK', N'16;17;11', N'35;36;37')
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
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_SanPham] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([IDSP])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_SanPham]
GO
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

USE [dbFakturyJK]
GO
/****** Object:  Table [dbo].[Faktury]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faktury](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NrFaktury] [varchar](50) NULL,
	[Obraz] [image] NULL,
	[DataWystawienia] [varchar](20) NULL,
	[IdOdbiorcy] [int] NULL,
 CONSTRAINT [PK_Faktury] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nadawca]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nadawca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NULL,
	[AdresUlicaNumer] [varchar](50) NULL,
	[AdresKodMiasto] [varchar](50) NULL,
	[NIP] [varchar](50) NULL,
	[REGON] [varchar](50) NULL,
	[NrKonta] [varchar](26) NULL,
 CONSTRAINT [PK_Nadawca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odbiorcy]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odbiorcy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NULL,
	[AdresUlicaNumer] [varchar](50) NULL,
	[AdresKodMiasto] [varchar](50) NULL,
	[NIP] [varchar](50) NULL,
	[REGON] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Odbiorcy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkty]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NULL,
	[Cena] [decimal](10, 2) NULL,
	[Vat] [int] NULL,
 CONSTRAINT [PK_Produkty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddFaktury]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddFaktury]
@nrfaktury int,
@datawystawienia varchar(20),
@idodbiorcy int,
@obraz image
as
INSERT INTO Faktury (NrFaktury,DataWystawienia,IdOdbiorcy, Obraz)
VALUES(@nrfaktury,@datawystawienia,@idodbiorcy,@obraz)
GO
/****** Object:  StoredProcedure [dbo].[AddNadawca]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNadawca]
@nazwa varchar(50),
@adresun varchar(50),
@adreskm varchar(50),
@nip varchar(50),
@regon varchar(50),
@nrkonta varchar(26)
as
INSERT INTO Nadawca (Nazwa, AdresUlicaNumer,AdresKodMiasto,NIP,REGON,NrKonta)
VALUES(@nazwa,@adresun,@adreskm,@nip,@regon,@nrkonta)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[AddOdbiorcy]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddOdbiorcy]
@nazwa varchar(50),
@adresun varchar(50),
@adreskm varchar(50),
@nip varchar(50),
@regon varchar(50),
@email varchar(50)
as
INSERT INTO Odbiorcy (Nazwa, AdresUlicaNumer,AdresKodMiasto,NIP,REGON,Email)
VALUES(@nazwa,@adresun,@adreskm,@nip,@regon,@email)
RETURN

GO
/****** Object:  StoredProcedure [dbo].[AddProdukty]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddProdukty]
@nazwa varchar(50),
@cena varchar(50),
@vat int
as
INSERT INTO Produkty (Nazwa, Cena,Vat)
VALUES(@nazwa,@cena,@vat)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[CountFaktury]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CountFaktury] as
select count(*)as ilosc from Faktury;
GO
/****** Object:  StoredProcedure [dbo].[DeleteOdbiorcaById]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteOdbiorcaById]
(
@id int
)
as
DELETE FROM Odbiorcy where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduktyById]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteProduktyById]
(
@id int
)
as
DELETE FROM Produkty where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[FakturyView]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE procedure [dbo].[FakturyView] as
SELECT TOP (100)
      [NrFaktury]
      
      ,[DataWystawienia],[Obraz]
      ,[IdOdbiorcy],[dbo].[Odbiorcy].Nazwa,[dbo].[Odbiorcy].Email
  FROM [dbFakturyJK].[dbo].[Faktury],[dbo].[Odbiorcy]
  where dbo.Faktury.IdOdbiorcy=dbo.Odbiorcy.Id
  order by NrFaktury desc;
GO
/****** Object:  StoredProcedure [dbo].[GetOdbiorcaById]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetOdbiorcaById]
(
@id int
)
as
select * from Odbiorcy where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[GetProduktyById]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetProduktyById]
(
@id int
)
as
select * from Produkty where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[NadawcaView]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NadawcaView] as
SELECT TOP (1) [Id]
      ,[Nazwa]
      ,[AdresUlicaNumer]
      ,[AdresKodMiasto]
      ,[NIP]
      ,[REGON]
	  ,[NrKonta]
  FROM [dbFakturyJK].[dbo].[Nadawca]
  Order By Nazwa;
  return
GO
/****** Object:  StoredProcedure [dbo].[OdbiorcyView]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE procedure [dbo].[OdbiorcyView] as
SELECT TOP (1000) [Id]
      ,[Nazwa]
      ,[AdresUlicaNumer]
      ,[AdresKodMiasto]
      ,[NIP]
      ,[REGON]
	  ,[Email]
  FROM [dbFakturyJK].[dbo].[Odbiorcy]
  Order By Nazwa;
  return
GO
/****** Object:  StoredProcedure [dbo].[ProduktyView]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProduktyView]
as
Select*from dbo.Produkty order by Nazwa;
GO
/****** Object:  StoredProcedure [dbo].[UpdateNadawca]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateNadawca]
(
@nazwa varchar(50),
@adresun varchar(50),
@adreskm varchar(50),
@nip varchar(50),
@regon varchar(50),
@nrkonta varchar(26)
)
as
UPDATE Nadawca 
set Nazwa=@nazwa,AdresUlicaNumer=@adresun,AdresKodMiasto=@adreskm,NIP=@nip,REGON=@regon,NrKonta=@nrkonta;

RETURN
GO
/****** Object:  StoredProcedure [dbo].[UpdateOdbiorca]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateOdbiorca]
(
@id int,
@nazwa varchar(50),
@adresun varchar(50),
@adreskm varchar(50),
@nip varchar(50),
@regon varchar(50),
@email varchar(50)
)
as
UPDATE Odbiorcy 
set Nazwa=@nazwa,AdresUlicaNumer=@adresun,AdresKodMiasto=@adreskm,NIP=@nip,REGON=@regon, Email=@email
where Id=@id;
RETURN
GO
/****** Object:  StoredProcedure [dbo].[UpdateProdukty]    Script Date: 29.07.2020 19:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateProdukty]
(
@id int,
@nazwa varchar(50),
@cena varchar(50),
@vat int

)
as
UPDATE Produkty 
set Nazwa=@nazwa,Cena=@cena, Vat=@vat
where Id=@id;
RETURN
GO

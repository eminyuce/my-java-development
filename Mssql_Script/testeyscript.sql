USE [testEY]
GO
/****** Object:  Table [dbo].[cg_ContentUrlWords]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_ContentUrlWords](
	[ContentUrlId] [int] NULL,
	[WordId] [int] NULL,
	[WordCount] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_ContentUrlsRelations]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_ContentUrlsRelations](
	[ContentUrlId] [int] NULL,
	[ContentUrlIdRelated] [int] NULL,
	[Similarity] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_ContentUrls]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_ContentUrls](
	[ContentUrlId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](2500) NULL,
	[Title] [nvarchar](2500) NULL,
	[Description] [nvarchar](max) NULL,
	[pubDate] [datetime] NULL,
	[isExtractable] [bit] NULL,
	[TitleExtracted] [nvarchar](2500) NULL,
	[ContentExtracted] [nvarchar](max) NULL,
	[HtmlExtracted] [nvarchar](max) NULL,
	[DateExtracted] [datetime] NULL,
	[StatusId] [int] NULL,
	[isSimularityCalc] [bit] NULL,
 CONSTRAINT [PK_cg_ContentUrls] PRIMARY KEY CLUSTERED 
(
	[ContentUrlId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_ContentUrlRequestRelation]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_ContentUrlRequestRelation](
	[RequestSourceId] [int] NULL,
	[ContentUrlId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_ContentUrlImages]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_ContentUrlImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ContentUrlId] [int] NULL,
	[ImageSrc] [nvarchar](2000) NULL,
	[ImageAlt] [nvarchar](2000) NULL,
	[ImageHash] [nvarchar](2000) NULL,
	[DownloadTime] [float] NULL,
 CONSTRAINT [PK_cg_ContentUrlImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_Categories]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](255) NULL,
	[CategoryTypeId] [int] NULL,
	[CategoryRank] [int] NULL,
 CONSTRAINT [PK_cg_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[cg_CategoriesForStories]    Script Date: 04/04/2014 12:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[cg_CategoriesForStories]
AS
SELECT DISTINCT CategoryName AS Category
FROM         [SQL11\SQL2008R2].NewsEngine.dbo.CategoriesLoc AS CategoriesLoc_1
WHERE     (CultureID = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CategoriesLoc_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 3045
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'cg_CategoriesForStories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'cg_CategoriesForStories'
GO
/****** Object:  UserDefinedFunction [dbo].[BINTToIP]    Script Date: 04/04/2014 12:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[BINTToIP] (@ip bigint)
    RETURNS varchar(16)
BEGIN
    DECLARE @ret varchar(16)
SELECT
    @ret =  CONVERT(varchar, @ip / POWER(2, 24)) + '.' +
                CONVERT(varchar, @ip  / POWER(2, 16) & 0xFF) + '.' +
                CONVERT(varchar, @ip / POWER(2, 8) & 0xFF) + '.' +
                CONVERT(varchar, @ip & 0xFF)
    RETURN @ret
END
GO
/****** Object:  View [dbo].[cg_Areas]    Script Date: 04/04/2014 12:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[cg_Areas]
AS
SELECT     AreaID, AreaShortName, AreaLongName
FROM         [SQL11\SQL2008R2].NewsEngine.dbo.Areas AS Areas_1
WHERE     (IsActive = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Areas_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'cg_Areas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'cg_Areas'
GO
/****** Object:  UserDefinedFunction [dbo].[AlphaNumericOnly]    Script Date: 04/04/2014 12:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[AlphaNumericOnly](@string varchar(max))

returns varchar(max)

begin
--   '%[^a-z0-9 ''^-]%'
   While PatIndex('%[^a-z0-9]%' , @string) > 0
 
        Set @string = Stuff(@string, PatIndex('%[^a-z0-9]%', @string), 1, '')

return @string

end
GO
/****** Object:  Table [dbo].[_temp_Keywords201404]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_temp_Keywords201404](
	[Word] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_temp_converte]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_temp_converte](
	[Ab Inflatables] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_temp]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_temp](
	[name] [nvarchar](50) NULL,
	[value] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_RayMarineUsa]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_RayMarineUsa](
	[tmpCompKey] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [float] NULL,
	[Country] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Install] [bit] NOT NULL,
	[Lat] [float] NULL,
	[Lon] [float] NULL,
	[Enabled] [bit] NOT NULL,
	[Authorized] [bit] NOT NULL,
	[CertInstall] [bit] NOT NULL,
	[Premier] [bit] NOT NULL,
	[Repair] [bit] NOT NULL,
	[Sales] [bit] NOT NULL,
	[Wholesale] [bit] NOT NULL,
	[Distance] [float] NULL,
	[LocationId] [float] NULL,
	[tmpLocKey] [nvarchar](250) NULL,
	[lid] [int] IDENTITY(40000,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_RayMarineDealersInternational]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_RayMarineDealersInternational](
	[tmpCompKey] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[address1] [nvarchar](255) NULL,
	[address2] [nvarchar](255) NULL,
	[address3] [nvarchar](255) NULL,
	[bmetqualifieduk] [nvarchar](255) NULL,
	[certifiedtechnician] [float] NULL,
	[city] [nvarchar](255) NULL,
	[clientkey] [float] NULL,
	[country] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[fax] [float] NULL,
	[icon] [nvarchar](255) NULL,
	[installation] [float] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[phone] [float] NULL,
	[postalcode] [float] NULL,
	[province] [nvarchar](255) NULL,
	[sales] [float] NULL,
	[state] [nvarchar](255) NULL,
	[uid] [float] NULL,
	[url] [nvarchar](255) NULL,
	[warranty] [float] NULL,
	[collection_Id] [float] NULL,
	[F25] [nvarchar](255) NULL,
	[F26] [nvarchar](255) NULL,
	[lid] [int] IDENTITY(30000,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_med_ProductSpecList]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_med_ProductSpecList](
	[ProductID] [int] NULL,
	[ProductSpecID] [int] NULL,
	[Value] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_man_Locations]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_man_Locations](
	[LocationID] [int] NOT NULL,
	[CompanyId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Photo] [image] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Order] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_man_CompaniesBrands]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_man_CompaniesBrands](
	[BCID] [int] NOT NULL,
	[CompanyId] [int] NULL,
	[Brand] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_man_Companies]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_man_Companies](
	[CompanyID] [int] NOT NULL,
	[Company] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[LogoImage] [image] NULL,
	[Url] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_man_BrandsList]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_man_BrandsList](
	[Brand] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_ForunoDealersUSA]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_ForunoDealersUSA](
	[tmpCompKey] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[zip] [float] NULL,
	[phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[web] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[lat] [float] NULL,
	[lon] [float] NULL,
	[lid] [int] IDENTITY(20000,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_FixCountries]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_FixCountries](
	[country] [nvarchar](255) NULL,
	[GoodCountry] [varchar](100) NOT NULL,
	[cnt] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cw_Registrants]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cw_Registrants](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Zipcode] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[RegistrantKey] [nvarchar](255) NULL,
	[JoinUrl] [nvarchar](255) NULL,
	[IsSuccess] [bit] NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[WebinarKey] [nvarchar](255) NULL,
 CONSTRAINT [PK_cw_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country$]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country$](
	[CountryID] [float] NULL,
	[CountryName] [nvarchar](255) NULL,
	[CountryCode] [nvarchar](255) NULL,
	[TheOrder] [float] NULL,
	[Enabled] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_WordsNoisy]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_WordsNoisy](
	[Word] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_Words]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_Words](
	[WordID] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](255) NULL,
 CONSTRAINT [PK_cg_Words] PRIMARY KEY CLUSTERED 
(
	[WordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_websites]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_websites](
	[WebSiteID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](500) NULL,
	[WebSiteContent] [nvarchar](max) NULL,
	[isExceptionThrown] [bit] NULL,
 CONSTRAINT [PK_med_websites] PRIMARY KEY CLUSTERED 
(
	[WebSiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[cg_tt_StingInt]    Script Date: 04/04/2014 12:35:11 ******/
CREATE TYPE [dbo].[cg_tt_StingInt] AS TABLE(
	[StringValue] [nvarchar](max) NULL,
	[IntValue] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[cg_tt_IntBit]    Script Date: 04/04/2014 12:35:11 ******/
CREATE TYPE [dbo].[cg_tt_IntBit] AS TABLE(
	[IntValue] [int] NULL,
	[BitValue] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[cg_tt_ContentUrl]    Script Date: 04/04/2014 12:35:11 ******/
CREATE TYPE [dbo].[cg_tt_ContentUrl] AS TABLE(
	[ContentUrlId] [int] NULL,
	[Url] [nvarchar](2500) NULL,
	[Title] [nvarchar](2500) NULL,
	[Description] [nvarchar](max) NULL,
	[pubDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[cg_RequestItems]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_RequestItems](
	[RequestSourceId] [int] IDENTITY(1,1) NOT NULL,
	[KeywordSourceId] [int] NULL,
	[StoriesSourceId] [int] NULL,
	[Url] [nvarchar](500) NULL,
	[NewItemsCount] [int] NULL,
	[TotalItemsCount] [int] NULL,
	[DateRequest] [datetime] NULL,
	[Html] [nvarchar](max) NULL,
	[ContentType] [nvarchar](50) NULL,
	[DiffText] [nvarchar](max) NULL,
	[DiffHtml] [nvarchar](max) NULL,
 CONSTRAINT [PK_content_RequestItems] PRIMARY KEY CLUSTERED 
(
	[RequestSourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[cg_test_Compare]    Script Date: 04/04/2014 12:35:11 ******/
CREATE TYPE [dbo].[cg_test_Compare] AS TABLE(
	[WordID] [int] NULL,
	[WordCount] [float] NULL
)
GO
/****** Object:  Table [dbo].[cg_StoryImages]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_StoryImages](
	[StoryImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [int] NULL,
	[StoryId] [int] NULL,
	[isSelected] [bit] NULL,
 CONSTRAINT [PK_cg_StoryImages] PRIMARY KEY CLUSTERED 
(
	[StoryImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_StoryEditors]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_StoryEditors](
	[StoryEditorId] [int] IDENTITY(1,1) NOT NULL,
	[StoryId] [int] NULL,
	[Editor] [nvarchar](255) NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_cg_StoryEditors] PRIMARY KEY CLUSTERED 
(
	[StoryEditorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_StoryCategories]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_StoryCategories](
	[StoryCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[StoryId] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_cg_StoryCategories] PRIMARY KEY CLUSTERED 
(
	[StoryCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_StoryAreas]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_StoryAreas](
	[StoryAreaId] [int] IDENTITY(1,1) NOT NULL,
	[StoryId] [int] NULL,
	[AreaId] [int] NULL,
	[isSelected] [bit] NULL,
 CONSTRAINT [PK_cg_StoryAreas] PRIMARY KEY CLUSTERED 
(
	[StoryAreaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_StoriesSource]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_StoriesSource](
	[StoriesSourceId] [int] IDENTITY(20000,1) NOT NULL,
	[Content] [nvarchar](500) NULL,
	[Rank] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_cg_StoriesSource] PRIMARY KEY CLUSTERED 
(
	[StoriesSourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_Stories]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_Stories](
	[StoryId] [int] IDENTITY(1,1) NOT NULL,
	[ContentUrlId] [int] NULL,
	[Title] [nvarchar](500) NULL,
	[Author] [nvarchar](255) NULL,
	[Body] [nvarchar](max) NULL,
	[PublishDate] [datetime] NULL,
	[Source] [nvarchar](255) NULL,
	[Comment] [nvarchar](max) NULL,
	[Rank] [int] NULL,
	[IsPublished] [bit] NULL,
	[Similarity] [float] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[TitleHtmlDiff] [nvarchar](max) NULL,
	[BodyHtmlDiff] [nvarchar](max) NULL,
	[Editor] [nvarchar](255) NULL,
 CONSTRAINT [PK_cg_Stories] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Search]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_Search](
	[SearchId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[ItemType] [int] NULL,
	[Search] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[url] [nvarchar](200) NULL,
 CONSTRAINT [PK_med_Search] PRIMARY KEY CLUSTERED 
(
	[SearchId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_ProductSpecValues]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_ProductSpecValues](
	[ProductID] [int] NOT NULL,
	[SpecGroup] [nvarchar](max) NULL,
	[ProductSpecID] [int] NULL,
	[ValueOriginal] [nvarchar](max) NULL,
	[ValueMin] [float] NULL,
	[ValueMax] [float] NULL,
	[ValueString] [nvarchar](400) NULL,
	[Measurement] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_ProductSpecsNames]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_ProductSpecsNames](
	[ProductSpecID] [int] IDENTITY(1,1) NOT NULL,
	[SpecName] [nvarchar](max) NULL,
	[SpecType] [int] NULL,
	[IsActive] [bit] NULL,
	[IsFullTextSearch] [bit] NULL,
 CONSTRAINT [PK_med_ProductSpecs] PRIMARY KEY CLUSTERED 
(
	[ProductSpecID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-string, 2- list, 16-number, 32-range' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'med_ProductSpecsNames', @level2type=N'COLUMN',@level2name=N'SpecType'
GO
/****** Object:  Table [dbo].[med_ProductSpecList]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_ProductSpecList](
	[ProductID] [int] NULL,
	[ProductSpecID] [int] NULL,
	[Value] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_ProductImages]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_ProductImages](
	[ProductImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ContentType] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[FileHash] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_ProductCategories]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_ProductCategories](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_med_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_ProductAccessory]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_ProductAccessory](
	[ProductId] [int] NOT NULL,
	[ProductAccessoryID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Product]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[TitleLong] [nvarchar](max) NULL,
	[DescriptionShort] [nvarchar](max) NULL,
	[BrandId] [int] NULL,
	[Attributes] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[url] [nvarchar](max) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Log]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [nvarchar](255) NULL,
	[ItemId] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[ActionId] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[Descripton] [nvarchar](max) NULL,
 CONSTRAINT [PK_med_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Location]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_Location](
	[LocationId] [int] IDENTITY(100000,1) NOT NULL,
	[CompanyId] [int] NULL,
	[tmpCompKey] [nvarchar](250) NULL,
	[name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[zip] [nvarchar](500) NULL,
	[phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[website] [nvarchar](255) NULL,
	[fax] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[country] [nvarchar](255) NULL,
	[lid] [int] NULL,
	[note] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Images]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_Images](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [int] NULL,
	[ItemID] [int] NULL,
	[FileHash] [nvarchar](max) NULL,
	[FileName] [nvarchar](255) NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_med_Images] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=company 2=product 3=location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'med_Images', @level2type=N'COLUMN',@level2name=N'ImageID'
GO
/****** Object:  Table [dbo].[med_FeaturedItems]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_FeaturedItems](
	[FeaturedID] [int] IDENTITY(40000,1) NOT NULL,
	[ItemId] [int] NULL,
	[ItemType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_CompanyTypes]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[med_CompanyTypes](
	[CompanyTypeId] [int] IDENTITY(2000,1) NOT NULL,
	[Type] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[med_CompanyTypeRelations]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_CompanyTypeRelations](
	[CompanyTypeId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_med_CompanyTypeRelations] PRIMARY KEY CLUSTERED 
(
	[CompanyTypeId] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_CompanyBrands]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_CompanyBrands](
	[CompanyId] [int] NULL,
	[BrandId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Companies]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[med_Companies](
	[CompanyId] [int] IDENTITY(100000,1) NOT NULL,
	[Company] [nvarchar](200) NULL,
	[tmpCompKey] [nvarchar](250) NULL,
	[tmpSource] [varchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[url] [nvarchar](200) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[med_Brands]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](255) NULL,
 CONSTRAINT [PK_med_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mc_CalaisItem]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mc_CalaisItem](
	[CalaisItemId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL,
	[Frequency] [nvarchar](255) NULL,
	[Section] [nvarchar](255) NULL,
	[Relevance] [nvarchar](255) NULL,
	[Score] [nvarchar](255) NULL,
	[Taxonomy] [nvarchar](255) NULL,
	[ContentHash] [nvarchar](255) NULL,
 CONSTRAINT [PK_CalaisItem] PRIMARY KEY CLUSTERED 
(
	[CalaisItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[us_states$]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[us_states$](
	[State] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_ParseAlphaChars]    Script Date: 04/04/2014 12:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[UDF_ParseAlphaChars]
(
@string VARCHAR(8000)
)
RETURNS VARCHAR(8000)
AS
BEGIN
DECLARE @IncorrectCharLoc SMALLINT
SET @IncorrectCharLoc = PATINDEX('%[^0-9A-Za-z]%', @string)
WHILE @IncorrectCharLoc > 0
BEGIN
SET @string = STUFF(@string, @IncorrectCharLoc, 1, '')
SET @IncorrectCharLoc = PATINDEX('%[^0-9A-Za-z]%', @string)
END
SET @string = @string
RETURN @string
END
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetNumeric]    Script Date: 04/04/2014 12:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_GetNumeric]
(@strAlphaNumeric VARCHAR(256))
RETURNS VARCHAR(256)
AS
BEGIN
DECLARE @intAlpha INT
declare @regexNumber nvarchar(255)
set @regexNumber = '% ^([0-9]*)(\.[0-9]{2})?$%'
SET @intAlpha = PATINDEX(@regexNumber, @strAlphaNumeric)
BEGIN
WHILE @intAlpha > 0
BEGIN
SET @strAlphaNumeric = STUFF(@strAlphaNumeric, @intAlpha, 1, '' )
SET @intAlpha = PATINDEX(@regexNumber, @strAlphaNumeric )
END
END
RETURN ISNULL(@strAlphaNumeric,0)
END
GO
/****** Object:  Table [dbo].[tmpProductType]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpProductType](
	[tmpProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[sqlProductID] [int] NOT NULL,
	[Product_Type] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpProductSpecList]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpProductSpecList](
	[tmpProductSpecificationID] [int] NULL,
	[sqlProductID] [int] NULL,
	[Value] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpProductSpecification]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpProductSpecification](
	[tmpProductSpecificationID] [int] IDENTITY(1,1) NOT NULL,
	[sqlProductID] [int] NOT NULL,
	[SpecGroup] [nvarchar](max) NULL,
	[ProductSpecID] [int] NULL,
	[SpecValue] [nvarchar](max) NULL,
	[realSpecValue] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tmpProductSpecification] PRIMARY KEY CLUSTERED 
(
	[tmpProductSpecificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpProducts]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpProducts](
	[sqlProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](max) NULL,
	[Id] [nvarchar](max) NULL,
	[ProductGuid] [nvarchar](max) NULL,
	[CategoryPath] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[Flag] [bit] NULL,
	[ProductSource] [nvarchar](max) NULL,
	[ProductURL] [nvarchar](max) NULL,
	[FullHTML] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[TitleLong] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[DescriptionShort] [nvarchar](max) NULL,
	[Features] [nvarchar](max) NULL,
	[Brand] [nvarchar](max) NULL,
	[SpecificationString] [nvarchar](max) NULL,
	[ImagesCode] [nvarchar](max) NULL,
	[Attributes] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
 CONSTRAINT [PK_tmpProducts] PRIMARY KEY CLUSTERED 
(
	[sqlProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpProductOption]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpProductOption](
	[tmpProductOptionId] [int] IDENTITY(1,1) NOT NULL,
	[sqlProductID] [int] NOT NULL,
	[Group] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_tmpOption] PRIMARY KEY CLUSTERED 
(
	[tmpProductOptionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpProductLists]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpProductLists](
	[tmpProductListID] [int] IDENTITY(1,1) NOT NULL,
	[sqlProductID] [int] NOT NULL,
	[ListName] [nvarchar](max) NULL,
	[ItemValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_tmpProductLists] PRIMARY KEY CLUSTERED 
(
	[tmpProductListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpProductCdnImage]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpProductCdnImage](
	[tmpProductCdnImageID] [int] IDENTITY(1,1) NOT NULL,
	[sqlProductID] [int] NOT NULL,
	[ContentType] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[FileHash] [nvarchar](max) NULL,
 CONSTRAINT [PK_tmpCdnImage] PRIMARY KEY CLUSTERED 
(
	[tmpProductCdnImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestTables]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestTables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_TestTables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_StoryWords]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_StoryWords](
	[WordId] [int] NULL,
	[StoryId] [int] NULL,
	[Count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system_logging]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[system_logging](
	[system_logging_guid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[entered_date] [datetime] NULL,
	[log_application] [varchar](200) NULL,
	[log_date] [varchar](100) NULL,
	[log_level] [varchar](100) NULL,
	[log_logger] [varchar](8000) NULL,
	[log_message] [varchar](8000) NULL,
	[log_machine_name] [varchar](8000) NULL,
	[log_user_name] [varchar](8000) NULL,
	[log_call_site] [varchar](8000) NULL,
	[log_thread] [varchar](100) NULL,
	[log_exception] [varchar](8000) NULL,
	[log_stacktrace] [varchar](8000) NULL,
 CONSTRAINT [PK_system_logging] PRIMARY KEY CLUSTERED 
(
	[system_logging_guid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[StripHtmlEn]    Script Date: 04/04/2014 12:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Function [dbo].[StripHtmlEn]
	(@Dirty varchar(MAX))
	Returns varchar(MAX)
As

Begin
	Declare @Start int,
		@End int,
		@Length int

	While CharIndex('<', @Dirty) > 0 And CharIndex('>', @Dirty, CharIndex('<', @Dirty)) > 0
	    Begin
		Select @Start = CharIndex('<', @Dirty), 
		  @End = CharIndex('>', @Dirty, CharIndex('<', @Dirty))
		Select @Length = (@End - @Start) + 1
		If @Length > 0
		    Begin
			Select @Dirty = Stuff(@Dirty, @Start, @Length, '')
		    End
	    End

	return @Dirty
End
GO
/****** Object:  UserDefinedFunction [dbo].[SplitWords]    Script Date: 04/04/2014 12:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitWords]
(
      @StringToSplit nvarchar(max)
)
RETURNS 
@words TABLE (Word varchar(200),  WordCHECKSUM int, Position int, WordCount smallint,WORDLENGTH smallint)
AS
BEGIN

declare @s  nvarchar(max)
set @s=lower(@StringToSplit)

DECLARE @SplitOn  nvarchar(100)
SET @SplitOn=' ,.:;!?/()"”“' + CHAR(9) + CHAR(13) + CHAR(10);
DECLARE @inWord bit

DECLARE @pos int, @start int
DECLARE @ch nchar(1), @word varchar(200)

DECLARE @allwords TABLE (Position int, Word varchar(200), WordCHECKSUM int)

      SET @pos = 1
      SET @inWord=0
      SET @word=''

      WHILE @pos <= LEN(@s)
      BEGIN
            set @ch=SUBSTRING(@s,@pos,1)
            IF CHARINDEX(@ch,@SplitOn) > 0
            BEGIN
                  IF @inWord=1 AND @pos>@start
                  BEGIN
                   SET @word=SUBSTRING(@s,@start,@pos-@start)
                   INSERT INTO @allwords (Position,Word,WordCHECKSUM)
                   VALUES (@start,@word,CHECKSUM(@word))    
                  END

                  SET @inWord=0
            END
            ELSE
            BEGIN 
                  IF @inWord=0 SET @start=@pos
                  SET @inWord=1
            END

            set @pos=@pos+1
      END



                  IF @inWord=1 AND @pos>@start
                  BEGIN
                   SET @word=SUBSTRING(@s,@start,@pos-@start)
                   INSERT INTO @allwords (Position,Word,WordCHECKSUM)
                   VALUES (@start,@word,CHECKSUM(@word))    

                   --print CAST(@start as varchar(10)) + '   ' + @word + '   ' + CAST(CHECKSUM(@word) as varchar(100))
                  END


INSERT INTO @words  (Word ,  WordCHECKSUM, Position , WordCount,WORDLENGTH)
select  RTRIM(LTRIM(word)),Min(WordCHECKSUM) as WordCHECKSUM,min(Position) as Position,  count(*) as cnt,LEN(RTRIM(LTRIM(word)))
from @allwords
group by word
ORDER BY min(Position)

      
      RETURN 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SetCompanyImage]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec med_sp_GetCompanyByUrl raymarine,3
CREATE PROCEDURE [dbo].[med_sp_SetCompanyImage]
	@ItemType nvarchar(255)='',	
	@ItemID int ,
	@fileHash nvarchar(255)='',	
	@FileName nvarchar(255)='',	
	@Type nvarchar(255)=''
AS
BEGIN

	SET NOCOUNT ON;
	 
           
 
  -- Update dbo.med_Images  set Type=@OldType Where  ItemType = 1 and  ItemId = @companyId  and FileHash <> @fileHash
	-- Update dbo.med_Images  set Type=@NewType Where FileHash = @fileHash
	
	 
					
END
GO
/****** Object:  UserDefinedTableType [dbo].[med_tpt_ProductSpecList]    Script Date: 04/04/2014 12:35:11 ******/
CREATE TYPE [dbo].[med_tpt_ProductSpecList] AS TABLE(
	[ProductID] [int] NULL,
	[ProductSpecID] [int] NULL,
	[Value] [nvarchar](255) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[med_tpt_Filter]    Script Date: 04/04/2014 12:35:11 ******/
CREATE TYPE [dbo].[med_tpt_Filter] AS TABLE(
	[FieldName] [nvarchar](max) NULL,
	[ValueFirst] [nvarchar](max) NULL,
	[ValueLast] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[se_Categories]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[se_Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SiteId] [int] NULL,
	[CategoryParentId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](1000) NULL,
	[UrlName] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[IsController] [bit] NULL,
	[IsIncludeParentKeywords] [bit] NULL,
	[IsMainMenu] [bit] NULL,
	[Ordering] [int] NULL,
	[CategorySid] [nvarchar](255) NULL,
 CONSTRAINT [PK_se_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[RemoveSpecialChars]    Script Date: 04/04/2014 12:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[RemoveSpecialChars] (@s varchar(256)) returns varchar(256)
   with schemabinding
begin
   if @s is null
      return null
   declare @s2 varchar(256)
   set @s2 = ''
   declare @s3 varchar(256)
   set @s3 = ' '
   declare @l int
   set @l = len(@s)
   declare @p int
   set @p = 1
   while @p <= @l begin
      declare @c int
      set @c = ascii(substring(@s, @p, 1))
      if @c between 48 and 57 or @c between 65 and 90 or @c between 97 and 122
         set @s2 = @s2 + char(@c) 
         else
         set @s2 = @s2 + @s3
      set @p = @p + 1
      end
   if len(@s2) = 0
      return null
   return rtrim(ltrim(@s2))
   end
GO
/****** Object:  Table [dbo].[se_Keywords]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[se_Keywords](
	[KeywordId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Text] [nvarchar](1000) NULL,
 CONSTRAINT [PK_se_Keywords] PRIMARY KEY CLUSTERED 
(
	[KeywordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[se_SiteSettings]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[se_SiteSettings](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[SiteId] [int] NULL,
	[SettingKey] [nvarchar](255) NULL,
	[SettingValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_se_SiteSettings] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[se_Sites]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[se_Sites](
	[SiteId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ShortName] [nvarchar](255) NULL,
 CONSTRAINT [PK_se_Sites] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sources$]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sources$](
	[Content] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ShortMess]    Script Date: 04/04/2014 12:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ShortMess]
		(@mess nvarchar(MAX), 
		@minLength int, 
		@maxLength int)
RETURNS nvarchar(MAX) AS  
BEGIN 

declare @i int

if(@minLength=0 AND @maxLength=0) 
	return ''


if len(@mess)<@maxLength or len(@mess)<@minLength
 Begin 
 set @i=len(@mess)
 End
else
 Begin
	
	set @i = CHARINDEX ('.',@mess,@minLength)
	
	if @i>@maxLength or @i<@minLength
	 Begin 
	 set @i=CHARINDEX (',',@mess,@minLength)
	 End

	if @i>@maxLength or @i<@minLength
	 Begin 
	 set @i=CHARINDEX (' ',@mess,@minLength)
	 End

	if @i<@minLength
	 Begin 
	 set @i=@minLength
	 End
	
	if @i>len(@mess) 
	 BEGIN 
	 set @i=len(@mess) 
	 End

 End
return LTRIM(substring(@mess,1,@i) )


END
GO
/****** Object:  Table [dbo].[RayMarineDealersUSA$]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RayMarineDealersUSA$](
	[Name] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [float] NULL,
	[Country] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Install] [bit] NOT NULL,
	[Lat] [float] NULL,
	[Lon] [float] NULL,
	[Enabled] [bit] NOT NULL,
	[Authorized] [bit] NOT NULL,
	[CertInstall] [bit] NOT NULL,
	[Premier] [bit] NOT NULL,
	[Repair] [bit] NOT NULL,
	[Sales] [bit] NOT NULL,
	[Wholesale] [bit] NOT NULL,
	[Distance] [float] NULL,
	[LocationId] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RayMarineDealersInternational_2$]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RayMarineDealersInternational_2$](
	[name] [nvarchar](255) NULL,
	[address1] [nvarchar](255) NULL,
	[address2] [nvarchar](255) NULL,
	[address3] [nvarchar](255) NULL,
	[bmetqualifieduk] [nvarchar](255) NULL,
	[certifiedtechnician] [float] NULL,
	[city] [nvarchar](255) NULL,
	[clientkey] [float] NULL,
	[country] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[fax] [float] NULL,
	[icon] [nvarchar](255) NULL,
	[installation] [float] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[phone] [float] NULL,
	[postalcode] [float] NULL,
	[province] [nvarchar](255) NULL,
	[sales] [float] NULL,
	[state] [nvarchar](255) NULL,
	[uid] [float] NULL,
	[url] [nvarchar](255) NULL,
	[warranty] [float] NULL,
	[collection_Id] [float] NULL,
	[F25] [nvarchar](255) NULL,
	[F26] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[parseURL]    Script Date: 04/04/2014 12:35:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      FUNCTION [dbo].[parseURL]  (
@strURL varchar(1000) 

)
RETURNS varchar(1000)
AS
BEGIN
 

SELECT @strURL =  substring(
substring(@strURL,charindex('://',@strURL)+3,len(@strURL)),
0,
case when charindex('/',substring(@strURL,charindex('://',@strURL)+3,len(@strURL)))>0  
then charindex('/',substring(@strURL,charindex('://',@strURL)+3,len(@strURL)))
when charindex('?',substring(@strURL,charindex('://',@strURL)+3,len(@strURL)))>0  
then charindex('?',substring(@strURL,charindex('://',@strURL)+3,len(@strURL)))
else
len(@strURL)
end
)
 
SELECT @strURL = RTRIM( LTRIM(REPLACE(@strURL,'www.','')))
 

RETURN @strURL
END
GO
/****** Object:  UserDefinedFunction [dbo].[IPToBINT]    Script Date: 04/04/2014 12:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IPToBINT] (@ip varchar(max)) 
    RETURNS bigint
    WITH SCHEMABINDING
AS
BEGIN
    DECLARE @idx1 int
    DECLARE @idx2 int
    DECLARE @idx3 int
    DECLARE @idx4 int
    DECLARE @ret bigint
     
    SELECT @idx1 = CHARINDEX('.', @ip)
    SELECT @idx2 = CHARINDEX('.', @ip, @idx1+1);
    SELECT @idx3 = CHARINDEX('.', @ip, @idx2+1);
    
    IF @idx3>0
    BEGIN
     
    SELECT @ret = CONVERT(bigint, SUBSTRING(@ip, 0, @idx1)) * POWER(2, 24) +
                    CONVERT(bigint, SUBSTRING(@ip, @idx1 + 1, @idx2 - @idx1 - 1)) * POWER(2, 16) +
                    CONVERT(bigint, SUBSTRING(@ip, @idx2 + 1, @idx3 - @idx2 - 1)) * POWER(2, 8) +
                    CONVERT(bigint, SUBSTRING(@ip, @idx3 + 1, LEN(@ip) - @idx3))
                    
    END
    ELSE
    BEGIN
    
    SELECT @ret = ''
    END
    
    
    RETURN @ret
END
GO
/****** Object:  Table [dbo].[geo_IPCityLocation]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geo_IPCityLocation](
	[locId] [bigint] NULL,
	[country] [char](2) NULL,
	[region] [char](2) NULL,
	[city] [varchar](100) NULL,
	[postalCode] [varchar](10) NULL,
	[latitude] [real] NULL,
	[longitude] [real] NULL,
	[metroCode] [bigint] NULL,
	[areaCode] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[geo_IPCityBlocks]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_IPCityBlocks](
	[startIpNum] [bigint] NULL,
	[endIpNum] [bigint] NULL,
	[locId] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_dfp_Regions]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geo_dfp_Regions](
	[dfpCountryTargetingID] [int] NULL,
	[dfpRegionTargetingID] [int] NULL,
	[Region] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[geo_dfp_Countries]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geo_dfp_Countries](
	[dfpCountryTargetingID] [int] NOT NULL,
	[dfpCountry] [varchar](100) NULL,
	[CountryCode] [char](2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[geo_CountryCodeTimeZone]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geo_CountryCodeTimeZone](
	[CountryCode] [char](2) NULL,
	[RegionCode] [char](2) NULL,
	[TimeZone] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[geo_CountryCodeRegion]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geo_CountryCodeRegion](
	[CountryCode] [char](2) NULL,
	[RegionCode] [char](2) NULL,
	[TimeZone] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[geo_CountryCodeName]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geo_CountryCodeName](
	[CountryCode] [char](2) NULL,
	[CountryName] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[geo_CountryCodeContinent]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geo_CountryCodeContinent](
	[CountryCode] [char](2) NULL,
	[Continent] [char](2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedTableType [dbo].[ga_tt_PageViews]    Script Date: 04/04/2014 12:35:11 ******/
CREATE TYPE [dbo].[ga_tt_PageViews] AS TABLE(
	[ProfileId] [int] NULL,
	[PagePath] [nvarchar](2500) NULL,
	[PageDate] [date] NULL,
	[PageHour] [int] NULL,
	[PageViews] [int] NULL,
	[PageID] [int] NULL
)
GO
/****** Object:  Table [dbo].[ec_Magazines]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ec_Magazines](
	[MagazineID] [int] IDENTITY(1000,1) NOT NULL,
	[MagazineName] [nvarchar](255) NULL,
 CONSTRAINT [PK_ec_Magazines] PRIMARY KEY CLUSTERED 
(
	[MagazineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ec_IssueValues]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ec_IssueValues](
	[IssueValueId] [int] IDENTITY(50000,1) NOT NULL,
	[IssueId] [int] NULL,
	[TemplateFieldId] [int] NULL,
	[Value] [nvarchar](500) NULL,
	[ParentId] [int] NULL,
	[ListId] [int] NULL,
 CONSTRAINT [PK_ec_IssueValues] PRIMARY KEY CLUSTERED 
(
	[IssueValueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ec_Issues]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ec_Issues](
	[IssueId] [int] IDENTITY(40000,1) NOT NULL,
	[MagazineId] [int] NULL,
	[IssueDate] [date] NULL,
 CONSTRAINT [PK_ec_Issues] PRIMARY KEY CLUSTERED 
(
	[IssueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ga_Sites]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ga_Sites](
	[ProfileId] [int] NULL,
	[Domain] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ga_PageViews]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ga_PageViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NULL,
	[PageDate] [date] NULL,
	[PageHour] [int] NULL,
	[PageViews] [int] NULL,
 CONSTRAINT [PK_ga_PageViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ga_Pages]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ga_Pages](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NULL,
	[PagePath] [nvarchar](2500) NULL,
	[Hash] [binary](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ga_DatesExtracted]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ga_DatesExtracted](
	[ProfileId] [int] NULL,
	[DateExtracted] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForunoDealersUSA2$]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForunoDealersUSA2$](
	[name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[zip] [float] NULL,
	[phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[web] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[lat] [float] NULL,
	[lon] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SplitDelimitedString]    Script Date: 04/04/2014 12:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SplitDelimitedString] (
      @List VARCHAR(MAX), -- List of delimited items
      @Delimiter CHAR(1) = ',' -- Delimiter that separates items
) RETURNS @Table TABLE (item VARCHAR(MAX))
BEGIN
      DECLARE @xml xml
      SELECT @xml = CONVERT(xml,'<root><s>' + REPLACE(@List, @Delimiter, '</s><s>') + '</s></root>')
      
      INSERT INTO @Table (item)
      SELECT T.c.value('.','varchar(20)')
      FROM @xml.nodes('/root/s') T(c)
      
      RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[edit_distance]    Script Date: 04/04/2014 12:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
select
 dbo.edit_distance('Fuzzy String Match','fuzzy string match'),
 dbo.edit_distance('fuzzy','fuzy'),
 dbo.edit_distance('Fuzzy String Match','fuzy string match'),
 dbo.edit_distance('levenshtein distance sql','levenshtein sql server'),
 dbo.edit_distance('distance','server')


 Levenshtein distance is also known as Edit Distance.

If two strings are equal the Levenstein distance is 0, zero.
A zero value for Levenshtein distance between two string variables in SQL Server means, these two string variables are identical.

The higher the value of Levenstein distance between two varchar or nvarchar string variables means the strings are more different than each other. 
As the Levenstein distance algoritm counts each character edition to transform one string to other,
 if strings are completely different then the Levenstein distance function will result high values.

The return of a SQL Levenstein distance function is an integer.

*/

CREATE FUNCTION [dbo].[edit_distance](@s1 nvarchar(max), @s2 nvarchar(max))
RETURNS int
AS
BEGIN
 DECLARE @s1_len int, @s2_len int
 DECLARE @i int, @j int, @s1_char nchar, @c int, @c_temp int
 DECLARE @cv0 varbinary(8000), @cv1 varbinary(8000)

 SELECT
  @s1_len = LEN(@s1),
  @s2_len = LEN(@s2),
  @cv1 = 0x0000,
  @j = 1, @i = 1, @c = 0

 WHILE @j <= @s2_len
  SELECT @cv1 = @cv1 + CAST(@j AS binary(2)), @j = @j + 1

 WHILE @i <= @s1_len
 BEGIN
  SELECT
   @s1_char = SUBSTRING(@s1, @i, 1),
   @c = @i,
   @cv0 = CAST(@i AS binary(2)),
   @j = 1

  WHILE @j <= @s2_len
  BEGIN
   SET @c = @c + 1
   SET @c_temp = CAST(SUBSTRING(@cv1, @j+@j-1, 2) AS int) +
    CASE WHEN @s1_char = SUBSTRING(@s2, @j, 1) THEN 0 ELSE 1 END
   IF @c > @c_temp SET @c = @c_temp
   SET @c_temp = CAST(SUBSTRING(@cv1, @j+@j+1, 2) AS int)+1
   IF @c > @c_temp SET @c = @c_temp
   SELECT @cv0 = @cv0 + CAST(@c AS binary(2)), @j = @j + 1
 END

 SELECT @cv1 = @cv0, @i = @i + 1
 END

 RETURN @c
END
GO
/****** Object:  Table [dbo].[ec_Values]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ec_Values](
	[ValueId] [int] IDENTITY(1,1) NOT NULL,
	[CookieId] [nvarchar](255) NULL,
	[UserId] [int] NULL,
	[KeyName] [nvarchar](255) NULL,
	[KeyValue] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_ec_Values] PRIMARY KEY CLUSTERED 
(
	[ValueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ec_Templates]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ec_Templates](
	[TemplateId] [int] IDENTITY(10000,1) NOT NULL,
	[TemplateName] [nvarchar](100) NULL,
	[IsIssueTemplate] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ec_Templates] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ec_TemplateFields]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ec_TemplateFields](
	[TemplateFieldId] [int] IDENTITY(20000,1) NOT NULL,
	[TemplateId] [int] NULL,
	[FieldName] [nvarchar](250) NULL,
	[FieldTypeId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ec_TemplateFields] PRIMARY KEY CLUSTERED 
(
	[TemplateFieldId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ec_SetValue]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ec_SetValue]
	@CookieId	nvarchar(255)=''
	,@UserId    int =0
    ,@KeyName	nvarchar(255)
    ,@KeyValue	nvarchar(255)
AS
BEGIN

	SET NOCOUNT ON;

DECLARE @ValueId INT	
	
SELECT   @ValueId=MAX(ValueId)
FROM         dbo.ec_Values
WHERE     CookieId = @CookieId
			 AND UserId = @UserId
			  AND KeyName = @KeyName
			  

IF ISNULL(@ValueId,0)=0
BEGIN

	INSERT INTO [dbo].ec_Values (DateCreated)
	VALUES (GETDATE())
	
	SET @ValueId=SCOPE_IDENTITY()
	
END
	
	
UPDATE [dbo].ec_Values
   SET [CookieId] = @CookieId
      ,[UserId] = @UserId
      ,[KeyName] = @KeyName
      ,[KeyValue] = @KeyValue
      ,[DateUpdated] = GETDATE()
 WHERE ValueId=@ValueId
END
GO
/****** Object:  StoredProcedure [dbo].[ec_SaveOrUpdateTemplateField]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ec_SaveOrUpdateTemplateField] (
		@TemplateFieldId int,
		@TemplateId int,
		@FieldName nvarchar(250),
		@FieldTypeId int)
AS
BEGIN
  IF NOT EXISTS (SELECT
      TemplateFieldId
    FROM [dbo].[ec_TemplateFields]
    WHERE TemplateFieldId = @TemplateFieldId)
  BEGIN
  
  	IF @FieldTypeId > 10000 AND NOT EXISTS (SELECT      TemplateFieldId    FROM [dbo].[ec_TemplateFields]    WHERE TemplateId=@TemplateId AND FieldTypeId = @FieldTypeId)
    BEGIN
			INSERT INTO ec_TemplateFields (TemplateId, FieldName, FieldTypeId)
			  VALUES (@TemplateId, @FieldName, @FieldTypeId)
			SET @TemplateFieldId = SCOPE_IDENTITY()
	END
	ELSE  IF @FieldTypeId < 10000
	BEGIN
	
		INSERT INTO ec_TemplateFields (TemplateId, FieldName, FieldTypeId)
			  VALUES (@TemplateId, @FieldName, @FieldTypeId)
			SET @TemplateFieldId = SCOPE_IDENTITY()
	
	END
	
  END
  ELSE
  BEGIN
    UPDATE ec_TemplateFields
    SET TemplateId = @TemplateId,
        FieldName = @FieldName,
        FieldTypeId = @FieldTypeId
    WHERE TemplateFieldId = @TemplateFieldId;
  END
  SELECT
    @TemplateFieldId AS TemplateFieldId
END
GO
/****** Object:  StoredProcedure [dbo].[ec_SaveOrUpdateTemplate]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ec_SaveOrUpdateTemplate] (
@TemplateId int,
@TemplateName nvarchar(100),
@IsIssueTemplate bit)
AS
BEGIN
  IF NOT EXISTS (SELECT
      TemplateId
    FROM [dbo].[ec_Templates]
    WHERE TemplateId = @TemplateId)
  BEGIN
    INSERT INTO ec_Templates (TemplateName, IsIssueTemplate)
      VALUES (@TemplateName, @IsIssueTemplate)

    SET @TemplateId = SCOPE_IDENTITY()
  END
  ELSE
  BEGIN
    UPDATE ec_Templates
    SET TemplateName = @TemplateName,
        IsIssueTemplate = @IsIssueTemplate
    WHERE TemplateId = @TemplateId;
  END
  SELECT
    @TemplateId AS TemplateId
END
GO
/****** Object:  StoredProcedure [dbo].[ec_SaveOrUpdateMagazine]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ec_SaveOrUpdateMagazine] (@MagazineID int,
@MagazineName nvarchar(255))
AS
BEGIN
  IF NOT EXISTS (SELECT
      MagazineID
    FROM [dbo].[ec_Magazines]
    WHERE MagazineID = @MagazineID)
  BEGIN
    INSERT INTO ec_Magazines (MagazineName)
      VALUES (@MagazineName)

    SET @MagazineID = SCOPE_IDENTITY()
  END
  ELSE
  BEGIN
    UPDATE ec_Magazines
    SET MagazineName = @MagazineName
    WHERE MagazineID = @MagazineID;
  END
  SELECT
    @MagazineID AS MagazineID
END
GO
/****** Object:  StoredProcedure [dbo].[ec_SaveOrUpdateIssueValue]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ec_SaveOrUpdateIssueValue] (
		@IssueValueId int,
		@IssueId int,
		@TemplateFieldId int,
		@Value nvarchar(500),
		@ParentId int,
		@ListId int)
AS
BEGIN
  --IF NOT EXISTS (SELECT
  --    IssueValueId
  --  FROM [dbo].[ec_IssueValues]
  --  WHERE  TemplateFieldId = @TemplateFieldId AND IssueId=@IssueId)
  
  -- declare @ListId int = 0
  
  IF NOT EXISTS (SELECT
      IssueValueId
    FROM [dbo].[ec_IssueValues]
    WHERE  IssueValueId = @IssueValueId)
  BEGIN
    INSERT INTO ec_IssueValues (IssueId, TemplateFieldId, Value, ParentId, ListId)
      VALUES (@IssueId, @TemplateFieldId, @Value, @ParentId, @ListId)

    SET @IssueValueId = SCOPE_IDENTITY()
  END
  ELSE
  BEGIN
    UPDATE ec_IssueValues
    SET IssueId = @IssueId,
        TemplateFieldId = @TemplateFieldId,
        Value = @Value,
        ParentId = @ParentId,
        ListId = @ListId
    WHERE IssueValueId = @IssueValueId
  END
  SELECT
    @IssueValueId AS IssueValueId
END
GO
/****** Object:  StoredProcedure [dbo].[ec_SaveOrUpdateIssue]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ec_SaveOrUpdateIssue] (@IssueId int,
@MagazineId int,
@IssueDate date)
AS
BEGIN
  IF NOT EXISTS (SELECT
      IssueId
    FROM [dbo].[ec_Issues]
    WHERE IssueId = @IssueId)
  BEGIN
    INSERT INTO ec_Issues (MagazineId, IssueDate)
      VALUES (@MagazineId, @IssueDate)

    SET @IssueId = SCOPE_IDENTITY()
  END
  ELSE
  BEGIN
    UPDATE ec_Issues
    SET MagazineId = @MagazineId,
        IssueDate = @IssueDate
    WHERE IssueId = @IssueId;
  END
  SELECT
    @IssueId AS IssueId
END
GO
/****** Object:  StoredProcedure [dbo].[ec_GetValue]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- v_GetValue '1',1,'1'

CREATE PROCEDURE [dbo].[ec_GetValue] 
	@CookieId	nvarchar(255),
	@UserId    int,
	@keyName nvarchar(255)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS( SELECT [ValueId]  FROM [dbo].[ec_Values] WHERE [CookieId]=@CookieId and UserId=@UserId and KeyName=@keyName)
	BEGIN
		SELECT *  FROM [dbo].[ec_Values] WHERE [CookieId]=@CookieId and UserId=@UserId and KeyName=@keyName
	END 
	ELSE IF EXISTS( SELECT [ValueId]  FROM [dbo].[ec_Values] WHERE UserId=@UserId and KeyName=@keyName)
	BEGIN
		SELECT *  FROM [dbo].[ec_Values] WHERE UserId=@UserId and KeyName=@keyName
	END
	ELSE IF EXISTS( SELECT [ValueId]  FROM [dbo].[ec_Values] WHERE [CookieId]=@CookieId and KeyName=@keyName)
	BEGIN
		SELECT *  FROM [dbo].[ec_Values] WHERE [CookieId]=@CookieId and KeyName=@keyName
	END     
END
GO
/****** Object:  StoredProcedure [dbo].[ec_GetTemplateFieldsWithValues]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 

ec_GetTemplateFieldsWithValues 40004
 ec_GetTemplateFieldsWithValues 40004,10004
 ec_GetTemplateFieldsWithValues 40004,10006
 
 exec  ec_GetTemplateFieldsWithValues 40004,10004,0
 SELECT * FROM ec_TemplateFields WHERE TemplateId=10004
 
 */
 
CREATE PROCEDURE [dbo].[ec_GetTemplateFieldsWithValues] (
	@IssueId int = 0,
	@TemplateId int = 0,
	@ListId int =-1

)
AS
BEGIN
  
  IF @TemplateId=0
  BEGIN
  
  SELECT     @TemplateId = MAX(ec_TemplateFields.TemplateId)
		FROM         ec_IssueValues INNER JOIN
							  ec_TemplateFields ON ec_IssueValues.TemplateFieldId = ec_TemplateFields.TemplateFieldId INNER JOIN
							  ec_Templates ON ec_TemplateFields.TemplateId = ec_Templates.TemplateId
		WHERE     (ec_IssueValues.IssueId = @IssueId) AND (ec_Templates.IsIssueTemplate = 1)

  END 
  
SELECT t.*, ISNULL(v.Value,'') Value, v.IssueValueId , v.ListId
FROM
(
SELECT *
  FROM [dbo].[ec_TemplateFields]
  WHERE [TemplateId]=@TemplateId
  ) t
  LEFT OUTER JOIN
  (
  
  SELECT *
  FROM  [dbo].[ec_IssueValues]
  WHERE [IssueId]=@IssueId
  AND @ListId = CASE WHEN @ListId>-1 THEN ListId ELSE @ListId END
  ) v
  ON t.[TemplateFieldId]=v.[TemplateFieldId]
  
END
GO
/****** Object:  StoredProcedure [dbo].[ec_GetEditorialCallendarFields]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC dbo.ec_GetEditorialCallendarFields @IssueId=40019
	
		EXEC dbo.ec_GetEditorialCallendarFields @MagazineId=1004

*/



CREATE PROCEDURE [dbo].[ec_GetEditorialCallendarFields]
	-- Add the parameters for the stored procedure here
	@MagazineId int=3,
	@DateStart datetime=null,
	@DateEnd datetime=null,
	@IssueId int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @issues TABLE (IssueId int, IssueTemplateId INT)

	if EXISTS (SELECT  [IssueId]  FROM [dbo].[ec_Issues]  WHERE [IssueId]=@IssueId)
	BEGIN

		INSERT INTO @issues(IssueId,IssueTemplateId)
		SELECT      v.IssueId, MAX(t.TemplateId) AS IssueTemplateId
		FROM         ec_IssueValues AS v INNER JOIN
							  ec_TemplateFields AS tf ON v.TemplateFieldId = tf.TemplateFieldId INNER JOIN
							  ec_Templates AS t ON tf.TemplateId = t.TemplateId
		WHERE     (t.IsIssueTemplate = 1) and v.IssueId=@IssueId
		GROUP BY v.IssueId

		--INSERT INTO @issues(IssueId)
		--VALUES(@IssueId)
	END
	ELSE
	BEGIN



		INSERT INTO @issues(IssueId,IssueTemplateId)
		SELECT      v.IssueId, MAX(t.TemplateId) AS IssueTemplateId
		FROM         ec_IssueValues AS v INNER JOIN
							  ec_TemplateFields AS tf ON v.TemplateFieldId = tf.TemplateFieldId INNER JOIN
							  ec_Templates AS t ON tf.TemplateId = t.TemplateId
		WHERE     (t.IsIssueTemplate = 1) and  v.IssueId in 
												(SELECT     IssueId
													FROM         ec_Issues
													WHERE     MagazineId = @MagazineId)
		GROUP BY v.IssueId

		--INSERT INTO @issues(IssueId)
		--SELECT     IssueId
		--FROM         ec_Issues
		--WHERE MagazineId=@MagazineId
		--AND @DateStart<= CASE WHEN @DateStart IS NOT NULL THEN IssueDate ELSE @DateStart END
		--AND @DateEnd>= CASE WHEN @DateEnd IS NOT NULL THEN IssueDate ELSE @DateEnd END
		


	END

	DECLARE @templateFiled TABLE (IssueId INT, TemplateFieldId INT, ParentTemplateFieldId int)
	
	--Insert field with values
	INSERT INTO @templateFiled (IssueId,TemplateFieldId,ParentTemplateFieldId)
	SELECT   DISTINCT  v.IssueId, tf.TemplateFieldId, tf2.TemplateFieldId as ParentTemplateFieldId
	FROM         ec_IssueValues AS v INNER JOIN
						  ec_TemplateFields AS tf ON v.TemplateFieldId = tf.TemplateFieldId LEFT OUTER JOIN
						  ec_TemplateFields AS tf2 ON tf.TemplateId = tf2.FieldTypeId
						  			INNER JOIN @issues i
									ON v.IssueId=i.IssueId 
									and ( tf2.TemplateId=I.IssueTemplateId or tf2.TemplateFieldId is null)
	
	
	--Insert Templates
	INSERT INTO @templateFiled (IssueId,TemplateFieldId, ParentTemplateFieldId)
	SELECT  DISTINCT   v.IssueId, tf2.TemplateFieldId,null
	FROM         ec_IssueValues AS v INNER JOIN
						  ec_TemplateFields AS tf ON v.TemplateFieldId = tf.TemplateFieldId INNER JOIN
						  ec_TemplateFields AS tf2 ON tf.TemplateId = tf2.FieldTypeId
						  			INNER JOIN @issues i
									ON v.IssueId=i.IssueId and tf2.TemplateId=I.IssueTemplateId
	 



SELECT     IssueId, MagazineId, IssueDate
FROM         ec_Issues	   idata
	WHERE MagazineId=@MagazineId


	SELECT tfs.*,tf2.FieldName,tf2.FieldTypeId, v.Value,v.ListId,v.IssueValueId
	FROM @templateFiled tfs
		INNER JOIN
			 ec_TemplateFields AS tf2 ON tfs.TemplateFieldId = tf2.TemplateFieldId
			LEFT OUTER JOIN
		 ec_IssueValues v
		 ON tfs.IssueId=v.IssueId
		 AND tfs.TemplateFieldId=v.TemplateFieldId
		 ORDER BY tfs.IssueId,v.ListId, tfs.TemplateFieldId

		

END
GO
/****** Object:  StoredProcedure [dbo].[cw_sp_SaveRegistrant]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cw_sp_SaveRegistrant]
	@FirstName nvarchar(255),
	@LastName nvarchar(255),
	@Email nvarchar(255),
	@Company nvarchar(255),
	@Phone nvarchar(255),
	@Country nvarchar(255),
	@Zipcode nvarchar(255),
	@State nvarchar(255),
	@RegistrantKey nvarchar(255),
	@JoinUrl nvarchar(255),
	@IsSuccess bit,
	@ErrorMessage nvarchar(max) = null,	
	@WebinarKey nvarchar(255) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO  [dbo].[cw_Registrants]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[Company]
           ,[Phone]
           ,[Country]
           ,[Zipcode]
           ,[State]
           ,[RegistrantKey]
           ,[JoinUrl]
           ,[IsSuccess]
           ,[ErrorMessage]
           ,[WebinarKey]
           )
     VALUES
           (@FirstName
           ,@LastName 
           ,@Email 
           ,@Company 
           ,@Phone 
           ,@Country 
           ,@Zipcode 
           ,@State 
           ,@RegistrantKey 
           ,@JoinUrl,@IsSuccess,@ErrorMessage,@WebinarKey)

		select SCOPE_IDENTITY() as ID
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStoriesList]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

  exec cg_sp_GetStoriesList 0,21723,300,70,0
  
  select * from cg_ContentUrls Where ContentUrlId=20258 
*/

CREATE PROCEDURE [dbo].[cg_sp_GetStoriesList]
	 @minId int = 0,
	 @maxId int = 0,
	 @take int = 0,
	 @Similarity int =70,
	 @StoriesSourceId int =0
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
	 --
 IF EXISTS(select name from tempdb..sysobjects  where name like '#cg_ContentUrls') drop table #cg_ContentUrls
 
 
  
	DECLARE @ids TABLE (id int, isResult bit)
	CREATE TABLE  #cg_ContentUrls   (ContentUrlId int, RowNumber int)
 
	IF @StoriesSourceId>0
	BEGIN
 		
	SELECT     
	 distinct cg_ContentUrls.ContentUrlId  INTO #tmp  
	 FROM      cg_ContentUrls INNER JOIN
                      cg_ContentUrlRequestRelation ON cg_ContentUrls.ContentUrlId = cg_ContentUrlRequestRelation.ContentUrlId INNER JOIN
                      cg_RequestItems ON cg_ContentUrlRequestRelation.RequestSourceId = cg_RequestItems.RequestSourceId
		WHERE     (cg_RequestItems.StoriesSourceId = @StoriesSourceId) and  cg_ContentUrls.isExtractable=1
		order by cg_ContentUrls.ContentUrlId desc
		
		INSERT INTO #cg_ContentUrls
		SELECT   [ContentUrlId],  ROW_NUMBER() OVER (ORDER BY [ContentUrlId] desc) AS RowNumber
		FROM #tmp
		
		drop table #tmp
	END
	ELSE
	BEGIN
		INSERT INTO #cg_ContentUrls
		SELECT   [ContentUrlId],  ROW_NUMBER() OVER (ORDER BY [ContentUrlId] desc) AS RowNumber
		FROM [dbo].[cg_ContentUrls]
		where  isExtractable=1
		order by [ContentUrlId] desc
	END
	
	
	DECLARE @minIdRowNumber int = -1
	DECLARE @maxIdRowNumber int = -1

	set @minIdRowNumber = ISNULL((Select top(1) RowNumber from #cg_ContentUrls where [ContentUrlId]=@minId),0)
	set @maxIdRowNumber = ISNULL((Select top(1) RowNumber from #cg_ContentUrls where [ContentUrlId]=@maxId),0) 
	
	print @maxIdRowNumber
	print @minIdRowNumber
	
	--select * from #cg_ContentUrls

	IF @minId <> 0 and @maxId<>0 
	BEGIN
		INSERT INTO @ids
		SELECT   ContentUrlId,1
		FROM #cg_ContentUrls c   where   RowNumber between @minIdRowNumber and @maxIdRowNumber 
	END 
	ELSE IF @minId=0 and  @maxId=0
	BEGIN
		INSERT INTO @ids 
		SELECT top (@take)  [ContentUrlId],1
		FROM #cg_ContentUrls c  
	END
	ELSE IF @minId<>0
	BEGIN
		INSERT INTO @ids
		SELECT   [ContentUrlId],1 
		FROM  #cg_ContentUrls   where  RowNumber between @minIdRowNumber+1 and  @minIdRowNumber+@take 
	END
	ELSE IF  @maxId<>0
	BEGIN 
		INSERT INTO @ids
		SELECT   [ContentUrlId],1 
		FROM  #cg_ContentUrls   where   RowNumber between @maxIdRowNumber-@take and @maxIdRowNumber-1 
	END 
 
	 
	 INSERT INTO @ids
	 SELECT distinct ContentUrlIdRelated,0 FROM dbo.cg_ContentUrlsRelations
	 as c INNER JOIN @ids as s on c.ContentUrlId=s.id  
	 WHERE s.isResult = 1 AND Similarity>=@Similarity and ContentUrlIdRelated not in (select id from @ids where isResult=1)
	 
	 INSERT INTO @ids
	 SELECT distinct ContentUrlId,0 FROM dbo.cg_ContentUrlsRelations
	 as c INNER JOIN @ids as s on c.ContentUrlIdRelated=s.id  
	 WHERE s.isResult = 1 AND Similarity>=@Similarity and ContentUrlId not in (select id from @ids where isResult=1)
	 
	 
	 
	 SELECT distinct c.* FROM dbo.cg_ContentUrlsRelations
			as c INNER JOIN @ids as s on c.ContentUrlId=s.id 
			or c.ContentUrlIdRelated=s.id
			WHERE s.isResult = 1 AND Similarity>=@Similarity 
	 order by Similarity desc, ContentUrlId
	 
	 
	 SELECT c.*, 
	 ROW_NUMBER() OVER (ORDER BY [ContentUrlId] desc) AS RowNumber , 
	 dbo.parseURL(Url) domain 
	 FROM [dbo].[cg_ContentUrls] as c INNER JOIN @ids as s on c.ContentUrlId=s.id  
	 	 
	 SELECT distinct ss.*,crr.ContentUrlId  FROM dbo.cg_StoriesSource ss 
		INNER JOIN dbo.cg_RequestItems as ri on ri.StoriesSourceId =ss.StoriesSourceId
		INNER JOIN dbo.cg_ContentUrlRequestRelation as crr on ri.RequestSourceId =crr.RequestSourceId
		INNER JOIN @ids as s on crr.ContentUrlId=s.id  
	 
	  

	 select * from @ids order by id desc
	 
 END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetRequestItemsTimed]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.cg_sp_GetRequestItemsTimed

*/


CREATE PROCEDURE [dbo].[cg_sp_GetRequestItemsTimed]
	@MinMin int =30,
	@MaxMin int = 1200,
	@DefaultMin int=180,
	@MinNewStories int =3 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	   
declare @KeywordSourceId int
declare @StoriesSourceId int
declare @DateRequestLatest datetime

  
IF EXISTS(select name from tempdb..sysobjects  where name like '#stat%') drop table #stat


DECLARE cRequestItem CURSOR FOR  
SELECT KeywordSourceId, StoriesSourceId, MAX(DateRequest) AS DateRequestLatest 
FROM [dbo].[cg_RequestItems] group by KeywordSourceId,StoriesSourceId

OPEN cRequestItem  
FETCH NEXT FROM cRequestItem INTO @KeywordSourceId,  @StoriesSourceId,@DateRequestLatest  

 
WHILE @@FETCH_STATUS = 0  
BEGIN  
	
	SELECT 
      [NewItemsCount]
      ,[TotalItemsCount]
      ,[DateRequest]
	  ,ROW_NUMBER() OVER(ORDER BY [DateRequest] ) AS RowNumber
		INTO #tFreq
  FROM [testEY].[dbo].[cg_RequestItems]
  WHERE 
  KeywordSourceId=@KeywordSourceId AND	
  StoriesSourceId=@StoriesSourceId AND 
  [NewItemsCount]>=0

	 IF EXISTS(select name from tempdb..sysobjects  where name like '#stat%')
	 BEGIN 
			 INSERT INTO #stat (KeywordSourceId,StoriesSourceId,DateRequestLatest,MinPerNews)
			 SELECT @KeywordSourceId as KeywordSourceId,@StoriesSourceId as StoriesSourceId,@DateRequestLatest as DateRequestLatest,AVG( [minutes]/[NewItemsCount] ) MinPerNews
			 FROM
			 (
				SELECT c.[NewItemsCount], c.[DateRequest] , p.[DateRequest] PrevDateReuest,
				DATEDIFF(mi,p.[DateRequest],c.[DateRequest]) [minutes]
				FROM #tFreq c
				LEFT OUTER JOIN #tFreq p
				ON c.RowNumber=p.RowNumber+1
				WHERE c.[NewItemsCount]>0
			 ) t
	 END
	 ELSE
	 BEGIN
			 SELECT @KeywordSourceId as KeywordSourceId,@StoriesSourceId as StoriesSourceId,@DateRequestLatest as DateRequestLatest,AVG( [minutes]/[NewItemsCount] ) MinPerNews INTO #stat
			 FROM
			 (
				SELECT c.[NewItemsCount], c.[DateRequest] , p.[DateRequest] PrevDateReuest,
				DATEDIFF(mi,p.[DateRequest],c.[DateRequest]) [minutes]
				FROM #tFreq c
				LEFT OUTER JOIN #tFreq p
				ON c.RowNumber=p.RowNumber+1
				WHERE c.[NewItemsCount]>0
			 ) t
	 
	 END
 
--

	
	drop table #tFreq
	 
	FETCH NEXT FROM cRequestItem INTO @KeywordSourceId,  @StoriesSourceId,@DateRequestLatest  

END  

CLOSE cRequestItem  
DEALLOCATE cRequestItem 
	
 

SELECT StoriesSourceId,KeywordSourceId,DATEADD(mi,NextRequestInMin, DateRequestLatest)  NextRequestTime
FROM
(

SELECT KeywordSourceId,StoriesSourceId,DateRequestLatest,
CASE WHEN NextRequestInMin=0 THEN @DefaultMin ELSE
CASE WHEN NextRequestInMin<@MinMin THEN @MinMin ELSE
CASE WHEN NextRequestInMin>@MaxMin THEN @MaxMin ELSE NextRequestInMin 
END
END
END as 	NextRequestInMin		
		
FROM
(

SELECT     s.KeywordSourceId,s.StoriesSourceId, s.DateRequestLatest, ISNULL(s.MinPerNews,0) * @MinNewStories as NextRequestInMin
FROM      
#stat s
) t1
) t2
order by NextRequestInMin desc
--WHERE DATEADD(mi,NextRequestInMin, DateRequestLatest) >GETDATE()




END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetRequestItems]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[cg_sp_GetRequestItems]
	@RequestSourceId int,
	@IsPrev bit =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	if(@IsPrev=1)
	BEGIN
	
		SELECT @RequestSourceId=MAX([RequestSourceId]) 
		 FROM 
	[dbo].[cg_RequestItems] t
	INNER JOIN
	(

	SELECT 
		  [KeywordSourceId]
		  ,[StoriesSourceId]

	  FROM [dbo].[cg_RequestItems]
	  WHERE [RequestSourceId]=@RequestSourceId
	  ) c
	  ON t.[KeywordSourceId]=c.[KeywordSourceId]
		  AND t.[StoriesSourceId]=c.[StoriesSourceId]
   WHERE  t.[RequestSourceId]<>@RequestSourceId
	
	
	
	
	END
	
	
	

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[cg_RequestItems]
	 WHERE [RequestSourceId]=@RequestSourceId
	 
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetNonExtractedContentUrl]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_sp_GetNonExtractedContentUrl]
	 
AS
BEGIN
	 SELECT *
  FROM [dbo].[cg_ContentUrls]
  WHERE [DateExtracted] IS NULL
 
   
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetHowManyStoryPerMinute]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 exec cg_sp_GetHowManyStoryPerMinute
*/
CREATE PROCEDURE  [dbo].[cg_sp_GetHowManyStoryPerMinute]
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
   
declare @KeywordSourceId int
declare @StoriesSourceId int


  
  
 declare @stat TABLE (KeywordSourceId int
      ,StoriesSourceId int
      ,MinPerNews int
      )
 --DECLARE @tFreq TABLE ([NewItemsCount] int
 --     ,[TotalItemsCount]int
 --     ,[DateRequest] DATETIME
 --     ,RowNumber int
 --     ,KeywordSourceId int
 --     ,StoriesSourceId int
 --     )
      
DECLARE cRequestItem CURSOR FOR  
SELECT KeywordSourceId, StoriesSourceId 
FROM [testEY].[dbo].[cg_RequestItems] group by KeywordSourceId,StoriesSourceId

 

OPEN cRequestItem  
FETCH NEXT FROM cRequestItem INTO @KeywordSourceId,  @StoriesSourceId  

 
WHILE @@FETCH_STATUS = 0  
BEGIN  
	
	--print 'KeywordSourceId='+ cast(@KeywordSourceId as varchar)+'  StoriesSourceId='+ cast(@StoriesSourceId as varchar)
	 
	 
 
SELECT 
      [NewItemsCount]
      ,[TotalItemsCount]
      ,[DateRequest]
		, ROW_NUMBER() OVER(ORDER BY [DateRequest] ) AS RowNumber
		,KeywordSourceId
		,StoriesSourceId
		INTO #tFreq
  FROM [dbo].[cg_RequestItems]
  WHERE 
  KeywordSourceId=@KeywordSourceId AND	StoriesSourceId=@StoriesSourceId AND 
  [NewItemsCount]>=0

 
 
INSERT INTO @stat (KeywordSourceId,StoriesSourceId,MinPerNews)
SELECT @KeywordSourceId as KeywordSourceId,@StoriesSourceId as StoriesSourceId,AVG( [minutes]/[NewItemsCount] ) MinPerNews
FROM
(

SELECT c.[NewItemsCount], c.[DateRequest] , p.[DateRequest] PrevDateReuest,
DATEDIFF(mi,p.[DateRequest],c.[DateRequest]) [minutes]

 FROM #tFreq c
 LEFT OUTER JOIN #tFreq p
 ON c.RowNumber=p.RowNumber+1
 WHERE c.[NewItemsCount]>0
 ) t
	
	drop table #tFreq
	 
	FETCH NEXT FROM cRequestItem INTO @KeywordSourceId,  @StoriesSourceId  

END  

CLOSE cRequestItem  
DEALLOCATE cRequestItem 


select * from @stat order by MinPerNews desc
  
  
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetEditedStories]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
dbo.cg_sp_GetEditedStories 0,2,4
*/
CREATE PROCEDURE [dbo].[cg_sp_GetEditedStories]
 @LimitDifference int =0,
 @top int=20,
 @skip int=0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
DECLARE @ret TABLE ( StoryId int, ContentUrlId int, rowNumber int)
IF @LimitDifference = 0
BEGIN
	INSERT INTO @ret (StoryId,ContentUrlId,rowNumber)
	SELECT [StoryId], [ContentUrlId],ROW_NUMBER() OVER (ORDER BY [StoryId] desc) AS rowNumber   
	FROM [testEY].[dbo].[cg_Stories]
END
ELSE
BEGIN
INSERT INTO @ret (StoryId,ContentUrlId,rowNumber)
SELECT [StoryId], [ContentUrlId],ROW_NUMBER() OVER (ORDER BY [StoryId] desc) AS rowNumber   
	FROM [testEY].[dbo].[cg_Stories]
   WHERE ISNULL([Similarity],0)<@LimitDifference
END
  
		 
		 
 select * INTO #tmp from @ret WHERE rowNumber BETWEEN @skip+1 AND @skip+@top
 
SELECT s.*  
	FROM [testEY].[dbo].[cg_Stories] 
		as s INNER JOIN #tmp as r on s.StoryId=r.StoryId
			ORDER BY [DateUpdated] desc
		
		DECLARE @RC INT
		SET @RC=@@RowCount
		
   SELECT s.ContentUrlId,s.TitleExtracted,s.ContentExtracted 
		FROM [testEY].[dbo].[cg_ContentUrls] as s INNER JOIN #tmp as r on s.ContentUrlId=r.ContentUrlId
			where s.isExtractable=1
	
 SELECT COUNT(*) RecordsTotal, @skip+1 recordFirst,  @skip+@top recordLast, @RC recordCount
		FROM @ret
		
	drop table #tmp
  
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlsToCalculateSimilarity]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  select top 10 * from cg_ContentUrls 	order by ContentUrlId
*/
CREATE PROCEDURE [dbo].[cg_sp_GetContentUrlsToCalculateSimilarity]
	 @top int = 500
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--  
		DECLARE @latest TABLE (id int)
		
		
		INSERT INTO @latest(id)
		SELECT  TOP(@top)  ContentUrlId
		FROM         cg_ContentUrls
		WHERE    (isExtractable = 1)
		AND ISNULL(isSimularityCalc ,0)=0
		AND
		CASE WHEN pubDate IS NULL THEN DateExtracted ELSE pubDate END  > GETDATE() - 3
		
 

		SELECT    ContentUrlId,   TitleExtracted, ContentExtracted
		FROM         cg_ContentUrls cu
		INNER JOIN @latest l
		ON cu.ContentUrlId=l.id
		order by ContentUrlId desc
		
				 
			select DISTINCT ContentUrlId,ContentUrlIdRelated   FROM cg_ContentUrlsRelations cur
			INNER JOIN @latest l
			ON cur.ContentUrlId=l.id
		--	OR cur.ContentUrlIdRelated=l.id
   
		
 


END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlImages]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 
  exec [dbo].[cg_sp_GetContentUrlImages]
      
  select count(*) as cnt from cg_ContentUrlImages WHERE [ImageHash] IS NULL
  select *  from cg_ContentUrlImages  WHERE ImageHash IS NULL 
  
    
 */
 
CREATE PROCEDURE [dbo].[cg_sp_GetContentUrlImages]
	 @top int=100
AS
BEGIN
	     SELECT  top (@top)   [ImageId]
      ,[ContentUrlId] 
      ,[ImageAlt]
      ,[ImageHash]
      ,[DownloadTime]
          ,CASE WHEN CHARINDEX ('http:',ImageSrc) =1 THEN ImageSrc
          ELSE
			(
			SELECT    SUBSTRING(MAX(Url),0,CHARINDEX('/', MAX(Url), 10))  + ImageSrc
			FROM         cg_ContentUrls
			WHERE     (ContentUrlId = cui.ContentUrlId)
			)
          END as ImageSrc 
FROM         cg_ContentUrlImages cui
WHERE     (DownloadTime IS NULL)    
 
   
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlDomainStats]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

  exec dbo.cg_sp_GetContentUrlDomainStats -300

*/
CREATE PROCEDURE [dbo].[cg_sp_GetContentUrlDomainStats]
	@LastDay int  = 30
AS
BEGIN
	
  SET @LastDay = @LastDay * -1
  select  dbo.parseURL(Url) domain, ISNULL(statusid,0) as statusid  INTO #tmp 
  from  [dbo].[cg_ContentUrls]  where DateExtracted > dateadd(day,@LastDay,getdate())
  
  SELECT 
       	  domain,  statusid, COUNT(statusid) cnt      	 
  FROM  #tmp
  group by  domain, statusid
  order by domain ,statusid

  drop table #tmp
   
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlByID]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_sp_GetContentUrlByID]
	@ContentUrlId int 
AS
BEGIN
	 SELECT *,dbo.parseURL(Url) domain FROM [dbo].[cg_ContentUrls]  WHERE ContentUrlId=@ContentUrlId
	 
	 SELECT * FROM [dbo].[cg_ContentUrlImages] WHERE ContentUrlId=@ContentUrlId
 
   
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetAllStoriesSourceStat]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 exec dbo.cg_sp_GetAllStoriesSourceStat 30

*/
CREATE PROCEDURE [dbo].[cg_sp_GetAllStoriesSourceStat]
	 
	@LastDay int = 30
AS
BEGIN
  
SET @LastDay=@LastDay*-1
SELECT StoriesSourceId, StatusId, COUNT(*) cnt INTO #tmp
FROM(
SELECT DISTINCT ISNULL(cg_ContentUrls.StatusId, 0) AS StatusId, cg_ContentUrls.ContentUrlId, cg_RequestItems.StoriesSourceId
FROM         cg_ContentUrls INNER JOIN
                      cg_ContentUrlRequestRelation ON cg_ContentUrls.ContentUrlId = cg_ContentUrlRequestRelation.ContentUrlId INNER JOIN
                      cg_RequestItems ON cg_ContentUrlRequestRelation.RequestSourceId = cg_RequestItems.RequestSourceId
WHERE     (cg_ContentUrls.isExtractable = 1) AND (CAST(ISNULL(cg_ContentUrls.pubDate, cg_ContentUrls.DateExtracted) AS date) > CAST(DATEADD(day, @LastDay, GETDATE()) AS date))
                      
                      ) t
                      GROUP BY StoriesSourceId, StatusId
 
 select t.*,s.Content,s.IsActive from #tmp t inner join cg_StoriesSource s on  t.StoriesSourceId = s.StoriesSourceId
                      
 drop table #tmp
                      
                      
   
END
GO
/****** Object:  StoredProcedure [dbo].[ga_sp_PageViewSave]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ga_sp_PageViewSave]
	@Date date,
	@ProfileId int,
	@PageViews as  dbo.ga_tt_PageViews READONLY

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	INSERT INTO dbo.ga_Pages (ProfileId,PagePath,[Hash])
	SELECT distinct n.ProfileId,n.PagePath,HASHBYTES('SHA1',n.PagePath)
	FROM @PageViews n LEFT OUTER JOIN dbo.ga_Pages p
	ON n.ProfileId=p.ProfileID AND  HASHBYTES('SHA1',n.PagePath)=p.[Hash]
	WHERE p.PageId IS NULL
	

 
		
		
	INSERT INTO  [dbo].[ga_PageViews]
           (
           [PageDate]
           ,[PageHour]
           ,[PageViews]
           ,[PageId])
    SELECT n.[PageDate]
           ,n.[PageHour]
           ,n.[PageViews]
           ,p.PageId
            FROM @PageViews n INNER JOIN dbo.ga_Pages p
			ON n.ProfileId=p.ProfileID AND HASHBYTES('SHA1',n.PagePath)=p.[Hash]
    
    IF NOT EXISTS (
			SELECT  [ProfileId]
				  ,[DateExtracted]
			  FROM [dbo].[ga_DatesExtracted]
			  WHERE [DateExtracted]=@Date AND [ProfileId] = @ProfileId
			  )
  BEGIN
	INSERT INTO [dbo].[ga_DatesExtracted] ( [ProfileId]				  ,[DateExtracted])
	VALUES (@ProfileId,@Date)
  
  END
 
  
END
GO
/****** Object:  StoredProcedure [dbo].[ga_sp_GetProfileIdDates]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec ga_sp_GetProfileIdDates '20130105'

CREATE PROCEDURE [dbo].[ga_sp_GetProfileIdDates]
	@StartDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT     ga_Sites.ProfileId,
    MAX(CASE WHEN ga_DatesExtracted.DateExtracted IS NULL THEN @StartDate ELSE DATEADD(DAY,  1,  ga_DatesExtracted.DateExtracted ) END) StartDate
    FROM         ga_Sites LEFT OUTER JOIN
                      ga_DatesExtracted ON ga_Sites.ProfileId = ga_DatesExtracted.ProfileId
                      
                      
                      GROUP BY ga_Sites.ProfileId
                      
                      
END
GO
/****** Object:  UserDefinedFunction [dbo].[InsertLinkFuzzyTemplate]    Script Date: 04/04/2014 12:35:18 ******/
CREATE FUNCTION [dbo].[InsertLinkFuzzyTemplate](@html [nvarchar](max), @keyword [nvarchar](max), @linkTemplate [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[InsertLinkFuzzyTemplate]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzyTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'36' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzyTemplate'
GO
/****** Object:  UserDefinedFunction [dbo].[InsertLinkFuzzy]    Script Date: 04/04/2014 12:35:17 ******/
CREATE FUNCTION [dbo].[InsertLinkFuzzy](@html [nvarchar](max), @linkText [nvarchar](max), @linkHref [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[InsertLinkFuzzy]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzy'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzy'
GO
/****** Object:  UserDefinedFunction [dbo].[HtmlToText]    Script Date: 04/04/2014 12:35:16 ******/
CREATE FUNCTION [dbo].[HtmlToText](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[HtmlToText]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'HtmlToText'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'71' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'HtmlToText'
GO
/****** Object:  UserDefinedFunction [dbo].[GetImagesFromHtml]    Script Date: 04/04/2014 12:35:15 ******/
CREATE FUNCTION [dbo].[GetImagesFromHtml](@html [nvarchar](max))
RETURNS  TABLE (
	[FileName] [nvarchar](1000) NULL,
	[Caption] [nvarchar](1000) NULL,
	[Src] [nvarchar](1000) NULL,
	[ImageIndex] [int] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[GetImagesFromHtml]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'GetImagesFromHtml'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'91' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'GetImagesFromHtml'
GO
/****** Object:  StoredProcedure [dbo].[GetContentUrls]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 GetContentUrls 300,100
 **/
 
 
create PROCEDURE [dbo].[GetContentUrls]  
	@skip int=0,
    @top int=100
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;





SELECT ContentUrlId, 
ROW_NUMBER() OVER (ORDER BY ContentUrlId desc) AS rowNumber  
INTO #tmp
FROM  [dbo].[cg_ContentUrls] 


SELECT c.ContentUrlId,
c.isExtractable,
c.TitleExtracted,
c.HtmlExtracted,
c.ContentExtracted,
t.rowNumber
FROM  [dbo].[cg_ContentUrls] c inner join #tmp  t on c.ContentUrlId=t.ContentUrlId
WHERE rowNumber BETWEEN @skip+1 AND @skip+@top


drop table  #tmp


END
GO
/****** Object:  StoredProcedure [dbo].[geo_sp_GetLocationItems]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

--Get Countries
exec geo_sp_GetLocationItems

--Get States(for US & CA) or Cities
exec geo_sp_GetLocationItems 'us'
exec geo_sp_GetLocationItems 'fr'

-- Get US Cities
exec geo_sp_GetLocationItems 'us','ny'


*/


CREATE PROCEDURE [dbo].[geo_sp_GetLocationItems]
	 @CountryValue char(2) ='',
	@RegionValue char(2) =''

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;






--Countries
IF @CountryValue='' AND @RegionValue=''
BEGIN
	SELECT   distinct  ccn.countryName  [Text], cl.country Value
	 FROM dbo.geo_IPCityLocation  cl
	INNER JOIN dbo.geo_CountryCodeName as ccn on 
	cl.Country = ccn.CountryCode
	WHERE cl.country>='ad'
	order by [Text]

END
ELSE-- @CountryValue='' AND @RegionValue=''
BEGIN
	--Get records for countries
	IF @CountryValue<>''  AND @RegionValue=''
	BEGIN
		--USA and canada
		IF @CountryValue='US' OR @CountryValue='CA'
		BEGIN
			--get states (regions)
		  SELECT DISTINCT region [Text], region Value
		  FROM [dbo].[geo_IPCityLocation]
		  where [country] = @CountryValue
		  AND region>'a'
		  order by region
		
		END
		ELSE
		BEGIN
			--For international get Cities
		SELECT [city] as [Text], [locId] Value
		FROM(
		SELECT [locId]
		      ,[city]
		      ,ROW_NUMBER() OVER 
		      (PARTITION BY [city] ORDER BY [postalCode],[locId] ) rowNumber
		  FROM [testEY].[dbo].[geo_IPCityLocation]
		  WHERE [country]=@CountryValue
		--  AND [region]=@RegionValue
		  AND City<>''
		) t
		WHERE rowNumber=1
		
		END--IF @CountryValue='US' OR @CountryValue='CA'
		
		

	
	END
	

END


		IF @CountryValue<>''  AND @RegionValue<>''
		BEGIN
			SELECT [city] as [Text], [locId] Value
			FROM(
			SELECT [locId]
				  ,[city]
				  ,ROW_NUMBER() OVER 
				  (PARTITION BY [city] ORDER BY [postalCode],[locId] ) rowNumber
			  FROM [testEY].[dbo].[geo_IPCityLocation]
			  WHERE [country]=@CountryValue
			  AND [region]=@RegionValue
			  AND City<>''
			) t
			WHERE rowNumber=1
		
		END -- IF @CountryValue<>''  AND @RegionValue<>''











END
GO
/****** Object:  StoredProcedure [dbo].[geo_sp_GetGeoIPLocation]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

--Get Countries
exec geo_sp_GetLocationItems

--Get States(for US & CA) or Cities
exec geo_sp_GetLocationItems 'us'
exec geo_sp_GetLocationItems 'fr'

-- Get US Cities
exec geo_sp_GetLocationCountryStateCity 2630


*/


create PROCEDURE [dbo].[geo_sp_GetGeoIPLocation]
	 @locID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 SELECT        * 
FROM         geo_IPCityLocation  
WHERE     (geo_IPCityLocation.locId = @locID)


END
GO
/****** Object:  StoredProcedure [dbo].[geo_sp_GetAllBrand]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

--Get Countries
exec geo_sp_GetLocationItems

--Get States(for US & CA) or Cities
exec geo_sp_GetLocationItems 'us'
exec geo_sp_GetLocationItems 'fr'

-- Get US Cities
exec geo_sp_GetLocationCountryStateCity 2630


*/


CREATE PROCEDURE [dbo].[geo_sp_GetAllBrand]
 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [BrandId]
      ,[Brand]
  FROM [testEY].[dbo].[med_Brands]
  order by Brand


END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_FillProductImageForCompanyLogo]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[med_sp_FillProductImageForCompanyLogo]
	 @numberOfProductImagePerCompany int = 3
AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO [testEY].[dbo].[med_Images]
           ([ItemType]
           ,[ItemID]
           ,[FileHash]
           ,[FileName]
           ,[Type])
  
SELECT 1,CompanyId,FileHash,[FileName],'product'
FROM (
SELECT     nimg.CompanyId AS CompanyId, med_ProductImages.ProductImageID, med_ProductImages.ContentType, med_ProductImages.FileName, 
                      med_ProductImages.FileHash,
                      ROW_NUMBER() OVER (PARTITION BY nimg.CompanyId ORDER BY NEWID() DESC) rank
                      
FROM         med_CompanyBrands AS cb INNER JOIN
                          (SELECT     c.CompanyId
                            FROM          med_Companies AS c LEFT OUTER JOIN
                                                       (SELECT     ItemID AS CompanyId
                                                         FROM          med_Images
                                                         WHERE      (ItemType = 1) 
                                                        AND (Type = N'logo' or Type = N'product')
                                                         ) AS himg ON c.CompanyId = himg.CompanyId
                            WHERE      (himg.CompanyId IS NULL)) AS nimg ON cb.CompanyId = nimg.CompanyId INNER JOIN
                      med_Product ON cb.BrandId = med_Product.BrandId INNER JOIN
                      med_ProductImages ON med_Product.ProductID = med_ProductImages.ProductID
                     
                      
                      ) t
                      WHERE rank <= @numberOfProductImagePerCompany   and   
  -- File hash of 'image not available' image
  [FileHash] <>'341714A4C223B6DD1F33B99B3E0B0608C407989D226CCEFCB7C9711C4C16BE35' and 
  [FileHash] <>'F51C02FA61188E449F4516B6D60E0B470B662246E154C7205C5B38DFEA199DFF' and 
  [FileHash] <>'9179CBE0A81A5705C411D423C444BB5DA4E45769941C5F5ADB1760016345238B'  
  
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_CompanySaveOrUpdate]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetCompanyProducts 106386,10
 companyId, string description, string url, string name
 select * from [dbo].[med_Companies] WHERE CompanyId=109099
 select *  FROM  [dbo].[med_CompanyTypeRelations] WHERE CompanyId=106271
 
*/
CREATE PROCEDURE [dbo].[med_sp_CompanySaveOrUpdate]
	@CompanyId int = null,
	@description nvarchar(max),
	@url nvarchar(255),
	@name nvarchar(255),
	@CompanyTypes cg_tt_IntBit readonly,
	@isActive bit 
AS
BEGIN


	IF NOT EXISTS (SELECT CompanyId FROM  [dbo].[med_Companies]  WHERE CompanyId=@CompanyId)
	BEGIN
		IF EXISTS (SELECT CompanyId FROM  [dbo].[med_Companies]  WHERE url=@url)
		BEGIN
			SET @url=@url +'-'+ LEFT(NEWID(),8)
		END
		
		INSERT INTO  [dbo].[med_Companies] (url)
		VALUES(@url) 
		
		SET @CompanyId=SCOPE_IDENTITY() 
	
	END
	 
  
     UPDATE [dbo].[med_Companies]
   SET [Company] = @name
      ,[Description] = @description
      ,[url] = @url
      ,[IsActive] = @isActive
      ,[tmpSource] = 'Manual'
 WHERE CompanyId=@CompanyId
 
 DELETE FROM  [dbo].[med_CompanyTypeRelations]  WHERE CompanyId=@CompanyId
	INSERT INTO [dbo].[med_CompanyTypeRelations]
           ([CompanyTypeId]
           ,[CompanyId])
     select IntValue,@CompanyId FROM @CompanyTypes Where BitValue=1
    
    
    select @CompanyId CompanyId, @url url
 
	 
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_AdminGetProducts]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

  [dbo].[med_sp_AdminGetProducts] '',30,100

*/
CREATE PROCEDURE [dbo].[med_sp_AdminGetProducts]
	@search nvarchar(200)='',
	@top int=20,
	@skip int=0 
	 
AS
BEGIN

	SET NOCOUNT ON;
 -- select top 3 * from  [dbo].[med_Product]
	 select [ProductID],ROW_NUMBER() OVER (ORDER BY  ProductID) AS rowNumber 
	 INTO #tmp from [dbo].[med_Product] where [Title] like '%'+ISNULL(@search,Title)+'%'
	 order by Title
 
	 -- and isActive=1
   
   
   	
	    SELECT *
			 FROM #tmp rf
				INNER join med_Product c ON rf.ProductID=c.ProductID
			WHERE rf.rowNumber BETWEEN @skip+1 AND @skip+@top
		
		DECLARE @RC INT
		SET @RC=@@RowCount
		
		SELECT COUNT(*) RecordsTotal, @skip+1 recordFirst,  @skip+@top recordLast, @RC recordCount
		FROM #tmp 
 
 

 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_AdminGetCompanies]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

  [dbo].[med_sp_AdminGetCompanies] '',30,100

*/
CREATE PROCEDURE [dbo].[med_sp_AdminGetCompanies]
	@search nvarchar(200)='',
	@top int=20,
	@skip int=0 
	 
AS
BEGIN

	SET NOCOUNT ON;
 
	 select [CompanyId],ROW_NUMBER() OVER (ORDER BY  CompanyId) AS rowNumber 
	 INTO #tmp from [dbo].[med_Companies] where [Company] like '%'+ISNULL(@search,Company)+'%'
	 order by Company
 
	 -- and isActive=1
   
   
   	
	    SELECT *
			 FROM #tmp rf
				INNER join med_Companies c ON rf.CompanyId=c.CompanyId
			WHERE rf.rowNumber BETWEEN @skip+1 AND @skip+@top
		
		DECLARE @RC INT
		SET @RC=@@RowCount
		
		SELECT COUNT(*) RecordsTotal, @skip+1 recordFirst,  @skip+@top recordLast, @RC recordCount
		FROM #tmp 
 
 

 
END
GO
/****** Object:  UserDefinedFunction [dbo].[med_sp_GenerateSearchKeywordsPerCompany]    Script Date: 04/04/2014 12:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[med_sp_GenerateSearchKeywordsPerCompany] 
(
    @CompanyId AS Int
)
RETURNS VARCHAR(MAX) AS
BEGIN
 
 		DECLARE @keywords VARCHAR(max)=''

		SELECT @keywords = Company + ' ' + Company 
				--ShortMess(ISNULL(Description ,''),200,350)
				FROM dbo.med_Companies 
		WHERE CompanyId=@CompanyId
		
		
		SELECT DISTINCT @keywords=@keywords + ' ' +  
				
				ISNULL(Country ,'')+' ' +  
				ISNULL(City ,'')+' '
				
				FROM dbo.med_Location
		WHERE CompanyId=@CompanyId


		--SELECT @keywords=@keywords + ' ' +  
		--		ISNULL(Address ,'')+' ' +  
		--		ISNULL(Country ,'')+' ' +  
		--		ISNULL(State ,'') +' ' +  
		--		ISNULL(City ,'')+' ' +  
		--		ISNULL(email ,'')
		--		FROM dbo.med_Location
		--WHERE CompanyId=@CompanyId
 
		
		SELECT @keywords=@keywords + b.Brand+ ' '
			FROM  med_Brands as b INNER JOIN
			med_CompanyBrands as cb ON b.BrandId = cb.BrandId
                      where cb.CompanyId = @CompanyId
	
	return @keywords
	
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_ContentUrlSave]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[cg_sp_ContentUrlSave]
	-- Add the parameters for the stored procedure here
	@RequestSourceId int,
	@ContentUrls as  dbo.cg_tt_ContentUrl READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO cg_ContentUrlRequestRelation(RequestSourceId,ContentUrlId)
   SELECT @RequestSourceId, o.ContentUrlId
   FROM @ContentUrls n
   INNER JOIN cg_ContentUrls o
   ON n.url=o.url
   
   
   DECLARE @ids TABLE (id int)
   
   INSERT INTO cg_ContentUrls (Url, Title,[Description],pubDate)
    OUTPUT INSERTED.ContentUrlId
        INTO @ids
   SELECT  n.Url, n.Title,n.[Description],n.pubDate 
   FROM @ContentUrls n
   LEFT OUTER JOIN cg_ContentUrls o
   ON n.url=o.url
   WHERE o.url IS NULL
   
   INSERT INTO cg_ContentUrlRequestRelation(RequestSourceId,ContentUrlId)
   SELECT @RequestSourceId, id
   FROM @ids 
 
   UPDATE dbo.cg_RequestItems
   SET NewItemsCount=
   (
	   SELECT COUNT(*)
	   FROM @ids
   
   )
   WHERE RequestSourceId=@RequestSourceId
 
   
END
GO
/****** Object:  View [dbo].[med_v_ProductSpecsNamesActive]    Script Date: 04/04/2014 12:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[med_v_ProductSpecsNamesActive]
AS
SELECT     ProductSpecID, SpecName, SpecType, IsActive
FROM         dbo.med_ProductSpecsNames
WHERE     (IsActive = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "med_ProductSpecsNames"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 147
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_ProductSpecsNamesActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_ProductSpecsNamesActive'
GO
/****** Object:  View [dbo].[med_v_ProductCategoriesActive]    Script Date: 04/04/2014 12:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[med_v_ProductCategoriesActive]
AS
SELECT     ProductCategoryID, Category
FROM         dbo.med_ProductCategories
WHERE     (isActive = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "med_ProductCategories"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 127
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_ProductCategoriesActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_ProductCategoriesActive'
GO
/****** Object:  View [dbo].[med_v_LocationActive]    Script Date: 04/04/2014 12:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[med_v_LocationActive]
AS
SELECT     dbo.med_Location.*
FROM         dbo.med_Location
WHERE     (IsActive = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "med_Location"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 14
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_LocationActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_LocationActive'
GO
/****** Object:  View [dbo].[med_v_CompaniesActive]    Script Date: 04/04/2014 12:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[med_v_CompaniesActive]
AS
SELECT     dbo.med_Companies.*
FROM         dbo.med_Companies
WHERE     (IsActive = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "med_Companies"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_CompaniesActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'med_v_CompaniesActive'
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetNearestCompaniesByLocationID]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec med_sp_GetNearestCompaniesByLocationID 2630 ,2,2000,1
CREATE PROCEDURE [dbo].[med_sp_GetNearestCompaniesByLocationID]

	@locationID int,
	@brandID int,
	@TypeId int,
	@top int
AS
BEGIN
 
	 declare 	@latitude float 
	 declare 	@longitude float
	   
	 select @latitude=cast(latitude as  float),@longitude=cast(longitude as float) from dbo.geo_IPCityLocation where locId = @locationID 
  
	  
	SELECT distinct c.CompanyId INTO #companyFound
			FROM        med_Product as p 
				INNER JOIN   med_CompanyBrands as cb ON p.BrandId = cb.BrandId
				INNER JOIN   med_Companies as c ON cb.CompanyId = c.CompanyId
				INNER JOIN   med_CompanyTypeRelations as ctr ON ctr.CompanyId = c.CompanyId 
				 --INNER JOIN   med_CompanyTypes as ct ON ct.CompanyTypeId = ctr.CompanyTypeId  
			  WHERE  p.BrandId = @BrandId 
			  and ctr.CompanyTypeId=@TypeId and c.IsActive=1
			  
	  
	
	
		DECLARE @radius float, @DegToRad float
		SET @DegToRad = 57.29577951
		SET @radius = 25000
		DECLARE @earthCircumference float
		SET @earthCircumference = 6387.7  -- km
	
		  
	
	  DECLARE @loc TABLE (CompanyId int, LocationId int, distance float)
		INSERT INTO @loc(CompanyId , LocationId , distance )
		SELECT  top (@top) l.CompanyId, l.LocationId
		,ROUND(ACOS(SIN(@latitude / 57.2958) * SIN(l.latitude / @DegToRad) + COS(@latitude / @DegToRad) * COS(l.latitude / @DegToRad) * COS(l.longitude / @DegToRad - @longitude / @DegToRad)) * @earthCircumference, 2) AS distance
		FROM         med_Location AS l INNER JOIN
							  med_Companies AS c ON l.CompanyId = c.CompanyId
		WHERE      l.CompanyId  in (select CompanyId from #companyFound)  
				AND (l.latitude >= @latitude - @radius / 111) 
					AND (l.latitude <= @latitude + @radius / 111) 
					AND (l.longitude >= @longitude - @radius / 111) 
					AND (l.longitude <= @longitude + @radius / 111) 
					AND (ISNUMERIC(l.latitude) = 1) AND (ISNUMERIC(l.latitude) = 1) and  l.IsActive=1
		ORDER BY distance
		
		
		IF NOT EXISTS ( SELECT * FROM @loc)
		BEGIN
		
		INSERT INTO @loc(CompanyId , LocationId , distance )
		SELECT  top (@top)  l.CompanyId, l.LocationId, 0 FROM
			#companyFound as  c INNER JOIN med_Location AS l  ON l.CompanyId = c.CompanyId
			where  l.IsActive=1
		
		END
	 


		SELECT    c.* FROM dbo.med_Companies c INNER JOIN 	(SELECT DISTINCT CompanyId,distance
			FROM @loc) l ON c.CompanyId=l.CompanyId
			order by l.distance


		SELECT c.* , l.distance FROM dbo.med_Location c INNER JOIN @loc l ON c.LocationId=l.LocationId


		SELECT    c.* 
			FROM dbo.med_Images c
			INNER JOIN 
			(SELECT DISTINCT CompanyId
			FROM @loc) l
			ON c.ItemId=l.CompanyId and c.ItemType = 1
			
	 
	     drop table  #companyFound
			
	  
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetNearestCompanies]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec med_sp_GetNearestCompanies 28.11721,-15.42225,10
CREATE PROCEDURE [dbo].[med_sp_GetNearestCompanies]
	-- Add the parameters for the stored procedure here
	@latitude float, 
	@longitude float, 
	@top int
AS
BEGIN
	 
	DECLARE @radius float, @DegToRad float
	SET @DegToRad = 57.29577951
	SET @radius = 25000
	DECLARE @earthCircumference float
	SET @earthCircumference = 6387.7  -- km
	
--SELECT     TOP (@top) l.CompanyId, c.Company, c.url,  l.address, l.country, l.state, l.city, 
----, l.latitude
----, l.longitude
--,ROUND(ACOS(SIN(@latitude / 57.2958) * SIN(l.latitude / @DegToRad) + COS(@latitude / @DegToRad) * COS(l.latitude / @DegToRad) * COS(l.longitude / @DegToRad - @longitude / @DegToRad)) * @earthCircumference, 2) AS distance
--FROM         med_Location AS l INNER JOIN
--                      med_Companies AS c ON l.CompanyId = c.CompanyId
--WHERE       (l.latitude >= @latitude - @radius / 111) 
--			AND (l.latitude <= @latitude + @radius / 111) 
--			AND (l.longitude >= @longitude - @radius / 111) 
--			AND (l.longitude <= @longitude + @radius / 111) 
--            AND (ISNUMERIC(l.latitude) = 1) AND (ISNUMERIC(l.latitude) = 1)
--ORDER BY distance



DECLARE @loc TABLE (CompanyId int, LocationId int, distance float)
INSERT INTO @loc(CompanyId , LocationId , distance )
SELECT  top (@top) l.CompanyId, l.LocationId
,ROUND(ACOS(SIN(@latitude / 57.2958) * SIN(l.latitude / @DegToRad) + COS(@latitude / @DegToRad) * COS(l.latitude / @DegToRad) * COS(l.longitude / @DegToRad - @longitude / @DegToRad)) * @earthCircumference, 2) AS distance
FROM         med_Location AS l INNER JOIN
                      med_Companies AS c ON l.CompanyId = c.CompanyId
WHERE       (l.latitude >= @latitude - @radius / 111) 
			AND (l.latitude <= @latitude + @radius / 111) 
			AND (l.longitude >= @longitude - @radius / 111) 
			AND (l.longitude <= @longitude + @radius / 111) 
            AND (ISNUMERIC(l.latitude) = 1) AND (ISNUMERIC(l.latitude) = 1)
ORDER BY distance
 
  

SELECT    c.* 
FROM dbo.med_Companies c
INNER JOIN 
(SELECT DISTINCT CompanyId
FROM @loc) l
ON c.CompanyId=l.CompanyId


SELECT c.* , l.distance
FROM dbo.med_Location c
INNER JOIN @loc l
ON c.LocationId=l.LocationId

 



END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetGeoInformationByIPAddress]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- exec med_sp_GetGeoInformationByIPAddress  '144.223.128.25'
-- =============================================
CREATE PROCEDURE [dbo].[med_sp_GetGeoInformationByIPAddress]
	@IP4Address nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @MyIP bigint
	set @MyIP =dbo.IPToBINT(@IP4Address)
     
  --SET @MyIP =2921648058 
  
  SELECT  cl.locID,ccn.countryName,cl.city
   FROM dbo.geo_IPCityBlocks as cb 
	INNER JOIN  dbo.geo_IPCityLocation as cl on cb.locId = cl.locID
	INNER JOIN dbo.geo_CountryCodeName as ccn on cl.Country = ccn.CountryCode  
	INNER JOIN dbo.geo_CountryCodeRegion as ccr on cl.Region = ccr.RegionCode  
   WHERE @MyIP >startIpNum and @MyIP < endIpNum
  

  END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetFilteredCompanies]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [med_sp_GetFilteredCompanies] 'Distributors','Foruno',NULL,NULL,NULL
CREATE PROCEDURE [dbo].[med_sp_GetFilteredCompanies]
	-- Add the parameters for the stored procedure here
	@CompanyType varchar(200) = NULL, 
	@Brand  varchar(200) = NULL, 
	@Country nvarchar(255) = NULL,
	@State nvarchar(255) = NULL, 
	@City nvarchar(255) = NULL  
AS
BEGIN

	 SELECT     c.CompanyId, c.Company, c.tmpCompKey, c.tmpSource, l.country,l.state,l.city, t.type, b.brand
		 FROM         med_Companies AS c INNER JOIN  
                      med_Location AS l ON c.CompanyId = l.CompanyId INNER JOIN
                      med_CompanyTypeRelations AS rt ON c.CompanyId = rt.CompanyId INNER JOIN
                      med_CompanyTypes AS t ON rt.CompanyTypeId = t.CompanyTypeId INNER JOIN
                      med_CompanyBrands as cb ON rt.CompanyId = cb.CompanyId INNER JOIN
                      med_Brands as b ON cb.BrandId = b.BrandId
      WHERE 
      t.Type = COALESCE(@CompanyType,   t.Type)  
      AND b.Brand  LIKE  '%' + ISNULL(@Brand,  b.Brand )+ '%'  
      AND l.country = COALESCE(@Country,   l.country)  
      AND l.state = COALESCE(@State,   l.state)  
      AND l.city = COALESCE(@City,   l.city)  
      order by c.Company
     
        
	   
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetFeaturedProducts]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---   exec dbo.med_sp_GetFeaturedProducts 10
CREATE PROCEDURE [dbo].[med_sp_GetFeaturedProducts]
	@top int
	 
AS
BEGIN

	SET NOCOUNT ON;
	
	 SELECT     TOP (@top) med_Product.ProductID
		INTO #tmp	FROM         med_FeaturedItems INNER JOIN
		med_Product ON med_FeaturedItems.ItemId = med_Product.ProductID
		where med_FeaturedItems.ItemType = 2
		order by NEWID()
                      
		select  *  from dbo.med_ProductImages as p inner join #tmp as t on p.ProductID =t.ProductID  
  
		
		select  *  from dbo.med_Product  as p inner join #tmp as t on p.ProductID =t.ProductID  
		order by p.Title
		
		drop table #tmp
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetFeaturedCompanies]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---   exec dbo.med_sp_GetFeaturedCompanies 10
CREATE PROCEDURE [dbo].[med_sp_GetFeaturedCompanies]
	@top int
	 
AS
BEGIN
 
	SET NOCOUNT ON;
	
	 SELECT     TOP (@top) med_Companies.CompanyId INTO #tmp
	 	FROM         med_FeaturedItems INNER JOIN
		med_Companies ON med_FeaturedItems.ItemId = med_Companies.CompanyId
		where med_FeaturedItems.ItemType = 1 and med_Companies.IsActive = 1
		order by NEWID()
		
		
		select  *  from dbo.med_Images as p inner join #tmp as t on p.ItemId = t.CompanyId  
		
 
		select  *  from dbo.med_Companies  as p inner join #tmp as t on p.CompanyId =t.CompanyId  
		order by p.Company
		
		drop table #tmp
		
     
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetCompanyProducts]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetCompanyProducts 106386,10
 
*/
CREATE PROCEDURE [dbo].[med_sp_GetCompanyProducts]
	@CompanyId int,
	@top int
AS
BEGIN
	 
	SET NOCOUNT ON;
 
			SELECT  TOP(@top)   med_Product.ProductID
			INTO #relatedProducts
FROM         med_CompanyBrands INNER JOIN
                  med_Product ON med_CompanyBrands.BrandId = med_Product.BrandId
WHERE     (med_CompanyBrands.CompanyId = @CompanyId) ORDER BY NEWID()
			
 	 
	select  *  from dbo.med_ProductImages where productId in   (select ProductID from #relatedProducts)
				
	select  * from dbo.med_Product where ProductID in (select ProductID from #relatedProducts)

	 
	drop table #relatedProducts
	 
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetCompanyByUrl]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec med_sp_GetCompanyByUrl raymarine,3
CREATE PROCEDURE [dbo].[med_sp_GetCompanyByUrl]
	@url nvarchar(200)='' 
AS
BEGIN

	SET NOCOUNT ON;
	declare @companyId int
	
	select  @companyId = companyId  from dbo.med_Companies where url =@url 
	
	select  *  from dbo.med_Companies where companyId = @companyId 
	select  *  from dbo.med_Location where companyId = @companyId and IsActive=1
	
	select MI.* from dbo.med_Images as MI where MI.ItemType = 1 and MI.ItemId = @companyId
		
	select * from dbo.med_CompanyTypeRelations where companyId = @companyId
	 
	 
	 SELECT     med_Brands.*
FROM         med_Brands INNER JOIN
                      med_CompanyBrands ON med_Brands.BrandId = med_CompanyBrands.BrandId INNER JOIN
                      med_Companies ON med_CompanyBrands.CompanyId = med_Companies.CompanyId
                      where med_Companies.CompanyId=@companyId
					
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetCompanyBrands]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[med_sp_GetCompanyBrands]
	-- Add the parameters for the stored procedure here
	@CompanyId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT   med_Brands.BrandId,med_Brands.Brand 
		FROM         med_Brands INNER JOIN
							  med_CompanyBrands ON med_Brands.BrandId = med_CompanyBrands.BrandId
		WHERE     (med_CompanyBrands.CompanyId = @CompanyId)

END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetAutoCompleteItems]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[med_sp_GetAutoCompleteItems]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM (
		SELECT DISTINCT Company as Title, 1 AS ItemTypeId
			FROM         med_Companies where IsActive=1
	UNION
		SELECT DISTINCT Title as Title, 2 AS ItemTypeId
			FROM         med_Product where IsActive=1
		 UNION
	 SELECT DISTINCT Title as Title, 32 AS ItemTypeId
			FROM         med_Search		where ItemType=32
	) as t 
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SaveImage]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- select * from  dbo.med_Images where [ItemID]=106267
-- exec med_sp_GetCompanyByUrl raymarine,3
CREATE PROCEDURE [dbo].[med_sp_SaveImage]
	@ItemType nvarchar(255)='',	
	@ItemID int ,
	@fileHash nvarchar(255)='',	
	@FileName nvarchar(255)='',	
	@Type nvarchar(255)=''
AS
BEGIN
 
	SET NOCOUNT ON;
	IF @Type ='logo' and EXISTS (Select [ItemID] From dbo.med_Images WHERE  ItemType = @ItemType and  ItemId = @ItemID and  Type='logo')
	BEGIN
		DELETE FROM dbo.med_Images WHERE  ItemType = @ItemType and  ItemId = @ItemID and  Type='logo'
	END
 
 INSERT INTO [dbo].[med_Images]
           ([ItemType]
           ,[ItemID]
           ,[FileHash]
           ,[FileName]
           ,[Type])
     VALUES
           (@ItemType
           ,@ItemID
           ,@FileHash
           ,@FileName
           ,@Type)
           
 
	-- Update dbo.med_Images  set Type=@OldType Where  ItemType = 1 and  ItemId = @companyId  and FileHash <> @fileHash
	-- Update dbo.med_Images  set Type=@NewType Where FileHash = @fileHash
	
	 
					
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SaveCompanyBrand]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetCompanyProducts 106386,10
 companyId, string description, string url, string name
 select * from [dbo].[med_Companies] WHERE CompanyId=109099
 select *  FROM  [dbo].[med_CompanyTypeRelations] WHERE CompanyId=106271
 
*/
CREATE PROCEDURE [dbo].[med_sp_SaveCompanyBrand]
	@BrandName nvarchar(255) ,
	@CompanyId int
	
AS
BEGIN
	DECLARE @BrandId int

	IF EXISTS (select * from med_Brands where Brand=@BrandName)
	BEGIN
		select @BrandId =BrandId from med_Brands where Brand=@BrandName
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[med_Brands]
           ([Brand])
     VALUES
           (@BrandName)
		SELECT @BrandId = SCOPE_IDENTITY()
	END

	INSERT INTO  [dbo].[med_CompanyBrands]
			   ([CompanyId]
			   ,[BrandId])
		 VALUES (@CompanyId,@BrandId)
	 
	SET NOCOUNT ON;
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SaveBrand]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetCompanyProducts 106386,10
 companyId, string description, string url, string name
 select * from [dbo].[med_Companies] WHERE CompanyId=109099
 select *  FROM  [dbo].[med_CompanyTypeRelations] WHERE CompanyId=106271
 
*/
CREATE PROCEDURE [dbo].[med_sp_SaveBrand]
	@BrandName nvarchar(255) 
	
AS
BEGIN
	DECLARE @BrandId int

	IF EXISTS (select * from med_Brands where Brand=@BrandName)
	BEGIN
		select @BrandId =BrandId from med_Brands where Brand=@BrandName
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[med_Brands]
           ([Brand])
     VALUES
           (@BrandName)
		SELECT @BrandId = SCOPE_IDENTITY()
	END

	 
		select @BrandId  as BrandId
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_ProductSpecValueSaveorUpdate]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetCompanyProducts 106386,10
 companyId, string description, string url, string name
 select * from [dbo].[med_Companies] WHERE CompanyId=109099
 select *  FROM  [dbo].[med_CompanyTypeRelations] WHERE CompanyId=106271
 
*/
CREATE PROCEDURE [dbo].[med_sp_ProductSpecValueSaveorUpdate]
	@ProductId int = null,
	@ProductSpecId int,
	@SpecName nvarchar(255),
	@SpecValue nvarchar(max),
	@Type int,
	--@IsActive bit,
	@ValueMin  float,
	@ValueMax float,
	@ValueString nvarchar(max),
	@groupName nvarchar(max),
	@measurement nvarchar(max),
	@listItems med_tpt_ProductSpecList readonly 
	
AS
BEGIN

	IF NOT EXISTS (SELECT [ProductSpecID]  FROM  [dbo].[med_ProductSpecsNames] where [SpecName]=@SpecName)
	BEGIN
		SET NOCOUNT ON;
		INSERT INTO  [dbo].[med_ProductSpecsNames]
           ([SpecName]
           ,[SpecType]
           ,[IsActive]
           ,[IsFullTextSearch])
     VALUES
           (@SpecName
           ,@Type
           ,1
           ,1)
           
       set @ProductSpecId = SCOPE_IDENTITY()    
	END
	ELSE 
	BEGIN
			SELECT @ProductSpecId=[ProductSpecID]  FROM  [dbo].[med_ProductSpecsNames] where [SpecName]=@SpecName
			
			--UPDATE  [dbo].[med_ProductSpecsNames]
		 --  SET [IsActive] = @IsActive
			--WHERE [ProductSpecID]=@ProductSpecId
 
	END
	
	IF NOT EXISTS (SELECT [ProductSpecID]  FROM  [dbo].[med_ProductSpecValues] where ProductSpecID=@ProductSpecId and [ProductID]=@ProductId)
	BEGIN 
			
	INSERT INTO [dbo].[med_ProductSpecValues]
           ([ProductID]
           ,[ProductSpecID]
           ,[ValueOriginal]
           ,[SpecGroup])
     VALUES
           (@ProductId
           ,@ProductSpecId
           ,@SpecValue
           ,@groupName )
           
	END
  ELSE 
  BEGIN
  
	  UPDATE  [dbo].[med_ProductSpecValues]
	   SET  [ValueOriginal] =  @SpecValue
	  WHERE  [ProductID]=@ProductId and [ProductSpecID]=@ProductSpecId
 
  
  END
  
	IF (@Type = 2 )  -- List 
	BEGIN
	
		DELETE FROM  [dbo].[med_ProductSpecList]  WHERE [ProductID]=@ProductId and [ProductSpecID]=@ProductSpecId
		 INSERT INTO [dbo].[med_ProductSpecList]
			   ([ProductID]
			   ,[ProductSpecID]
			   ,[Value])
		 SELECT [ProductID],[ProductSpecID],[Value] FROM @listItems
      
	END ELSE IF (@Type = 32 )  -- Range
	BEGIN
	
		UPDATE  [dbo].[med_ProductSpecValues]
		SET  [ValueMin] = @ValueMin
		   ,[ValueMax] = @ValueMax
		WHERE [ProductID]=@ProductId and [ProductSpecID]=@ProductSpecId
	
	END ELSE IF (@Type = 16 )  -- Numbers
	BEGIN
	
		UPDATE  [dbo].[med_ProductSpecValues]
		SET  [ValueMin] = @ValueMin
		   ,[ValueMax] = 0
		WHERE [ProductID]=@ProductId and [ProductSpecID]=@ProductSpecId
	
	END ELSE IF (@Type = 1 )  -- String
	BEGIN
		
		UPDATE  [dbo].[med_ProductSpecValues]
		SET  [ValueString] = @SpecValue
		WHERE [ProductID]=@ProductId and [ProductSpecID]=@ProductSpecId
	
	END
	
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_ProductSaveOrUpdate]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetCompanyProducts 106386,10
 companyId, string description, string url, string name
 select * from [dbo].[med_Companies] WHERE CompanyId=109099
 select *  FROM  [dbo].[med_CompanyTypeRelations] WHERE CompanyId=106271
 
*/
CREATE PROCEDURE [dbo].[med_sp_ProductSaveOrUpdate]
	@ProductId int = null,
	@ProductCategoryID int,
	@Title nvarchar(max),
	@TitleLong nvarchar(max),
	@DescriptionShort nvarchar(max),
	@BrandId int,
	@Attributes  nvarchar(255),
	@Model nvarchar(255),
	@url nvarchar(255),
    @isActive bit
AS
BEGIN


	IF NOT EXISTS (SELECT ProductId FROM  [dbo].[med_Product]  WHERE ProductId=@ProductId)
	BEGIN
		IF EXISTS (SELECT ProductId FROM  [dbo].[med_Product]  WHERE url=@url)
		BEGIN
			SET @url=@url +'-'+ LEFT(NEWID(),8)
		END
		
		INSERT INTO  [dbo].[med_Product] (url)
		VALUES(@url) 
		
		SET @ProductId=SCOPE_IDENTITY() 
	
	END
	 
  UPDATE  [dbo].[med_Product]
   SET [ProductCategoryID] = @ProductCategoryID
      ,[Title] = @Title 
      ,[TitleLong] = @TitleLong
      ,[DescriptionShort] = @DescriptionShort 
      ,[BrandId] = @BrandId 
      ,[Attributes] = @Attributes
      ,[Model] = @Model 
      ,[isActive] = @isActive 
WHERE ProductId=@ProductId
 
 
    select @ProductId ProductId, @url url
 
	 
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_ProductCategorySaveOrUpdate]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetCompanyProducts 106386,10
 companyId, string description, string url, string name
 select * from [dbo].[med_Companies] WHERE CompanyId=109099
 select *  FROM  [dbo].[med_CompanyTypeRelations] WHERE CompanyId=106271
 
*/
CREATE PROCEDURE [dbo].[med_sp_ProductCategorySaveOrUpdate]
	@Category nvarchar(255),
	@IsActive int 
	
AS
BEGIN
	
		declare @ProductCategoryId int
		IF NOT EXISTS (SELECT * FROM  [dbo].[med_ProductCategories]  WHERE [Category]=@Category)
		BEGIN
			
			INSERT INTO  [dbo].[med_ProductCategories]
			   ([Category]
			   ,[isActive])
		 VALUES
			   (@Category
			   ,@IsActive)
	           
			SET @ProductCategoryId=SCOPE_IDENTITY() 
		
		END
	  ELSE
	  BEGIN
	  SELECT @ProductCategoryId=[ProductCategoryID] FROM  [dbo].[med_ProductCategories]  WHERE [Category]=@Category
	  
	  END
  
		select @ProductCategoryId as ProductCategoryId
 
 
 
	 
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_mt_FillSearchNews]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[med_sp_mt_FillSearchNews]

AS
BEGIN
	
	SET NOCOUNT ON;
INSERT INTO [dbo].[med_Search]
	([ItemId]
	,[Title]
      ,[Description]
      ,[Search]
      , ItemType
      ,url
	)
SELECT [StoryID] [ItemId]
      ,[Title]
      ,[Description]
      ,[Search]
      , 32 ItemType
      ,url
  FROM [sql11\sql2008r2].[NewsEngine].[dbo].[v_me_StoriesSearch] n
  LEFT OUTER JOIN
  (
  SELECT [ItemId]
  FROM [dbo].[med_Search]
  WHERE ItemType=32
  ) o
  ON n.[StoryID]=o.[ItemId]
  WHERE o.[ItemId] IS NULL
  
  -- To do add Removal
  
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_LocationSaveOrUpdate]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 
*/
CREATE PROCEDURE [dbo].[med_sp_LocationSaveOrUpdate]
    @LocationId int,
	@CompanyId int,
	@address nvarchar(255),
	@city nvarchar(255),
	@state nvarchar(255),
	@zip nvarchar(255),
	@phone nvarchar(255),
	@email nvarchar(255),
	@description nvarchar(255),
	@website nvarchar(255),
	@fax nvarchar(255),
	@latitude float,
	@longitude float,
	@country nvarchar(255),
    @note nvarchar(255),
    @name nvarchar(255),
    @isActive bit 
AS
BEGIN


	IF NOT EXISTS (SELECT LocationId FROM  [dbo].[med_Location]  WHERE LocationId=@LocationId)
	BEGIN
		
			SET NOCOUNT ON;
	INSERT INTO [testEY].[dbo].[med_Location]
           ([CompanyId]
           ,[address]
           ,[name]
           ,[city]
           ,[state]
           ,[zip]
           ,[phone]
           ,[email]
           ,[website]
           ,[fax]
           ,[description]
           ,[latitude]
           ,[longitude]
           ,[country]
           ,[note]
           ,[IsActive])
     VALUES
           (@CompanyId
           ,@address
           ,@name
           ,@city
           ,@state
           ,@zip
           ,@phone
           ,@email
           ,@website
           ,@fax
           ,@description
           ,@latitude
           ,@longitude
           ,@country
           ,@note
           ,@IsActive)
           
           	
		SET @LocationId=SCOPE_IDENTITY() 
 
    END
	ELSE 
	BEGIN
	 	SET NOCOUNT ON;
	 	
	 	 UPDATE  [dbo].[med_Location]
			   SET [address] = @address
					,[name] = @name
				  ,[city] = @city
				  ,[state] = @state
				  ,[zip] = @zip
				  ,[phone] = @phone
				  ,[email] = @email
				  ,[website] = @website
				  ,[fax] = @fax
				  ,[description] =@description
				  ,[latitude] = @latitude
				  ,[longitude] = @longitude 
				  ,[country] = @country
				  ,[note] = @note
				  ,[IsActive] = @IsActive
			 WHERE  LocationId=@LocationId
 
	 
	END
	 
	 select @LocationId LocationId
  
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_InsertSpecsList]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
SELECT [tmpProductSpecificationID]
      ,[sqlProductID]
      ,[SpecGroup]
      ,[SpecName]
      ,[SpecValue]
      ,[realSpecValue]
      ,[isActive]
  FROM [testEY].[dbo].[tmpProductSpecification]
  where [SpecName] like '%Included Software%'
  order by [SpecName]
  
  
  
  
  
SELECT     SpecName, COUNT(*) AS cnt
FROM         testEY.dbo.tmpProductSpecification
WHERE     (SpecValue LIKE '%,%')
GROUP BY SpecName
order by cnt desc



SELECT     tmpProductSpecification.SpecName
FROM         tmpProductSpecList INNER JOIN
                      tmpProductSpecification ON tmpProductSpecList.tmpProductSpecificationID = tmpProductSpecification.tmpProductSpecificationID
GROUP BY tmpProductSpecification.SpecName


 

select * INTO _med_ProductSpecList from dbo.med_ProductSpecList
select COUNT(*) from dbo.med_ProductSpecList
 
 
 
begin tran
update dbo.tmpProductSpecification set isActive = 0 
where SpecName in ('Included Accessories','Designed For','Features','Maximum Depth','Functions',
'Trip Computer','GTIN','Part Numbers','Interface')

select isActive from dbo.tmpProductSpecification where SpecName in ('Included Accessories','Designed For','Features','Maximum Depth','Functions',
'Trip Computer','GTIN','Part Numbers','Interface','Included Software','Compatible Software')

*/
CREATE PROCEDURE [dbo].[med_sp_InsertSpecsList]
	@specsId int
 
AS
BEGIN

	SET NOCOUNT ON;
	 
	 
	 

DECLARE @SpecID int
DECLARE @sqlProductID int
DECLARE @SpecValue NVARCHAR(max)
	 
DECLARE cSpecList CURSOR FOR  

--SELECT tmpProductSpecificationID, sqlProductID, SpecValue
--FROM dbo.tmpProductSpecification
-- where SpecName =  @specName
 
 SELECT    
			med_ProductSpecValues.ProductSpecID as SpecID
			,med_ProductSpecValues.ProductID as sqlProductID 
           ,med_ProductSpecValues.ValueOriginal as SpecValue
           
FROM         med_ProductSpecValues INNER JOIN
                      med_ProductSpecsNames ON med_ProductSpecValues.ProductSpecID = med_ProductSpecsNames.ProductSpecID
WHERE     (med_ProductSpecValues.ProductSpecID = @specsId)

OPEN cSpecList  
FETCH NEXT FROM cSpecList INTO @SpecID,  @sqlProductID,  @SpecValue
 	
WHILE @@FETCH_STATUS = 0  
BEGIN  
 
	--print @tmpProductSpecificationID
	INSERT INTO [testEY].[dbo].[med_ProductSpecList]
           ([ProductID]
           ,[ProductSpecID]
           ,[Value])
	select @sqlProductID,@SpecID,RTRIM(LTRIM(item)) From dbo.fn_SplitDelimitedString(@SpecValue,',')
	 
	
	FETCH NEXT FROM cSpecList INTO @SpecID,  @sqlProductID,  @SpecValue

END  

CLOSE cSpecList  
DEALLOCATE cSpecList 


	
 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetSearchResults]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--   exec med_sp_GetSearchResults 'Garmin',10000,0

--  3637
-- select * from med_Search where ItemId =109060
-- =============================================
CREATE PROCEDURE [dbo].[med_sp_GetSearchResults] 
	@searchKey nvarchar(200),
	@top int=20,
	@skip int=0
AS
BEGIN
 
 
 SELECT t.[key]
		    ,CASE WHEN t.[rank] IS NOT NULL THEN (t.[rank] + s.[rank]) ELSE s.[rank] END [Rank]
		    INTO #tmp
 FROM
	(
SELECT [key], [rank] as [rank] FROM	
	FREETEXTTABLE (dbo.[med_Search],*, @searchKey) ft)
	s
LEFT JOIN 
(
SELECT [key], [rank] as [rank] FROM
	FREETEXTTABLE (dbo.[med_Search],Title, @searchKey) ft
	) t
	
	ON t.[key]=s.[key]
	
	
	select ms.*,[RANK],ROW_NUMBER() OVER (ORDER BY  [Rank] desc) AS rowNumber INTO #tmp2 from #tmp as t
	Inner join dbo.[med_Search] as ms 	on ms.SearchId = t.[key] 
	ORDER BY [Rank] desc    
	
	select * from #tmp2   WHERE rowNumber BETWEEN @skip+1 AND @skip+@top  
	
	DECLARE @RC INT
	SET @RC=@@RowCount
		
	select ItemType, COUNT(*) as cnt   from #tmp2 group by ItemType
		 
	select COUNT(*) RecordsTotal,
			@skip+1 recordFirst,
			@skip+@top recordLast,
			@RC as recordCount 
		from #tmp2
	
	drop table #tmp
	drop table #tmp2
	
					
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetRelatedProducts]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

exec dbo.med_sp_GetRelatedProducts 10,10,10,5
 
*/
CREATE PROCEDURE [dbo].[med_sp_GetRelatedProducts]
	@CategoryId int,
	@BrandId  int,
	@top int,
	@ExcludedProductID  int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT DISTINCT   b.ProductID INTO #relatedProducts
			FROM         med_Product b  
			WHERE b.ProductCategoryID=@CategoryId and b.IsActive=1
			
			
	 IF NOT EXISTS(select ProductID from #relatedProducts) 
	 BEGIN
			SET NOCOUNT ON;
		  SELECT DISTINCT   b.ProductID INTO #relatedProducts2
			     FROM  med_Product b 
		 WHERE b.BrandId=@BrandId and b.IsActive=1

			select top (@top) ProductID INTO #randomProducts from #relatedProducts2 where ProductID <> @ExcludedProductID
				order by NEWID()
			
			
			 
			
			select * from dbo.med_Product where ProductID in 
		   (select ProductID from #randomProducts)
			
			select  *  from dbo.med_ProductImages where productId in   (select ProductID from #randomProducts)
		
			
			drop table #relatedProducts2
			drop table #randomProducts
	 END
	 ELSE
	 BEGIN
			SET NOCOUNT ON;
			
			select top (@top) ProductID INTO #randomProducts2 from #relatedProducts where ProductID <> @ExcludedProductID   
				order by NEWID()
							
			select  * from dbo.med_Product 
			where ProductID in (select ProductID from #randomProducts2) and  IsActive=1
	 
			select  *  from dbo.med_ProductImages where productId in   (select ProductID from #randomProducts2)
	 
			
			drop table #randomProducts2
			
	 END
	 
	 drop table #relatedProducts
	 
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[se_SwapOrderingNumberFromIdToReplaceId]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE PROCEDURE [dbo].[se_SwapOrderingNumberFromIdToReplaceId]
	@CatId int,
	@ReplaceId	int  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Ordering int
	declare @Ordering1 int
	select @Ordering=ordering from [dbo].[se_Categories] where [CategoryId]=@ReplaceId
	select @Ordering1=ordering from [dbo].[se_Categories] where [CategoryId]=@CatId
	
	update [dbo].[se_Categories]  set Ordering = @Ordering where [CategoryId]=@CatId
	update [dbo].[se_Categories]  set Ordering = @Ordering1 where [CategoryId]=@ReplaceId
 
END
GO
/****** Object:  StoredProcedure [dbo].[se_SaveOrUpdateCategory]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

 
            
CREATE PROCEDURE [dbo].[se_SaveOrUpdateCategory]
	@Id int,
	@Name	nvarchar(255) ,
	@Title nvarchar(255) ,
	@Url nvarchar(255) ,
	@IsIncludeParentKeywords bit ,
	@IsControllerNode bit ,
	@IsActiveNode bit,
	@IsMainMenu bit ,
	@CategorySid nvarchar(255) ,
	@Keywords cg_tt_StingInt readonly 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE  FROM dbo.se_Keywords  WHERE  CategoryId=@Id
	INSERT INTO  [dbo].[se_Keywords]
           ([CategoryId]
           ,[Text])
	SELECT @Id,StringValue  FROM @Keywords
 
	 UPDATE  [dbo].[se_Categories]
	   SET [Name] = @Name
		  ,[Title] = @Title
		  ,[UrlName] = @Url
		  ,[IsActive] = @IsActiveNode
		  ,[IsController] = @IsControllerNode
		  ,[IsIncludeParentKeywords] = @IsIncludeParentKeywords
		  ,[IsMainMenu] = @IsMainMenu
		  ,[CategorySid]=@CategorySid
	 WHERE  CategoryId=@Id
 
END
GO
/****** Object:  StoredProcedure [dbo].[se_SaveCategory]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[se_SaveCategory]
	@SiteId int,
	@ParentId	int,
	@Name nvarchar(255) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
declare @Ordering int
select @Ordering = ISNULL(Min(ordering)-1,0) from [dbo].[se_Categories] where [CategoryParentId]=@ParentId
 
INSERT INTO  [dbo].[se_Categories]
           ([SiteId]
           ,[CategoryParentId]
           ,[Name]
           ,[IsActive]
           ,[Ordering])
     VALUES
           (@SiteId
           ,@ParentId
           ,@Name
           ,1
           ,@Ordering)
           
           select SCOPE_IDENTITY() as Id
 
END
GO
/****** Object:  StoredProcedure [dbo].[se_GetSiteBySiteId]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[se_GetSiteBySiteId]
	@SiteId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from se_sites where SiteId=@SiteId
 select * from se_SiteSettings where SiteId=@SiteId
END
GO
/****** Object:  StoredProcedure [dbo].[se_GetCategoryById]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[se_GetCategoryById]
	@CategoryId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
SELECT *  FROM dbo.se_Categories  WHERE  CategoryId=@CategoryId
SELECT *  FROM dbo.se_Keywords  WHERE  CategoryId=@CategoryId



END
GO
/****** Object:  UserDefinedFunction [dbo].[RegExMatchLast]    Script Date: 04/04/2014 12:35:22 ******/
CREATE FUNCTION [dbo].[RegExMatchLast](@text [nvarchar](4000), @pattern [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[RegExMatchLast]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'RegEx.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatchLast'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'35' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatchLast'
GO
/****** Object:  UserDefinedFunction [dbo].[RegExMatch]    Script Date: 04/04/2014 12:35:20 ******/
CREATE FUNCTION [dbo].[RegExMatch](@text [nvarchar](4000), @pattern [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[RegExMatch]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'RegEx.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatch'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatch'
GO
/****** Object:  UserDefinedFunction [dbo].[RegExIsMatch]    Script Date: 04/04/2014 12:35:19 ******/
CREATE FUNCTION [dbo].[RegExIsMatch](@text [nvarchar](4000), @pattern [nvarchar](4000))
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[RegExIsMatch]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'RegEx.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExIsMatch'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'62' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExIsMatch'
GO
/****** Object:  UserDefinedFunction [dbo].[SanitizeHtmlSoft]    Script Date: 04/04/2014 12:35:25 ******/
CREATE FUNCTION [dbo].[SanitizeHtmlSoft](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[SanitizeHtmlSoft]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlSoft'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'57' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlSoft'
GO
/****** Object:  UserDefinedFunction [dbo].[SanitizeHtmlDeEntitize]    Script Date: 04/04/2014 12:35:24 ******/
CREATE FUNCTION [dbo].[SanitizeHtmlDeEntitize](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[SanitizeHtmlDeEntitize]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlDeEntitize'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'64' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlDeEntitize'
GO
/****** Object:  UserDefinedFunction [dbo].[SanitizeHtml]    Script Date: 04/04/2014 12:35:23 ******/
CREATE FUNCTION [dbo].[SanitizeHtml](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[SanitizeHtml]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtml'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'49' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtml'
GO
/****** Object:  StoredProcedure [dbo].[med_sp_UpdateLogs]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[med_sp_UpdateLogs]
     @itemType nvarchar(255),
     @itemId int,
     @userName nvarchar(255), 
     @descripton nvarchar(max),
     @actionId nvarchar(255)
     
AS
BEGIN
		SET NOCOUNT ON;
 INSERT INTO  [dbo].[med_Log]
           ([ItemType]
           ,[ItemId]
           ,[UserName]
           ,[ActionId]        
           ,[descripton]
           ,[DateCreated])
     VALUES
           (@itemType
           ,@itemId
           ,@userName
           ,@actionId
                  ,@descripton
           ,GETDATE())
	 
	END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SetCompanyLogoImage]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec med_sp_GetCompanyByUrl raymarine,3
CREATE PROCEDURE [dbo].[med_sp_SetCompanyLogoImage]
	@ItemType nvarchar(255)='',	
	@ItemID int ,
	@fileHash nvarchar(255)='',	
	@FileName nvarchar(255)='',	
	@Type nvarchar(255)=''
AS
BEGIN

	SET NOCOUNT ON;
	IF @Type = 'logo' 
	BEGIN
		DELETE FROM dbo.med_Images WHERE  ItemType = @ItemType and  ItemId = @ItemID and  @Type='logo'
	END
 
 INSERT INTO [dbo].[med_Images]
           ([ItemType]
           ,[ItemID]
           ,[FileHash]
           ,[FileName]
           ,[Type])
     VALUES
           (@ItemType
           ,@ItemID
           ,@FileHash
           ,@FileName
           ,@Type)
           
 
	-- Update dbo.med_Images  set Type=@OldType Where  ItemType = 1 and  ItemId = @companyId  and FileHash <> @fileHash
	-- Update dbo.med_Images  set Type=@NewType Where FileHash = @fileHash
	
	 
					
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SearchCompanies_v2]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [med_sp_GetFilteredCompanies] 'Distributors','Foruno',NULL,NULL,NULL
CREATE PROCEDURE [dbo].[med_sp_SearchCompanies_v2]
	@search nvarchar(200)='',
	@top int=20,
	@skip int=0,
	@filters AS dbo.med_tpt_Filter Readonly 
AS
BEGIN

	SET NOCOUNT ON;
	
	
		SET @search=RTRIM(@search)

			
	IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound') 
		drop table #recordFound

	CREATE TABLE #recordFound 
	(
	 companyId int ,
	 company nvarchar(255),
	 [description] nvarchar(max),
	 url nvarchar(255), 
	 CompanyTypeId int, 
	 BrandId  int, 
	 Country nvarchar(255),
	 [State] nvarchar(255), 
	 City nvarchar(255), 
	 rowNumber int)
			
     IF EXISTS(SELECT TOP (1) * FROM @filters f)	-- FILTERS
	 BEGIN	
		print 'FILTERS EXISTS'
		
		
 
		DECLARE @companyType nvarchar(100), @brand nvarchar(100), @country nvarchar(100), @state nvarchar(100), @city nvarchar(100)
 
		
		SELECT @companyType=ISNULL(ValueFirst,0)
		FROM @filters
		WHERE FieldName='companyType'
		
		
		SELECT @brand=ISNULL(ValueFirst,0)
		FROM @filters
		WHERE FieldName='brand'
		
		SELECT @country=ISNULL(ValueFirst,'')
		FROM @filters
		WHERE FieldName='country'
		
		SELECT @state=ISNULL(ValueFirst,'')
		FROM @filters
		WHERE FieldName='state'
		
		SELECT @city=ISNULL(ValueFirst,'')
		FROM @filters
		WHERE FieldName='city'
		
		--print @companyType
		--print @brand
		--print @country
		--print @state
		--print @city
		
		IF LEN (ISNULL(@search,''))=0 -- Filters but no search
		BEGIN

			 print 'FILTERS NO SEARCH '
			 --SET NOCOUNT ON;
			 
			 
			INSERT INTO #recordFound (
					companyId,
					company,
					[description],
					url,
					CompanyTypeId, 
					BrandId, 
					Country,
					[State], 
					City,			
					rowNumber)
		
		--select * from med_Location where 	CompanyId = 106322
		--select * from med_Companies where 	CompanyId = 106322
		
				
		 SELECT    c.CompanyId, c.Company, c.Description, c.url,
		  rt.CompanyTypeId, cb.BrandId, l.country, l.state, l.city,
					ROW_NUMBER() OVER (ORDER BY c.CompanyId) AS rowNumber
			FROM         med_Companies AS c INNER JOIN  
                      med_Location AS l ON c.CompanyId = l.CompanyId INNER JOIN
                      med_CompanyTypeRelations AS rt ON c.CompanyId = rt.CompanyId INNER JOIN
                      med_CompanyTypes AS t ON rt.CompanyTypeId = t.CompanyTypeId INNER JOIN
                      med_CompanyBrands as cb ON rt.CompanyId = cb.CompanyId INNER JOIN
                      med_Brands as b ON cb.BrandId = b.BrandId              
		  WHERE 
		  t.Type = COALESCE(@companyType,   t.Type)  
		  AND b.Brand  LIKE  '%' + ISNULL(@brand,  b.Brand )+ '%'  
		  AND l.country = COALESCE(@country,   l.country)  
		  AND l.state = COALESCE(@state,   l.state)  
		  AND l.city = COALESCE(@city,   l.city)  
		 
      
			 
		END
		ELSE
		BEGIN
			SET NOCOUNT ON;
			print 'Filters And Search'
				 
		
		END
		

	 END
	 ELSE
	 BEGIN
				IF LEN (ISNULL(@search,''))=0
				BEGIN
						SET NOCOUNT ON;
							print 'NO Filters No search'
				 
				 INSERT INTO #recordFound (
					companyId,
					company,
					[description],
					url,
					CompanyTypeId, 
					BrandId, 
					Country,
					[State], 
					City,			
					rowNumber)
		
	 
		 SELECT    c.CompanyId, c.Company, c.Description, c.url,
		  rt.CompanyTypeId, cb.BrandId, l.country, l.state, l.city,
					ROW_NUMBER() OVER (ORDER BY c.CompanyId) AS rowNumber
			FROM         med_Companies AS c INNER JOIN  
                      med_Location AS l ON c.CompanyId = l.CompanyId INNER JOIN
                      med_CompanyTypeRelations AS rt ON c.CompanyId = rt.CompanyId INNER JOIN
                      med_CompanyTypes AS t ON rt.CompanyTypeId = t.CompanyTypeId INNER JOIN
                      med_CompanyBrands as cb ON rt.CompanyId = cb.CompanyId INNER JOIN
                      med_Brands as b ON cb.BrandId = b.BrandId  
				  
						 
						 
				END
				ELSE
				BEGIN
				
						SET NOCOUNT ON;
						print 'NO Filters But search'
				END

	 
	 	
	 END
        
        
  --      SELECT c.CompanyId, c.Company, c.Description, c.url,  
  --      --CompanyTypeId,BrandId,country,[state],city,
  --      f.rowNumber  
  --      FROM dbo.med_Companies c
  --      inner join #recordFound f on c.CompanyId = f.CompanyId
		--WHERE f.rowNumber BETWEEN @skip+1 AND @skip+@top
		--ORDER BY f.rowNumber
		
		SELECT *, ROW_NUMBER() OVER (ORDER BY CompanyId) as rowNumber INTO #recordFound2 FROM dbo.med_Companies WHERE CompanyId = ANY (SELECT DISTINCT companyId from #recordFound)
		SELECT *  FROM  #recordFound2 where rowNumber	 BETWEEN @skip+1 AND @skip+@top	 


		
		
		
		SELECT * 
			FROM
			(	
				 SELECT 'companyType' as FieldName,CAST(CompanyTypeId as varchar)   as ValueFirst,'' as ValueLast,Count(*) cnt, 10 ord
					FROM #recordFound fr
					Group by CompanyTypeId
				 
				 UNION
				 
				SELECT 'brand'as FieldName,CAST(brandId as varchar)  as ValueFirst,'' as ValueLast,Count(*)  cnt, 20 ord
					FROM #recordFound fr
					Group by brandId
					
					UNION
				 
				SELECT 'country'as FieldName, country as ValueFirst,'' as ValueLast,Count(*)  cnt, 30 ord
					FROM #recordFound fr
					Group by country
					
					UNION
				 
				SELECT 'state'as FieldName, state as ValueFirst,'' as ValueLast,Count(*)  cnt, 40 ord
					FROM #recordFound fr
					Group by [state]
					
					UNION
				 
				SELECT 'city'as FieldName, city as ValueFirst,'' as ValueLast,Count(*)  cnt, 50 ord
					FROM #recordFound fr
					Group by city
					
			) AS E ORDER BY ord
	
		
        DECLARE @RC INT
		SET @RC=@@RowCount
		
		SELECT COUNT(*) recordsTotal, @skip+1 recordFirst,  @skip+@top recordLast, @RC recordCount
		FROM #recordFound2 r
	   	drop table #recordFound2 
 
END
GO
/****** Object:  UserDefinedFunction [dbo].[WordsAproxMatched]    Script Date: 04/04/2014 12:35:28 ******/
CREATE FUNCTION [dbo].[WordsAproxMatched](@text1 [nvarchar](max), @text2 [nvarchar](max), @diffLettersInWord [smallint], @excludeNoiseWords [bit])
RETURNS [real] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[WordsAproxMatched]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'MatchFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'WordsAproxMatched'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'WordsAproxMatched'
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 04/04/2014 12:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitCollocation]    Script Date: 04/04/2014 12:35:27 ******/
CREATE FUNCTION [dbo].[SplitCollocation](@text [nvarchar](max), @wordsNumber [smallint], @minWordLength [smallint])
RETURNS  TABLE (
	[Word] [nvarchar](max) NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[SplitCollocation]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'SplitCollocation.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SplitCollocation'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SplitCollocation'
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidEmail]    Script Date: 04/04/2014 12:35:18 ******/
CREATE FUNCTION [dbo].[IsValidEmail](@email [nvarchar](max))
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[IsValidEmail]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'IsValidEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'80' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'IsValidEmail'
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_StoryUpdate]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

select * from dbo.cg_Stories where editor is not null

*/

CREATE PROCEDURE [dbo].[cg_sp_StoryUpdate]
	@StoryId int,
	@ContentUrlId int  = NULL,
	@Title nvarchar(500)= NULL,
	@Author nvarchar(255) =NULL,
	@Body nvarchar(max)= NULL,
	@PublishDate datetime= NULL,
	@Source nvarchar(255)= NULL,
	@Comment nvarchar(max)= NULL,
	@Rank int =NULL,
	@IsPublished bit= NULL,
	@Images as cg_tt_IntBit readonly,
	@Areas as cg_tt_IntBit readonly,
	@Categories as cg_tt_StingInt readonly,
	@Companies as cg_tt_StingInt readonly,
    @editorName nvarchar(255)= NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	 UPDATE dbo.cg_Stories
	   SET ContentUrlId = @ContentUrlId 
		  ,Title = @Title 
		  ,Author = @Author 
		  ,Body = @Body 
		  ,PublishDate = @PublishDate 
		  ,Source = @Source 
		  ,Comment = @Comment 
		  ,Rank = @Rank
		  ,IsPublished = @IsPublished
		  ,DateUpdated=GETDATE()
		  ,editor=@editorName
	 WHERE StoryId=@StoryId
	 
	INSERT INTO [dbo].[cg_StoryEditors]
           ([StoryId]
           ,[Editor]
           ,[DateUpdated])
     VALUES
           (@StoryId
           ,@editorName
           ,GETDATE())
	
	UPDATE si
	SET isSelected=img.BitValue
	FROM 
	cg_StoryImages si INNER JOIN  @Images img
	ON si.ImageId=img.IntValue
	WHERE si.StoryId=@StoryId
	
	
	
	INSERT INTO cg_StoryImages (ImageId,StoryId,isSelected)
	SELECT newImg.IntValue,@StoryId,newImg.BitValue
	FROM  @Images newImg
	LEFT OUTER JOIN
	(
		SELECT ImageId
		FROM 	cg_StoryImages si
		WHERE si.StoryId=@StoryId
	) oldImg
	ON newImg.IntValue=oldImg.ImageId
	WHERE oldImg.ImageId IS NULL
	
	
	
		
	UPDATE si
	SET isSelected=area.BitValue
	FROM 
	dbo.cg_StoryAreas si INNER JOIN  @Areas area
	ON si.AreaId=area.IntValue
	WHERE si.StoryId=@StoryId
	
	
	
	INSERT INTO cg_StoryAreas (AreaId,StoryId,isSelected)
	SELECT newArea.IntValue,@StoryId,newArea.BitValue
	FROM   @Areas newArea
	LEFT OUTER JOIN
	(
		SELECT AreaId
		FROM 	cg_StoryAreas si
		WHERE si.StoryId=@StoryId
	) oldArea
	ON newArea.IntValue=oldArea.AreaId
	WHERE oldArea.AreaId IS NULL
	
	
	
	
	DECLARE @cats TABLE (Category nvarchar(255), CategoryTypeId int,  CategoryId int)
	select * INTO #tbl_Companies from cg_Categories WHERE CategoryTypeId=2
	select * INTO #tbl_Categories from cg_Categories WHERE CategoryTypeId=1
	

	INSERT INTO @cats (Category, CategoryTypeId,CategoryId)
	Select newCat.StringValue Category, newCat.IntValue CategoryTypeId, oldCat.CategoryId
	FROM @Categories newCat LEFT OUTER JOIN #tbl_Categories oldCat 
	ON oldCat.Category=RTRIM(LTRIM(newCat.StringValue))
	 
	INSERT INTO @cats (Category, CategoryTypeId,CategoryId)
	Select newCat.StringValue Category, newCat.IntValue CategoryTypeId, oldCat.CategoryId
	FROM @Companies newCat LEFT OUTER JOIN #tbl_Companies oldCat 
	ON oldCat.Category=RTRIM(LTRIM(newCat.StringValue))
	 

	 
	drop table #tbl_Companies
	drop table #tbl_Categories
	 
	
	
	DECLARE @newCats TABLE (CategoryId int,Category nvarchar(255), CategoryTypeId int)
	
	INSERT INTO cg_Categories (Category, CategoryTypeId)
		 OUTPUT INSERTED.CategoryID, INSERTED.Category, INSERTED.CategoryTypeId  INTO @newCats
	SELECT Category, CategoryTypeId
	FROM @cats WHERE CategoryId IS NULL
	 
	
	UPDATE @cats
		SET CategoryId=nCats.CategoryID
	FROM @cats cats INNER JOIN @newCats nCats
	ON cats.Category=nCats.Category
	WHERE nCats.CategoryTypeId = 1 and cats.CategoryTypeId = 1 
	
	
	UPDATE @cats
		SET CategoryId=nCats.CategoryID
	FROM @cats cats INNER JOIN @newCats nCats
	ON cats.Category=nCats.Category
	WHERE nCats.CategoryTypeId = 2 and cats.CategoryTypeId = 2 
	
	

	delete from dbo.cg_StoryCategories where StoryCategoryId in (  
	select StoryCategoryId from dbo.cg_StoryCategories as si 
	LEFT OUTER JOIN @cats as c ON si.CategoryId=c.CategoryId WHERE si.StoryId=@StoryId
	)
	
	INSERT INTO  dbo.cg_StoryCategories 
	select @StoryId,c.CategoryId from @cats as c
	
	--declare @similarity int=0
	--select @similarity=dbo.edit_distance(s.Title+' '+s.Body, c.TitleExtracted+' '+c.ContentExtracted) 
	--from dbo.cg_ContentUrls as c inner join dbo.cg_Stories as s on c.ContentUrlId=s.ContentUrlId where s.ContentUrlId=@ContentUrlId
	--UPDATE dbo.cg_Stories
	--   SET Similarity = @similarity  
	-- WHERE StoryId=@StoryId
	 
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_StoryAndContentUrlSimilarity]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[cg_sp_StoryAndContentUrlSimilarity]
	@StoryId int, 
	@ContentUrlId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 declare @similarity int=0
	
	select @similarity=dbo.edit_distance(s.Title+' '+s.Body, c.TitleExtracted+' '+c.ContentExtracted) 
	from dbo.cg_ContentUrls as c inner join dbo.cg_Stories as s on c.ContentUrlId=s.ContentUrlId where s.ContentUrlId=@ContentUrlId
	
	UPDATE dbo.cg_Stories
	   SET Similarity = @similarity  
	 WHERE StoryId=@StoryId
	 
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_InsertContentUrlRelationsAndUpdateContentUrl]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cg_sp_InsertContentUrlRelationsAndUpdateContentUrl] 
	@ContentUrlId int
           ,@ContentUrlIdRelated int
           ,@Similarity float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[cg_ContentUrlsRelations]
           ([ContentUrlId]
           ,[ContentUrlIdRelated]
           ,[Similarity])
     VALUES
           (@ContentUrlId
           ,@ContentUrlIdRelated
           ,@Similarity)

    UPDATE        cg_ContentUrls
    SET isSimularityCalc=1
    WHERE ContentUrlId=@ContentUrlId
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStorySourceStats]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 exec dbo.cg_sp_GetStorySourceStats 20010

*/
CREATE PROCEDURE [dbo].[cg_sp_GetStorySourceStats]
	 
	@StoriesSourceId int 
AS
BEGIN


DECLARE @ret TABLE ( GroupName varchar(50),  Name nvarchar(100), Value varchar(max), ValueType varchar(50))


	 /****** Script for SelectTopNRows command from SSMS  ******/
SELECT   distinct  cg_ContentUrls.ContentUrlId, ISNULL(cg_ContentUrls.pubDate, cg_ContentUrls.DateExtracted) AS date_created, 
                      ISNULL(cg_ContentUrls.StatusId, 0) AS StatusId, dbo.parseURL(cg_ContentUrls.Url) AS domain
INTO            [#tmp]
FROM         cg_ContentUrls INNER JOIN
                      cg_ContentUrlRequestRelation ON cg_ContentUrls.ContentUrlId = cg_ContentUrlRequestRelation.ContentUrlId INNER JOIN
                      cg_RequestItems ON cg_ContentUrlRequestRelation.RequestSourceId = cg_RequestItems.RequestSourceId
WHERE     (cg_RequestItems.StoriesSourceId = @StoriesSourceId) and  cg_ContentUrls.isExtractable=1

   
  declare @OldestCollectedStory datetime 
  declare @NewestCollectedStory datetime 
  declare @AverageCollectedStory int 
  SET  @OldestCollectedStory =( select top(1) date_created as OldestCollectedStory from #tmp )
  SET  @NewestCollectedStory =(select top(1) date_created as NewestCollectedStory from #tmp  order by date_created desc )
  
   select * INTO #tmp_lastMonth from #tmp  
  WHERE cast(date_created as date) >  cast(dateadd(day,-30,getdate()) as date)
  
  --DATEPART(m, date_created) = DATEPART(m, DATEADD(m, -1, getdate())) AND DATEPART(yy, date_created) = DATEPART(yy, DATEADD(m, -1, getdate())) 
  


  SET  @AverageCollectedStory =( SELECT COUNT(*)/30 FROM #tmp_lastMonth )
  
   INSERT INTO @ret ( GroupName ,  Name , Value , ValueType )
   VALUES ('General','OldestCollectedStory',@OldestCollectedStory,'datetime') 
  
   INSERT INTO @ret ( GroupName ,  Name , Value , ValueType )
   VALUES ('General','NewestCollectedStory',@NewestCollectedStory,'datetime') 
  
  
  INSERT INTO @ret ( GroupName ,  Name , Value , ValueType )
   VALUES ('General','AverageCollectedStoryLastMonth',@AverageCollectedStory,'int') 
  
   
  Declare @CollectedStory int 
  set @CollectedStory=(select COUNT(*) as CollectedStory FROM #tmp_lastMonth)
  
  INSERT INTO @ret ( GroupName ,  Name , Value , ValueType )
   VALUES ('General','CollectedStoryLastMonth',@CollectedStory,'int') 
  
 
  INSERT INTO @ret ( GroupName ,  Name , Value , ValueType )
  select 'Story Status',StatusId, COUNT(*) as LastMonth_Cnt,'int' from #tmp_lastMonth group by StatusId
 
 INSERT INTO @ret ( GroupName ,  Name , Value , ValueType )
  select 'Domain',domain, COUNT(*) as LastMonth_Cnt,'int'   from #tmp_lastMonth  group by domain
 
 
 
  drop table #tmp_lastMonth
  drop table #tmp
  
  select * from @ret
   
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStoryById]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_sp_GetStoryById]
	@StoryId int 
AS
BEGIN


SELECT *  FROM [dbo].[cg_Stories] WHERE StoryId=@StoryId
	
	
	
SELECT c.*  FROM 	[dbo].[cg_StoryCategories] as sc inner join [dbo].[cg_Categories]  c
	 ON sc.CategoryID = c.CategoryId
	  WHERE [StoryId]=@StoryId
	  order by c.Category
	  
	  
SELECT     cg_ContentUrlImages.*, cg_StoryImages.isSelected,cg_StoryImages.StoryId
FROM        cg_ContentUrlImages LEFT OUTER JOIN
                      cg_StoryImages   ON cg_StoryImages.ImageId = cg_ContentUrlImages.ImageId
                      WHERE cg_StoryImages.StoryId=@StoryId
                      
                      
 
		IF EXISTS( SELECT  distinct   cg_Areas.AreaID
				FROM          cg_Areas  LEFT OUTER JOIN
                     cg_StoryAreas ON cg_StoryAreas.AreaId = cg_Areas.AreaID
				WHERE cg_StoryAreas.StoryId = @StoryId)
		BEGIN
		
		 SELECT  distinct   cg_Areas.*,cg_StoryAreas.isSelected
		FROM          cg_Areas  LEFT OUTER JOIN
                     cg_StoryAreas ON cg_StoryAreas.AreaId = cg_Areas.AreaID
		WHERE cg_StoryAreas.StoryId = @StoryId
		
		END	
		ELSE
		BEGIN
			 SELECT  distinct   cg_Areas.*,0 as isSelected
		FROM          cg_Areas 
		
		END


	  
END
GO
/****** Object:  StoredProcedure [dbo].[cg_GetContentUrlDateSimiliarityStatsPerMonth]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_GetContentUrlDateSimiliarityStatsPerMonth]
	@Similarity float = 70 
AS
BEGIN
	 
	SET NOCOUNT ON;

SELECT dt, COUNT(*) Similarity_Cnt  INTO #tmp
FROM 
(
SELECT     convert(varchar(7), cg_ContentUrls.DateExtracted, 126)  dt ,  cg_ContentUrlsRelations.Similarity
FROM         cg_ContentUrls INNER JOIN
                      cg_ContentUrlsRelations ON cg_ContentUrls.ContentUrlId = cg_ContentUrlsRelations.ContentUrlId     
WHERE  cg_ContentUrlsRelations.Similarity > @Similarity
) t
GROUP BY dt
ORDER BY dt desc

  
SELECT   ISNULL(cg_ContentUrls.StatusId, 0) AS StatusId, 
 COUNT(ISNULL(cg_ContentUrls.StatusId, 0)) AS Status_Cnt, 
 convert(varchar(7), cg_ContentUrls.DateExtracted, 126)   dt     INTO #tmp2  
FROM     cg_ContentUrls 
WHERE     (cg_ContentUrls.isExtractable = 1)
GROUP BY ISNULL(cg_ContentUrls.StatusId, 0), convert(varchar(7), cg_ContentUrls.DateExtracted, 126) 
ORDER BY dt DESC

select t.Similarity_Cnt,m.* from #tmp as t inner join  #tmp2 as m on t.dt=m.dt 
 order by t.dt DESC

drop table #tmp2

drop table #tmp


--  select COUNT(*) FROM cg_ContentUrls WHERE     (isExtractable = 1)

END
GO
/****** Object:  StoredProcedure [dbo].[cg_GetContentUrlDateSimiliarityStats]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [cg_GetContentUrlDateSimiliarityStats]
*/
CREATE PROCEDURE [dbo].[cg_GetContentUrlDateSimiliarityStats]
	@Similarity float = 70,
	@LastDay int = 7
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SET @LastDay=@LastDay*-1
  
SELECT dt, COUNT(NULLIF( Similarity, 0 )) Similarity_Cnt INTO #tmp
FROM 
(
SELECT    CONVERT(varchar(20), cg_ContentUrls.DateExtracted,112) dt ,  cg_ContentUrlsRelations.Similarity
FROM         cg_ContentUrls LEFT OUTER JOIN
                      cg_ContentUrlsRelations ON cg_ContentUrls.ContentUrlId = cg_ContentUrlsRelations.ContentUrlId
                      
WHERE    (cg_ContentUrls.isExtractable = 1) and (cg_ContentUrls.DateExtracted  >= DATEADD(day,@LastDay, GETDATE())) 
 AND ISNULL(cg_ContentUrlsRelations.Similarity, @Similarity) >= @Similarity 
) t
GROUP BY dt
ORDER BY dt desc
 

SELECT   ISNULL(cg_ContentUrls.StatusId, 0) AS StatusId, 
 COUNT(ISNULL(cg_ContentUrls.StatusId, 0)) AS Status_Cnt, 
 CONVERT(varchar(20), cg_ContentUrls.DateExtracted,112) dt  INTO #tmp2
FROM         cg_ContentUrls 
WHERE     (cg_ContentUrls.isExtractable = 1) and (cg_ContentUrls.DateExtracted  >= DATEADD(day,@LastDay, GETDATE()))
GROUP BY ISNULL(cg_ContentUrls.StatusId, 0), CONVERT(varchar(20), cg_ContentUrls.DateExtracted,112)   
ORDER BY dt DESC


select t.Similarity_Cnt,m.* from #tmp as t inner join  #tmp2 as m on t.dt=m.dt 
 order by t.dt DESC

drop table #tmp2

drop table #tmp



END
GO
/****** Object:  StoredProcedure [dbo].[cg_GetCategoriesAutofill]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_GetCategoriesAutofill]


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		SELECT Category, 1 as CategoryTypeId FROM cg_CategoriesForStories
		UNION 
		SELECT     Category, CategoryTypeId
FROM         cg_Categories
WHERE     (CategoryTypeId = 2) AND (LEN(Category) > 2) AND (Category NOT LIKE 'com%')
  
END
GO
/****** Object:  UserDefinedFunction [dbo].[cg_f_GetStoriesSimularity2]    Script Date: 04/04/2014 12:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
/*
 select dbo.cg_f_GetStoriesSimularity(357340,357339)
drop FUNCTION dbo.cg_f_GetStoriesSimularity
*/
create FUNCTION [dbo].[cg_f_GetStoriesSimularity2]
(
	@ContentUrlId1 INT,
 	@ContentUrlId2 INT 
)
RETURNS float
AS
BEGIN
	
	DECLARE @compare TABLE (WordID1 int, WordID2 int, WordCount1 float, WordCount2 float)
	 
	 
INSERT INTO @compare (WordID1,WordID2,WordCount1,WordCount2)
SELECT t1.WordID, t2.WordID, ISNULL(t1.WordCount,0), ISNULL(t2.WordCount,0)
  FROM
  (
  SELECT [WordID]
          ,[WordCount]
     
  FROM  [dbo].[cg_ContentUrlWords]
  WHERE  [ContentUrlId]=@ContentUrlId1
  ) t1
  FULL OUTER JOIN
  (
  SELECT [WordID]
          ,[WordCount]
     
  FROM  [dbo].[cg_ContentUrlWords]
  WHERE  [ContentUrlId]=@ContentUrlId2
  ) t2
  ON t1.[WordID]=t2.[WordID]
  
 
  
  DECLARE @WordsCount1 int 
  DECLARE @WordsCount2 int 
  
  SELECT @WordsCount1 = COUNT(WordID1),
		@WordsCount2 = COUNT(WordID2)
	FROM @compare
	declare @ret float
	
	declare @minValue int 
	set @minValue=  (SELECT Min(v) FROM (VALUES (@WordsCount1),(@WordsCount2)) AS value(v))
	IF @minValue = 0
	BEGIN
		SET @minValue = 1
	END 
	
	SELECT @ret = SUM(wordMacth)/ @minValue
	
	FROM
	(

	SELECT 
		
		CASE WHEN wc1 IS NOT NULL AND wc2 IS NOT NULL 
		THEN
		 (SELECT Min(v) FROM (VALUES (wc1),(wc2)) AS value(v)) /
		(SELECT Max(v) FROM (VALUES (wc1),(wc2)) AS value(v))  
		ELSE
			0
		END wordMacth
		
	FROM
	(
	SELECT WordID1,WordID2,WordCount1,WordCount2,
		WordCount1/NULLIF (@WordsCount1,0) wc1,WordCount2/NULLIF (@WordsCount2,0) wc2
	  FROM @compare
	  ) t1
	  
	  ) t2
	  
 return @ret

END
GO
/****** Object:  UserDefinedFunction [dbo].[cg_f_GetStoriesSimularity]    Script Date: 04/04/2014 12:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
/*
 select dbo.cg_f_GetStoriesSimularity(357340,357339)
drop FUNCTION dbo.cg_f_GetStoriesSimularity
*/
CREATE FUNCTION [dbo].[cg_f_GetStoriesSimularity]
(
	@ContentUrlId INT,
	@compare2 dbo.cg_test_Compare readonly   
)
RETURNS float
AS
BEGIN
	
	DECLARE @compare TABLE (WordID1 int, WordID2 int, WordCount1 float, WordCount2 float)
	 
	 
INSERT INTO @compare (WordID1,WordID2,WordCount1,WordCount2)
SELECT t1.WordID, t2.WordID, ISNULL(t1.WordCount,0), ISNULL(t2.WordCount,0)
  FROM @compare2 t1
  FULL OUTER JOIN
  (
  SELECT [WordID]
          ,[WordCount]
     
  FROM  [dbo].[cg_ContentUrlWords]
  WHERE  [ContentUrlId]=@ContentUrlId
  ) t2
  ON t1.[WordID]=t2.[WordID]
  
 
  
  DECLARE @WordsCount1 int 
  DECLARE @WordsCount2 int 
  
  SELECT @WordsCount1 = COUNT(WordID1),
		@WordsCount2 = COUNT(WordID2)
	FROM @compare
	declare @ret float
	
	declare @minValue int 
	set @minValue=  (SELECT Min(v) FROM (VALUES (@WordsCount1),(@WordsCount2)) AS value(v))
	IF @minValue = 0
	BEGIN
		SET @minValue = 1
	END 
	
	SELECT @ret = SUM(wordMacth)/ @minValue
	
	FROM
	(

	SELECT 
		
		CASE WHEN wc1 IS NOT NULL AND wc2 IS NOT NULL 
		THEN
		 (SELECT Min(v) FROM (VALUES (wc1),(wc2)) AS value(v)) /
		(SELECT Max(v) FROM (VALUES (wc1),(wc2)) AS value(v))  
		ELSE
			0
		END wordMacth
		
	FROM
	(
	SELECT WordID1,WordID2,WordCount1,WordCount2,
		WordCount1/NULLIF (@WordsCount1,0) wc1,WordCount2/NULLIF (@WordsCount2,0) wc2
	  FROM @compare
	  ) t1
	  
	  ) t2
	  
 return @ret

END
GO
/****** Object:  StoredProcedure [dbo].[cg_DeletePriorThreeMonthContentGatheringData]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_DeletePriorThreeMonthContentGatheringData]
	

AS
BEGIN
	declare @lastDay int = -60
  
	select  ContentUrlId INTO #tmp from dbo.cg_ContentUrls 
	where StatusId = 0 and  
	CAST(DateExtracted AS Date)     <=  CAST(DATEADD(day,@lastDay, GETDATE()) AS Date)   
	
	
	-- all content url ID
	-- SELECT * FROM #tmp
	
	DELETE c FROM dbo.cg_ContentUrlImages as c INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
	
	DELETE w FROM dbo.cg_Words as w 
		INNER JOIN 	dbo.cg_ContentUrlWords as c ON w.WordID = c.WordId 
		INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
		
		
	DELETE c FROM dbo.cg_ContentUrlWords as c INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
	

	
		DELETE sa FROM dbo.cg_StoryAreas as sa 
			INNER JOIN dbo.cg_Stories  as c	ON sa.StoryId = c.StoryId 
			INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
	
 
		DELETE  sa FROM dbo.cg_StoryCategories as sa 
		INNER JOIN dbo.cg_Stories  as c	ON sa.StoryId = c.StoryId 
		INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
 
 
		DELETE sa FROM dbo.cg_StoryImages as sa INNER JOIN dbo.cg_Stories  as c
	ON sa.StoryId = c.StoryId INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
	
	
		DELETE sa FROM dbo.cg_StoryEditors as sa INNER JOIN dbo.cg_Stories  as c
	ON sa.StoryId = c.StoryId INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
	
	
	

    DELETE c FROM dbo.cg_ContentUrlsRelations as c INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
    
    DELETE c FROM dbo.cg_Stories as c INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
	DELETE c FROM dbo.cg_ContentUrls as c INNER JOIN #tmp as t on c.ContentUrlId=t.ContentUrlId
	
	drop table #tmp
 
 
END
GO
/****** Object:  StoredProcedure [dbo].[cg_test_Similar]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

[dbo].[cg_test_Similar]

*/
CREATE PROCEDURE [dbo].[cg_test_Similar]
	@ContentUrlId int= 48439

AS
BEGIN
 

DECLARE	@compare AS dbo.cg_test_Compare   

INSERT INTO @compare (WordID,WordCount)
SELECT [WordID]
          ,[WordCount]
  FROM  [dbo].[cg_ContentUrlWords]
  WHERE [ContentUrlId]=@ContentUrlId

delete from [dbo].[cg_ContentUrlsRelations] where [ContentUrlId]=@ContentUrlId

INSERT INTO [dbo].[cg_ContentUrlsRelations]
           ([ContentUrlId]
           ,[ContentUrlIdRelated]
           ,[Similarity])  
SELECT * FROM
(

SELECT    @ContentUrlId as ContentUrlId1, ContentUrlId as ContentUrlId2, dbo.cg_f_GetStoriesSimularity2(@ContentUrlId,ContentUrlId) * 100 as Similar
FROM         cg_ContentUrls AS t1
WHERE     ContentUrlId <> @ContentUrlId and (DateExtracted >
                          (SELECT     DateExtracted
                            FROM          cg_ContentUrls
                            WHERE      (ContentUrlId = @ContentUrlId)) - 3)
                            ) t
                            WHERE Similar > 10 
                       
                   
  --  select COUNT(*) from dbo.cg_ContentUrlWords
  -- select top 1000 * from [dbo].[cg_ContentUrlsRelations] order by ContentUrlId desc
END
GO
/****** Object:  StoredProcedure [dbo].[cg_MaintenanceDaily]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_MaintenanceDaily]

AS
BEGIN

	SET NOCOUNT ON;

	--To Do: add any code to execute every night
	--exec sp_somthing
    exec [cg_DeletePriorThreeMonthContentGatheringData]

END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStoryByContetUrlId]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

*/
CREATE PROCEDURE [dbo].[cg_sp_GetStoryByContetUrlId]
	@ContentUrlId int 
AS
BEGIN

DECLARE @StoryId INT

SELECT @StoryId=StoryId FROM [dbo].[cg_Stories] WHERE ContentUrlId=@ContentUrlId

IF ISNULL(@StoryId,0)=0
BEGIN
INSERT INTO [dbo].[cg_Stories]
	(ContentUrlId, Title, Body,publishDate, Source,[Rank],IsPublished,DateCreated)
SELECT     ContentUrlId, TitleExtracted, ContentExtracted, pubDate,dbo.parseURL(Url),2,0,GETDATE() 
FROM         cg_ContentUrls
WHERE     (ContentUrlId = @ContentUrlId)

SET @StoryId=SCOPE_IDENTITY()

INSERT INTO   cg_StoryImages
(StoryId,ImageId, isSelected)

SELECT   @StoryId,  ImageId,1
FROM         cg_ContentUrlImages
WHERE     (ContentUrlId = @ContentUrlId)
	
END

exec [cg_sp_GetStoryById] @StoryId


	  
END
GO
/****** Object:  StoredProcedure [dbo].[Test_Request]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Test_Request
*/
-- =============================================
CREATE PROCEDURE [dbo].[Test_Request] 
	
AS
BEGIN
		SET NOCOUNT ON;
		
		SELECT ProductId, 0 as stateid INTO #tmp  
FROM dbo.med_Product as p
inner join med_v_ProductCategoriesActive c
				ON p.ProductCategoryID = c.ProductCategoryID 
				
				
				
				WAITFOR DELAY '00:00:20'
				
				select * from #tmp
				drop table #tmp
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SearchProducts]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

  DECLARE @filter as med_tpt_Filter
 
  INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES ('company','raymarine','')
  --INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES ('Included Qty x Type','USB adapter - 5 pin Micro-USB Type B ( female ) - Apple Dock connector ( male ) USB cable - 5 pin Micro-USB Type B ( male ) - 4 pin USB Type A ( male )','')
  --INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES ('Warranty','1 Year','')
  --INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES ('Part Numbers','CW13632','') 
  --INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES ('Depth','1.5','')
  --INSERT INTO @filter (FieldName, ValueFirst, ValueLast)  VALUES ('Low Voltage Power','20','')
 

exec [dbo].[med_sp_SearchProducts] @search = '', @top = 100, @skip = 0, @filter= @filter



 
 select * from  dbo.med_Product where ProductID = 5521
 
 
 select * from   dbo.med_ProductSpecValues psv
	    
			WHERE  ProductSpecID=152 AND ValueString= 'USB adapter - 5 pin Micro-USB Type B ( female ) - Apple Dock connector ( male ) USB cable - 5 pin Micro-USB Type B ( male ) - 4 pin USB Type A ( male )'
 

*/
CREATE PROCEDURE [dbo].[med_sp_SearchProducts]
	@search nvarchar(200)='',
	@top int=20,
	@skip int=0,
	@filter AS dbo.med_tpt_Filter Readonly 
AS
BEGIN

	SET NOCOUNT ON;
	
/*	
IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound') drop table #recordFound
 */
 
CREATE TABLE #recordFound (ProductId int, FiltersMatched int)
CREATE INDEX IDX_Product_RecordFound ON #recordFound(ProductId)

 
INSERT INTO #recordFound (ProductId, FiltersMatched)
SELECT ProductId, 0
FROM dbo.med_Product as p
inner join med_v_ProductCategoriesActive c
				ON p.ProductCategoryID = c.ProductCategoryID
 where 	p.IsActive=1
 



DECLARE cFilters CURSOR FOR  
SELECT FieldName, ValueFirst,ValueLast
FROM @filter

DECLARE @FieldName VARCHAR(max)
DECLARE @ValueFirst VARCHAR(max)
DECLARE @ValueLast VARCHAR(max)

OPEN cFilters  
FETCH NEXT FROM cFilters INTO @FieldName,  @ValueFirst, @ValueLast 

 
WHILE @@FETCH_STATUS = 0  
BEGIN  

	-- 
    IF @FieldName='Company'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT    med_Product.ProductID
				FROM  med_Product
				INNER JOIN   med_CompanyBrands ON med_CompanyBrands.BrandId = med_Product.BrandId
				INNER JOIN  med_Companies ON med_CompanyBrands.CompanyId = med_Companies.CompanyId 
				--WHERE     (med_Companies.Company = @ValueFirst)
					WHERE     (med_Companies.url = @ValueFirst) and 	med_Product.IsActive=1

		  ) m
		  ON rf.ProductID = m.ProductID
		--select* from #recordFound where FiltersMatched > 1
	END
	
	IF @FieldName='Brand'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT DISTINCT   b.ProductID
			FROM         med_Product b INNER JOIN
						 med_Brands cb ON b.BrandId = cb.BrandId
			WHERE cb.Brand=@ValueFirst  and 	b.IsActive=1
		  ) m
		  ON rf.ProductID = m.ProductID
		   
		 -- select MAX(FiltersMatched) from  #recordFound  
	END
	 

	IF @FieldName='Category'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT DISTINCT   b.ProductID
			FROM         med_Product b INNER JOIN
						 med_ProductCategories cb ON b.ProductCategoryID = cb.ProductCategoryID
			WHERE cb.Category=@ValueFirst and 	b.IsActive=1
		  ) m
		  ON rf.ProductID = m.ProductID
	END
	
	
	DECLARE @SpecType INT=0
	DECLARE @ProductSpecID INT=0
	
	SELECT  @SpecType =  SpecType, @ProductSpecID=ProductSpecID
	FROM        dbo.med_v_ProductSpecsNamesActive
	WHERE SpecName=@FieldName
	
	--  print '@SpecType  '+cast(@SpecType as nvarchar)
	--  print '@@ProductSpecID  '+cast(@ProductSpecID as nvarchar)
	  print '@@ValueFirst  '+@ValueFirst
	
	IF @SpecType=1 --string
	BEGIN
	
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
			 #recordFound rf 
			INNER JOIN 
	         dbo.med_ProductSpecValues psv
	         ON rf.ProductId=psv.ProductId
			WHERE  ProductSpecID=@ProductSpecID AND ValueString = @ValueFirst 
			-- like  '%'+@ValueFirst+ '%' 
	 
	END
	ELSE IF @SpecType=2 --list
	BEGIN
	
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
			 #recordFound rf 
			INNER JOIN 
	        dbo.med_ProductSpecList psv
	         ON rf.ProductId=psv.ProductId
			WHERE  ProductSpecID=@ProductSpecID AND Value=@ValueFirst 
		
	END
	ELSE IF @SpecType=16 -- numbers
	BEGIN
		 
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
			 #recordFound rf 
			INNER JOIN 
	         dbo.med_ProductSpecValues psv
	         ON rf.ProductId=psv.ProductId
			WHERE  ProductSpecID=@ProductSpecID AND ValueMin= CONVERT(float, @ValueFirst)
			
	END
	ELSE IF @SpecType=32 -- range
	BEGIN
		 
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
			 #recordFound rf 
			INNER JOIN 
	         dbo.med_ProductSpecValues psv
	         ON rf.ProductId=psv.ProductId
			WHERE  ProductSpecID=@ProductSpecID  
			 and psv.ValueMin   <= CONVERT(float, @ValueFirst)  
		    and  psv.ValueMax >= CONVERT(float, @ValueFirst)
		
	END
 
	
	FETCH NEXT FROM cFilters INTO @FieldName,  @ValueFirst, @ValueLast 

END  

CLOSE cFilters  
DEALLOCATE cFilters 

  --select * from  #recordFound where FiltersMatched > 0 

 DELETE FROM #recordFound  WHERE FiltersMatched<(SELECT COUNT(*) FROM @filter)






CREATE TABLE #recordFound2 (ProductID int, rowNumber int)
CREATE INDEX IDX_Product_RecordFound2 ON #recordFound2(ProductId)



  
		IF (LEN (ISNULL(@search,''))>0)  
		BEGIN
				INSERT INTO  #recordFound2 (ProductID , rowNumber )
				SELECT rf.ProductID , 	ROW_NUMBER() OVER (ORDER BY [RANK] DESC, rf.ProductID) AS rowNumber 
				FROM #recordFound rf INNER JOIN
				(
					SELECT s.ItemId as ProductID, ft.[RANK] as [RANK] 
						FROM  med_Search s  
						INNER JOIN 	FREETEXTTABLE (dbo.[med_Search], *, @search) ft ON s.[SearchId]=ft.[Key]
					WHERE s.ItemType=2 
				) fts
				ON rf.ProductID=fts.ProductID
			
				order by rowNumber
		END
		ELSE
		BEGIN
			INSERT INTO  #recordFound2 (ProductID , rowNumber )
			SELECT c.ProductID, 	ROW_NUMBER() OVER (ORDER BY c.Title) AS rowNumber 
				FROM #recordFound rf
				INNER join med_Product c
					ON rf.ProductID=c.ProductID
					where  c.isActive=1
			order by rowNumber
		END
		 
		 
		 		
		IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound') drop table #recordFound
   
	  SELECT * FROM med_ProductImages where ProductId in (SELECT p.ProductId
			 FROM #recordFound2 rf
				INNER join med_Product p ON rf.ProductId=p.ProductId
			 WHERE rf.rowNumber BETWEEN @skip+1 AND @skip+@top )
	
		
	    SELECT p.*
			 FROM #recordFound2 rf
				INNER join med_Product p ON rf.ProductId=p.ProductId
			 WHERE rf.rowNumber BETWEEN @skip+1 AND @skip+@top
		 
		
		DECLARE @RC INT
		SET @RC=@@RowCount
 
		 
			SELECT * 
			FROM
			(	
				SELECT  'Category' as FieldName,c.Category  as ValueFirst,'' as ValueLast
				,t.cnt,10 ord   
				FROM	
				(  
					SELECT ct.ProductCategoryID,Count(*) cnt
					FROM        dbo.med_Product ct
					INNER JOIN #recordFound2 rf on rf.ProductID=ct.ProductID
					group by ct.ProductCategoryID
				) t inner join med_ProductCategories c
				ON t.ProductCategoryID = c.ProductCategoryID 
			    --group by c.Category
					
					UNION
					
			SELECT  'Brand' as FieldName,b.Brand   as ValueFirst,'' as ValueLast, cnt, 20 ord 
				FROM
				(  
					SELECT ct.BrandId,Count(*) cnt
					FROM        dbo.med_Product ct
					INNER JOIN #recordFound2 rf on rf.ProductID=ct.ProductID
					group by ct.BrandId
				) t inner join med_Brands b
				ON t.BrandId=b.BrandId
				
				
			UNION
 
			SELECT  b.SpecName as FieldName,t.Value   as ValueFirst,'' as ValueLast, cnt, 30 ord 
				FROM
				(  
					SELECT ct.ProductSpecID, ct.ValueString as Value, Count(*) as cnt
					FROM        dbo.med_ProductSpecValues ct
					INNER JOIN #recordFound2 rf on rf.ProductID=ct.ProductID
					group by ct.ValueString, ct.ProductSpecID
				) t inner join med_v_ProductSpecsNamesActive b
				ON t.ProductSpecID=b.ProductSpecID
					Where b.SpecType = 1
					
			 UNION
 
			SELECT  b.SpecName as FieldName,CAST(t.ValueFirst as varchar) as ValueFirst,'' as ValueLast, cnt, 40 ord 
				FROM
				(  
					SELECT ct.ProductSpecID, ct.Value as ValueFirst, Count(*) as cnt
					FROM        dbo.med_ProductSpecList ct
					INNER JOIN #recordFound2 rf on rf.ProductID=ct.ProductID
					group by ct.Value, ct.ProductSpecID
				) t inner join med_v_ProductSpecsNamesActive b
				ON t.ProductSpecID=b.ProductSpecID
					Where b.SpecType = 2
					 
			 UNION
 
			SELECT  b.SpecName as FieldName,CAST(t.ValueFirst as varchar) as ValueFirst,'' as ValueLast, cnt, 50 ord 
				FROM
				(  
					SELECT ct.ProductSpecID, ct.ValueMin as ValueFirst, Count(*) as cnt
					FROM        dbo.med_ProductSpecValues ct
					INNER JOIN #recordFound2 rf on rf.ProductID=ct.ProductID
					group by ct.ValueMin, ct.ProductSpecID
				) t inner join med_v_ProductSpecsNamesActive b
				ON t.ProductSpecID=b.ProductSpecID
					Where b.SpecType =16	
		 UNION
 
			SELECT  b.SpecName as FieldName,CAST(t.ValueFirst as varchar) as ValueFirst,CAST(t.ValueLast as varchar) as ValueLast, cnt, 60 ord 
				FROM
				(  
					SELECT ct.ProductSpecID, ct.ValueMin as ValueFirst, ct.ValueMax as ValueLast, Count(*) as cnt
					FROM        dbo.med_ProductSpecValues ct
					INNER JOIN #recordFound2 rf on rf.ProductID=ct.ProductID
					group by ct.ValueMin,ct.ValueMax, ct.ProductSpecID
				) t inner join med_v_ProductSpecsNamesActive b
				ON t.ProductSpecID=b.ProductSpecID
					Where b.SpecType = 32
	    
		 
	) AS E ORDER BY ord
 


		
		SELECT COUNT(*) RecordsTotal, @skip+1 recordFirst,  @skip+@top recordLast, @RC recordCount
		FROM #recordFound2 
		
		

 	/*
IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound%') drop table #recordFound
 IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound2') drop table #recordFound2
*/
 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SearchCompanies]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

DECLARE @filter AS dbo.med_tpt_Filter
 
--INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES('CompanyType','Distributors','')

--INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES('country','United States','')

--INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES('Brand','foruno','')

--INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES('state','New York','')

--INSERT INTO @filter (FieldName, ValueFirst, ValueLast) VALUES('city','Tuzla-Istanbul','')

exec [dbo].[med_sp_SearchCompanies] 
@search = 'furuno', 
@top = 20, 
@skip = 0, 
@filter= @filter

*/
CREATE PROCEDURE [dbo].[med_sp_SearchCompanies]
	@search nvarchar(200)='',
	@top int=20,
	@skip int=0,
	@filter AS dbo.med_tpt_Filter Readonly 
AS
BEGIN

	SET NOCOUNT ON;
	
	/*
IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound%') drop table #recordFound
*/
CREATE TABLE #recordFound (CompanyId int, FiltersMatched int)


INSERT INTO #recordFound (CompanyId, FiltersMatched)
SELECT CompanyId, 0
FROM dbo.med_v_CompaniesActive




DECLARE @FieldName VARCHAR(100)
DECLARE @ValueFirst VARCHAR(100)

DECLARE cFilters CURSOR FOR  
SELECT FieldName, ValueFirst
FROM @filter


OPEN cFilters  
FETCH NEXT FROM cFilters INTO @FieldName,  @ValueFirst 


Declare @companyType nvarchar(255)
Declare @brand nvarchar(255)
Declare @country nvarchar(255)
Declare @state nvarchar(255)
Declare @city nvarchar(255)	
	 
set @companyType = NULL 
set @brand = NULL 
set @country = NULL 
set @state = NULL 
set @city = NULL 
 
		
WHILE @@FETCH_STATUS = 0  
BEGIN  

	print @FieldName
	
	
	IF @FieldName='CompanyType'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT DISTINCT   cb.CompanyId
			FROM         dbo.med_CompanyTypes b INNER JOIN
						 dbo.med_CompanyTypeRelations cb ON b.CompanyTypeId = cb.CompanyTypeId
			WHERE b.Type=@ValueFirst
		  ) m
		  ON rf.CompanyId = m.CompanyId
		  set @companyType = @ValueFirst 
	END
	
	
	IF @FieldName='Brand'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT DISTINCT   cb.CompanyId
			FROM         med_Brands b INNER JOIN
						 med_CompanyBrands cb ON b.BrandId = cb.BrandId
			WHERE b.Brand=@ValueFirst
		  ) m
		  ON rf.CompanyId = m.CompanyId
		 set @brand = @ValueFirst 
	END
	
	
	
	
	IF @FieldName='State'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT DISTINCT CompanyId
			FROM dbo.med_v_LocationActive
			WHERE State=@ValueFirst

		  ) m
		  ON rf.CompanyId = m.CompanyId
		  
		  set @state = @ValueFirst 
		  
		
	END
	
	
	
	IF @FieldName='Country'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT DISTINCT CompanyId
			FROM dbo.med_v_LocationActive
			WHERE Country=@ValueFirst

		  ) m
		  ON rf.CompanyId = m.CompanyId
		  
		  set @country = @ValueFirst 
		 
	END
	
	
	
	IF @FieldName='City'
	BEGIN
		UPDATE rf
			SET FiltersMatched=FiltersMatched+1
		FROM 
		 #recordFound rf 
		 INNER JOIN 
		 (
			SELECT DISTINCT CompanyId
			FROM dbo.med_v_LocationActive
			WHERE City =  @ValueFirst

		  ) m
		  ON rf.CompanyId = m.CompanyId
		  
		 set @city = @ValueFirst 
	END

	-- TO DO: Add Other filters
	
	
	FETCH NEXT FROM cFilters INTO @FieldName,  @ValueFirst 

END  

CLOSE cFilters  
DEALLOCATE cFilters 

--select * from #recordFound WHERE FiltersMatched>0

DELETE FROM #recordFound 
WHERE FiltersMatched<(SELECT COUNT(*) FROM @filter)

/*
IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound2%') drop table #recordFound
*/

CREATE TABLE #recordFound2 (CompanyId int, rowNumber int)


		
				
				
		IF (LEN (ISNULL(@search,''))>0)  
		BEGIN
				
				INSERT INTO  #recordFound2 (CompanyId , rowNumber )
				SELECT rf.CompanyId , 	ROW_NUMBER() OVER (ORDER BY [RANK] DESC, rf.CompanyID) AS rowNumber 
				FROM #recordFound rf INNER JOIN
				(
			    SELECT s.ItemId as CompanyId, ft.[RANK] as [RANK] 
				FROM  med_Search s  
				INNER JOIN 	FREETEXTTABLE (dbo.[med_Search], *, @search) ft ON s.[SearchId]=ft.[Key]
				WHERE s.ItemType=1
				) fts
				ON rf.CompanyId=fts.CompanyId
				order by rowNumber
		
		END
		ELSE
		BEGIN
			
			INSERT INTO  #recordFound2 (CompanyId , rowNumber )
			SELECT c.CompanyId, 	ROW_NUMBER() OVER (ORDER BY c.CompanyId) AS rowNumber 
				FROM #recordFound rf
				INNER join med_Companies c
					ON rf.CompanyId=c.CompanyId
			order by rowNumber
		
		END
		
		
		
	    SELECT c.CompanyId, Company, Description, Url, 	rf.rowNumber
			 FROM #recordFound2 rf
				INNER join med_Companies c ON rf.CompanyId=c.CompanyId
			WHERE rf.rowNumber BETWEEN @skip+1 AND @skip+@top
		
		DECLARE @RC INT
		SET @RC=@@RowCount
				 

		SELECT * 
			FROM
			(	
				SELECT  'companyType' as FieldName,c.Type   as ValueFirst,'' as ValueLast,Count(*) cnt, 10 ord   
				FROM        dbo.med_CompanyTypeRelations ct
				INNER JOIN #recordFound2 rf on rf.CompanyId=ct.CompanyId
				inner join dbo.med_CompanyTypes c on ct.CompanyTypeId = c.CompanyTypeId
				--where c.Type = ISNULL(@companyType,c.Type)
				group by c.Type
					
					UNION
					
				SELECT  'brand' as FieldName,b.Brand   as ValueFirst,'' as ValueLast, cnt, 20 ord 
				FROM
				(  
					SELECT ct.BrandId,Count(*) cnt
					FROM        dbo.med_CompanyBrands ct
					INNER JOIN #recordFound2 rf on rf.CompanyId=ct.CompanyId
					group by ct.BrandId
				) t inner join med_Brands b
				ON t.BrandId=b.BrandId
				--where b.Brand =ISNULL(@brand, b.Brand)
				
				--  select * from  dbo.med_CompanyBrands ct inner join  dbo.med_Brands b on ct.BrandId=b.BrandId where  CompanyId=107347 
				--  select * from  dbo.med_CompanyBrands ct inner join  dbo.med_Brands b on ct.BrandId=b.BrandId where  CompanyId=107347 
				
					UNION
					
				SELECT  'country' as FieldName,CAST(ct.country as varchar)   as ValueFirst,'' as ValueLast,Count(*) cnt, 30 ord   
				FROM        dbo.med_v_LocationActive ct
				INNER JOIN #recordFound2 rf on rf.CompanyId=ct.CompanyId
                --where ct.country = ISNULL(@country,   ct.country)   
				group by ct.country
				HAVING ct.country <>''
				
					UNION
					
				SELECT  'state' as FieldName,CAST(ct.state as varchar)   as ValueFirst,'' as ValueLast,Count(*) cnt, 40 ord   
				FROM        dbo.med_v_LocationActive ct
				INNER JOIN #recordFound2 rf on rf.CompanyId=ct.CompanyId
				--where  ct.country = ISNULL(@country,   ct.country)  and ct.state = ISNULL(@state,   ct.state)  
				group by ct.state	
				HAVING ct.state <>''
			
				UNION
				
				SELECT  'city' as FieldName,CAST(ct.city as varchar)   as ValueFirst,'' as ValueLast,Count(*) cnt, 50 ord   
				FROM        dbo.med_v_LocationActive ct
				INNER JOIN #recordFound2 rf on rf.CompanyId=ct.CompanyId
				--where ct.country = ISNULL(@country,   ct.country)  and ct.state = ISNULL(@state,   ct.state)  and ct.city = ISNULL(@city,   ct.city)  
				group by ct.city
				 HAVING ct.city <>''
				
				--select * from dbo.med_v_LocationActive  where CompanyId = 107178
				
 ) AS E ORDER BY ord

				
		SELECT COUNT(*) RecordsTotal, @skip+1 recordFirst,  @skip+@top recordLast, @RC recordCount
		FROM #recordFound2 

		select MI.* from dbo.med_Images as MI  inner join #recordFound2 RF on MI.ItemId =RF.CompanyId
		where MI.ItemType = 1 
		--and MI.Type ='logo'
		



 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetProductByUrlAdminPage]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
[dbo].[med_sp_GetProductByUrlAdminPage] '700-series-786ci-marine-chartplotter-5-color-640-x-640'
select * from dbo.med_Product where productId = 11
select * from med_ProductSpecValues
*/
CREATE PROCEDURE [dbo].[med_sp_GetProductByUrlAdminPage] 
	@url nvarchar(500)=''
	 
AS
BEGIN

	SET NOCOUNT ON;
	declare @productId int
	-- select * from dbo.med_Product
	select  @productId = productId  from dbo.med_Product where url =@url 
	-- Product
	select  *  from dbo.med_Product where productId =@productId 
	-- Product Specs
	SELECT     S.ProductSpecID,med_ProductSpecValues.ProductID, S.SpecName, med_ProductSpecValues.SpecGroup, med_ProductSpecValues.ValueString, med_ProductSpecValues.ValueOriginal
		FROM         med_v_ProductSpecsNamesActive AS S INNER JOIN
							  med_ProductSpecValues ON S.ProductSpecID = med_ProductSpecValues.ProductSpecID INNER JOIN
							  med_Product ON med_ProductSpecValues.ProductID = med_Product.ProductID
		WHERE     (med_ProductSpecValues.ProductID = @productId)
		order by S.SpecName
                  
	-- Product Images
	select  *  from dbo.med_ProductImages where productId =@productId 
	
	
	
 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetProductByUrl]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[med_sp_GetProductByUrl]
	@url nvarchar(500)=''
	 
AS
BEGIN

	SET NOCOUNT ON;
	declare @productId int
	
	select  @productId = productId  from dbo.med_Product where url =@url 
	-- Product
	select  *  from dbo.med_Product where productId =@productId 
	-- Product Specs
	SELECT     med_ProductSpecValues.ProductID, S.SpecName, med_ProductSpecValues.SpecGroup, med_ProductSpecValues.ValueString, med_ProductSpecValues.ValueOriginal
		FROM         med_v_ProductSpecsNamesActive AS S INNER JOIN
							  med_ProductSpecValues ON S.ProductSpecID = med_ProductSpecValues.ProductSpecID INNER JOIN
							  med_Product ON med_ProductSpecValues.ProductID = med_Product.ProductID
		WHERE     (med_ProductSpecValues.ProductID = @productId)
                  
	-- Product Images
	select  *  from dbo.med_ProductImages where productId =@productId 
	
	-- Product Accessories and Images
	
	
	SELECT   med_Product.ProductID INTO #productAccessories
			FROM         med_ProductAccessory INNER JOIN
								  med_Product ON med_ProductAccessory.ProductAccessoryID = med_Product.ProductID
			WHERE     (med_ProductAccessory.ProductId = @productId)
			
			
	select  *  from dbo.med_Product where productId in (select ProductID from #productAccessories)	
	select  *  from dbo.med_ProductImages where productId  in (select ProductID from #productAccessories)		
	drop table 	#productAccessories	
 
END
GO
/****** Object:  UserDefinedFunction [dbo].[med_sp_GenerateSearchKeywordsPerProduct]    Script Date: 04/04/2014 12:35:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[med_sp_GenerateSearchKeywordsPerProduct] 
(
    @ProductId AS Int
)
RETURNS VARCHAR(MAX) AS
BEGIN
 
 		DECLARE @keywords VARCHAR(max)=''

		SELECT @keywords =  ISNULL(TitleLong,'') + ' ' + 
				ISNULL(DescriptionShort ,'')+ ' ' 
				FROM dbo.med_Product
		WHERE ProductId=@ProductId
		
		select @keywords = @keywords +ISNULL(Category,'') + ' ' from dbo.med_Product as p inner join 
		dbo.med_v_ProductCategoriesActive as b on p.ProductCategoryID = b.ProductCategoryID
		Where p.ProductId=@ProductId	
		
		select @keywords =@keywords + ISNULL(Brand,'') + ' ' from dbo.med_Product as p inner join 
		dbo.med_Brands as b on p.BrandId = b.BrandId
		Where p.ProductId=@ProductId


		SELECT    @keywords = @keywords + ISNULL(med_ProductSpecValues.ValueString,'')+ ' '+ ISNULL(med_ProductSpecValues.ValueOriginal,'')+ ' '
			FROM     med_ProductSpecsNames INNER JOIN
                      med_ProductSpecValues ON med_ProductSpecsNames.ProductSpecID = med_ProductSpecValues.ProductSpecID
			WHERE     (med_ProductSpecsNames.IsFullTextSearch = 1) AND (med_ProductSpecsNames.SpecType = 1 or med_ProductSpecsNames.SpecType = 2)
		AND med_ProductSpecValues.ProductId=@ProductId
  
	
	return @keywords
	
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GenerateSearchKeywordsForEveryCompany]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 
	select * from med_Search where ItemType=1
  exec dbo.med_sp_GenerateSearchKeywordsForEveryCompany  
 */
CREATE PROCEDURE [dbo].[med_sp_GenerateSearchKeywordsForEveryCompany]
	
AS
BEGIN     
     IF EXISTS(SELECT     med_Search.SearchId
			FROM         med_Search INNER JOIN
                      med_Companies ON med_Search.ItemId = med_Companies.CompanyId and med_Search.ItemType = 1) 
      BEGIN
           UPDATE med_Search SET 
            Search=dbo.med_sp_GenerateSearchKeywordsPerCompany( m.companyId) 
           ,Title = m.Company
           ,[Description] = dbo.ShortMess( ISNULL(m.Description,Search), 150, 200)
           ,url = m.url
					FROM  med_Search as s  INNER JOIN
                      med_Companies as m ON s.ItemId = m.CompanyId
					  Where s.ItemType = 1
      END
      ELSE
      BEGIN
      	INSERT INTO med_Search (ItemId,Search,ItemType,Title,[Description],url ) 
			SELECT companyId,dbo.med_sp_GenerateSearchKeywordsPerCompany(companyId),1,Company,[Description],url  from dbo.med_Companies
	
      END
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GenerateSearchKeywordsForEveryProduct]    Script Date: 04/04/2014 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

 	select * from med_Search where ItemType=2
  exec dbo.med_sp_GenerateSearchKeywordsForEveryProduct
 */
CREATE PROCEDURE [dbo].[med_sp_GenerateSearchKeywordsForEveryProduct]
	
AS
BEGIN     
     IF EXISTS(SELECT     med_Search.SearchId
			FROM         med_Search INNER JOIN
                      med_Product ON med_Search.ItemId = med_Product.ProductID and med_Search.ItemType = 2) 
      BEGIN
           UPDATE med_Search SET Search=dbo.med_sp_GenerateSearchKeywordsPerProduct( m.ProductID)
           ,Title = SUBSTRING (m.Title,0,195)
           ,[Description] = dbo.ShortMess( ISNULL(m.DescriptionShort,Search), 150, 200)
           ,url = m.url
           
					FROM  med_Search as s  INNER JOIN
                      med_Product as m ON s.ItemId = m.ProductID
					where s.ItemType = 2
	  END
      ELSE
      BEGIN
      	INSERT INTO med_Search (ItemId,Search,ItemType, Title,[Description],url   ) 
			SELECT ProductID,dbo.med_sp_GenerateSearchKeywordsPerProduct(ProductID),2,Title,DescriptionShort,url  from dbo.med_Product
	
      END
      
      
   --SELECT     med_Product.* 
			--FROM         med_Search RIGHT OUTER JOIN
   --                   med_Product ON med_Search.ItemId = med_Product.ProductID and med_Search.ItemType = 2
   --                   WHERE med_Search.SearchId is null
      
      
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_ContentUrlWordsSplitting]    Script Date: 04/04/2014 12:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

[dbo].[cg_sp_ContentUrlWordsSplitting] 46738
select top 10 * from dbo.cg_ContentUrls  order by ContentUrlId desc 
*/


CREATE PROCEDURE [dbo].[cg_sp_ContentUrlWordsSplitting]
	-- Add the parameters for the stored procedure here
	@ContentUrlId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @text nvarchar(max)
	
	select @text= ISNULL(TitleExtracted,'')+' ' + dbo.StripHtmlEn(ISNULL(ContentExtracted,''))  from dbo.cg_ContentUrls where ContentUrlId=@ContentUrlId
	
	DECLARE @word TABLE (word nvarchar(200), WordCount int, WordId INT)
	
	INSERT INTO  @word (word,WordCount)
	 select w.Word, WordCount
		  from  dbo.SplitWords(@text) w
		  LEFT OUTER JOIN dbo.cg_WordsNoisy n
		  ON w.Word=n.Word
		  WHERE n.Word IS NULL AND WORDLENGTH>2
  
  
  INSERT INTO dbo.cg_Words (Word)
  SELECT n.word FROM   @word n
  LEFT OUTER JOIN dbo.cg_Words  w on n.Word=w.[Word]
  where w.[Word] is null 
    
    
  UPDATE n
	SET WordId = w.WordId
	FROM @word n
	INNER JOIN dbo.cg_Words  w 
	on n.Word=w.[Word]
	
	DELETE FROM cg_ContentUrlWords 
	WHERE ContentUrlId=@ContentUrlId
	
	
	INSERT INTO cg_ContentUrlWords(ContentUrlId ,  WordCount , WordId )
	SELECT @ContentUrlId ,  WordCount , WordId 
	FROM @word n
	
    
    
    exec dbo.cg_test_Similar @ContentUrlId
    
    
   
END
GO
/****** Object:  Default [DF_cg_StoriesSource_IsActive]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[cg_StoriesSource] ADD  CONSTRAINT [DF_cg_StoriesSource_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ec_TemplateFields_IsActive]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[ec_TemplateFields] ADD  CONSTRAINT [DF_ec_TemplateFields_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ec_Templates_IsActive]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[ec_Templates] ADD  CONSTRAINT [DF_ec_Templates_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_ec_Values_UserId]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[ec_Values] ADD  CONSTRAINT [DF_ec_Values_UserId]  DEFAULT ((0)) FOR [UserId]
GO
/****** Object:  Default [DF_ec_Values_DateCreated]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[ec_Values] ADD  CONSTRAINT [DF_ec_Values_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_med_ProductCategories_isActive]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[med_ProductCategories] ADD  CONSTRAINT [DF_med_ProductCategories_isActive]  DEFAULT ((1)) FOR [isActive]
GO
/****** Object:  Default [DF_med_ProductSpecsNames_IsActive]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[med_ProductSpecsNames] ADD  CONSTRAINT [DF_med_ProductSpecsNames_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_system_logging_system_logging_guid]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[system_logging] ADD  CONSTRAINT [DF_system_logging_system_logging_guid]  DEFAULT (newid()) FOR [system_logging_guid]
GO
/****** Object:  Default [DF_system_logging_entered_date]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[system_logging] ADD  CONSTRAINT [DF_system_logging_entered_date]  DEFAULT (getdate()) FOR [entered_date]
GO
/****** Object:  Default [DF__webpages___IsCon__7993056A]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
/****** Object:  Default [DF__webpages___Passw__7A8729A3]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 04/04/2014 12:35:10 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO

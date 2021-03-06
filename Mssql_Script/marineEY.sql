USE [testEY]
GO
/****** Object:  Table [dbo].[cg_ContentUrlsRelations]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_ContentUrls]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_ContentUrlRequestRelation]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cg_ContentUrlRequestRelation](
	[RequestSourceId] [int] NULL,
	[ContentUrlId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cg_ContentUrlImages]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_Categories]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  View [dbo].[cg_CategoriesForStories]    Script Date: 07/24/2013 13:44:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[BINTToIP]    Script Date: 07/24/2013 13:44:39 ******/
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
/****** Object:  View [dbo].[cg_Areas]    Script Date: 07/24/2013 13:44:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[AlphaNumericOnly]    Script Date: 07/24/2013 13:44:39 ******/
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
/****** Object:  Table [dbo].[_temp]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_temp](
	[name] [nvarchar](50) NULL,
	[value] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_RayMarineUsa]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[_RayMarineDealersInternational]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[_med_ProductSpecList]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[_man_Locations]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[_man_CompaniesBrands]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[_man_Companies]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[_man_BrandsList]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_man_BrandsList](
	[Brand] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_ForunoDealersUSA]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[_FixCountries]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[ga_Sites]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ga_Sites](
	[ProfileId] [int] NULL,
	[Domain] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ga_PageViews]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[ga_Pages]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ga_Pages](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NULL,
	[PagePath] [nvarchar](2500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ga_DatesExtracted]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ga_DatesExtracted](
	[ProfileId] [int] NULL,
	[DateExtracted] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForunoDealersUSA2$]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[Country$]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_websites]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  UserDefinedTableType [dbo].[cg_tt_StingInt]    Script Date: 07/24/2013 13:44:37 ******/
CREATE TYPE [dbo].[cg_tt_StingInt] AS TABLE(
	[StringValue] [nvarchar](max) NULL,
	[IntValue] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[cg_tt_IntBit]    Script Date: 07/24/2013 13:44:37 ******/
CREATE TYPE [dbo].[cg_tt_IntBit] AS TABLE(
	[IntValue] [int] NULL,
	[BitValue] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[cg_tt_ContentUrl]    Script Date: 07/24/2013 13:44:37 ******/
CREATE TYPE [dbo].[cg_tt_ContentUrl] AS TABLE(
	[ContentUrlId] [int] NULL,
	[Url] [nvarchar](2500) NULL,
	[Title] [nvarchar](2500) NULL,
	[Description] [nvarchar](max) NULL,
	[pubDate] [datetime] NULL
)
GO
/****** Object:  Table [dbo].[cg_StoryImages]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_StoryCategories]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_StoryAreas]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_StoriesSource]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[cg_Stories]    Script Date: 07/24/2013 13:44:36 ******/
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
 CONSTRAINT [PK_cg_Stories] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Search]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_ProductSpecValues]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_ProductSpecsNames]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_ProductSpecList]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_ProductImages]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_ProductCategories]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_ProductAccessory]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_ProductAccessory](
	[ProductId] [int] NOT NULL,
	[ProductAccessoryID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Product]    Script Date: 07/24/2013 13:44:36 ******/
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
	[url] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Location]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_Location](
	[LocationId] [int] IDENTITY(100000,1) NOT NULL,
	[CompanyId] [int] NULL,
	[tmpCompKey] [nvarchar](250) NULL,
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
/****** Object:  Table [dbo].[med_Images]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_FeaturedItems]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_CompanyTypes]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_CompanyTypeRelations]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_CompanyBrands]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_CompanyBrands](
	[CompanyId] [int] NULL,
	[BrandId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_Companies]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[med_Brands]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  UserDefinedFunction [dbo].[IPToBINT]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  Table [dbo].[RayMarineDealersUSA$]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[RayMarineDealersInternational_2$]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  UserDefinedFunction [dbo].[parseURL]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  Table [dbo].[cg_RequestItems]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_IPCityLocation]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_IPCityBlocks]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_dfp_Regions]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_dfp_Countries]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_CountryCodeTimeZone]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_CountryCodeRegion]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_CountryCodeName]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[geo_CountryCodeContinent]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  UserDefinedTableType [dbo].[ga_tt_PageViews]    Script Date: 07/24/2013 13:44:37 ******/
CREATE TYPE [dbo].[ga_tt_PageViews] AS TABLE(
	[ProfileId] [int] NULL,
	[PagePath] [nvarchar](2500) NULL,
	[PageDate] [date] NULL,
	[PageHour] [int] NULL,
	[PageViews] [int] NULL,
	[PageID] [int] NULL
)
GO
/****** Object:  Table [dbo].[Sources$]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sources$](
	[Content] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ShortMess]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  UserDefinedTableType [dbo].[med_tpt_Filter]    Script Date: 07/24/2013 13:44:37 ******/
CREATE TYPE [dbo].[med_tpt_Filter] AS TABLE(
	[FieldName] [nvarchar](max) NULL,
	[ValueFirst] [nvarchar](max) NULL,
	[ValueLast] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[RemoveSpecialChars]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_SplitDelimitedString]    Script Date: 07/24/2013 13:44:39 ******/
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
/****** Object:  Table [dbo].[us_states$]    Script Date: 07/24/2013 13:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[us_states$](
	[State] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_ParseAlphaChars]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  UserDefinedFunction [dbo].[udf_GetNumeric]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  Table [dbo].[tmpProductType]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[tmpProductSpecList]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[tmpProductSpecification]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[tmpProducts]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[tmpProductOption]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[tmpProductLists]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[tmpProductCdnImage]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  Table [dbo].[t_StoryWords]    Script Date: 07/24/2013 13:44:36 ******/
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
/****** Object:  UserDefinedFunction [dbo].[SplitCollocation]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  UserDefinedFunction [dbo].[med_sp_GenerateSearchKeywordsPerCompany]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_FillProductImageForCompanyLogo]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_mt_FillSearchNews]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_InsertSpecsList]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetSearchResults]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetRelatedProducts]    Script Date: 07/24/2013 13:44:33 ******/
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
			WHERE b.ProductCategoryID=@CategoryId
			
			
	 IF NOT EXISTS(select ProductID from #relatedProducts) 
	 BEGIN
			SET NOCOUNT ON;
		  SELECT DISTINCT   b.ProductID INTO #relatedProducts2
			     FROM  med_Product b 
		 WHERE b.BrandId=@BrandId

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
			where ProductID in (select ProductID from #randomProducts2)
	 
			select  *  from dbo.med_ProductImages where productId in   (select ProductID from #randomProducts2)
	 
			
			drop table #randomProducts2
			
	 END
	 
	 drop table #relatedProducts
	 
	 
	END
GO
/****** Object:  UserDefinedFunction [dbo].[RegExMatchLast]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[RegExMatchLast](@text [nvarchar](4000), @pattern [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[RegExMatchLast]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'RegEx.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatchLast'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'35' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatchLast'
GO
/****** Object:  UserDefinedFunction [dbo].[RegExMatch]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[RegExMatch](@text [nvarchar](4000), @pattern [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[RegExMatch]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'RegEx.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatch'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExMatch'
GO
/****** Object:  UserDefinedFunction [dbo].[RegExIsMatch]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[RegExIsMatch](@text [nvarchar](4000), @pattern [nvarchar](4000))
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[RegExIsMatch]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'RegEx.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExIsMatch'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'62' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'RegExIsMatch'
GO
/****** Object:  UserDefinedFunction [dbo].[SanitizeHtmlSoft]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[SanitizeHtmlSoft](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[SanitizeHtmlSoft]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlSoft'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'57' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlSoft'
GO
/****** Object:  UserDefinedFunction [dbo].[SanitizeHtmlDeEntitize]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[SanitizeHtmlDeEntitize](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[SanitizeHtmlDeEntitize]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlDeEntitize'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'64' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtmlDeEntitize'
GO
/****** Object:  UserDefinedFunction [dbo].[SanitizeHtml]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[SanitizeHtml](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[SanitizeHtml]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtml'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'49' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'SanitizeHtml'
GO
/****** Object:  UserDefinedFunction [dbo].[WordsAproxMatched]    Script Date: 07/24/2013 13:44:43 ******/
CREATE FUNCTION [dbo].[WordsAproxMatched](@text1 [nvarchar](max), @text2 [nvarchar](max), @diffLettersInWord [smallint], @excludeNoiseWords [bit])
RETURNS [real] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[WordsAproxMatched]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'MatchFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'WordsAproxMatched'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'WordsAproxMatched'
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SearchCompanies_v2]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[ga_sp_PageViewSave]    Script Date: 07/24/2013 13:44:33 ******/
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
	
	INSERT INTO  [dbo].[ga_PageViews]
           (
           [PageDate]
           ,[PageHour]
           ,[PageViews])
    SELECT [PageDate]
           ,[PageHour]
           ,[PageViews] FROM @PageViews
    
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
/****** Object:  StoredProcedure [dbo].[ga_sp_GetProfileIdDates]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStoriesList]    Script Date: 07/24/2013 13:44:33 ******/
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
	 
	  

	 select * from @ids order by id
	 
 END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_GetRequestItemsTimed]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetRequestItems]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetNonExtractedContentUrl]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetHowManyStoryPerMinute]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlsToCalculateSimilarity]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlImages]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlDomainStats]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetContentUrlByID]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetAllStoriesSourceStat]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_ContentUrlSave]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_GetCategoriesAutofill]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  View [dbo].[med_v_ProductSpecsNamesActive]    Script Date: 07/24/2013 13:44:44 ******/
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
/****** Object:  View [dbo].[med_v_ProductCategoriesActive]    Script Date: 07/24/2013 13:44:44 ******/
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
/****** Object:  View [dbo].[med_v_LocationActive]    Script Date: 07/24/2013 13:44:44 ******/
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
/****** Object:  View [dbo].[med_v_CompaniesActive]    Script Date: 07/24/2013 13:44:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[InsertLinkFuzzyTemplate]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[InsertLinkFuzzyTemplate](@html [nvarchar](max), @keyword [nvarchar](max), @linkTemplate [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[InsertLinkFuzzyTemplate]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzyTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'36' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzyTemplate'
GO
/****** Object:  UserDefinedFunction [dbo].[InsertLinkFuzzy]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[InsertLinkFuzzy](@html [nvarchar](max), @linkText [nvarchar](max), @linkHref [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[InsertLinkFuzzy]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzy'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'InsertLinkFuzzy'
GO
/****** Object:  UserDefinedFunction [dbo].[HtmlToText]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[HtmlToText](@html [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[HtmlToText]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'HtmlToText'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'71' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'HtmlToText'
GO
/****** Object:  UserDefinedFunction [dbo].[GetImagesFromHtml]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  StoredProcedure [dbo].[geo_sp_GetLocationItems]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[geo_sp_GetGeoIPLocation]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[geo_sp_GetAllBrand]    Script Date: 07/24/2013 13:44:33 ******/
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


create PROCEDURE [dbo].[geo_sp_GetAllBrand]
 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [BrandId]
      ,[Brand]
  FROM [testEY].[dbo].[med_Brands]


END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetNearestCompaniesByLocationID]    Script Date: 07/24/2013 13:44:33 ******/
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
			  and ctr.CompanyTypeId=@TypeId
			  
	  
	
	
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
					AND (ISNUMERIC(l.latitude) = 1) AND (ISNUMERIC(l.latitude) = 1)
		ORDER BY distance
		
		
		IF NOT EXISTS ( SELECT * FROM @loc)
		BEGIN
		
		INSERT INTO @loc(CompanyId , LocationId , distance )
		SELECT  top (@top)  l.CompanyId, l.LocationId, 0 FROM
			#companyFound as  c INNER JOIN med_Location AS l  ON l.CompanyId = c.CompanyId
		
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetNearestCompanies]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetGeoInformationByIPAddress]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetFilteredCompanies]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetFeaturedProducts]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetFeaturedCompanies]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetCompanyProducts]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetCompanyByUrl]    Script Date: 07/24/2013 13:44:33 ******/
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
	select  *  from dbo.med_Location where companyId = @companyId
	
	select MI.* from dbo.med_Images as MI where MI.ItemType = 1 and MI.ItemId = @companyId
		
 
	 
					
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetCompanyBrands]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GetAutoCompleteItems]    Script Date: 07/24/2013 13:44:33 ******/
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
			FROM         med_Companies
	UNION
		SELECT DISTINCT Title as Title, 2 AS ItemTypeId
			FROM         med_Product
		 UNION
	 SELECT DISTINCT Title as Title, 32 AS ItemTypeId
			FROM         med_Search		where ItemType=32
	) as t 
	
	
	
END
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidEmail]    Script Date: 07/24/2013 13:44:42 ******/
CREATE FUNCTION [dbo].[IsValidEmail](@email [nvarchar](max))
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerCLRNews].[UserDefinedFunctions].[IsValidEmail]
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'HtmlFunctions.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'IsValidEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=N'80' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'IsValidEmail'
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_StoryUpdate]    Script Date: 07/24/2013 13:44:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
	@Companies as cg_tt_StingInt readonly  
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
	 WHERE StoryId=@StoryId
	
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
	
	
	
	
	 
END
GO
/****** Object:  StoredProcedure [dbo].[cg_sp_InsertContentUrlRelationsAndUpdateContentUrl]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStorySourceStats]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStoryById]    Script Date: 07/24/2013 13:44:33 ******/
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
                      
                      
 
		IF EXISTS( SELECT  distinct   cg_Areas.*,cg_StoryAreas.isSelected
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
/****** Object:  StoredProcedure [dbo].[cg_sp_GetStoryByContetUrlId]    Script Date: 07/24/2013 13:44:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cg_sp_GetStoryByContetUrlId]
	@ContentUrlId int 
AS
BEGIN

DECLARE @StoryId INT

SELECT @StoryId=StoryId FROM [dbo].[cg_Stories] WHERE ContentUrlId=@ContentUrlId

IF ISNULL(@StoryId,0)=0
BEGIN
INSERT INTO [dbo].[cg_Stories]
	(ContentUrlId, Title, Body,publishDate, Source,[Rank],IsPublished)
SELECT     ContentUrlId, TitleExtracted, ContentExtracted, pubDate,dbo.parseURL(Url),2,0 
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
/****** Object:  UserDefinedFunction [dbo].[med_sp_GenerateSearchKeywordsPerProduct]    Script Date: 07/24/2013 13:44:42 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_SearchCompanies]    Script Date: 07/24/2013 13:44:33 ******/
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
	
	
IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound%') drop table #recordFound

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

IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound2%') drop table #recordFound
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
				 
				
				--select * from dbo.med_v_LocationActive  where CompanyId = 107178
				
 ) AS E ORDER BY ord

				
		SELECT COUNT(*) RecordsTotal, @skip+1 recordFirst,  @skip+@top recordLast, @RC recordCount
		FROM #recordFound2 

		select MI.* from dbo.med_Images as MI  inner join #recordFound2 RF on MI.ItemId =RF.CompanyId
		where MI.ItemType = 1 
		--and MI.Type ='logo'
		



 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_SearchProducts]    Script Date: 07/24/2013 13:44:33 ******/
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
	
	
IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound%') drop table #recordFound
 
CREATE TABLE #recordFound (ProductId int, FiltersMatched int)
CREATE INDEX IDX_Product_RecordFound ON #recordFound(ProductId)
 
INSERT INTO #recordFound (ProductId, FiltersMatched)
SELECT ProductId, 0
FROM dbo.med_Product as p
inner join med_v_ProductCategoriesActive c
				ON p.ProductCategoryID = c.ProductCategoryID 
 



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
					WHERE     (med_Companies.url = @ValueFirst)

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
			WHERE cb.Brand=@ValueFirst
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
			WHERE cb.Category=@ValueFirst
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

 DELETE FROM #recordFound 
WHERE FiltersMatched<(SELECT COUNT(*) FROM @filter)



IF EXISTS(select name from tempdb..sysobjects  where name like '#recordFound2%') drop table #recordFound
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
			order by rowNumber
		END
		 
		 
		 		
		
   
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
		
		

 
 
END
GO
/****** Object:  StoredProcedure [dbo].[med_sp_GetProductByUrl]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GenerateSearchKeywordsForEveryCompany]    Script Date: 07/24/2013 13:44:33 ******/
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
/****** Object:  StoredProcedure [dbo].[med_sp_GenerateSearchKeywordsForEveryProduct]    Script Date: 07/24/2013 13:44:33 ******/
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
END
GO
/****** Object:  Default [DF_cg_StoriesSource_IsActive]    Script Date: 07/24/2013 13:44:36 ******/
ALTER TABLE [dbo].[cg_StoriesSource] ADD  CONSTRAINT [DF_cg_StoriesSource_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_med_ProductCategories_isActive]    Script Date: 07/24/2013 13:44:36 ******/
ALTER TABLE [dbo].[med_ProductCategories] ADD  CONSTRAINT [DF_med_ProductCategories_isActive]  DEFAULT ((1)) FOR [isActive]
GO
/****** Object:  Default [DF_med_ProductSpecsNames_IsActive]    Script Date: 07/24/2013 13:44:36 ******/
ALTER TABLE [dbo].[med_ProductSpecsNames] ADD  CONSTRAINT [DF_med_ProductSpecsNames_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

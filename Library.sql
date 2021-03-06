USE [Customer]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BookLanguage] [varchar](20) NOT NULL,
	[bookName] [nvarchar](80) NOT NULL,
	[BookType] [varchar](20) NOT NULL,
	[createTime] [datetime] NULL CONSTRAINT [DF_Book_create_time]  DEFAULT (getdate()),
	[Summary] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_dbo.Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookImgae]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookImgae](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[ImageDate] [datetime] NULL CONSTRAINT [DF_BookImgae_Image_Date]  DEFAULT (getdate()),
	[ImagePath] [nvarchar](80) NULL,
 CONSTRAINT [PK_dbo.BookImgae] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2017/5/25 下午 11:35:30 ******/
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastPassWord] [varchar](120) NULL,
	[Password] [varchar](120) NOT NULL,
	[Username] [varchar](25) NOT NULL,
	[ModifyDate] [datetime] NULL,
	CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[parameter]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParameterSetting](
	[Chinese] [nvarchar](200) NOT NULL,
	[English] [varchar](200) NOT NULL,
	[Parametertype] INT NOT NULL
) 

GO


INSERT INTO dbo.ParameterSetting ([chinese],[English],[Parametertype]) VALUES (N'搞笑','funny',10);
INSERT INTO dbo.ParameterSetting ([chinese],[English],[Parametertype]) VALUES (N'恐怖','horror',10);
INSERT INTO dbo.ParameterSetting ([chinese],[English],[Parametertype]) VALUES (N'科學','science',10);

INSERT INTO dbo.ParameterSetting ([chinese],[English],[Parametertype]) VALUES (N'中文','Chinese',0);
INSERT INTO dbo.ParameterSetting ([chinese],[English],[Parametertype]) VALUES (N'英文','English',0);


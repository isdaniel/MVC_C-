USE [Department]
GO
/****** Object:  Table [dbo].[Library_Book]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Library_Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BookLanguage] [varchar](20) NOT NULL,
	[bookName] [nvarchar](80) NOT NULL,
	[BookType] [varchar](20) NOT NULL,
	[create_time] [datetime] NULL CONSTRAINT [DF_Library_Book_create_time]  DEFAULT (getdate()),
	[summary] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_dbo.Library_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Library_BookImgae]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library_BookImgae](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[Image_Date] [datetime] NULL CONSTRAINT [DF_Library_BookImgae_Image_Date]  DEFAULT (getdate()),
	[Image_Path] [nvarchar](80) NULL,
 CONSTRAINT [PK_dbo.Library_BookImgae] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Library_UserInfo]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Library_UserInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastPassWord] [varchar](120) NULL,
	[Lib_password] [varchar](120) NOT NULL,
	[Lib_username] [varchar](25) NOT NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Library_UserInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[parameter]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parameter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chinese] [nvarchar](max) NOT NULL,
	[English] [nvarchar](max) NOT NULL,
	[parametertype] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Parameters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2017/5/25 下午 11:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Rowid] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Library_BookImgae]  WITH NOCHECK ADD  CONSTRAINT [FK_Library_BookImgae_Library_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Library_Book] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Library_BookImgae] NOCHECK CONSTRAINT [FK_Library_BookImgae_Library_Book]
GO

--USE [Master]
--drop database [SWP_Project]
--create database [SWP_Project]
USE [SWP_Project]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[conversationID] [int] IDENTITY(1,1) NOT NULL,
	[MentorID] [int] NULL,
	[MenteeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[conversationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[CvID] [int] IDENTITY(1,1) NOT NULL,
	[ProfessionIntroduction] [nvarchar](255) NULL,
	[ServiceDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentee]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentee](
	[Avatar] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentor]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor](
	[UserID] [int] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
	[CvID] [int] NULL,
	[Achivement] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MentorSkills]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorSkills](
	[SkillID] [int] NULL,
	[MentorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[conversationID] [int] NULL,
	[SenderID] [int] NULL,
	[sentAt] [datetime] NULL,
	[msgContent] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](255) NULL,
	[Balance] [int] NULL,
	[UserID] [int] NULL,
	[ReceiverID] [int] NULL,
	[Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[MentorID] [int] NULL,
	[MenteeID] [int] NULL,
	[noStar] [int] NULL,
	[ratingComment] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportContent] [text] NULL,
	[reportTime] [datetime] NULL,
	[UserID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NULL,
	[UserID] [int] NULL,
	[RequestReason] [nvarchar](255) NULL,
	[RequestStatus] [nvarchar](255) NULL,
	[RequestTime] [datetime] NOT NULL default GETDATE(),
	[DeadlineTime] [datetime] NOT NULL,
	[RequestSubject] [nvarchar](255) NULL
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestSkill]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestSkill](
	[RequestID] [int] NULL,
	[SkillID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[MentorID] [int] NULL,
	[SlotID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [int] NULL,
	[Money] [int] NULL,
	[createAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotMember]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotMember](
	[SlotID] [int] NULL,
	[MenteeID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/13/2024 9:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[sex] [bit] NULL,
	[activeStatus] [bit] NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[dob] [date] NULL,
	[email] [varchar](255) NULL,
	[phoneNumber] [varchar](10) NULL,
	[wallet] [int] NULL,
	[address] [nvarchar](255) NULL,
	[RoleID] [int] NULL,
	[isValidate] [bit] default 0
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CV] ON 

INSERT [dbo].[CV] ([CvID], [ProfessionIntroduction], [ServiceDescription]) VALUES (1, N'Có kinh nghiệm 5 năm trong việc dạy học tại trường đại học X.', N'Vui vẻ nhiệt tình giải đáp mọi câu hỏi của bạn.')
SET IDENTITY_INSERT [dbo].[CV] OFF
GO
INSERT [dbo].[Mentee] ([Avatar], [fullname], [UserID]) VALUES (N'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2020/6/13/812414/Luu-Diec-Phi.jpg', N'Cô Cô', 3)
INSERT [dbo].[Mentee] ([Avatar], [fullname], [UserID]) VALUES (N'https://tse4.mm.bing.net/th/id/OIP.sxEyv7CyrelgrwogIa8X4AHaKI?rs=1&pid=ImgDetMain', N'Quá Cụt', 4)
GO
INSERT [dbo].[Mentor] ([UserID], [Avatar], [Description], [fullname], [CvID], [Achivement]) VALUES (5, N'https://yt3.ggpht.com/a/AGF-l7-76wRFn8M3Kc3hoh_b99uuoqzMELozCJVkSA=s900-mo-c-c0xffffffff-rj-k-no', NULL, N'Doãn Chí Bình', 1, N'Đã hỗ trợ học tập được 15 học viên.')
GO
INSERT [dbo].[MentorSkills] ([SkillID], [MentorID]) VALUES (1, 5)
INSERT [dbo].[MentorSkills] ([SkillID], [MentorID]) VALUES (2, 5)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [roleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([RoleID], [roleName]) VALUES (3, N'Mentor')
INSERT [dbo].[Role] ([RoleID], [roleName]) VALUES (4, N'Mentee')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (1, N'Lập trình Python')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (2, N'Lập trình Java')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (3, N'Lập trình C')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (4, N'Lập trình Ruby')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (5, N'Lập trình PHP')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (6, N'HTML')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (7, N'CSS')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (8, N'React')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (9, N'Bootstrap')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (10, N'Node.js')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (11, N'Spring Boot')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (12, N'MySQL')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (13, N'Lập trình JavaScript')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (14, N'Lập trình C#')
INSERT [dbo].[Skills] ([SkillID], [SkillName]) VALUES (15, N'Lập trình C++')
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [sex], [activeStatus], [username], [password], [dob], [email], [phoneNumber], [wallet], [address], [RoleID]) VALUES (1, 0, 1, N'admin', N'123', CAST(N'2000-01-01' AS Date), NULL, N'0123456789', 0, N'Hà Nội', 1)
INSERT [dbo].[User] ([UserID], [sex], [activeStatus], [username], [password], [dob], [email], [phoneNumber], [wallet], [address], [RoleID]) VALUES (2, 1, 1, N'manager', N'123', CAST(N'1999-05-03' AS Date), NULL, N'0923874567', 0, N'Hà Nội', 2)
INSERT [dbo].[User] ([UserID], [sex], [activeStatus], [username], [password], [dob], [email], [phoneNumber], [wallet], [address], [RoleID]) VALUES (3, 1, 1, N'coco', N'123', CAST(N'2005-06-09' AS Date), NULL, N'0823476854', 100000, N'Cà Mau', 4)
INSERT [dbo].[User] ([UserID], [sex], [activeStatus], [username], [password], [dob], [email], [phoneNumber], [wallet], [address], [RoleID]) VALUES (4, 1, 0, N'kiemto', N'123', CAST(N'2007-12-04' AS Date), NULL, N'0128749365', 10000000, N'Hà Giang', 4)
INSERT [dbo].[User] ([UserID], [sex], [activeStatus], [username], [password], [dob], [email], [phoneNumber], [wallet], [address], [RoleID]) VALUES (5, 0, 1, N'doandaihiep', N'123', CAST(N'2000-09-07' AS Date), NULL, N'0912873406', 0, N'Bắc Cạn', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD FOREIGN KEY([MenteeID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD FOREIGN KEY([MentorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Mentee]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Mentor]  WITH CHECK ADD FOREIGN KEY([CvID])
REFERENCES [dbo].[CV] ([CvID])
GO
ALTER TABLE [dbo].[Mentor]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[MentorSkills]  WITH CHECK ADD FOREIGN KEY([MentorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[MentorSkills]  WITH CHECK ADD FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD FOREIGN KEY([conversationID])
REFERENCES [dbo].[Conversation] ([conversationID])
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD FOREIGN KEY([SenderID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([MenteeID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([MentorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[RequestSkill]  WITH CHECK ADD FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[RequestSkill]  WITH CHECK ADD FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([SenderID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([MentorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[SlotMember]  WITH CHECK ADD FOREIGN KEY([MenteeID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[SlotMember]  WITH CHECK ADD FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO

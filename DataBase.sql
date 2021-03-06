USE [master]
GO
/****** Object:  Database [University_DB]    Script Date: 11/1/2018 2:31:30 AM ******/
CREATE DATABASE [University_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\University_DB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'University_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\University_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [University_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [University_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [University_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University_DB] SET  MULTI_USER 
GO
ALTER DATABASE [University_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [University_DB]
GO
/****** Object:  Table [dbo].[Admin_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_User_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignTeacher_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignTeacher_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_AssignTeacher_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](50) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseCredit] [decimal](5, 3) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[DeptId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptCode] [nvarchar](50) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Designation_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enroll_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollDate] [date] NOT NULL,
 CONSTRAINT [PK_Enroll_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grade_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Grade_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_Result_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomAllocation_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAllocation_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[Day] [nvarchar](50) NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[EndTime] [time](0) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_RoomAllocation_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Semester_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[StudentEmail] [nvarchar](50) NOT NULL,
	[StudentContact] [nvarchar](50) NOT NULL,
	[RegDate] [date] NOT NULL,
	[StudentAddress] [nvarchar](255) NOT NULL,
	[DeptId] [int] NOT NULL,
	[RegisterNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher_tb]    Script Date: 11/1/2018 2:31:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](50) NOT NULL,
	[TeacherAddress] [nvarchar](500) NOT NULL,
	[TracherEmail] [nvarchar](50) NOT NULL,
	[TracherContact] [nvarchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DeptId] [int] NOT NULL,
	[Credit] [decimal](5, 3) NOT NULL,
 CONSTRAINT [PK_Teacher_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin_tb] ON 

INSERT [dbo].[Admin_tb] ([Id], [Name], [UserName], [Password]) VALUES (8, N'Mehedi Hasan', N'mehedi', N'3HhxGocas55cs8Bct+/O3Q==')
SET IDENTITY_INSERT [dbo].[Admin_tb] OFF
SET IDENTITY_INSERT [dbo].[AssignTeacher_tb] ON 

INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2031, 11, 1007, 1009, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2032, 11, 1008, 1010, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2033, 11, 1007, 1011, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2034, 11, 1008, 1012, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2035, 11, 1010, 1014, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2036, 11, 1009, 1013, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2037, 12, 1011, 1015, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2038, 12, 1012, 1016, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2039, 12, 1011, 1017, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2040, 13, 1015, 1018, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2041, 13, 1014, 1019, 1)
INSERT [dbo].[AssignTeacher_tb] ([Id], [DeptId], [TeacherId], [CourseId], [Status]) VALUES (2042, 13, 1016, 1020, 1)
SET IDENTITY_INSERT [dbo].[AssignTeacher_tb] OFF
SET IDENTITY_INSERT [dbo].[Course_tb] ON 

INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1009, N'CSE 101', N'Computer Fundamental', CAST(3.000 AS Decimal(5, 3)), NULL, 11, 1)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1010, N'CSE 112', N'Programming and Problem Solving', CAST(3.000 AS Decimal(5, 3)), NULL, 11, 2)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1011, N'CSE 113', N'Programming and Problem Solving Lab', CAST(1.000 AS Decimal(5, 3)), NULL, 11, 2)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1012, N'CSE 131', N'Object Oriented Programming', CAST(3.000 AS Decimal(5, 3)), NULL, 11, 3)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1013, N'CSE 132', N'Object Oriented Programming Lab', CAST(1.000 AS Decimal(5, 3)), NULL, 11, 3)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1014, N'CSE 211', N'Algorithm', CAST(3.000 AS Decimal(5, 3)), NULL, 11, 4)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1015, N'SWE 201', N'Software Engineering', CAST(3.000 AS Decimal(5, 3)), NULL, 12, 2)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1016, N'SWE 231', N'Software Security', CAST(3.000 AS Decimal(5, 3)), NULL, 12, 3)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1017, N'SWE 301', N'Theory of Computing', CAST(3.000 AS Decimal(5, 3)), NULL, 12, 4)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1018, N'EEE 101', N'Fundamental Physics', CAST(3.000 AS Decimal(5, 3)), NULL, 13, 1)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1019, N'EEE 102', N'Engineering Physics', CAST(3.000 AS Decimal(5, 3)), NULL, 13, 2)
INSERT [dbo].[Course_tb] ([Id], [CourseCode], [CourseName], [CourseCredit], [Description], [DeptId], [SemesterId]) VALUES (1020, N'EEE 130', N'Electric Circuit', CAST(3.000 AS Decimal(5, 3)), NULL, 13, 3)
SET IDENTITY_INSERT [dbo].[Course_tb] OFF
SET IDENTITY_INSERT [dbo].[Department_tb] ON 

INSERT [dbo].[Department_tb] ([Id], [DeptCode], [DeptName]) VALUES (11, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Department_tb] ([Id], [DeptCode], [DeptName]) VALUES (12, N'SWE', N'Software Engineering')
INSERT [dbo].[Department_tb] ([Id], [DeptCode], [DeptName]) VALUES (13, N'EEE', N'Electrical and Electronics Engineering')
INSERT [dbo].[Department_tb] ([Id], [DeptCode], [DeptName]) VALUES (14, N'BBA', N'Bachelor of Business Administration')
INSERT [dbo].[Department_tb] ([Id], [DeptCode], [DeptName]) VALUES (15, N'ETE', N'Electronics and Telecommunication Engineering')
SET IDENTITY_INSERT [dbo].[Department_tb] OFF
SET IDENTITY_INSERT [dbo].[Designation_tb] ON 

INSERT [dbo].[Designation_tb] ([Id], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[Designation_tb] ([Id], [DesignationName]) VALUES (2, N'Associate Professor')
INSERT [dbo].[Designation_tb] ([Id], [DesignationName]) VALUES (3, N'Senior Lecturer')
INSERT [dbo].[Designation_tb] ([Id], [DesignationName]) VALUES (4, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designation_tb] OFF
SET IDENTITY_INSERT [dbo].[Enroll_tb] ON 

INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1002, 1010, 1009, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1003, 1010, 1010, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1004, 1012, 1011, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1005, 1010, 1012, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1006, 1011, 1010, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1007, 1011, 1012, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1008, 1011, 1011, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1009, 1014, 1015, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1010, 1014, 1016, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1011, 1014, 1017, CAST(0xE33E0B00 AS Date))
INSERT [dbo].[Enroll_tb] ([Id], [StudentId], [CourseId], [EnrollDate]) VALUES (1012, 1010, 1011, CAST(0xE33E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Enroll_tb] OFF
SET IDENTITY_INSERT [dbo].[Grade_tb] ON 

INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (1, N'A+')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (2, N'A')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (3, N'A-')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (4, N'B+')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (5, N'B')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (6, N'B-')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (7, N'C+')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (8, N'C')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (9, N'C-')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (10, N'D+')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (11, N'D')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (12, N'D-')
INSERT [dbo].[Grade_tb] ([Id], [Grade]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[Grade_tb] OFF
SET IDENTITY_INSERT [dbo].[Result_tb] ON 

INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1002, 1010, 1009, 1)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1003, 1010, 1010, 1)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1004, 1010, 1012, 1)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1005, 1011, 1010, 2)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1006, 1011, 1012, 2)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1007, 1011, 1011, 1)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1008, 1014, 1015, 1)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1009, 1014, 1016, 2)
INSERT [dbo].[Result_tb] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1010, 1014, 1017, 2)
SET IDENTITY_INSERT [dbo].[Result_tb] OFF
SET IDENTITY_INSERT [dbo].[Room_tb] ON 

INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (1, N'301-AB')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (2, N'302-AB')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (3, N'303-AB')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (4, N'401-AB')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (5, N'402-AB')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (6, N'601-PP')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (7, N'602-PP')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (8, N'801-PP')
INSERT [dbo].[Room_tb] ([Id], [RoomNumber]) VALUES (9, N'802-PP')
SET IDENTITY_INSERT [dbo].[Room_tb] OFF
SET IDENTITY_INSERT [dbo].[RoomAllocation_tb] ON 

INSERT [dbo].[RoomAllocation_tb] ([Id], [DeptId], [CourseId], [RoomId], [Day], [StartTime], [EndTime], [Status]) VALUES (2002, 11, 1009, 1, N'Saturday', CAST(0x0088770000000000 AS Time), CAST(0x00A08C0000000000 AS Time), 1)
INSERT [dbo].[RoomAllocation_tb] ([Id], [DeptId], [CourseId], [RoomId], [Day], [StartTime], [EndTime], [Status]) VALUES (2003, 11, 1009, 2, N'Monday', CAST(0x0088770000000000 AS Time), CAST(0x00A08C0000000000 AS Time), 1)
INSERT [dbo].[RoomAllocation_tb] ([Id], [DeptId], [CourseId], [RoomId], [Day], [StartTime], [EndTime], [Status]) VALUES (2004, 11, 1010, 3, N'Monday', CAST(0x00A08C0000000000 AS Time), CAST(0x00B8A10000000000 AS Time), 1)
INSERT [dbo].[RoomAllocation_tb] ([Id], [DeptId], [CourseId], [RoomId], [Day], [StartTime], [EndTime], [Status]) VALUES (2005, 11, 1010, 6, N'Thrusday', CAST(0x00D0B60000000000 AS Time), CAST(0x00E8CB0000000000 AS Time), 1)
INSERT [dbo].[RoomAllocation_tb] ([Id], [DeptId], [CourseId], [RoomId], [Day], [StartTime], [EndTime], [Status]) VALUES (2006, 12, 1015, 9, N'Monday', CAST(0x00B8A10000000000 AS Time), CAST(0x00D0B60000000000 AS Time), 1)
INSERT [dbo].[RoomAllocation_tb] ([Id], [DeptId], [CourseId], [RoomId], [Day], [StartTime], [EndTime], [Status]) VALUES (2007, 12, 1016, 5, N'Monday', CAST(0x00A08C0000000000 AS Time), CAST(0x00B8A10000000000 AS Time), 1)
INSERT [dbo].[RoomAllocation_tb] ([Id], [DeptId], [CourseId], [RoomId], [Day], [StartTime], [EndTime], [Status]) VALUES (2008, 13, 1020, 2, N'Monday', CAST(0x0020FD0000000000 AS Time), CAST(0x0038120100000000 AS Time), 1)
SET IDENTITY_INSERT [dbo].[RoomAllocation_tb] OFF
SET IDENTITY_INSERT [dbo].[Semester_tb] ON 

INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (1, N'1st Semester')
INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (2, N'2nd Semester')
INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (3, N'3rd Semester')
INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (4, N'4th Semester')
INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (5, N'5th Semester')
INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (6, N'6th Semester')
INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (7, N'7th Semester')
INSERT [dbo].[Semester_tb] ([Id], [SemesterName]) VALUES (8, N'8th Semester')
SET IDENTITY_INSERT [dbo].[Semester_tb] OFF
SET IDENTITY_INSERT [dbo].[Student_tb] ON 

INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1010, N'Mehedi Hasan', N'mehedi3555@gmail.com', N'01790744999', CAST(0xE33E0B00 AS Date), N'Dhaka', 11, N'CSE-2018-001')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1011, N'Abu Huzaifa', N'abu@gmail.com', N'01700000000', CAST(0xE33E0B00 AS Date), N'Dhaka', 11, N'CSE-2018-002')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1012, N'Tamim Iqbal', N'tamim@gmail.com', N'01711111111', CAST(0xE33E0B00 AS Date), N'Dhaka', 11, N'CSE-2018-003')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1013, N'Md. Muzahid', N'muzahid@gmail.com', N'01722222222', CAST(0xE33E0B00 AS Date), N'Dhaka', 11, N'CSE-2018-004')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1014, N'Sumaiya Rahman', N'rahman@gmail.com', N'01733333333', CAST(0xE33E0B00 AS Date), N'Dhaka', 12, N'SWE-2018-001')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1015, N'Afia Hasan', N'afia@gmail.com', N'01744444444', CAST(0xE33E0B00 AS Date), N'Dhaka', 12, N'SWE-2018-002')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1016, N'Jabbir Hosain', N'hosain@gmail.com', N'01755555555', CAST(0xE33E0B00 AS Date), N'Dhaka', 12, N'SWE-2018-003')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1017, N'Ahsan Habib', N'habib@gmail.com', N'01766666666', CAST(0xE33E0B00 AS Date), N'Dhaka', 13, N'EEE-2018-001')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1018, N'Sayem Hosain', N'sayem@gmail.com', N'01777777777', CAST(0xE33E0B00 AS Date), N'Dhaka', 13, N'EEE-2018-002')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1019, N'Rokibul Islam', N'rocky@gmail.com', N'01788888888', CAST(0xE33E0B00 AS Date), N'Dhaka', 13, N'EEE-2018-003')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1020, N'Repon Sarkar', N'sarkar@gmail.com', N'01799999999', CAST(0xE33E0B00 AS Date), N'Dhaka', 12, N'SWE-2018-004')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1021, N'Steve Smith', N'smith@gmail.com', N'01701010101', CAST(0xE43E0B00 AS Date), N'Dhaka', 14, N'BBA-2018-001')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1022, N'David Warner', N'warner@gmail.com', N'01703030303', CAST(0xE43E0B00 AS Date), N'Dhaka', 14, N'BBA-2018-002')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1023, N'Glenn Maxwell', N'maxi@gmail.com', N'01901010101', CAST(0xE43E0B00 AS Date), N'Dhaka', 15, N'ETE-2018-001')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1024, N'Abir Hasan', N'abir@gmail.com', N'01745454545', CAST(0xE63E0B00 AS Date), N'Dhaka', 15, N'ETE-2018-002')
INSERT [dbo].[Student_tb] ([Id], [StudentName], [StudentEmail], [StudentContact], [RegDate], [StudentAddress], [DeptId], [RegisterNumber]) VALUES (1025, N'Arifujjaman Arif', N'arif@gmail.com', N'01989898989', CAST(0xE63E0B00 AS Date), N'Dhaka', 15, N'ETE-2018-003')
SET IDENTITY_INSERT [dbo].[Student_tb] OFF
SET IDENTITY_INSERT [dbo].[Teacher_tb] ON 

INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1007, N'Sazzadur Ahmed', N'Dhaka', N'sazzad@gmail.com', N'01711111111', 4, 11, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1008, N'Israt Ferdous', N'Dhaka', N'israt@gmail.com', N'01722222222', 4, 11, CAST(12.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1009, N'Nasrin Hakim Mithila', N'Dhaka', N'mithila@gmail.com', N'01733333333', 3, 11, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1010, N'Rubaiya Hafiz', N'Dhaka', N'hafiz@gmail.com', N'01744444444', 4, 11, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1011, N'Ahmed Al Maruf', N'Dhaka', N'maruf@gmail.com', N'01755555555', 3, 12, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1012, N'Sadikur Rahman', N'Dhaka', N'sadik@gmail.com', N'01766666666', 3, 12, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1013, N'Juel Mia', N'Dhaka', N'mia@gmail.com', N'01777777777', 4, 12, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1014, N'Saiful Islam', N'Dhaka', N'saiful@gmail.com', N'01788888888', 4, 13, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1015, N'Shaon Batta Shuvo', N'Dhaka', N'shuvo@gmail.com', N'01799999999', 4, 13, CAST(15.000 AS Decimal(5, 3)))
INSERT [dbo].[Teacher_tb] ([Id], [TeacherName], [TeacherAddress], [TracherEmail], [TracherContact], [DesignationId], [DeptId], [Credit]) VALUES (1016, N'Sejuti Banik', N'Dhaka', N'banik@gmail.com', N'01700000000', 4, 13, CAST(12.000 AS Decimal(5, 3)))
SET IDENTITY_INSERT [dbo].[Teacher_tb] OFF
USE [master]
GO
ALTER DATABASE [University_DB] SET  READ_WRITE 
GO

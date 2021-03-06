USE [Library]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_removeMark]    Script Date: 5/15/2019 12:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_removeMark] (@text nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
	SET @text = LOWER(@text)
	DECLARE @textLen int = LEN(@text)
	IF @textLen > 0
	BEGIN
		DECLARE @index int = 1
		DECLARE @lPos int
		DECLARE @SIGN_CHARS nvarchar(100) = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýđð'
		DECLARE @UNSIGN_CHARS varchar(100) = 'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyydd'

		WHILE @index <= @textLen
		BEGIN
			SET @lPos = CHARINDEX(SUBSTRING(@text,@index,1),@SIGN_CHARS)
			IF @lPos > 0
			BEGIN
				SET @text = STUFF(@text,@index,1,SUBSTRING(@UNSIGN_CHARS,@lPos,1))
			END
			SET @index = @index + 1
		END
	END
	RETURN @text
END
GO
/****** Object:  Table [dbo].[tblDocGia]    Script Date: 5/15/2019 12:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDocGia](
	[MADG] [varchar](10) NOT NULL,
	[HOTEN] [nvarchar](100) NOT NULL,
	[NGAYSINH] [varchar](50) NOT NULL,
	[GIOITINH] [nvarchar](10) NOT NULL,
	[LOP] [varchar](50) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[EMAIL] [varchar](50) NOT NULL,
	[GHICHU] [nvarchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__tblDocGi__603F004691AC70BA] PRIMARY KEY CLUSTERED 
(
	[MADG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLinhVuc]    Script Date: 5/15/2019 12:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLinhVuc](
	[MALV] [varchar](10) NOT NULL,
	[TENLV] [nvarchar](100) NOT NULL,
	[GHICHU] [nvarchar](max) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__tblLinhV__603F415351441711] PRIMARY KEY CLUSTERED 
(
	[MALV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 5/15/2019 12:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[TENTAIKHOAN] [varchar](50) NOT NULL,
	[MATKHAU] [varchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TENTAIKHOAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSach]    Script Date: 5/15/2019 12:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSach](
	[MASACH] [varchar](10) NOT NULL,
	[TENSACH] [nvarchar](100) NOT NULL,
	[TACGIA] [nvarchar](100) NOT NULL,
	[NHAXUATBAN] [nvarchar](100) NOT NULL,
	[NAMXB] [varchar](50) NOT NULL,
	[SOTRANG] [int] NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[NGAYNHAP] [varchar](50) NOT NULL,
	[GHICHU] [nvarchar](max) NULL,
	[MALV] [varchar](10) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SOSACHHONG] [nchar](10) NULL,
 CONSTRAINT [PK__tblSach__3FC48E4CBA3759E4] PRIMARY KEY CLUSTERED 
(
	[MASACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblThongTinMuon]    Script Date: 5/15/2019 12:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblThongTinMuon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SOLUONGMUON] [int] NOT NULL,
	[NGAYMUON] [varchar](50) NOT NULL,
	[NGAYTRA] [varchar](50) NOT NULL,
	[XACNHANTRA] [nvarchar](50) NULL,
	[GHICHU] [nvarchar](max) NULL,
	[MASACH] [varchar](10) NOT NULL,
	[MADG] [varchar](10) NOT NULL,
 CONSTRAINT [PK__tblThong__3214EC279004800E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblDocGia] ON 

INSERT [dbo].[tblDocGia] ([MADG], [HOTEN], [NGAYSINH], [GIOITINH], [LOP], [DIACHI], [EMAIL], [GHICHU], [ID]) VALUES (N'dg01', N'Lê Văn Dũng', N'08-12-1998', N'Nam', N'khmt15', N'Hà Nội', N'dung@gmail.com', N'note 1', 1)
INSERT [dbo].[tblDocGia] ([MADG], [HOTEN], [NGAYSINH], [GIOITINH], [LOP], [DIACHI], [EMAIL], [GHICHU], [ID]) VALUES (N'dg02', N'Nguyễn Thị Hường', N'27-11-1998', N'Nữ', N'httt15', N'Đặng Thùy Trâm', N'huong@gmail.com', N'note 2', 5)
INSERT [dbo].[tblDocGia] ([MADG], [HOTEN], [NGAYSINH], [GIOITINH], [LOP], [DIACHI], [EMAIL], [GHICHU], [ID]) VALUES (N'dg03', N'Nguyễn Chiến Thắng', N'21-02-1998', N'Nam', N'khmt15', N'Trần Cung', N'thang@gmail.com', N'note 3', 6)
INSERT [dbo].[tblDocGia] ([MADG], [HOTEN], [NGAYSINH], [GIOITINH], [LOP], [DIACHI], [EMAIL], [GHICHU], [ID]) VALUES (N'dg04', N'Nguyễn Danh Hiếu', N'09-05-1998', N'Nam', N'khmt15', N'Xuân Đỉnh', N'hieu@gmail.com', N'note 4', 7)
SET IDENTITY_INSERT [dbo].[tblDocGia] OFF
SET IDENTITY_INSERT [dbo].[tblLinhVuc] ON 

INSERT [dbo].[tblLinhVuc] ([MALV], [TENLV], [GHICHU], [ID]) VALUES (N'lv01', N'lập trình', N'note 1', 1)
INSERT [dbo].[tblLinhVuc] ([MALV], [TENLV], [GHICHU], [ID]) VALUES (N'lv02', N'giáo dục', N'note 2', 4)
INSERT [dbo].[tblLinhVuc] ([MALV], [TENLV], [GHICHU], [ID]) VALUES (N'lv03', N'đời sống', N'note 3', 1003)
INSERT [dbo].[tblLinhVuc] ([MALV], [TENLV], [GHICHU], [ID]) VALUES (N'lv04', N'công nghệ', N'note 4', 1006)
SET IDENTITY_INSERT [dbo].[tblLinhVuc] OFF
SET IDENTITY_INSERT [dbo].[tblNhanVien] ON 

INSERT [dbo].[tblNhanVien] ([TENTAIKHOAN], [MATKHAU], [ID]) VALUES (N'dung', N'12345', 2)
INSERT [dbo].[tblNhanVien] ([TENTAIKHOAN], [MATKHAU], [ID]) VALUES (N'nv01', N'aaaaa', 1)
SET IDENTITY_INSERT [dbo].[tblNhanVien] OFF
SET IDENTITY_INSERT [dbo].[tblSach] ON 

INSERT [dbo].[tblSach] ([MASACH], [TENSACH], [TACGIA], [NHAXUATBAN], [NAMXB], [SOTRANG], [SOLUONG], [NGAYNHAP], [GHICHU], [MALV], [ID], [SOSACHHONG]) VALUES (N'sach01', N'lý thuyết hệ điều hành', N'Hoàng Cầu', N'kim đồng', N'2018', 5, 4, N'19-04-2019', N'note 1', N'lv02', 1, N'0         ')
INSERT [dbo].[tblSach] ([MASACH], [TENSACH], [TACGIA], [NHAXUATBAN], [NAMXB], [SOTRANG], [SOLUONG], [NGAYNHAP], [GHICHU], [MALV], [ID], [SOSACHHONG]) VALUES (N'sach02', N'ngôn ngữ lập trình', N'Vũ Trọng Phụng', N'kim đồng', N'2018', 22, 9, N'02-05-2019', N'note 2', N'lv01', 1002, N'0         ')
SET IDENTITY_INSERT [dbo].[tblSach] OFF
SET IDENTITY_INSERT [dbo].[tblThongTinMuon] ON 

INSERT [dbo].[tblThongTinMuon] ([ID], [SOLUONGMUON], [NGAYMUON], [NGAYTRA], [XACNHANTRA], [GHICHU], [MASACH], [MADG]) VALUES (27, 2, N'08-05-2019', N'11-05-2019', N'Chưa trả', N'note 1', N'sach02', N'dg01')
SET IDENTITY_INSERT [dbo].[tblThongTinMuon] OFF
ALTER TABLE [dbo].[tblSach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_LinhVuc] FOREIGN KEY([MALV])
REFERENCES [dbo].[tblLinhVuc] ([MALV])
GO
ALTER TABLE [dbo].[tblSach] CHECK CONSTRAINT [FK_Sach_LinhVuc]
GO
ALTER TABLE [dbo].[tblThongTinMuon]  WITH CHECK ADD  CONSTRAINT [FK_TTM_DocGia] FOREIGN KEY([MADG])
REFERENCES [dbo].[tblDocGia] ([MADG])
GO
ALTER TABLE [dbo].[tblThongTinMuon] CHECK CONSTRAINT [FK_TTM_DocGia]
GO
ALTER TABLE [dbo].[tblThongTinMuon]  WITH CHECK ADD  CONSTRAINT [FK_TTM_Sach] FOREIGN KEY([MASACH])
REFERENCES [dbo].[tblSach] ([MASACH])
GO
ALTER TABLE [dbo].[tblThongTinMuon] CHECK CONSTRAINT [FK_TTM_Sach]
GO

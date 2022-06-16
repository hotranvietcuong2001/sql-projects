
CREATE DATABASE QLDT

use QLDT

create table GIAOVIEN
(
	MAGV nvarchar(10),
	HOTEN nvarchar(25),
	LUONG float,
	PHAI nvarchar(4) constraint Chk_Phai check (Phai = N'Nam' or Phai = N'Nữ'),
	NGSINH nvarchar(10),
	DIACHI nvarchar(50),
	GVQLCM nvarchar(10),
	MABM nvarchar(10) ,
	constraint PK_GiaoVien primary key (MAGV)
)


create table BOMON
(
	MABM nvarchar(10),
	TENBM nvarchar(25),
	PHONG nvarchar(10),
	DIENTHOAI numeric(12),
	TRUONGBM nvarchar(10),
	MAKHOA nvarchar(10),
	NGAYNHANCHUC nvarchar(10),
	constraint PK_BoMon primary key (MABM)
)

create table KHOA
(
	MAKHOA nvarchar(10),
	TENKHOA nvarchar(25),
	NAMTL nvarchar(10),
	PHONG nvarchar(10),
	DIENTHOAI numeric(12),
	TRUONGKHOA nvarchar(10), 
	NGAYNHANCHUC nvarchar(10),
	constraint PK_Khoa primary key (MAKHOA)
)

create table GV_DT
(
	MAGV nvarchar(10),
	DIENTHOAI numeric(12),
	constraint PK_GV_DT primary key (MAGV, DIENTHOAI)
)


create table NGUOITHAN
(
	MAGV nvarchar(10),
	TEN nvarchar(25),
	NGSINH nvarchar(10),
	PHAI nvarchar(4) constraint Chk_Phai2 check (Phai = N'Nam' or Phai = N'Nữ'),
	constraint PK_Nguoithan primary key (MAGV, TEN)
)

create table THAMGIADT
(
	MAGV nvarchar(10),
	MADT nvarchar(10),
	STT nvarchar(10),
	PHUCAP float,
	KETQUA nvarchar(10) CONSTRAINT Chk_Kq check (Ketqua = N'Đạt' or Ketqua = N'Không Đạt' or Ketqua = Null) 
	constraint PK_ThamGiaDT primary key (MAGV, MADT, STT)
)

create table CONGVIEC
(
	MADT nvarchar(10),
	SOTT nvarchar(10),
	TENCV nvarchar(25),
	NGAYBD nvarchar(10),
	NGAYKT nvarchar(10),
	constraint PK_CongViec primary key (MADT, SOTT)
)

create table DETAI
(
	MADT nvarchar(10),
	TENDT nvarchar(50),
	CAPQL nvarchar(10),
	KINHPHI float,
	NGAYBD nvarchar(10),
	NGAYKT nvarchar(10),
	MACD nvarchar(10),
	GVCNDT nvarchar(10),
	constraint PK_DeTai primary key (MADT)
)

create table CHUDE
(
	MACD nvarchar(10),
	TENCD nvarchar(25),
	constraint PK_ChuDe primary key (MACD)
)


alter table GIAOVIEN
add constraint FK_GiaoVien_GiaoVien
foreign key (GVQLCM)
references GIAOVIEN(MAGV)

alter table GIAOVIEN
add constraint FK_GiaoVien_BoMon
foreign key (MABM)
references BOMON(MABM)

alter table BOMON
add constraint FK_BoMon_GiaoVien
foreign key (TRUONGBM)
references GIAOVIEN(MAGV)

alter table BOMON
add constraint FK_BoMon_Khoa
foreign key (MAKHOA)
references KHOA(MAKHOA)

alter table KHOA
add constraint FK_Khoa_GiaoVien
foreign key (TRUONGKHOA)
references GIAOVIEN(MAGV)

alter table GV_DT
add constraint FK_GVDT_GiaoVien
foreign key (MAGV)
references GIAOVIEN(MAGV)

alter table NGUOITHAN
add constraint FK_NguoiThan_GiaoVien
foreign key (MAGV)
references GIAOVIEN(MAGV)

alter table THAMGIADT
add constraint FK_ThamGiaDT_GiaoVien
foreign key (MAGV)
references GIAOVIEN(MAGV)

alter table THAMGIADT
add constraint FK_ThamGiaDT_CongViec
foreign key (MADT, STT)
references CONGVIEC(MADT, SOTT)

alter table CONGVIEC
add constraint FK_CongViec_DeTai
foreign key (MADT)
references DETAI(MADT)

alter table DETAI
add constraint FK_DeTai_GiaoVien
foreign key (GVCNDT)
references GIAOVIEN(MAGV)

alter table DETAI
add constraint FK_DeTai_ChuDe
foreign key (MACD)
references CHUDE(MACD)

insert into CHUDE values('NCPT', N'Nghiên cứu phát triển')
insert into CHUDE values('QLGD', N'Quản lý giáo dục')
insert into CHUDE values('UDCN', N'Ứng dụng công nghệ')

insert into KHOA values('CNTT', N'Công nghệ thông tin', 1995, 'B11', 0838123456, Null, '2005-02-20')
insert into KHOA values('HH', N'Hóa học', 1980, 'B41', 0838456456, Null, '2001-10-15')
insert into KHOA values('SH', N'Sinh học', 1980, 'B31', 0838454545, Null, '2000-10-11')
insert into KHOA values('VL', N'Vật lý', 1976, 'B21', 0838223223, Null, '2003-09-16')

insert into GIAOVIEN values('001', N'Nguyễn Hoài An', 2000.0, N'Nam', '1973-02-15', N'25/3 Lạc Long Quân, Q.10, TP HCM', Null, Null)
insert into GIAOVIEN values('002', N'Trần Trà Hương', 2500.0, N'Nữ', '1960-06-20', N'125 Trần Hưng Đạo, Q.1, TP HCM', Null, Null)
insert into GIAOVIEN values('003', N'Nguyễn Ngọc Ánh', 2200.0, N'Nữ', '1975-05-11', N'12/21 Võ Văn Ngân Thủ ĐỨc TP HCM', Null, Null)
insert into GIAOVIEN values('004', N'Trương Nam Sơn', 2300.0, N'Nam', '1959-06-20', N'215 Lý Thường Kiệt', Null, Null)
insert into GIAOVIEN values('005', N'Lý Hoàng Hà', 2500.0, N'Nam', '1954-10-23', N'22/ Nguyễn Xí, Q.Bình Thạnh, TP HCM', Null, Null)
insert into GIAOVIEN values('006', N'Trần Bach Tuyết', 1500.0, N'Nữ', '1980-05-20', N'127 Hùng Vương', Null, Null)
insert into GIAOVIEN values('007', N'Nguyễn An Trung', 2100.0, N'Nam', '1976-06-05', N'234 3/2, TP Biên Hòa', Null, Null)
insert into GIAOVIEN values('008', N'Trần Trung Hiếu', 1800.0, N'Nam', '1977-08-06', N'22/11 Lý Thường Kiệt', Null, Null)
insert into GIAOVIEN values('009', N'Trần Hoàng Nam', 2000.0, N'Nam', '1975-11-22', N'234 Trần Não, An Phú, TP HCM', Null, Null)
insert into GIAOVIEN values('010', N'Phạm Nam Thanh', 1500.0, N'Nam', '1980-12-12', N'221 Hùng Vương, Q.5, TP HCM', Null, Null)

insert into BOMON values('CNTT', N'Công nghệ tri thức', 'B15', 0838126126, NULL, 'CNTT',  NULL)
insert into BOMON values('HHC', N'Hóa hữu cơ', 'B44', 838222222, NULL, 'HH',  NULL)
insert into BOMON values('HL', N'Hóa lý', 'B42', 0838878787, NULL, 'HH',  NULL)
insert into BOMON values('HPT', N'Hóa phân tích', 'B43', 0838777777, '007', 'HH',  '2007-10-15')
insert into BOMON values('HTTT', N'Hệ thống thông tin', 'B13', 0838125125, '002', 'CNTT',  '2004-09-20')
insert into BOMON values('MMT', N'Mạng máy tính', 'B16', 0838676676, '001', 'CNTT',  '2005-05-15')
insert into BOMON values('SH', N'Sinh hóa', 'B33', 0838898898, NULL, 'SH',  NULL)
insert into BOMON values('VLDT', N'Vật lý điện tử', 'B23', 0838234234, NULL, 'VL',  NULL)
insert into BOMON values('VLUD', N'Vật lý ứng dụng', 'B24', 0838454545, '005', 'VL',  '2006-02-18')
insert into BOMON values('VS', N'Vi sinh', 'B32', 0838909090, '004', 'SH',  '2007-01-01')

insert into GV_DT values('001', 0838912112)
insert into GV_DT values('001', 0903123123)
insert into GV_DT values('002', 0913454545)
insert into GV_DT values('003', 0838121212)
insert into GV_DT values('003', 0909656565)
insert into GV_DT values('003', 0937125125)
insert into GV_DT values('006', 0937888888)
insert into GV_DT values('008', 0653717171)
insert into GV_DT values('008', 0913232323)

insert into NGUOITHAN values('001', N'HÙng', '1990-01-14', N'Nam')
insert into NGUOITHAN values('001', N'Thủy', '1994-12-08', N'Nữ')
insert into NGUOITHAN values('003', N'Hà', '1998-09-03', N'Nữ')
insert into NGUOITHAN values('003', N'Thu', '1998-09-03', N'Nữ')
insert into NGUOITHAN values('007', N'Mai', '2003-03-26', N'Nữ')
insert into NGUOITHAN values('007', N'Vy', '2000-02-14', N'Nữ')
insert into NGUOITHAN values('008', N'Nam', '1991-05-06', N'Nam')
insert into NGUOITHAN values('009', N'An', '1996-08-19', N'Nam')
insert into NGUOITHAN values('010', N'Nguyệt', '2006-01-14', N'Nữ')



update KHOA
set TRUONGKHOA = '002'
where MAKHOA = 'CNTT'

update KHOA
set TRUONGKHOA = '007'
where MAKHOA = 'HH'

update KHOA
set TRUONGKHOA = '004'
where MAKHOA = 'SH'

update KHOA
set TRUONGKHOA = '005'
where MAKHOA = 'VL'


update GIAOVIEN
set GVQLCM = '002'
where MAGV = '003'

update GIAOVIEN
set GVQLCM = '004'
where MAGV = '006'

update GIAOVIEN
set GVQLCM = '007'
where MAGV = '008'

update GIAOVIEN
set GVQLCM = '001'
where MAGV = '009'

update GIAOVIEN
set GVQLCM = '007'
where MAGV = '010'


update GIAOVIEN
set MABM = 'MMT'
where MAGV = '001'

update GIAOVIEN
set MABM = 'HTTT'
where MAGV = '002'

update GIAOVIEN
set MABM = 'HTTT'
where MAGV = '003'

update GIAOVIEN
set MABM = 'VS'
where MAGV = '004'

update GIAOVIEN
set MABM = 'VLDT'
where MAGV = '005'

update GIAOVIEN
set MABM = 'VS'
where MAGV = '006'

update GIAOVIEN
set MABM = 'HPT'
where MAGV = '007'

update GIAOVIEN
set MABM = 'HPT'
where MAGV = '008'

update GIAOVIEN
set MABM = 'MMT'
where MAGV = '009'

update GIAOVIEN
set MABM = 'HPT'
where MAGV = '010'




insert into DETAI values('001', N'HTTT quản lý các trường ĐH', 'DHQG', 20.0, '2007-10-20', '2008-10-20', 'QLGD', '002')
insert into DETAI values('002', N'HTTT quản lý giáo vụ cho một khoa', N'Trường', 20.0, '2000-10-12', '2001-10-12', 'QLGD', '002')
insert into DETAI values('003', N'Nghiên cứu chế tạo sợi Nano Platin', 'DHQG', 300.0, '2008-05-15', '2010-05-15', 'NCPT', '005')
insert into DETAI values('004', N'Tạo vật liệu sinh học bằng màng ối người', N'Nhà nước', 100.0, '2007-01-01', '2009-12-31', 'NCPT', '004')
insert into DETAI values('005', N'Ứng dụng hóa học xanh', N'Trường', 200.0, '2003-10-10','2004-12-10', 'UDCN', '007')
insert into DETAI values('006', N'Nghiên cứu tế bài gốc', N'Nhà nước', 4000.0, '2006-10-20', '2009-10-20', 'NCPT', '004')
insert into DETAI values('007', N'HTTT quản lý thư viện ở các trường ĐH', N'Trường', 20.0, '2009-05-10', '2010-05-10', 'QLGD', '001')

insert into CONGVIEC values('001', '1', N'Khởi tạo và Lập kế hoạch', '2007-10-20', '2008-12-20')
insert into CONGVIEC values('001', '2', N'Xác định yêu cầu', '2008-12-21', '2008-03-21')
insert into CONGVIEC values('001', '3', N'Phân tích hệ thống', '2008-03-22', '2008-05-22')
insert into CONGVIEC values('001', '4', N'Thiết kế hệ thống', '2008-05-23', '2008-06-23')
insert into CONGVIEC values('001', '5', N'Cài đặt thử nghiệm', '2008-06-24', '2008-10-20')
insert into CONGVIEC values('002', '1', N'Khởi tạo và Lập Kế hoạch', '2009-05-10', '2009-07-10')
insert into CONGVIEC values('002', '2', N'Xác định yêu cầu', '2009-07-11', '2009-10-11')
insert into CONGVIEC values('002', '3', N'Phân tích hệ thống', '2009-10-12', '2009-12-20')
insert into CONGVIEC values('002', '4', N'Thiết kế hệ thống', '2009-12-21', '2010-03-22')
insert into CONGVIEC values('002', '5', N'Cài đặt thử nghiệm', '2010-03-23', '2010-05-10')
insert into CONGVIEC values('006', '1', N'Lấy mẫu', '2006-10-20', '2007-02-20')
insert into CONGVIEC values('006', '2', N'Nuôi cấy', '2007-02-21', '2008-08-21')

insert into THAMGIADT values('001', '002', '1', 0.0, Null)
insert into THAMGIADT values('001', '002', '2', 2.0, Null)
insert into THAMGIADT values('002', '001', '4', 2.0,N'Đạt')
insert into THAMGIADT values('003', '001', '1', 1.0,N'Đạt')
insert into THAMGIADT values('003', '001', '2', 0.0,N'Đạt')
insert into THAMGIADT values('003', '001', '4', 1.0,N'Đạt')
insert into THAMGIADT values('003', '002', '2', 0.0, Null)
insert into THAMGIADT values('004', '006', '1', 0.0,N'Đạt')
insert into THAMGIADT values('004', '006', '2', 1.0,N'Đạt')
insert into THAMGIADT values('006', '006', '2', 1.5,N'Đạt')
insert into THAMGIADT values('009', '002', '3', 0.5, Null)
insert into THAMGIADT values('009', '002', '4', 1.5, Null)
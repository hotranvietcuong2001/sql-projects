
CREATE DATABASE QLGV

use QLGV

create table GIAOVIEN
(
	MAGV nvarchar(10),
	HOTEN nvarchar(25),
	LUONG float,
	PHAI nvarchar(4) constraint Chk_Phai check (Phai = N'Nam' or Phai = N'Nu'),
	NGSINH nvarchar(10),
	DIACHI nvarchar(25),
	GVQLCM nvarchar(10),
	MABM nvarchar(10) ,
	constraint PK_GiaoVien primary key (MAGV)
)


create table BOMON
(
	MABM nvarchar(10),
	TENBM nvarchar(10),
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

insert into KHOA values('K01', N'Cong nghe thong tin', 2001, '201', 3012312, Null, '21/2/2001')
insert into KHOA values('K02', N'Cong nghe sinh hoc', 2001, '202', 3012314, Null, '21/2/2001')
insert into KHOA values('K03', N'Dien tu vien thong', 2001, '203', 3012315, Null, '21/2/2001')

insert into GIAOVIEN values('GV01', N'Nguyen Nam', 10000000, N'Nam', '01/01/1999', '23 Nguyen Trai', Null, Null)
insert into GIAOVIEN values('GV02', N'Nguyen Nu', 10000000, N'Nu', '02/02/1999', '235 Nguyen Trai', Null, Null)
insert into GIAOVIEN values('GV04', N'Nguyen Tu', 10000000, N'Nam', '12/01/1999', '235 Nguyen Trai', Null, Null)

insert into BOMON values('BM01', N'TTNT', '301', 0033031, 'GV01', 'K01', '1/1/1999')
insert into BOMON values('BM02', N'CNPM', '302', 1033031, 'GV02', 'K01', '01/1/1999')
insert into BOMON values('BM03', N'HTTT', '304', 0023031, 'GV04', 'K01', '01/1/1999')

update KHOA
set TRUONGKHOA = 'GV01'
where MAKHOA = 'K01'

update KHOA
set TRUONGKHOA = 'GV02'
where MAKHOA = 'K02'

update KHOA
set TRUONGKHOA = 'GV04'
where MAKHOA = 'K03'

update GIAOVIEN
set GVQLCM = 'GV02'
where MAGV = 'GV01'

update GIAOVIEN
set MABM = 'BM01'
where MAGV = 'GV01'

update GIAOVIEN
set GVQLCM = 'GV01'
where MAGV = 'GV02'

update GIAOVIEN
set MABM = 'BM01'
where MAGV = 'GV02'

update GIAOVIEN
set GVQLCM = 'GV02'
where MAGV = 'GV04'

update GIAOVIEN
set MABM = 'BM02'
where MAGV = 'GV04'

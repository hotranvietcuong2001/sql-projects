

-- Q1. ho ten, luong cua giao vien nu

select HOTEN as "Họ tên", LUONG as "Lương"
from GIAOVIEN
where PHAI = N'Nữ'

-- Q2. Ho Ten, Luong giao vien khi tang 10%

select HOTEN as "Họ tên", LUONG*1.1 as "Lương"
from GIAOVIEN

--Q3 ma giao vien co ho ten bat dau "Nguyen" va luong > 2000 hoac truong bo mon nhan chuc sau 1995

select MAGV as "Mã GV"
from GIAOVIEN gv join BOMON bm
on (gv.MABM = bm.MABM) or (gv.MAGV = bm.TRUONGBM)
where (HOTEN like N'Nguyễn%' and LUONG > 2000) or (gv.MAGV = bm.TRUONGBM and bm.NGAYNHANCHUC > '1995-12-31')

--Q4 cac giao vien thuoc khoa CNTT

select HOTEN as "Họ tên"
from GIAOVIEN gv 
join BOMON bm on gv.MABM = bm.MABM
join KHOA k on bm.MAKHOA = k.MAKHOA
where TENKHOA = N'Công nghệ thông tin'

--Q5 Thong tin bo mon cung thong tin truong bo mon do

select *
from BOMON bm
join GIAOVIEN gv on bm.TRUONGBM = gv.MAGV

--Q6 Thong tin bo mon ma moi giao vien dang lam viec

select *
from GIAOVIEN gv
join BOMON bm on gv.MABM = bm.MABM

--Q7 Ten de tai va giao vien chu nhiem de tai

select TENDT, HOTEN
from DETAI dt
join GIAOVIEN gv on dt.GVCNDT = gv.MAGV

--Q8 Thong tin moi truong khoa

select *
from KHOA k
join GIAOVIEN gv on k.TRUONGKHOA = gv.MAGV

-- Q9 Giao Vien bo mon vi sinh tham gia de tai 006

select *
from GIAOVIEN gv
join THAMGIADT tgdt on tgdt.MAGV = gv.MAGV
join BOMON bm on gv.MABM = bm.MABM
where TENBM = 'Vi sinh' and MADT = '006'


-- Q10 de tai thuoc cap thanh pho, xuat ma de tai, de tai, chu de, ho ten chu nhiem, ngay sinh, dia chi

select MADT as "Mã đề tài", TENDT as "Tên Đề Tài", TENCD as "Tên chủ đề", GVCNDT as "Giáo viên chủ nhiệm đề tài", NGSINH as "Ngày sinh", DIACHI as "Địa chỉ"
from DETAI dt
join CHUDE cd on dt.MACD = cd.MACD
join GIAOVIEN gv on dt.GVCNDT = gv.MAGV
where CAPQL = N'Thành phố'

--Q11 Ho ten tung giao vien va nguoi phu trach chuyen mon giao vien

select gv.HOTEN as "Họ tên", gv2.HOTEN as "Người quản lý chuyên môn"
from GIAOVIEN gv
join GIAOVIEN gv2 on gv.GVQLCM = gv2.MAGV

--Q12 tim giao vien duoc "Nguyen Thanh Tung" phu trach truc tiep

select gv.HOTEN as "Họ tên"
from GIAOVIEN gv
join GIAOVIEN gv2 on gv.GVQLCM = gv2.MAGV
where gv2.HOTEN = N'Nguyễn Thanh Tùng'

-- Q13 Ten giao vien truong bo mon "He thong thong tin"

select HOTEN as "Họ tên"
from BOMON bm
join GIAOVIEN gv on bm.TRUONGBM = gv.MAGV
where TENBM = N'Hệ thống thông tin'

--Q14 Ten chu nhiem de tai cua nhung de tai Quan ly giao duc

select distinct HOTEN as "Họ tên"
from DETAI dt
join GIAOVIEN gv on dt.GVCNDT = gv.MAGV
join CHUDE cd on dt.MACD = cd.MACD
where TENCD = N'Quản lý giáo dục'

-- Q15 Ten cong viec de tai HTTT quan ly truong DH bat dau trong thang 3/2008

select TENCV as "Tên công việc"
from CONGVIEC cv
join DETAI dt on cv.MADT = dt.MADT
where (TENDT = N'HTTT quản lý các trường ĐH') and (cv.NGAYBD between '2008-03-01' and '2008-03-31')

--Q16 Ho ten tung giao vien va nguoi phu trach chuyen mon giao vien

select gv.HOTEN as "Họ tên", gv2.HOTEN as "Người quản lý chuyên môn"
from GIAOVIEN gv
join GIAOVIEN gv2 on gv.GVQLCM = gv2.MAGV


-- Q17 ten cong viec nam trong khaong thoi gian   '2007-01-01' toi  '2007-08-01'
select TENCV as "Tên công việc"
from CONGVIEC cv
where (cv.NGAYBD between '2007-01-01' and '2007-08-01')

-- Q18 Cho biết họ tên các giáo viên cùng bộ môn với giáo viên “Trần Trà Hương”.
select gv.HOTEN
FROM GIAOVIEN gv
WHERE GV.MABM = (SELECT MABM FROM GIAOVIEN WHERE HOTEN = N'Trần Trà Hương') and (gv.HOTEN <> N'Trần Trà Hương')

-- Q19 Tìm những giáo viên vừa là trưởng bộ môn vừa chủ nhiệm đề tài.

select distinct MAGV as "MÃ Gíao viên" , HOTEN as "HỌ Tên"
from GIAOVIEN gv
join BOMON bm on bm.TRUONGBM = gv.MAGV
join DETAI dt on dt.GVCNDT = gv.MAGV


-- Q20 Cho biết tên những giáo viên vừa là trưởng khoa và vừa là trưởng bộ môn.
select distinct HOTEN as "Họ tên"
from GIAOVIEN gv
join BOMON bm on bm.TRUONGBM = gv.MAGV
join KHOA k on k.TRUONGKHOA = gv.MAGV

-- Q21 Cho biết tên những trưởng bộ môn mà vừa chủ nhiệm đề tài.
select distinct HOTEN as "Họ tên"
from GIAOVIEN gv
join DETAI dt on dt.GVCNDT = gv.MAGV
join BOMON bm on bm.TRUONGBM = gv.MAGV



-- Q22 Cho biết mã số các trưởng khoa có chủ nhiệm đề tài.
select distinct gv.MAGV
from GIAOVIEN gv
join DETAI dt on dt.GVCNDT = gv.MAGV
join KHOA k on k.TRUONGKHOA = gv.MAGV

-- Q23 Cho biết mã số các giáo viên thuộc bộ môn “HTTT” hoặc có tham gia đề tài mã “001”.
select distinct gv.MAGV
from GIAOVIEN gv
join THAMGIADT tgdt on tgdt.MAGV = gv.MAGV
where gv.MABM = 'HTTT' or MADT = '001'

-- Q24 Cho biết giáo viên làm việc cùng bộ môn với giáo viên 002.
select gv.HOTEN
FROM GIAOVIEN gv
WHERE GV.MABM = (SELECT MABM FROM GIAOVIEN WHERE MAGV = '002') and (MAGV <> '002')

-- Q25 Tìm những giáo viên là trưởng bộ môn.
select HOTEN as "Họ tên"
from BOMON bm
join GIAOVIEN gv on bm.TRUONGBM = gv.MAGV


-- Q26 ho ten, luong cua giao vien 

select HOTEN as "Họ tên", LUONG as "Lương"
from GIAOVIEN



--Q27 So luong giao vien va tong luong
select count(distinct gv.MAGV) as "Số lượng giáo viên", sum(gv.LUONG) as "Tổng lương"
from GIAOVIEN gv

--Q28 So luong giao vien va trung binh luong cua tung bo mon
select gv.MABM as "Mã Bộ Môn", count(distinct gv.MAGV) as "Số lượng giáo viên", avg(gv.Luong)
from GIAOVIEN gv
group by gv.MABM

--Q29 Ten chu de va so luong de tai thuoc chu de do

select cd.TENCD as "Tên chủ đề", count(dt.MADT) as "Số lượng đề tài"
from DETAI dt
join CHUDE cd on dt.MACD = cd.MACD
group by cd.TENCD

--Q30 Ten giao vien va so luong de tai ma giao vien do tham gia

select gv.HOTEN as "Tên giáo viên", count(tgdt.MADT) as "Số lượng đề tài"
from GIAOVIEN gv
join THAMGIADT tgdt on tgdt.MAGV = gv.MAGV
group by gv.MAGV, gv.HOTEN

--Q31 Ten giao vien va so luong de tai ma gv chu nhiem

select gv.HOTEN as "Tên giáo viên", count(dt.MADT) as "Số lượng đề tài giáo viên chủ nhiệm"
from GIAOVIEN gv
join DETAI dt on dt.GVCNDT = gv.MAGV
group by gv.MAGV, gv.HOTEN

--Q32 Ten giao vien va so luong nguoi than cua giao vien do
select gv.HOTEN as "Tên giáo viên", count(nt.TEN) as "So luong nguoi than"
from GIAOVIEN gv
join NGUOITHAN nt on nt.MAGV = gv.MAGV
group by gv.MAGV, gv.HOTEN

--Q33 Ten giao vien tham gia 3 de tai tro len

select gv.HOTEN as "Họ tên giáo viên" 
from GIAOVIEN gv
join THAMGIADT tgdt on tgdt.MAGV = gv.MAGV
group by gv.MAGV, gv.HOTEN
having count(tgdt.MADT) >=3

--Q34 So luong giao vien da tham gia de tai Ung dung hoa hoc xanh

select count(gv.MAGV) as "Số lượng giáo viên"
from GIAOVIEN gv
join THAMGIADT tgdt on  tgdt.MAGV = gv.MAGV
join DETAI dt on tgdt.MADT = dt.MADT
group by dt.TENDT
having dt.TENDT = N'Ứng dụng hóa học xanh'
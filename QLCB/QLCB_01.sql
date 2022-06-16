

-- Q1 mã số, tên phi công, địa chỉ, điện thoại của các phi công đã từng lái máy bay loại B747.

select  distinct NV.MANV, NV.TEN, NV.DCHI, NV.DTHOAI
from NHANVIEN nv
join PHANCONG pc on nv.MANV = pc.MANV
join LICHBAY lb on lb.MACB = pc.MACB
where MALOAI = 'B747'

-- Q2 mã số và ngày đi của các chuyến bay xuất phát từ sân bay DCA trong khoảng thời gian từ 14 giờ đến 18 giờ.

select cb.MACB as "Mã chuyến bay", NGAYDI as "Ngày đi"
from CHUYENBAY cb
join LICHBAY lb on cb.MACB = lb.MACB
where cb.SBDI = 'DCA' and (cb.GIODI between '14:00:00' and '18:00:00') 

-- Q3 tên những nhân viên được phân công trên chuyến bay có mã số 100 xuất phát tại sân bay SLC.
select distinct  nv.TEN as "Tên Nhân Viên"
from NHANVIEN nv
join PHANCONG pc on pc.MANV = nv.MANV
join LICHBAY lb on (pc.MACB = lb.MACB and pc.NGAYDI = lb.NGAYDI)
join CHUYENBAY cb on (cb.MACB = lb.MACB)
where cb.MACB = '100' and cb.SBDI = 'SLC'


-- Q4 mã loại và số hiệu máy bay đã từng xuất phát tại sân bay MIA.

select MALOAI as "Mã loại", SOHIEU as "Số hiệu máy bay"
from LICHBAY lb
join CHUYENBAY cb on lb.MACB = cb.MACB
where cb.SBDI = 'MIA'

-- Q5 mã chuyến bay, ngày đi, cùng với tên, địa chỉ, điện thoại của tất cả các hành khách đi trên chuyến bay đó. Sắp xếp theo thứ tự tăng dần của mã chuyến bay và theo ngày đi giảm dần.

select TEN as "Tên KH", DCHI as "Địa chỉ", DTHOAI as "Điện thoại", MACB as "Mã chuyến bay", NGAYDI as "Ngày đi"
from KHACHHANG kh
join DATCHO dc on kh.MAKH = dc.MAKH
order by dc.MACB ASC, dc.NGAYDI DESC

-- Q6 mã chuyến bay, ngày đi, cùng với tên, địa chỉ, điện thoại của tất cả những nhân viên được phân công trong chuyến bay đó. Sắp xếp theo thứ tự tăng dần của mã chuyến bay và theo ngày đi giảm dần.
select TEN as "Tên Nhân Viên", DCHI as "Địa chỉ", DTHOAI as "Điện thoại", MACB as "Mã chuyến bay", NGAYDI as "Ngày đi"
from NHANVIEN nv
join PHANCONG pc on nv.MANV = pc.MANV
order by pc.MACB ASC, pc.NGAYDI DESC

-- Q7 mã chuyến bay, ngày đi, mã số và tên của những phi công được phân công vào chuyến bay hạ cánh xuống sân bay ORD.
select pc.MACB as "MÃ chuyến bay" , NGAYDI as "NGày đi", TEN as  "Tên phi công"
from NHANVIEN nv
join PHANCONG pc on nv.MANV = pc.MANV
join CHUYENBAY cb on pc.MACB = cb.MACB
where (nv.LOAINV = '1' and  cb.SBDEN = 'ORD')

-- Q8 các chuyến bay (mã số chuyến bay, ngày đi và tên của phi công) trong đó phi công có mã 1001 được phân công lái.
select pc.MACB as "MÃ chuyến bay" , NGAYDI as "NGày đi", TEN as  "Tên phi công"
from NHANVIEN nv
join PHANCONG pc on nv.MANV = pc.MANV
where (nv.LOAINV = '1' and  nv.MANV = '1001')

-- Q9 (mã chuyến bay, sân bay đi, giờ đi, giờ đến, ngày đi) của những chuyến bay hạ cánh xuống DEN. Các chuyến bay được liệt kê theo ngày đi giảm dần và sân bay xuất phát (SBDI) tăng dần.
select cb.MACB as "MÃ chuyến bay" , SBDI as "Sân bay đi", GIODI as "Giờ đi", GIODEN as "Giờ đến", NGAYDI as "Ngày đi"
from CHUYENBAY cb
join LICHBAY lb on cb.MACB = lb.MACB
where SBDEN = 'DEN'
order by lb.NGAYDI ASC, cb.SBDI DESC

-- Q10 mỗi phi công, cho biết hãng sản xuất và mã loại máy bay mà phi công này có khả năng bay được. Xuất ra tên phi công, hãng sản xuất và mã loại máy bay.

select distinct TEN as "Tên phi công", HANGSX as "Hãng sản xuất", l.MALOAI as "Mã Loại"
from NHANVIEN nv
join KHANANG kn on nv.MANV = kn.MANV
join LOAIMB l on l.MALOAI = kn.MALOAI
where LOAINV = '1' 

-- Q11 mã phi công, tên phi công đã lái máy bay trong chuyến bay mã số 100 vào ngày 11/01/2000.

select nv.MANV as "Mã phi công", TEN as "Tên phi công"
from NHANVIEN nv
join PHANCONG pc on nv.MANV = pc.MANV
where LOAINV = '1' and pc.MACB = '100' and pc.NGAYDI = '2000-11-01'

-- Q12 mã chuyến bay, mã nhân viên, tên nhân viên được phân công vào chuyến bay xuất phát ngày 10/31/2000 tại sân bay MIA vào lúc 20:30

select cb.MACB as "Mã chuyến bay", nv.MANV as "Mã nhân viên", TEN as "Tên nhân viên"
from NHANVIEN nv
join PHANCONG pc on nv.MANV = pc.MANV
join CHUYENBAY cb on cb.MACB = pc.MACB
where pc.NGAYDI = '2000-10-31' and SBDI = 'MIA' and GIODI = '20:30:00'

-- Q13 thông tin về chuyến bay (mã chuyến bay, số hiệu, mã loại, hãng sản xuất) mà phi công "Quang" đã lái.
select  distinct lb.MACB as "Mã chuyến bay", SOHIEU as "Số hiệu", l.MALOAI as "Mã loại", HANGSX as "Hãng sản xuất"
from NHANVIEN nv
join PHANCONG pc on nv.MANV = pc.MANV
join LICHBAY lb on (pc.NGAYDI = lb.NGAYDI and pc.MACB = lb.MACB)
join LOAIMB l on (l.MALOAI = lb.MALOAI)
where LOAINV = '1'

-- Q14 biết tên của những phi công chưa được phân công lái chuyến bay nào.

select TEN as "Tên phi công"
from NHANVIEN nv
where nv.MANV not  in (select distinct nv.MANV from NHANVIEN nv join PHANCONG pc  on nv.MANV = pc.MANV) and nv.LOAINV = '1'

-- Q15 tên khách hàng đã đi chuyến bay trên máy bay của hãng "Boeing"

select distinct TEN as "Tên khác hàng"
from KHACHHANG kh
join DATCHO dc on kh.MAKH = dc.MAKH
join LICHBAY lb on (lb.NGAYDI = dc.NGAYDI and dc.MACB = lb.MACB)
join LOAIMB l on (lb.MALOAI = l.MALOAI)
where l.HANGSX = 'BOEING'

-- Q16 mã các chuyến bay chỉ bay với máy bay số hiệu 10 và mã loại B747.

select MACB as "Mã chuyến bay"
from LICHBAY
where SOHIEU = '10' and MALOAI = 'B747'
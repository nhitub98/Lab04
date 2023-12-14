--------------BÀI 1: VIẾT NHỮNG TRUY VẤN LẶP VÀ SẮP XẾP DỮ LIỆU---------------------------------------
--1.
select * from monhoc
--2. 
select masv, hosv, tensv, hocbong
from sinhvien
order by masv asc
--3. 
select masv,tensv,phai, ngaysinh
from sinhvien
order by tensv asc
--4.
select hosv + ' ' + tensv as [họ tên sinh viên], ngaysinh, hocbong
from sinhvien
order by ngaysinh asc, hocbong desc
--5.
select mamh,tenmh,sotiet
from monhoc
where tenmh like N'T%'
--6.
select hosv + ' ' + tensv as [họ tên sinh viên], ngaysinh, phai
from sinhvien
where tensv like N'%i'
--7.
select makh,tenkh
from khoa
where tenkh like N'_N%'
--8. 
select *
from sinhvien
where hosv like N'%Thị%'
--9. 
select masv, hosv,tensv, phai, hocbong
from sinhvien
where tensv like N'[a-m]%'
go
--10. 
select hosv + ' ' + tensv as [họ tên sinh viên], ngaysinh,noisinh,hocbong
from sinhvien
where tensv like N'%[a-m]%'
order by hosv asc, tensv asc
go
--11.
SELECT masv, hosv + ' ' + tensv as [họ tên sinh viên], ngaysinh, SinhVien.MaKH
FROM Khoa 
INNER JOIN
SinhVien ON Khoa.MaKH = SinhVien.MaKH
WHERE  Khoa.TenKH = N'Anh Văn'
go
--12.
SELECT masv, hosv + ' ' + tensv as [họ tên sinh viên], ngaysinh
FROM Khoa 
INNER JOIN SinhVien 
ON Khoa.MaKH = SinhVien.MaKH
WHERE  Khoa.TenKH = N'Vật Lý'
order by ngaysinh desc
go
--13. 
select masv, hosv + ' ' + tensv as [họ tên sinh viên], sinhvien.makh, hocbong
from sinhvien
inner join khoa
on sinhvien.makh=khoa.makh
where hocbong>500000
order by makh desc
go
--14.
select masv, hosv + ' ' + tensv as [họ tên sinh viên], sinhvien.makh, hocbong
from sinhvien
where datepart(year, ngaysinh) = 1987 and
      datepart(month, ngaysinh) = 12 and
      datepart(day, ngaysinh) = 20
go
--15.
select hosv,tensv,convert(varchar(10),ngaysinh, 103) as 'ngày sinh',noisinh,hocbong
from sinhvien
where ngaysinh> '1988/12/20'
order by ngaysinh desc
go
--16.
select hosv + ' ' + tensv as [họ tên sinh viên], sinhvien.makh, noisinh,hocbong
from sinhvien
where hocbong>100000 and noisinh=N'Tp.HCM'
order by  ngaysinh desc
go
--17. 
select masv, sinhvien.makh, phai
from sinhvien
inner join khoa on sinhvien.makh=khoa.makh
where khoa.TenKH=N'Anh Văn' or khoa.TenKH=N'Triết'
go
--18.
SELECT masv, ngaysinh,noisinh,hocbong
FROM sinhvien
WHERE ngaysinh BETWEEN '1986-01-01' AND '1992-06-05';
go
--19.
select masv, ngaysinh, phai, sinhvien.makh
from sinhvien
where hocbong between 200000 and 800000
go
--20.
select mamh, tenmh, sotiet
from monhoc
where sotiet>40 and sotiet<60
go
--21.
select masv, hosv + ' ' + tensv as [họ tên sinh viên], phai 
from sinhvien
inner join khoa
on sinhvien.makh=khoa.makh
where phai='0' and khoa.TenKH=N'Anh Văn'
go
--22.
select hosv, tensv, noisinh, ngaysinh
from sinhvien
where noisinh= N'Hà Nội' and ngaysinh>'01/01/1990'
go

--23. 
select * 
from sinhvien
where tensv like N'%N%' and phai='1'
--24. 
select *
from sinhvien
inner join khoa
on sinhvien.makh=khoa.makh
where phai='0' and khoa.TenKH=N'Tin Học' and ngaysinh>'1986/05/30'
go
--25. 
select hosv + ' ' + tensv as [họ và tên sinh viên],     phai = IIF(phai = 0, N'Nam', IIF(phai = 1, N'Nữ', N'Khác')), ngaysinh
from sinhvien

--26.
SELECT masv, year(getdate()) - year(ngaysinh) as Tuổi, noisinh,  sinhvien.makh
FROM sinhvien
--27.
SELECT hosv + ' ' + tensv as [họ và tên sinh viên], year(getdate()) - year(ngaysinh) as Tuổi, hocbong
FROM sinhvien
where year(getdate()) - year(ngaysinh)>20
go
--28.
SELECT hosv + ' ' + tensv as [họ và tên sinh viên], year(getdate()) - year(ngaysinh) as Tuổi, khoa.tenkh
FROM sinhvien
inner join khoa
on sinhvien.makh=khoa.makh
where year(getdate()) - year(ngaysinh) between 20 and 30
go

-------------------------BÀI 2. SỬ DỤNG HÀM TRONG TRUY VẤN DỮ LIỆU----------------------------------
--1.
SELECT hosv + ' ' + tensv as [họ và tên sinh viên], phai =IIF(phai=1, N'Nam', IIF(phai=0, N'Nữ',N'Khác')), year(getdate()) - year(ngaysinh) as Tuổi ,sinhvien.makh
from sinhvien
order by year(getdate()) - year(ngaysinh) desc
go
--2. 
select hosv + ' ' + tensv as [họ và tên sinh viên], phai, day(ngaysinh) as [Ngày sinh]
from sinhvien
where month(ngaysinh)=2 and year(ngaysinh)=1994
--3.
select *
from sinhvien
order by ngaysinh desc
--4.
--5. 
SELECT hosv + ' ' + tensv AS [họ tên sinh viên], ketqua.MaMH, ketqua.diem
FROM sinhvien
INNER JOIN ketqua ON sinhvien.masv = ketqua.MaSV
ORDER BY tensv ASC, ketqua.MaMH ASC;
--6.
SELECT
    hosv + ' ' + tensv AS [họ tên sinh viên],
    phai = IIF(phai = 1, N'Nam', IIF(phai = 0, N'Nữ', N'Khác')),
    khoa.makh
FROM
    sinhvien
    INNER JOIN khoa ON sinhvien.MaKH = khoa.MaKH
WHERE
    khoa.TenKH = N'Anh Văn';
--7.
SELECT  hosv + ' ' + tensv AS [họ tên sinh viên],MonHoc.TenMH,MonHoc.Sotiet,Ketqua.Diem
FROM     Ketqua 
INNER JOIN MonHoc ON Ketqua.MaMH = MonHoc.MaMH 
INNER JOIN SinhVien ON Ketqua.MaSV = SinhVien.MaSV INNER JOIN
           Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE  Khoa.TenKH = N'Tin học'
--8.
SELECT hosv + ' ' + tensv AS [họ tên sinh viên], Khoa.MaKH, MonHoc.TenMH, diem = IIF(Diem > 8, N'Giỏi', IIF(Diem BETWEEN 6 AND 8, N'Khá', N'Trung bình'))
FROM Ketqua
    INNER JOIN MonHoc ON Ketqua.MaMH = MonHoc.MaMH
    INNER JOIN SinhVien ON Ketqua.MaSV = SinhVien.MaSV
    INNER JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH;

-------------------BÀI 3: Tính toán thống kê dữ liệu---------------------------------------------
--1.
SELECT MonHoc.MaMH, MonHoc.TenMH,AVG(Ketqua.Diem) AS [Điểm trung bình]
FROM Ketqua
    INNER JOIN MonHoc ON Ketqua.MaMH = MonHoc.MaMH
GROUP BY MonHoc.MaMH, MonHoc.TenMH;
--2.
select  hosv + ' ' + tensv AS [họ tên sinh viên],khoa.tenkh, count(*) as [Tổng số môn thi]
FROM Ketqua
INNER JOIN SinhVien ON Ketqua.MaSV = SinhVien.MaSV
INNER JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
GROUP BY SinhVien.HoSV, SinhVien.TenSV,Khoa.TenKH;
--3.
SELECT
    hosv + ' ' + tensv AS [họ tên sinh viên],
    Khoa.TenKH AS [Tên khoa],
    phai,
    SUM(Ketqua.Diem) AS [Tổng điểm thi]
FROM
    Ketqua
    INNER JOIN SinhVien ON Ketqua.MaSV = SinhVien.MaSV
    INNER JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH
GROUP BY HoSV,TenSV, Khoa.TenKH, SinhVien.Phai;
--4.
SELECT Khoa.TenKH, COUNT(MaSV) AS [Tổng số sinh viên]
FROM
    Khoa
    LEFT JOIN SinhVien ON Khoa.MaKH = SinhVien.MaKH
GROUP BY
    Khoa.TenKH;
--5. 
select hosv + ' ' + tensv AS [họ tên sinh viên], max(ketqua.diem) as [Điểm cao nhất]
from sinhvien
inner join ketqua
on sinhvien.masv=ketqua.masv
GROUP BY
   sinhvien.hosv,sinhvien.tensv, ketqua.masv

--6. 
select monhoc.TenMH, sotiet as [Số tiết nhiều nhất]
from monhoc
where sotiet=(select max(sotiet) from monhoc)
--7.
select khoa.makh, khoa.tenkh, sinhvien.hocbong as [Học bổng cao nhất của khoa]
from khoa, sinhvien
where hocbong=(select max(hocbong) from sinhvien)
--8.-----------------------
SELECT MonHoc.TenMH, Ketqua.Diem
FROM   Ketqua 
INNER JOIN
MonHoc ON Ketqua.MaMH = MonHoc.MaMH
WHERE  Ketqua.Diem = (SELECT max(diem) FROM ketqua) 
-----------------
--9.

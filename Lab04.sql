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
select  hosv + ' ' + tensv as [họ tên sinh viên], sinhvien.makh, hocbong
from sinhvien
where datepart(year, ngaysinh) = 1987 and
      datepart(month, ngaysinh) = 12 and
      datepart(day, ngaysinh) = 20
go
--15.
select hosv + ' ' + tensv as [họ tên sinh viên],convert(varchar(10),ngaysinh, 103) as 'ngày sinh',noisinh,hocbong
from sinhvien
where ngaysinh> '1977/12/20'
order by ngaysinh desc
go
--16.
select hosv + ' ' + tensv as [họ tên sinh viên], sinhvien.makh, noisinh,hocbong
from sinhvien
where hocbong>100000 and noisinh=N'Tp. HCM'
order by  ngaysinh desc
go

--17. 
select masv, sv.makh, phai
from sinhvien sv
inner join khoa kh on sv.makh=kh.makh
where kh.TenKH=N'Anh Văn' or kh.TenKH=N'Triết'
go

--18.
SELECT masv, ngaysinh,noisinh,hocbong
FROM sinhvien
WHERE ngaysinh BETWEEN '1986-01-01' AND '1992-06-05';
go
--19.
select masv, ngaysinh, phai, sv.makh
from sinhvien sv
where hocbong between 200000 and 800000
go

--20.
select mamh, tenmh, sotiet
from monhoc
where sotiet>40 and sotiet<60
go

--21.
select masv, hosv + ' ' + tensv as [họ tên sinh viên], phai 
from sinhvien sv
inner join khoa kh
on sv.makh=kh.makh
where phai='0' and kh.TenKH=N'Anh Văn'
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
from sinhvien sv
inner join khoa kh
on sv.makh=kh.makh
where phai='0' and kh.TenKH=N'Tin Học' and ngaysinh>'1986/05/30'
go

--25. 
select hosv + ' ' + tensv as [họ và tên sinh viên], phai = IIF(phai = 0, N'Nam', IIF(phai = 1, N'Nữ', N'Khác')), ngaysinh
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
Select sv.masv, phai, sv.makh, 'Mức học bổng'=IIF(hocbong>500000, N'Học bổng cao', IIF(hocbong<500000, N'Mức Trung bình',N'Khác'))
from sinhvien sv

--5. 
SELECT  hosv + ' ' + tensv AS [họ tên sinh viên], kq.MaMH, kq.diem
FROM sinhvien sv
join ketqua kq ON sv.masv = kq.MaSV
join monhoc mh on mh.mamh=kq.MaMH
ORDER BY hosv ASC, tensv ASC, kq.MaMH ASC
--6.
SELECT
    hosv + ' ' + tensv AS [họ tên sinh viên],
    phai = IIF(phai = 0, N'Nam', IIF(phai = 1, N'Nữ', N'Khác')),
    khoa.makh
FROM
    sinhvien
    INNER JOIN khoa ON sinhvien.MaKH = khoa.MaKH
WHERE
    khoa.TenKH = N'Anh Văn'
--7.
SELECT  kh.tenkh, hosv + ' ' + tensv AS [họ tên sinh viên],Mh.TenMH,Mh.Sotiet,Kq.Diem
FROM     Ketqua  kq
INNER JOIN MonHoc mh ON kq.MaMH = Mh.MaMH 
INNER JOIN SinhVien sv ON Kq.MaSV = Sv.MaSV 
INNER JOIN Khoa kh ON Sv.MaKH = Kh.MaKH
WHERE  Kh.TenKH = N'Tin học'
--8.
SELECT hosv + ' ' + tensv AS [họ tên sinh viên], Khoa.MaKH, MonHoc.TenMH, diem, 'Loại' = IIF(Diem > 8, N'Giỏi', IIF(Diem BETWEEN 6 AND 8, N'Khá', N'Trung bình'))
FROM Ketqua
    INNER JOIN MonHoc ON Ketqua.MaMH = MonHoc.MaMH
    INNER JOIN SinhVien ON Ketqua.MaSV = SinhVien.MaSV
    INNER JOIN Khoa ON SinhVien.MaKH = Khoa.MaKH;

-------------------BÀI 3: Tính toán thống kê dữ liệu---------------------------------------------
--1.
SELECT MonHoc.MaMH, MonHoc.TenMH,round(isnull(AVG(diem),0),2) AS [Trung bình điểm thi]
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
    Khoa.TenKH,
    phai,
    SUM(Ketqua.Diem) AS [Tổng điểm thi]
FROM Ketqua
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
select monhoc.TenMH, sotiet
from monhoc
where sotiet=(select max(sotiet) from monhoc)

--7.
select khoa.makh, khoa.tenkh, max(hocbong) as [Học bổng cao nhất]
from khoa
inner join sinhvien on khoa.makh=sinhvien.makh
group by khoa.makh, khoa.tenkh

--8.-----------------------
SELECT MonHoc.TenMH, max(Ketqua.Diem) as [Điểm cao nhất]
FROM   Ketqua 
INNER JOIN
MonHoc ON Ketqua.MaMH = MonHoc.MaMH
group by monhoc.tenmh

-----------------
--9. 
select mh.mamh,mh.tenmh, count(distinct masv) as [Số sinh viên đang học]
from ketqua kq, monhoc mh
where kq.mamh=mh.mamh
group by mh.mamh, mh.tenmh

--10. 

select mh.tenmh, mh.sotiet, sv.tensv, kq.diem as [Điểm cao nhất]
from sinhvien sv
join ketqua kq on kq.masv=sv.masv
join monhoc mh on mh.mamh=kq.mamh
where diem = (select max(diem) from ketqua)
group by  mh.tenmh, mh.sotiet, sv.tensv, kq.diem

--11.
select k.makh, k.tenkh, s.masv as [Tổng số sinh viên]
from khoa as k
join sinhvien as s on k.makh=s.makh
where masv = (select count(masv) from sinhvien)
group by k.makh, k.tenkh, s.masv
go


--12. 
select k.TenKH, hosv + ' ' + tensv AS [họ tên sinh viên], s.hocbong
from khoa as k
join sinhvien as s on k.makh=s.makh
where s.hocbong=(select max(hocbong) from sinhvien)
go
--13.
select s.masv,s.hosv, s.tensv,  k.TenKH, s.hocbong
from khoa as k
join sinhvien as s on k.makh=s.makh
where k.tenkh=N'Tin học' and  s.hocbong=(select max(hocbong) from sinhvien where MaKH='TH') 
go

--14. 
select hosv+' '+tensv 'Họ tên sinh viên',tenmh,diem
from ketqua kq,monhoc mh,sinhvien sv
where sv.masv=kq.masv 
and kq.mamh=mh.mamh 
and tenmh=N'cơ sở dữ liệu'
and diem=(select max(diem)
from ketqua kq,monhoc mh
where kq.mamh=mh.mamh and tenmh=N'cơ sở dữ liệu')
--15.
select hosv + ' ' + tensv as [họ và tên sinh viên], tenkh, TenMH, diem=(select top 3 diem from ketqua )
from sinhvien sv 
join ketqua kq on sv.masv=kq.masv
join monhoc mh on kq.mamh=mh.mamh
 join khoa kh on sv.makh=kh.makh
where mh.TenMH=N'Đồ họa'


--16.
select kh.makh,kh.tenkh
from sinhvien sv,khoa kh
where sv.makh=kh.makh and phai=1
group by tenkh,kh.makh
having count(tenkh)>=all(select count(masv)
from sinhvien
where phai=1
group by makh)
--17.
select kh.makh,kh.tenkh, tongsv = (select count(masv) from sinhvien where makh=kh.makh), 
'tong sv nu' = (select count(masv) from sinhvien where makh=kh.makh and phai=1)
from sinhvien sv 
join khoa kh on sv.makh=kh.makh
group by kh.makh, kh.tenkh
--18. 
SELECT
    hosv + ' ' + tensv AS [Họ và tên sinh viên],
    kh.TenKH, sum(diem) as [kết quả],
   case 
   when sum(diem)>5 then N'đậu'
   when sum(diem)<5 then N'Rớt'
   end as [kết quả]
       
FROM
    sinhvien sv
    JOIN ketqua kq ON sv.masv = kq.masv
    JOIN monhoc mh ON kq.mamh = mh.mamh
    JOIN khoa kh ON sv.makh = kh.makh
GROUP BY
    hosv, tensv, tenkh;
--19. 
--20.
select mamh,tenmh
from monhoc
where mamh in (select mamh from ketqua group by  mamh having min(diem)>5)
--21.
SELECT DISTINCT
    kh.makh,
    kh.tenkh
FROM
    khoa kh
JOIN
    sinhvien sv ON sv.makh = kh.makh
WHERE
    EXISTS (
        SELECT *
        FROM
            sinhvien sv
            JOIN ketqua kq ON kq.masv = sv.masv
        WHERE
            sv.makh = kh.makh
            AND kq.diem > 5)
--22.
SELECT
    mh.MaMH,
    mh.TenMH,
    COUNT(CASE WHEN kq.Diem >= 5 THEN 1 END) AS [Số sinh viên đậu],
    COUNT(CASE WHEN kq.Diem < 5 THEN 1 END) AS [Số sinh viên rớt]
FROM
    MonHoc mh
    INNER JOIN Ketqua kq ON mh.MaMH = kq.MaMH
GROUP BY
    mh.MaMH,
    mh.TenMH;

--23. 
select mamh,tenmh
from monhoc
where mamh not in (select mamh from ketqua kq where kq.diem<4)

--24.
select distinct sv.masv,hosv + ' ' + tensv as [họ và tên sinh viên],kh.makh 
from sinhvien sv 
join ketqua kq on sv.masv=kq.masv
join khoa kh on sv.makh=kh.makh
where sv.masv in (select masv from ketqua group by masv having min(diem)>5)
--25.
select sv.masv,hosv + ' ' + tensv as [họ và tên sinh viên],sv.makh 
from sinhvien sv 
join ketqua kq on sv.masv=kq.masv
join monhoc mh on kq.mamh=mh.mamh
where diem<5
group by sv.masv, hosv, tensv, makh
having count(mh.mamh)>=2
--26.
select kh.makh,tenkh, 'Tổng số sinh viên của khoa'=count(masv)
from sinhvien sv
join khoa kh on sv.makh=kh.makh
group by kh.makh, kh.tenkh
having count(masv)>=10
--27.
select sv.masv,hosv + ' ' + tensv as [họ và tên sinh viên], 'Số môn thi'=count(mh.mamh)
from sinhvien sv
join ketqua kq on sv.masv=kq.masv
join monhoc mh on kq.mamh=mh.mamh
join khoa kh on sv.makh=kh.makh
group by sv.masv, hosv, tensv
having count(mh.mamh)>=4
--28. 
select kh.makh,kh.tenkh, 'Tổng số sinh viên nam'=count(sv.masv)
from sinhvien sv
join khoa kh on sv.makh=kh.makh
where phai=0 
group by kh.makh, kh.tenkh
having count(sv.masv)>=5
--29. 
SELECT hosv + ' ' + tensv as [họ và tên sinh viên], kh.tenkh, sv.phai, AVG(kq.Diem) AS [Điểm trung bình các môn]
FROM
    sinhvien sv
join ketqua kq ON sv.MaSV = kq.MaSV
join khoa kh on sv.makh=kh.makh
GROUP BY sv.hosv, sv.tensv,kh.tenkh,sv.phai
HAVING
    AVG(kq.Diem) > 4;

--30.
SELECT mh.mamh, mh.tenmh, avg(diem) as [Trung bình điểm]
FROM ketqua kq
join monhoc mh on kq.MaMH=mh.MaMH
GROUP BY mh.mamh, mh.tenmh
HAVING
    AVG(kq.Diem) > 6;
-----------------Bài 4. Sử dụng tham số trong truy vấn
1. 


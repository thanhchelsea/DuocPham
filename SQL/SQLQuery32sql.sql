create database Test
go
use Test
go
 create table Tacgia(
 MaTG int primary key,
 TenTG varchar(20) 
 )
  drop table Tacgia
 go
create table Sach(
 MaSach int primary key,
 TenSach varchar(20) ,
 MaNXB  int,
 MaTG int,
 NamSX date,
 Soluong int,
 Dongia int,

FOREIGN KEY (MaTG) REFERENCES Tacgia(MaTG),
FOREIGN KEY (MaNXB) REFERENCES NhaXB(MaNXB)
 )
 go
  create table NhaXB(
 MaNXB int primary key,
 TenNXB varchar(20) 
 )



 Select TenTG,TenSach from Sach inner join Tacgia on Sach.MaTG=Tacgia.MaTG where Sach.TenSach='e';

 
GO
/* tao khung nhin */
create view TinhThanhTien
as
select MaSach, TenSach, SoLuong, DonGia,SoLuong*DonGia AS ThanhTien
from SACH inner join NHAXB
	ON SACH.MaNXB=NHAXB.MaNXB
	where NHAXB.TenNXB='NXBGD'
go

Select*from TinhThanhTien;

/* tao ham function */


GO
CREATE FUNCTION ThanhTien (@MaSach char(4))
RETURNS table 
AS
RETURN 
(
SELECT MaSach, TenSach , SoLuong , DonGia , SoLuong*DonGia AS ThanhTien 
 FROM SACH inner join NHAXB 
ON  SACH.MaNXB=NHAXB.MaNXB
WHERE ( SACH.MaSach=@MaSach AND (NHAXB.TenNXB='NXBGD'))
)
/*gọi hàm và truyền tham số cho hàm để xem giá tri*/

select* from ThanhTien('1')

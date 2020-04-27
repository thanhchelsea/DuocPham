create database CyBer
go
use CyBer;
go 
create table chuQuan(
tenChu varchar(20)  primary key,
sdt char(10) ,
diaChi varchar(30)
)
go;
create table nhanVien(
  maNhanVien VARCHAR(10) not null unique,
  ten varchar(20),
  sdt varchar(10),
  luong double,
  ngayLamViec varchar(8),
  tenChu varchar(20),
  primary key(maNhanVien),
FOREIGN KEY (tenChu) REFERENCES chuQuan(tenChu)
  
  
)
go;
create table KinhDoanh(
thoiGiAN varchar(10) primary key,
maNhanVien varchar(10),
tenTaiKhoan varchar(20),
FOREIGN KEY (maNhanVien) REFERENCES nhanVien(maNhanVien),
FOREIGN KEY (tenTaiKhoan) REFERENCES KhacHang(tenTaiKhoan)


)
go;
create table KhacHang(
tenTaiKhoan varchar(20) not null unique,
ten varchar(20) ,
sdt varchar(10),
soTienNap varchar(6),
primary key (tenTaiKhoan)

)
go;
select ten
from KinhDoanh inner join KhacHang 
on KinhDoanh.tenTaiKhoan=KhacHang.tenTaiKhoan
where KinhDoanh.thoiGiAN="10h.0803";

select *
from nhanVien
where nhanVien.luong <10000000 and nhanVien.maNhanVien>=2;


select *
from nhanVien
where sdt = "0974399005";



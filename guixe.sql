create database QuanLyXe
go
use QuanLyXe
go
create table Xe(
Id int identity(1,1) primary key,
[Name] nvarchar(100) not null,
IdHangXe int not null,
Giaxe int not null,
Thue float
)
go
create table HangXe(
Id int identity(1,1) primary key,
[Name] nvarchar(100) not null)
go

insert into Xe values ('K3', 1, 25000, 0.1),
('G63', 3, 250000, 0.1),
('Vios', 2, 23000, 0.2),
('Cerato', 1, 30000, 0.1)
go
insert into Hangxe values ('Kia'),
('Toyota'),
('Mercedes'),
('Audi')

/*
Scaffold-DbContext "Server= Tên_server ;Initial Catalog= Tên_db;Persist Security Info=True;User ID= tên_username; Password= Password " Microsoft.EntityFrameworkCore.SqlServer -OutputDir "Thư mục muốn lưu tới"
*/
--Tạo bảng loại sách : mã loại, mã sách, số lượng
--Tạo bảng sách : mã sách, tên sách, tác giả
--Tạo bảng phiếu mượn: mã phiếu, mã sách, tên sinh viên, trạng thái, ngày mượn, số lượng mượn



use LUYEN_TAP_03

create table LOAISACH(
	MaLoai nvarchar(50) not null,
	MaSach nvarchar(50) not null,
	SoLuong int not null,
	primary key (MaSach),
	foreign key (MaSach) references SACH (MaSach)
);

create table SACH(
	MaSach nvarchar(50) not null,
	TenSach nvarchar(50) not null,
	TacGia nvarchar(50) not null,
	primary key (MaSach)
);

create table PHIEUMUON(
	MaPM nvarchar(50) not null,
	MaSach nvarchar(50) not null,
	TenSV nvarchar(50) not null,
	TrangThai nvarchar(50) not null,
	NgayMuon date not null,
	soLuongMuon int not null,
	primary key(MaPM),
	foreign key (MaSach) references SACH(MaSach)
);



select * from LOAISACH
select * from SACH
select * from PHIEUMUON


insert into LOAISACH
values('TT','TT001',10)
insert into LOAISACH
values('TT','TT002',10)
insert into LOAISACH
values('TT','TT003',10)
insert into LOAISACH
values('TT','TT004',10)


insert into SACH
values('TT001','TieuThuyet','TaiLinh')
insert into SACH
values('TT002','TieuThuyet2','TaiLinh2')
insert into SACH
values('TT003','TieuThuyet3','TaiLinh3')
insert into SACH
values('TT004','TieuThuye4','TaiLinh4')

insert into PHIEUMUON
values('PM001','TT001','Thi','muon','2022-5-4',22)

insert into PHIEUMUON
values('PM002','TT002','Thi2','muon','2022-5-4',22)

insert into PHIEUMUON
values('PM003','TT003','Thi3','muon','2022-5-4',22)

insert into PHIEUMUON
values('PM004','TT004','Thi4','muon','2022-5-4',22)

select *
from SACH
--Viết proc insert bảng sách nếu mã sách đã tồn tại -> hiển thị sách đã tồn tại


create procedure proc_insert_sach @MaSach nvarchar(50), @TenSach nvarchar(50), @TacGia nvarchar(50) 
as
begin
	if exists (select * from SACH where @MaSach = MaSach)
	begin
		print N'Mã sách đã tồn tại'
	end
	else 
	begin
		insert into SACH
		values(@MaSach,@TenSach,@TacGia)
	end
end

drop proc proc_insert_sach


exec proc_insert_sach 'TT005','TieuThuyet5','TaiLinh5'


select * from LOAISACH
--Viết proc insert bảng loai sách

	create procedure proc_insert_LoaiSach @MaLoai nvarchar(50), @MaSach nvarchar(50), @SoLuong nvarchar(50) 
as
begin
	if exists (select * from LOAISACH where @MaLoai = MaLoai)
	begin
		print N'Mã loại đã tồn tại'
	end
	else 
	begin
		insert into SACH
		values(@MaLoai,@MaSach,@SoLuong)
	end
end

drop proc proc_insert_LoaiSach


exec proc_insert_LoaiSach 'IT','TT005',15


select * from PHIEUMUON
--Viết proc insert bảng phiếu mượn, nếu mã sách không tồn tại -> thông báo sách không tồn tại, nếu số lượng mượn > số lượng sách trong kho
---> thông báo không đủ sách cho mượn, trường hợp insert thành công -> update lại số lượng sách trong kho = số lượng - số lượng mượn

	create proc proc_insert_PM @MaPM nvarchar(50), @MaSach nvarchar(50), @TenSV nvarchar(50), @TrangThai nvarchar(50), @NgayMuon date, @soLuongMuon int
	as
	begin
		if exists(select * from PHIEUMUON where 
	end



--Viết proc trả sách : update lại trạng thái của phiếu mượn, đồng thời update lại số lượng sách trong kho
--Viết view hiển thị top 2 sách có lượt mượn nhiều nhất

create view view_Luot_muon
as
	select top 2 count(PHIEUMUON.MaSach), PHIEUMUON.soLuongMuon from SACH inner join PHIEUMUON on SACH.MaSach = PHIEUMUON.MaSach
	GROUP BY PHIEUMUON.soLuongMuon
	order by count(PHIEUMUON.MaSach) desc
	select * from view_Luot_muon
--Viết view hiển thị tên sinh viên và sách mượn



	create view view_TenSV 
	as select 
--Viết hàm nhận vào mã sách -> hiển thị số lượt mượn của sách
--Viết hàm nhận vào mã sách -> hiển thị sinh viên chưa trả sách




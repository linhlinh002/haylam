use LUYENTAP_02

--Tạo bảng phòng ban: mã phòng ban, tên phòng ban, số lượng nhân viên
--Tạo bảng nhân viên : mã nhân viên, tên nhân viên, mã phòng ban, lương, ngày sinh
--Viết proc insert bảng nhân viên. kiểm tra mã nhân viên đã tồn tai -> thông báo mã đã tồn tại, ngược lại cho insert, khi insert bảng nhân viên đồng thời tăng số lượng nhân viên của phòng ban đó +1
--Viết hàm nhận vào mã nhân viên trả ra lương và thuế của nhân viên đó . thuế = 10% *lương
--viết proc insert dữ liệu bảng phòng ban -> kiểm tra mã phòng ban đã tồn tại -> thông báo đã tồn tại
--viết trigger check insert bảng nhân viên . Nếu lương <100 thông báo -> nhập lại lương
--Tạo view hiển thị top 2 phòng ban có nhiều nhân viên nhất
--Tạo view hiển thị top 3 nhân viên có mức lương cao nhất của phòng KT

create table PHONGBAN(
	MaPB nvarchar(15),
	TenPB nvarchar(20),
	SoLuongNV int 
	primary key (MaPB)
);


insert into PHONGBAN 
values('PB01','keToan',10)
insert into PHONGBAN 
values('PB02','Maketing',15)
insert into PHONGBAN 
values('PB03','SangTao',1)
insert into PHONGBAN 
values('PB04','BaoVe',30)
insert into PHONGBAN 
values('PB05','KT',30)

create table NHANVIEN(
	MaNV nvarchar(20),
	TenNV nvarchar(20),
	MaPB nvarchar(15),
	Luong int,
	NgaySinh date
	primary key (MaNV),
	foreign key (MaPB) references PHONGBAN(MaPB)
);

insert into NHANVIEN 
values('NV01','NguyenTaiLinh','PB01',10000000,'3-4-2003')
insert into NHANVIEN 
values('NV02','Nguyen','PB02',1000000,'3-4-2003')
insert into NHANVIEN 
values('NV03','Linh','PB03',100000,'3-2-2003')
insert into NHANVIEN 
values('NV04','NguyenThiHuyen','PB04',100000,'3-7-2003')
insert into NHANVIEN 
values('NV05','NguyenThyen','PB05',102220000,'3-7-2003')
insert into NHANVIEN 
values('NV06','NguyenThiyen','PB05',100222000,'3-7-2003')
insert into NHANVIEN 
values('NV07','Nguyen','PB05',1030000,'3-7-2003')
insert into NHANVIEN 
values('NV08','NguyHuyen','PB05',100343000,'3-7-2003')

--Tạo view hiển thị top 2 phòng ban có nhiều nhân viên nhất


create View Top2_PB_Nhieu_NV 
as
select top 2 SoLuongNV from PHONGBAN inner join NHANVIEN on PHONGBAN.MaPB = NHANVIEN.MaPB order by SoLuongNV desc

select * from Top2_PB_Nhieu_NV


--Tạo view hiển thị top 3 nhân viên có mức lương cao nhất của phòng KT


create view top3_NV_luongCaoNHat 
as select top 3 NHANVIEN.Luong
from PHONGBAN inner join NHANVIEN on PHONGBAN.MaPB = NHANVIEN.MaPB order by SoLuongNV desc

select *
from top3_NV_luongCaoNHat

--Viết proc insert bảng nhân viên. kiểm tra mã nhân viên đã tồn tai -> 
--thông báo mã đã tồn tại, ngược lại cho insert, 
--khi insert bảng nhân viên đồng thời tăng số lượng nhân viên của phòng ban đó +1


select *
from NHANVIEN

create procedure pro_themnv @MaNV nvarchar(20), @TenNV nvarchar(20), @MaPB nvarchar (20), @Luong int, @NgaySinh date
as 
if exists(select * from NHANVIEN where MaPB = @MaPB)
if exists(select * from NHANVIEN where MaNV = @MaNV )
update NHANVIEN set MaNV = @MaNV, TenNV = @TenNV , MaPB = @MaPB, Luong = @Luong, NgaySinh = @NgaySinh
where MaNV = @MaNV

else 
insert into NHANVIEN
values (@MaNV,@TenNV,@MaPB,@Luong,@NgaySinh)
drop proc pro_themnv


exec pro_themnv 'NV09','NguyenHue','PB06',1256489,'7-9-2003'

select * from NHANVIEN

--Viết hàm nhận vào mã nhân viên trả ra lương và thuế của nhân viên đó . thuế = 10% *lương









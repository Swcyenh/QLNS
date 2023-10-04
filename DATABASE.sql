﻿create database QLNS
go

use QLNS
set dateformat DMY
go

create table CHITIETHOADON
(
	MAHOADON char(7) not null,
	MASACH char(7),
	SOLUONG int,
	GIATIEN int,
	THANHTIEN int
)


create table HOADON
(
	MAHOADON char(7) primary key not null,
	TENKHACHHANG nvarchar(50),
	NGAYLAP datetime,
	TONGTIEN decimal(10, 2) 
)

create table KHO
(
	MASACH char(7) primary key not null,
	SOLUONG int
)


create table SACH
(
	MASACH char(7) primary key not null,
	TENSACH nvarchar(100),
	MATG char(7) not null,
	TENLINHVUC nvarchar(30),
	TENLOAISACH nvarchar(30),
	GIAMUA int,
	GIABIA int,
	LANTAIBAN int,
	TENNHAXUATBAN nvarchar(50),
	NAMXUATBAN datetime
)

create table TACGIA
(
    MATG char(7) primary key not null,
	TENTG nvarchar(40),
	NAMSINH date,
	NAMMAT date,
	QUEQUAN nvarchar(20)
)

create table TAIKHOAN
(
    USERNAME nvarchar(20) primary key not null,
	PASS_WORD nvarchar(100)
)

--FK
alter table CHITIETHOADON add constraint FK_CHITIETHOADON_HOADON foreign key(MAHOADON) references HOADON(MAHOADON)
alter table CHITIETHOADON add constraint FK_CHITIETHOADON_SACH foreign key(MASACH) references SACH(MASACH)
alter table KHO add constraint FK_KHO_SACH foreign key(MASACH) references SACH(MASACH)
alter table SACH add constraint FK_SACH_LOAISACH foreign key(TENLOAISACH) references LOAISACH(TENLOAISACH)
alter table SACH add constraint FK_SACH_TACGIA foreign key(MATG) references TACGIA(MATG)
alter table SACH add constraint FK_SACH_LINHVUC foreign key(TENLINHVUC) references LINHVUC(TENLINHVUC)
alter table SACH add constraint FK_SACH_NHAXUATBAN foreign key(TENNHAXUATBAN) references NHAXUATBAN(TENNHAXUATBAN)
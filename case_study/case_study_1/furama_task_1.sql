drop database if exists furama;
create database if not exists furama;
use furama;
create table vi_tri
(
    ma_vi_tri  int auto_increment,
    ten_vi_tri varchar(45),
    primary key (ma_vi_tri)
);
create table trinh_do
(
    ma_trinh_do  int auto_increment,
    ten_trinh_do varchar(45),
    primary key (ma_trinh_do)
);
create table bo_phan
(
    ma_bo_phan  int auto_increment,
    ten_bo_phan varchar(45),
    primary key (ma_bo_phan)
);
create table loai_khach
(
    ma_loai_khach  int auto_increment,
    ten_loai_khach varchar(45),
    primary key (ma_loai_khach)
);
create table kieu_thue
(
    ma_kieu_thue  int auto_increment,
    ten_kieu_thue varchar(45),
    primary key (ma_kieu_thue)
);
create table loai_dich_vu
(
    ma_loai_dich_vu  int auto_increment,
    ten_loai_dich_vu varchar(45),
    primary key (ma_loai_dich_vu)
);

create table dich_vu_di_kem
(
    ma_dich_vu_di_kem  int auto_increment,
    ten_dich_vu_di_kem varchar(45) not null,
    gia                double      not null,
    don_vi             varchar(10) not null,
    trang_thai         varchar(45),
    primary key (ma_dich_vu_di_kem)
);

create table nhan_vien
(
    ma_nhan_vien  int auto_increment,
    ho_ten        varchar(45) not null,
    ngay_sinh     date        not null,
    so_cmnd       varchar(45) not null,
    luong         double      not null,
    so_dien_thoai varchar(45) not null,
    email         varchar(45),
    dia_chi       varchar(45),
    ma_vi_tri     int         not null,
    ma_trinh_do   int         not null,
    ma_bo_phan    int         not null,
    primary key (ma_nhan_vien),
    foreign key (ma_vi_tri) references vi_tri (ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do (ma_trinh_do),
    foreign key (ma_bo_phan) references bo_phan (ma_bo_phan)
);
create table khach_hang
(
    ma_khach_hang int auto_increment,
    ho_ten        varchar(45) not null,
    ngay_sinh     date        not null,
    gioi_tinh     bit(1)      not null,
    so_cmnd       varchar(45) not null,
    so_dien_thoai varchar(45) not null,
    email         varchar(45),
    dia_chi       varchar(45),
    ma_loai_khach int         not null,
    primary key (ma_khach_hang),
    foreign key (ma_loai_khach) references loai_khach (ma_loai_khach)
);
create table dich_vu
(
    ma_dich_vu       int auto_increment,
    ten_dich_vu      varchar(45) not null,
    dien_tich        int,
    chi_phi_thue     double      not null,
    so_nguoi_toi_da  int,
    ma_kieu_thue     int         not null,
    ma_loai_dich_vu  int         not null,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi  varchar(45),
    dien_tich_ho_boi double,
    so_tang          int,
    primary key (ma_dich_vu),
    foreign key (ma_kieu_thue) references kieu_thue (ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu (ma_loai_dich_vu)
);
create table hop_dong
(
    ma_hop_dong       int auto_increment,
    ngay_lam_hop_dong datetime not null,
    ngay_ket_thuc     datetime not null,
    tien_dat_coc      double   not null,
    ma_nhan_vien      int      not null,
    ma_khach_hang     int      ,
    ma_dich_vu        int      ,
    primary key (ma_hop_dong),
    foreign key (ma_nhan_vien) references nhan_vien (ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang (ma_khach_hang) on delete set null,
    foreign key (ma_dich_vu) references dich_vu (ma_dich_vu) on delete set null
);

create table hop_dong_chi_tiet
(
    ma_hop_dong_chi_tiet int auto_increment,
    ma_hop_dong          int not null,
    ma_dich_vu_di_kem    int not null,
    so_luong             int not null,
    primary key (ma_hop_dong_chi_tiet),
    foreign key (ma_hop_dong) references hop_dong (ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem (ma_dich_vu_di_kem)
);

insert into vi_tri
(ten_vi_tri)
values ('Quản lý'),
       ('Nhân viên');

insert into trinh_do
(ten_trinh_do)
values ('Trung Cấp'),
       ('Cao Đẳng'),
       ('Đại Học'),
       ('Sau Đại Học');

insert into bo_phan
(ten_bo_phan)
values ('Sale-Marketing'),
       ('Hành chính'),
       ('Phục vụ'),
       ('Quản lý');

insert into loai_khach
(ten_loai_khach)
values ('Diamond'),
       ('Platinium'),
       ('Gold'),
       ('Silver'),
       ('Member');

insert into kieu_thue
(ten_kieu_thue)
values ('year'),
       ('month'),
       ('day'),
       ('hour');

insert into loai_dich_vu
(ten_loai_dich_vu)
values ('Villa'),
       ('House'),
       ('Room');

insert into dich_vu_di_kem
(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values ('Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
       ('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
       ('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
       ('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       ('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       ('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

insert into nhan_vien
(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
values ('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com',
        '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
       ('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1,
        2, 2),
       ('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com',
        'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
       ('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com',
        '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
       ('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com',
        '43 Yên Bái, Đà Nẵng', 2, 1, 1),
       ('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com',
        '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
       ('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com',
        '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
       ('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com',
        '111 Hùng Vương, Hà Nội', 2, 4, 4),
       ('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng',
        2, 4, 4),
       ('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com',
        '6 Hoà Khánh, Đồng Nai', 2, 3, 2);

insert into khach_hang
(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
values ('Nguyễn Thị Hào', '1970-11-07', b'0', '643431213', '0945423362', 'thihao07@gmail.com',
        '23 Nguyễn Hoàng,Đà Nẵng', 5),
       ('Phạm Xuân Diệu', '1992-08-08', b'1', '865342123', '0954333333', 'xuandieu92@gmail.com',
        'K77/22 Thái Phiên, Quảng Trị', 3),
       ('Trương Đình Nghệ', '1990-02-27', b'1', '488645199', '0373213122', 'nghenhan2702@gmail.com',
        'K323/12 Ông Ích Khiêm, Vinh', 1),
       ('Dương Văn Quan', '1981-07-08', b'1', '543432111', '0490039241', 'duongquan@gmail.com',
        'K453/12 Lê Lợi, Đà Nẵng', 1),
       ('Hoàng Trần Nhi Nhi', '1995-12-09', b'0', '795453345', '0312345678', 'nhinhi123@gmail.com',
        '224 Lý Thái Tổ, Gia Lai', 4),
       ('Tôn Nữ Mộc Châu', '2005-12-06', b'0', '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng',
        4),
       ('Nguyễn Mỹ Kim', '1984-04-08', b'0', '856453123', '0912345698', 'kimcuong84@gmail.com',
        'K123/45 Lê Lợi, Hồ Chí Minh', 1),
       ('Nguyễn Thị Hào', '1999-04-08', b'0', '965656433', '0763212345', 'haohao99@gmail.com',
        '55 Nguyễn Văn Linh, Kon Tum', 3),
       ('Trần Đại Danh', '1994-07-01', b'1', '432341235', '0643343433', 'danhhai99@gmail.com',
        '24 Lý Thường Kiệt, Quảng Ngãi', 1),
       ('Nguyễn Tâm Đắc', '1989-07-01', b'1', '344343432', '0987654321', 'tdactam@gmail.com', '22 Ngô Quyền, Đà Nẵng',
        2);

insert into dich_vu
(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi, dien_tich_ho_boi, so_tang,
 ma_kieu_thue, ma_loai_dich_vu)
values ('Villa Beach Front', 25000, 10000000, 10, 'vip', 'Có hồ bơi', 500, 4, 3, 1),
       ('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, 2, 2),
       ('Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, 4, 3),
       ('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, 3, 1),
       ('House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, 2, 3, 2),
       ('Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, 4, 3);

insert into hop_dong
(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values ('2020-12-08', '2020-12-08', 0, 3, 1, 3),
       ('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
       ('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
       ('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
       ('2021-07-14', '2021-07-15', 0, 7, 2, 6),
       ('2021-06-03', '2021-06-03', 0, 7, 7, 6),
       ('2021-09-05', '2021-09-05', 100000, 7, 4, 4),
       ('2021-06-18', '2021-06-18', 150000, 3, 4, 1),
       ('2020-11-19', '2020-11-19', 0, 3, 4, 3),
       ('2021-04-14', '2021-04-14', 0, 10, 3, 5),
       ('2021-04-25', '2021-04-25', 0, 2, 2, 1),
       ('2021-05-27', '2021-05-27', 0, 7, 10, 1);

insert into hop_dong_chi_tiet
(so_luong, ma_hop_dong, ma_dich_vu_di_kem)
values (5, 2, 4),
       (8, 2, 5),
       (15, 2, 6),
       (1, 3, 1),
       (11, 3, 2),
       (1, 1, 3),
       (2, 1, 2),
       (2, 12, 2);
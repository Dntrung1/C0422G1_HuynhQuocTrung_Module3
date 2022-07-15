DROP DATABASE IF EXISTS sales_management;

CREATE DATABASE sales_management;

USE sales_management;

CREATE TABLE khach_hang (
    khach_hang_id INT PRIMARY KEY AUTO_INCREMENT,
    khach_hang_name VARCHAR(45),
    khach_hang_tuoi tinyint
);

CREATE TABLE hoa_don (
    ma_hoa_don INT PRIMARY KEY AUTO_INCREMENT,
    ma_khach_hang INT,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (khach_hang_id),
    ngay_mua DATE,
    tong_tien DOUBLE
);

CREATE TABLE san_pham (
    san_pham_id INT PRIMARY KEY AUTO_INCREMENT,
    ten_san_pham VARCHAR(50),
    gia_san_pham DOUBLE
);

CREATE TABLE chi_tiet_hoa_don (
    ma_hoa_don INT,
    ma_san_pham INT,
    FOREIGN KEY (ma_hoa_don)
        REFERENCES hoa_don (ma_hoa_don),
    FOREIGN KEY (ma_san_pham)
        REFERENCES san_pham (san_pham_id),
    so_luong_san_pham INT
);

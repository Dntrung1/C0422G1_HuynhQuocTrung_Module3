drop database if exists xuat_nhap_khau;

create database xuat_nhap_khau;

use xuat_nhap_khau;

CREATE TABLE phieu_xuat (
    so_px INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE
);

CREATE TABLE phieu_nhap (
    so_pn INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATE
);

CREATE TABLE vat_tu (
    ma_vtu VARCHAR(50) PRIMARY KEY,
    ten_vtu VARCHAR(50)
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_px INT,
    ma_vtu VARCHAR(50),
    PRIMARY KEY (so_px , ma_vtu),
    FOREIGN KEY (so_px)
        REFERENCES phieu_xuat (so_px),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu),
    sl_xuat INT,
    dg_xuat VARCHAR(50)
);

CREATE TABLE chi_tiet_phieu_nhap (
    so_pn INT,
    ma_vtu VARCHAR(50),
    PRIMARY KEY (so_pn , ma_vtu),
    FOREIGN KEY (so_pn)
        REFERENCES phieu_nhap (so_pn),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu),
    sl_nhap INT,
    dg_nhap VARCHAR(50)
);

CREATE TABLE nhacc (
    nhacc_id INT PRIMARY KEY AUTO_INCREMENT,
    ma_nhacc VARCHAR(50),
    ten_nhacc VARCHAR(50),
    dia_chi VARCHAR(50),
    sdt VARCHAR(50)
);

CREATE TABLE sdt (
    sdt VARCHAR(20) PRIMARY KEY,
    nhacc_id INT,
    FOREIGN KEY (nhacc_id)
        REFERENCES nhacc (nhacc_id)
);

CREATE TABLE don_dh (
    so_dh INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dh DATE,
    ma_nhacc VARCHAR(50),
    FOREIGN KEY (so_dh)
        REFERENCES nhacc (nhacc_id)
);

CREATE TABLE chi_tiet_don_hang (
    ma_vtu VARCHAR(50),
    so_dh INT,
    PRIMARY KEY (ma_vtu , so_dh),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu),
    FOREIGN KEY (so_dh)
        REFERENCES don_dh (so_dh)
);
use sales_management;

insert into khach_hang(khach_hang_name,khach_hang_tuoi)
value ("Minh Quan",10),("Ngoc Anh",20),("Hong Ha",50);

insert into hoa_don(ma_khach_hang,ngay_mua)
value (1,'2006-03-21'), (2,'2006-03-23'), (1,'2006-03-16');

insert into san_pham(ten_san_pham,gia_san_pham)
value ("May giat",3),("Tu lanh",5),("Dieu hoa",7),("Quat",1),("Bep dien",2);

insert into chi_tiet_hoa_don(ma_hoa_don,ma_san_pham,so_luong_san_pham)
value (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,2,3);

SELECT 
    h.ma_hoa_don, h.ngay_mua, h.tong_tien
FROM
    hoa_don h;

SELECT 
    kh.khach_hang_name, sp.ten_san_pham
FROM
    khach_hang kh
        JOIN
    hoa_don hd ON kh.khach_hang_id = hd.ma_khach_hang
        JOIN
    chi_tiet_hoa_don cthd ON hd.ma_hoa_don = cthd.ma_hoa_don
        JOIN
    san_pham sp ON sp.san_pham_id = cthd.ma_san_pham;


SELECT 
    kh.khach_hang_name
FROM
    khach_hang kh
        LEFT JOIN
    hoa_don hd ON kh.khach_hang_id = hd.ma_khach_hang
WHERE
    hd.ngay_mua IS NULL;

SELECT 
    hd.ma_hoa_don,
    hd.ngay_mua,
    SUM(sp.gia_san_pham * cthd.so_luong_san_pham) AS tong_tien
FROM
    hoa_don hd
        JOIN
    chi_tiet_hoa_don cthd ON hd.ma_hoa_don = cthd.ma_hoa_don
        JOIN
    san_pham sp ON sp.san_pham_id = cthd.ma_san_pham
GROUP BY hd.ma_hoa_don;

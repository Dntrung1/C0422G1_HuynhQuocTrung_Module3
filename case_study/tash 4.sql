use furama;

-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    nv.ngay_sinh,
    nv.so_cmnd,
    nv.so_dien_thoai,
    nv.email,
    nv.dia_chi,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    vt.ten_vi_tri
FROM
    nhan_vien nv
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
        JOIN
    bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
        JOIN
    vi_tri vt ON nv.ma_vi_tri = vt.ma_vi_tri
WHERE
    nv.ho_ten LIKE 'h%'
        OR nv.ho_ten LIKE 't%'
        OR nv.ho_ten LIKE 'k%'
        AND CHAR_LENGTH(nv.ho_ten) = 15; 

-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    kh.ngay_sinh,
    kh.gioi_tinh,
    kh.so_cmnd,
    kh.so_dien_thoai,
    kh.email,
    kh.dia_chi,
    lk.ten_loai_khach
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE
    TIMESTAMPDIFF(YEAR,
        kh.ngay_sinh,
        DATE(NOW())) > 18
        AND TIMESTAMPDIFF(YEAR,
        kh.ngay_sinh,
        DATE(NOW())) < 50
        AND kh.dia_chi LIKE '%đà nẵng'
        OR kh.dia_chi LIKE '%quảng trị';

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT 
    kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_hop_dong) AS so_lan_dat
FROM
    khach_hang kh
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ho_ten
ORDER BY COUNT(hd.ma_hop_dong);

-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (dv.chi_phi_thue + dvdk.gia * hdct.so_luong) AS 'Tong_tien'
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
       JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
      JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
		RIGHT JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
      JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
order by(kh.ma_khach_hang);



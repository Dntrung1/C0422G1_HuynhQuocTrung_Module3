use furama;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set SQL_SAFE_UPDATES = 0;

delete from nhan_vien nv
where nv.ma_nhan_vien not in (select hd.ma_nhan_vien
from hop_dong hd where year(hd.ngay_lam_hop_dong) between 2019 and 2021
);

set SQL_SAFE_UPDATES = 1;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

set sql_safe_updates =0;
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_loai_khach = 2
        AND ma_khach_hang IN (SELECT 
            temp.ma_khach_hang
        FROM
            (SELECT 
                kh.ma_khach_hang,
				dv.chi_phi_thue + SUM(IFNULL(hdct.so_luong * dvdk.gia, 0)) AS tong_tien
            FROM
                khach_hang kh
            RIGHT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
            LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
            LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            GROUP BY kh.ma_khach_hang
            HAVING tong_tien > 10000000) AS temp);
                
set sql_safe_updates =1;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

set SQL_SAFE_UPDATES = 0;
set foreign_key_checks =0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM
        (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
        JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        
        WHERE
            YEAR(hd.ngay_lam_hop_dong) < 2021) AS tmp);
set foreign_key_checks =1;
set SQL_SAFE_UPDATES = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

set SQL_SAFE_UPDATES = 0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            (SELECT 
                dvdk.ma_dich_vu_di_kem
            FROM
                hop_dong_chi_tiet hdct
            JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
            WHERE
                hdct.so_luong > 10
                    AND YEAR(hd.ngay_lam_hop_dong) = 2020) AS tmp);
set SQL_SAFE_UPDATES = 1;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select kh.ma_khach_hang as id,kh.ho_ten,kh.email,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi
from khach_hang kh
union all
select nv.ma_nhan_vien,nv.ho_ten,nv.email,nv.so_dien_thoai,nv.ngay_sinh,nv.dia_chi
from nhan_vien nv



use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

SELECT 
    *
FROM
    subject s
WHERE
    s.Credit = (SELECT 
            MAX(s.Credit)
        FROM
            subject s);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

SELECT 
    *
FROM
    subject s
        JOIN
    mark m ON s.SubId = m.SubId
WHERE
    m.Mark = (SELECT 
            MAX(m.Mark)
        FROM
            mark m);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần 
SELECT 
    *, AVG(m.Mark) AS diem_trug_binh
FROM
    student s
        JOIN
    mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId
ORDER BY AVG(m.Mark) DESC


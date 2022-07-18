use quan_ly_sinh_vien;

SELECT 
    *
FROM
    subject s
WHERE
    s.Credit = (SELECT 
            MAX(s.Credit)
        FROM
            subject s);

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

SELECT 
    *, AVG(m.Mark) AS diem_trug_binh
FROM
    student s
        JOIN
    mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId
ORDER BY AVG(m.Mark) DESC


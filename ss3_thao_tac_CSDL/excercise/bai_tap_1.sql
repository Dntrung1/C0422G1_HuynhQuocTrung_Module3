use quan_ly_sinh_vien;

SELECT 
    *
FROM
    student;

SELECT 
    *
FROM
    student s
WHERE
    s.studentname LIKE 'h%';

SELECT 
    *
FROM
    class
WHERE
    MONTH(StartDate) = 12;

SELECT 
    *
FROM
    subject s
WHERE
    s.credit BETWEEN 3 AND 5;

set sql_safe_updates = 0;
UPDATE student 
SET 
    classid = 1
WHERE
    studentname = 'Hung';
set sql_safe_updates = 1;

SELECT 
    s.studentname, sub.subname, m.mark
FROM
    student s
        JOIN	
    mark m ON s.classid = m.studentid
        JOIN
    subject sub ON m.subid = sub.subid
ORDER BY m.mark DESC , s.studentname;
drop database if exists idex_view_dp;

create database idex_view_dp;

use idex_view_dp;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productCode INT,
    productName VARCHAR(45),
    productPrice DOUBLE,
    productAmount INT,
    productDescription VARCHAR(100),
    productStatus VARCHAR(45)
);

insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value (1,'bánh',5000,10,'a','b'),
(2,'keo',3000,20,'c','d'),
(3,'sữa',10000,30,'e','f');

-- 3.1 Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

create unique index index_products
on products(productCode);

-- xóa index

drop index index_products on products;

-- 3.2 Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

create index com_index
on products(productName,productPrice);

-- xóa index 

drop index com_index on products;


-- 3.3 Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào

explain select * from products;

-- 4.1 Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view p_view as
select p.productCode,p.productName,p.productPrice,p.productStatus
from products p;

-- truy xuất view

select *
from p_view;

-- 4.2 Tiến hành sửa đổi view

-- thêm vào bảng view

insert into p_view(productCode,productName,productPrice,productStatus) values (4,'kem',1000,'g');

-- xóa sản phẩm trong bảng view

set SQL_SAFE_UPDATES = 0;
DELETE FROM p_view 
WHERE
    productCode = 4;
set SQL_SAFE_UPDATES = 1;

-- Cập nhât cho bảng view 

set SQL_SAFE_UPDATES = 0;
update p_view
set productName = 'nước ngọt'
where productCode = 1;
set SQL_SAFE_UPDATES = 1;

-- 4.3 xóa view 
drop view p_view;

-- 5.1 Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter $$
create procedure display_products()
begin 
	select*
	from products;
end $$
delimiter ;

call display_products();

-- 5.2 Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure add_products (new_productCode int,new_productName varchar(45),new_productPrice double,new_productAmount int, new_productDescription varchar(100), new_productStatus varchar(45))
begin
	insert into products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
    value (new_productCode,new_productName,new_productPrice,new_productAmount,new_productDescription,new_productStatus);
end //
delimiter ;

call add_products(6,'t',5000,2,'r','u');
    
--  5.3 Tạo store procedure sửa thông tin sản phẩm theo id 
delimiter //
create procedure edit_products (find_id int, new_price double)
begin
	update products 
    set productPrice = new_price
    where id = find_id;
end //
delimiter ;

call edit_products (2,5);

-- 5.4 Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure delete_products (find_id int)
begin
	delete from products
    where id = find_id;
end //
delimiter ;

call delete_products(3);

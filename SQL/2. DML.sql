show databases;
use campusx;
show tables;
create table users(
	id int primary key,
    name varchar(255),
    email varchar(255) unique,
    password varchar(255) not null
);

insert into users values
    (1,"Ayush","ayush@gmail.com","1221"),
    (2,"Joshi","joshi@gmail.com","11111"),
    (3,"Maksood","maksood@gmail.com","12221"),
    (4,"Ankit","hacker@gmail.com","2222");

select * from users;






select * from smartphones;

select model,price,rating from smartphones;

-- aliasing
select model as "Phone_Name",price as "Pricing",rating as "UserRating" from smartphones;

-- calculating PPI (pixel per index)
select  model, sqrt((resolution_width*resolution_width) + (resolution_height*resolution_height))/screen_size as "PPI" from smartphones;

select model as "Phone_Name",rating/10 as "UserRating" from smartphones;

select model , "SmartPhone" as "Type_Of_Phone" from smartphones;

select distinct(brand_nam e) as "Unique_Brands" from smartphones;

select distinct(processor_brand) as "Unique_Processor" from smartphones;

select distinct(os) as "Unique_OS" from smartphones;

-- gives unique combinations of multiple columns
select distinct brand_name, processor_brand from smartphones;







-- WHERE clause filters rows

select  * from smartphones where brand_name = "Samsung";

select  * from smartphones where price>20000 and price<50000;

select  * from smartphones where price between 20000 and 50000;

select  * from smartphones where rating>80 and price<20000 and processor_brand="Snapdragon";


select distinct(brand_name) from smartphones where price>50000;

select * from smartphones where brand_name in  ("samsung","iphone");

select * from smartphones where brand_name not in  ("samsung","iphone");

set sql_safe_updates=0;

update smartphones
set processor_brand="Dimensity"
where processor_brand="Mediatek";

select * from users;

-- update specific rows
update users
set email="bdkt@gmail.com", password="4444"
where name="Ayush";


-- alter changes rows 
-- update changes rows


-- deleting rows on a specific condition
delete from smartphones where price>200000;




-- TYPES OF FUNCTIONS = BUILT-IN and USER-DEFINED
-- BUILT IN FUNCTIONS IN SQL = SCALAR AND AGGREGATE
-- SCALAR FUNCTIONS = APPLIES ON EACH VALUE OF COLUMN = abs,round,ceil,floor
-- AGGEREGATE FUNCTIONS = APPLIES ON THE WHOLE COLUMN = max,min,count,avg,sum
select * from smartphones;

select max(price) from smartphones;
select min(price) from smartphones;

select avg(rating) from smartphones where brand_name="Apple";

select sum(price) from smartphones;

-- count(*) = it counts the number of rows
select count(*) as "Apple Phones" from smartphones where brand_name="Apple";

select count(distinct(brand_name)) as "Brand Count" from smartphones;



-- SCALAR FUNCTIONS
select abs(10000-price) as "Temp" from smartphones;

select round(rating/10) as "AvgRating" from smartphones;

select ceil(4.9);
select floor(4.9);

select ceil(screen_size) from smartphones;
select floor(screen_size) from smartphones;



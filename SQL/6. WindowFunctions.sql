show databases;
use campusx;
show tables;

create table StudentData(
	id int,
    name varchar(255),
    branch varchar(255),
    marks int
);


insert into StudentData values
	(1,"Ayush","CSE",98),
    (2,"Joshi","ECE",88),
    (3,"Ankit","ECE",78),
    (4,"Maksood","CSE",88);
    
    
    
    
    
select avg(marks) from StudentData;

-- OVER operates on each row

-- each row of table
select *,avg(marks) over() from StudentData;

-- partition by = group by (aggregate functions works same here)
select *,avg(marks) over(partition by branch) from StudentData;

select *,min(marks) over(),
max(marks) over (),
min(marks) over (partition by branch),
max(marks) over (partition by branch) 
from StudentData;


-- find names of students who have marks > avgMarks in their branch
select *,avg(marks) over(partition by branch) as "AvgMarks" 
from StudentData
where marks>AvgMarks;

select *,rank() over(order by marks desc) from StudentData;











    
    
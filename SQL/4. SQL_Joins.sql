-- joins are used to combine information from two tables based on a common coolumn in both tables.
-- combines two tables to get the required information
 create database campusx_2;
 use campusx_2;
 
select * from users; 
select  * from campusx_2.groups;
select * from membership;

-- cross join means all conbinations
select * from users t1
cross join campusx_2.groups t2;

-- inner join means commom elements from both tables (default join is inner join)
-- "on" is the condition
select * from membership t1
inner join  users t2
on  t1.user_id=t2.user_id;

-- left join
select * from membership t1
left join  users t2
on  t1.user_id=t2.user_id;

-- right join
select * from membership t1
left join  users t2
on  t1.user_id=t2.user_id;

-- outer join (full outer join)
-- SQL cannot perforn full outer join (so we need some jugad like set operations)
select * from membership t1
outer join  users t2
on  t1.user_id=t2.user_id;











-- SET OPERATIONS = UNION, UNION ALL, INTERSECT, EXCEPT (MINUS)

select * from person1;
select * from person2;


select * from person1
union
select * from person2;

select * from person1
union all
select * from person2;

select * from person1
intersect
select * from person2;

select * from person1
except
select * from person2;


-- HOW to do full outer join using setOperation
# full outer join = leftJoin + rightJoin + UNION
select * from membership t1
left join  users t2
on  t1.user_id=t2.user_id
union
select * from membership t1
right join  users t2
on  t1.user_id=t2.user_id;


-- SELF JOIN
select * from users1 t1
join users1 t2
on t1.emergency_contact=t2.user_id;


-- JOINS on more than one column condition
select * from students t1
join class t2
on t1.class_id=t2.class_id and t1.enrollment_year=t2.class_year;


-- JOINS on more than 2 tables
select * from order_details t1
join orders t2
on t1.order_id=t2.order_id
join users t3
on t3.user_id=t2.user_id;


select t1.order_id, t1.amount, t1.profit, t3.name from order_details t1
join orders t2
on t1.order_id=t2.order_id
join users t3
on t3.user_id=t2.user_id;


select * from orders t1
join users t2
on t1.user_id=t2.user_id
where t2.city="Pune";
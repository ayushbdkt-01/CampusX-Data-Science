show databases;
use campusx;
show tables;

-- creating table
create table users(
	id int primary key,
    uname varchar(255),
    email varchar(255),
    password varchar(255)
);

-- deletes all rows from the table.
truncate table users;

-- deletes the table
drop table if exists users;







-- CONSTRAINS
create table users(
	id int not null,
    uname varchar(255) not null,
    email varchar(255),
    password varchar(255)
);


create table users(
	id int not null,
    uname varchar(255) not null,
    email varchar(255) not null unique,
    password varchar(255)
);

create table users(
	id int not null,
    uname varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    constraint myConstraint unique (id,email)
);


create table users(
	id int not null primary key,
    uname varchar(255) not null,
    email varchar(255),
    password varchar(255)
);


create table users(
	id int not null,
    uname varchar(255) not null,
    email varchar(255),
    password varchar(255),
    constraint myPrimaryKey primary key(id)
);


-- primary key constraint automatically adds notNull and unique constraint
create table users(
	id int primary key auto_increment,
    uname varchar(255) not null,
    email varchar(255),
    password varchar(255)
);

-- check adds condition to the variable values
create table student(
	id int primary key,
    sname varchar(255),
    age int check (age>6 and age<25),
    constraint checkAge check (age>6 and age<25)
);

drop table student;

create table ticket(
	id int primary key,
    usname varchar(255) not null,
    travelDate datetime default current_timestamp
);

drop table ticket;




-- FOREIGN KEY = when pk of one table is present in another table as a column.
create table customers(
	cid int primary key auto_increment,
    cname varchar(255),
    email varchar(255) unique
);

create table orders(
	oid int primary key auto_increment,
    cid integer,
    orderDate datetime not null default current_timestamp,
    constraint myForeignKey foreign key (cid) references customers(cid)
);

drop table student;







-- REFRENTIAL ACTIONS = how the child table will be changed when we try to modify and update the parent table.
-- RESTRICT mode = cannot deletes the entries from the parent table
-- CASCADE mode = updates and deletion any data on child table as we change in parent table.
-- SET NULL = sets all values of the child parent as NULL when something in the parent table is deleted or updated.
-- SET DEFAULT = sets default values in child table 

create table orders(
	oid int primary key auto_increment,
    cid integer,
    orderDate datetime not null default current_timestamp,
    constraint myForeignKey foreign key (cid) references customers(cid)
    on delete cascade
    on update cascade
);

create table orders(
	oid int primary key auto_increment,
    cid integer,
    orderDate datetime not null default current_timestamp,
    constraint myForeignKey foreign key (cid) references customers(cid)
    on delete set null
    on update set null
);




-- ALTER = modifies table = addColumn, deleteColumn, modifyColumn.

-- adds new column at rightMost of column
alter table student add column CGPA decimal not null default 7.5;
select * from student;

-- adds new column at specific position
alter table student add column CGPA decimal not null default 7.5 after sname;
select * from student;

-- adding multiple columns
alter table student 
add column depId int not null default 1,
add column salary int not null default 7000 after sname;
select * from student;


-- deleting single column
alter table student drop column CGPA;
select * from student;

-- deleting multiple columns
alter table student
drop column salary,
drop column depId;
select * from student;

-- modifying existing column
alter table student modify column sname int not null;

-- adding constraint using ALTER
alter table student add constraint myAgeConstraint check (age>6);

-- modifying constraint = cannot modify constraint.= first delete the oldConstraint and then add new constraint
alter table student drop constraint myAgeConstraint;
alter table student add constraint myAgeConstraint check (age>6);

-- renaming constraint = cannot rename constraint.


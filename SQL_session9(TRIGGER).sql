create database triggerDemo;

use triggerDemo;

create table emp(
emp_id int primary key auto_increment,
name varchar(100),
department varchar(50)
);

create table emp_log(
log_id int primary key auto_increment,
emp_id int,
message text,
created_at timestamp default current_timestamp
);

DELIMITER //
create trigger after_insert_trigger
after insert on emp
for each row
begin
insert into emp_log(emp_id,message)
values(new.emp_id,
concat('New employee',new.name,'added to',new.department));
end
// DELIMITER ;

select * from emp;

select * from emp_log;

insert into emp (name,department) values('john','HR');

-- Example 2

create table student(
name varchar(50),
age int ,
score int
);

DELIMITER //
create trigger set_score
before insert on student
for each row
begin
if new.score<0 then
set new.score=0;
end if;
end
// DELIMITER ;

insert into student values
('prashant',21,50),
('Disha',19,-10),
('Nisha',17,-20),
('Ashu',22,60);

select * from student;

-- create a table id,name and position insert data in this
-- and create second table
-- with data id,name ,position and deleted time
-- create trigger before delete

create table employee
(id int,
name varchar(100),
position varchar(100));

insert into employee values
(1,'john','Account'),
(2,'smith','team leader'),
(3,'rocky','developer'),
(4,'jane','data analyst');
select * from employee;

create table delete_emp
(
id int,
name varchar(100),
position varchar(100),
deleted_at timestamp default current_timestamp
);

DELIMITER $$
create trigger deleted_employee
before delete on employee
for each row
begin
insert into delete_emp(id,name,position)
values(old.id,old.name,old.position);
end
$$ DELIMITER ;

select * from delete_emp;

delete from employee
where id=2;


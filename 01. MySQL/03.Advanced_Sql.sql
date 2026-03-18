-- Advanced MySql 
-----------------

-- CTEs => Commen Table Exceprtion 
----------------------------------

with CTE_Example as 
(
select gender , avg(salary) as average ,
 max(salary) as max_salary , min(salary) as min_salary , 
 count(salary) as count_salary
from employee_demographics dem 
join employee_salary sal 
on dem.employee_id = sal.employee_id 
group by gender
)  
select * 
from  CTE_Example ; 

-------------------
-- default prameters 
--------------------
with CTE_Example  (Gender , Average , MaxSal , MinSal , CountSal) as
(
select gender , avg(salary) as average ,
 max(salary) as max_salary , min(salary) as min_salary , 
 count(salary) as count_salary
from employee_demographics dem 
join employee_salary sal 
on dem.employee_id = sal.employee_id 
group by gender
)  
select * 
from  CTE_Example ; 
-------------------
select dem.gender , dem.employee_id , sal.salary ,
avg(salary) over( partition by gender ) , 
max(salary) over( partition by gender) , 
min(salary) over( partition by gender) , 
count(salary) over( partition by gender) 
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id ; 

------------------
select * 
from employee_demographics 
where gender is null ; 

-------
select * 
from employee_salary ; 

-----------------------------
-- Leson 2 <= Tempraroy table 
-----------------------------
create temporary table temp_table ( 
fisrt_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
); 

select * from temp_table; 

insert into temp_table ()
values('Alex' , 'Freberg' , 'Lord of the Rings: The Two Towes' );

select * from temp_table; 


select * 
from employee_salary;

create temporary table salary_over_50k
select * 
from employee_salary
where salary >= 50000; 

select * 
from salary_over_50k; 


---------------------------------
-- Lesson 3 =>  Stored Procedures 
---------------------------------

create procedure large_salaries()
select * 
from employee_salary 
where salary >= 50000; 

call large_salaries(); 
----------------------
DELIMITER  $$ 
create procedure large_salaries2()
begin
select * 
from employee_salary 
where salary >= 50000;
select *
from employee_salary
where salary >= 100000; 
end $$  
delimiter ; 

call large_salaries2();

----------------------
delimiter $$
create procedure  large_salaries3 (emp_id int)
begin 
select * 
from employee_salary 
where employee_id = emp_id
;
end $$
delimiter 

call large_salaries3(1);

---------------------------------
-- Lesson 4 => Triggers an Evets  
---------------------------------
delimiter $$
create trigger employee_insert
after insert on employee_salary 
for each row 
begin
insert into employee_demographics(employee_id ,first_name,last_name)
values(new.employee_id,new.first_name,new.last_name);
end $$
delimiter 

insert into employee_salary(employee_id , first_name, last_name)
values (115, 'Esraa' , 'Eltehawy'); 
 
 select * 
 from employee_demographics; 
 
 
 ---------- 
 -- Events 
 ----------

 select * 
 from employee_demographics ; 
 -----------------------------
 delimiter $$
 create event delet_retirees2 
on  schedule every 30 second 
do 
begin 
delete 
 from employee_demographics 
 where age >= 45 ;
end $$
delimiter ;

-- -------------------

show variables like 'event%'; 
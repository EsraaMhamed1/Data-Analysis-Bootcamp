-- Stored Procedures
--------------------

select * 
from employee_salary
where salary >= 50000; 

-- create procdure
------------------
create procedure large_salaries()
select * 
from employee_salary
where salary >= 50000; 

-- call procedure
-----------------
call large_salaries();


-- Best practice 
----------------
delimiter $$
create procedure large_salaries3()
begin
select * 
from employee_salary
where salary >= 50000;
select * 
from employee_salary 
where salary >= 10000;
end $$
delimiter ; 

call large_salaries3();

delimiter $$
create procedure large_salaries4(huggymuffin int)
begin
select salary 
from employee_salary
where employee_id = huggymuffin
;
end $$
delimiter $$

call large_salaries4(1);


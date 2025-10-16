-- Joins
--------

select  * 
from employee_demographics ;

select * 
from employee_salary;

------------------------------------
-- inner join || only matching cols 
------------------------------------

select * 
from employee_demographics d
inner join employee_salary s
on d.employee_id = s.employee_id;


----------------------------------- 
-- self join 
-----------------------------------

select * 
from employee_salary emp1 
join employee_salary emp2 
on emp1.employee_id + 1 = emp2.employee_id ; 

---- 
select * 
from employee_demographics as dem 
inner join employee_salary as sal 
on dem.employee_id = sal.employee_id 
inner join parks_departments pd
on sal.dept_id = pd.department_id;  

select * 
from parks_departments ; 





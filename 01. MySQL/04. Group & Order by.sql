-- Group by 
-----------

select * from employee_demographics ; 
-------------------------------------

select 
 gender , avg(age) as avg_age ,
 max(age) as max_age , 
 min(age) as min_age,
 count(age) count_age
from employee_demographics 
group by gender ; 
-----------------

select occupation , salary
from employee_salary 
group by occupation , salary ; 
------------------------------

-- Order by 
-----------

select *
 from employee_demographics
-- order by first_name desc; 
order by gender , age desc;
--------------------------

-- order by col position 
------------------------

select * 
from employee_demographics
order by 5 ; -- || gender colmun
--------------------------------


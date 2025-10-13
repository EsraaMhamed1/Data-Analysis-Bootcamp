select  first_name ,
age, 
(age + 10 ) * 2 
from  employee_demographics; 

select distinct gender 
from employee_demographics; 

-- verey important reaction (distinct 2 cols ) 
select distinct gender , first_name 
from employee_demographics ; 

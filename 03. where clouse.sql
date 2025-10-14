-- where clouse 
select * 
from employee_salary
where salary > 50000 ; 

-- and or not logical operators 

select * 
from employee_demographics
where gender != 'male';

select * 
from employee_demographics
where gender = 'male' 
and birth_date > '1985-01-01' ;

select * 
from employee_demographics
where (first_name = 'Leslie' and age = 44 ) or age > 55 ; 

-- Like  statement 
-- % any thing  and _ specific value  
select * 
from employee_demographics 
-- where first_name like 'jer%' ;  -- || start with jer 
-- where first_name like '%er%' ;  -- || contain er every where 
-- where first_name like 'a%' ;    -- || start with a charcter 
-- where first_name like 'a__' ;      -- || start with a and after a there is  2 charcters 
where first_name like 'a__%' ;      -- || start with a and after a there is  2 charcters more.. 

select * 
from employee_demographics 
where birth_date like '1985%';


 

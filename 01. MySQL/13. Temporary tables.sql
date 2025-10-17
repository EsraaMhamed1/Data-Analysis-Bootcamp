-- Temporary Tables 
-------------------

create temporary table temp_table 
( first_name varchar(50),
last_name varchar(50),
fav_movie varchar(100)
);

select * 
from temp_table;

-- insert data 
---------------
insert into temp_table
values('Esraa' , 'Mohamed' , 'Heart of stone' );

select * 
from temp_table;

-- crate table from another table exist 
----------------------------------------
create temporary table salary_over_50k 
select * 
from employee_salary
where salary >= 50000;

select * 
from salary_over_50k;

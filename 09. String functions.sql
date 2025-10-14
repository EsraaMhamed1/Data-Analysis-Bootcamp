-- string functions 
-------------------

-- length()
-----------
select length('Esraa') as Esraa;

select first_name , length(first_name)
from employee_demographics 
order by 2; -- || col number 2 

-- upper()
----------
select upper('sara');

-- lower()
----------
select lower('ESRAA');


-- trim()
---------
select trim('    esraa mohamed   ');

-- left()
---------
select first_name , left(first_name ,4) 
from employee_demographics ;

-- Right( , )
---------
select first_name ,
 right(first_name, 4)  as f_name_4
from employee_demographics ;


-- Substring( , , )
--------------
select first_name ,
 left(first_name ,4) ,
 right(first_name, 4) , 
substring(first_name,2,2),
birth_date,
substring(birth_date, 6,2) as birth_month
from employee_demographics ;


-- Replace( str , , )
---------------------

select first_name , replace(first_name , 'a', 'z')
from employee_demographics;


-- locate( , )
--------------
select locate('x' ,'Alexander') ; 

select first_name , locate('An' , first_name)
from employee_demographics; 

-- concat()
-----------
select first_name , last_name ,
concat(first_name , '  ' , last_name) as full_name
from employee_demographics








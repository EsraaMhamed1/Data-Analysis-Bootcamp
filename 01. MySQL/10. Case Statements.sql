-- Case Statements 
------------------

select  first_name , 
last_name,
case 
when age <= 30 then  'Young' 
when age between 31 and 50 then 'Old'
when age >= 50 then 'Retired'
end  as Age_Barcket
from employee_demographics; 

 -- pay increase and bouns
 -- < 50000 = 5%
 -- > 50000 = 7%
 -- finance = 10% bouns
 ----------------------
 select first_name, last_name , salary ,
 case 
 when salary < 50000 then salary * 1.05
 when salary > 50000 then salary * 1.07
 end  as New_salary ,
 case 
 when dept_id = 6 then  salary *.10 
 end as Bouns
 from employee_salary; 
 
 
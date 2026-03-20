-- Data Cleaning with MySql
---------------------------

select * from layoffs ; 

-- 1. Remove Dublicates 
-- 2. Standarized the Data 
-- 3. Null values or blank values 
-- 4. Remove any columns 


create table layoffs_staging
like layoffs ; 

insert layoffs_staging 
select * 
from layoffs ; 
 
select * from layoffs_staging;
------------------------------

-- to kow dublicate roww (if have the sam number ) 
--------------------------------------------------
select * ,
row_number() over(partition by company,industry, 
total_laid_off, percentage_laid_off, `date` ) as rn
from  layoffs_staging;


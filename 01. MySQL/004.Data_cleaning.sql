-- Data Cleaning with MySql
---------------------------

select * from layoffs ; 

-- 1. Remove Dublicates 
-- 2. Standarized the Data 
-- 3. Null values or blank values 
-- 4. Remove any columns 

------------------------
-- 1. Remove Dublicates 
------------------------

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

with duplicate_cte as 
(
select * ,
row_number() over(partition by company,industry, 
total_laid_off, percentage_laid_off, `date`, stage, 
country,funds_raised_millions ) as rn
from  layoffs_staging
)
select  * 
from duplicate_cte 
where rn > 1 ; 
-------------- 
-- test to show ; 
select* 
from layoffs_staging 
where company = 'Casper'; 
-------------------------

with duplicate_cte as 
(
select * ,
row_number() over(partition by company,industry, 
total_laid_off, percentage_laid_off, `date`, stage, 
country,funds_raised_millions ) as rn
from  layoffs_staging
)
delete  
from duplicate_cte 
where rn > 1 ; 

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL ,
  `rn` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select  * 
from layoffs_staging2 ;
 
 
 insert into layoffs_staging2 
 select * , 
row_number() over(partition by company,location,industry, 
total_laid_off, percentage_laid_off, `date`, stage, 
country,funds_raised_millions ) as rn 
from  layoffs_staging ;  
 
 -- cuse I'm in save mood 
SET SQL_SAFE_UPDATES = 0;
delete
from layoffs_staging2 
where rn > 1 ;
SET SQL_SAFE_UPDATES = 1;

select * 
from layoffs_staging2 
where rn > 1 ;

------------------------------
 

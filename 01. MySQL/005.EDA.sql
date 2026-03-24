
-- Exploraty Data Analysis 
---------------------------

select *
from layoffs_staging2; 

select max(total_laid_off) , max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

select company, sum(total_laid_off)
from layoffs_staging2 
group by company
order by 2 desc;


select min(`date`), max(`date`)
from layoffs_staging2 ; 


select Industry, sum(total_laid_off)
from layoffs_staging2 
group by Industry
order by 2 desc;


select * 
from layoffs_staging2 ; 


select YEAR(`date`), sum(total_laid_off)
from layoffs_staging2 
group by year(`date`)
order by 1 desc;


select stage, sum(total_laid_off)
from layoffs_staging2 
group by stage
order by 1 desc;


select substring(`date`,1,7) as 'Month' , sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not NULL 
group by Month
order by Month; 


select month(`date`) as 'Month'
from layoffs_staging2;


select * 
from layoffs_staging2 ; 


with Rolling_Total as 
(
select substring(`date`,1,7) as 'Month' ,
 sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not NULL 
group by Month
order by 1 asc
)
select `Month`, total_off,
sum(total_off) over(order by 'Month') as Rolling_Total
from Rolling_Total ; 







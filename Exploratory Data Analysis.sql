-- Exploratory Data Analysis --

# We Explore the cleaned data without any particular agenda
# We start with the basics and move up to advanced stuff
# We will be working on total laid off and percetage laid off quit a bit
# Primary challenge-No info of total employees, so looking into percenatge laid off is futile

select*
from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;  # Percentage_laid_off = 1 means 100%

select*
from layoffs_staging2
where percentage_laid_off = 1;  # Companies that laid off 100% employees

select*
from layoffs_staging2
where percentage_laid_off = 1
Order by funds_raised_millions desc; # Companies with the largest fundings

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc; # Total laid off per company. 2 is for 2nd column

select min(`date`), max(`date`)
from layoffs_staging2;  # To check date range

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;  # Checking which industry was hit the hardest


select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;  #Checking which country was hit the hardest


select `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 1 desc;  # Total Layoffs via date descending


select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;  # Total Layoffs via year


select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;  # Total Layoffs via stage


select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc;  # Total laid off per month

with Rolling_Total as
(select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc)
select `month` , total_off
, sum(total_off) over(order by `month`) as rolling_total
from Rolling_Total;   # Rolling Total laid off over each month


select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

with Company_year(company, years, total_laid_off) as 
(select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`))
select*, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from Company_year
where years is not null; # This gives us the companies with highest lay offs per year ascending

# If we need to rank it highest to lowest based of every year

with Company_year(company, years, total_laid_off) as 
(select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`))
select*, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from Company_year
where years is not null
order by ranking asc; # We just add an order by to the dense rank i.e., ranking

# IF we need to look at top 5 company lay offs year by year

with Company_year(company, years, total_laid_off) as 
(select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)), 
company_yearly_rank as  # Creating another CTE
(select*, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from Company_year
where years is not null)
select*
from company_yearly_rank
where ranking <= 5;

# This can be also done for industry

with Industry_year(industry, years, total_laid_off) as 
(select industry, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by industry, year(`date`)), 
industry_yearly_rank as  # Creating another CTE
(select*, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from Industry_year
where years is not null)
select*
from industry_yearly_rank
where ranking <= 5;

-- End of Exploratory Data Analysis --




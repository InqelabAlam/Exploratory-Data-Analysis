# Checking which industry was hit the hardest

select min(`date`), max(`date`)
from layoffs_staging2;  # To check date range

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;
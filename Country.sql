#Checking which country was hit the hardest

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;  
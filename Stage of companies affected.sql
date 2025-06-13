# Stage of companies affected
with Stage_year(stage, years, total_laid_off) as 
(select stage, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by stage, year(`date`)), 
stage_yearly_rank as  # Creating another CTE
(select*, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from Stage_year
where years is not null)
select*
from stage_yearly_rank
where ranking <= 5;
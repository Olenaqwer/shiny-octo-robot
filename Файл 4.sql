select *
from salaries s 
limit 10
;

--Порахувати кількість працівників у таблиці, які у 2023 році працюють на компанії розміром «М» та oтримують з/п вищу за $100 000
--Спосіб 1
select COUNT(*)
from salaries
where year = 2023 and company_size = 'M'
  and salary_in_usd > 100000
;
--Спосіб 2
with CTE as (
select *,
case when salary_in_usd>100000 then '1' else NULL
       end as salary_category     
from salaries s 
where year=2023 and company_size ='M'
)
select count(salary_category) 
from CTE
;

--Вивести всіх співробітників, які у 2023 році отримали з/п більше за $300тис.
select *
from salaries
where year = 2023 and salary_in_usd > 300000
;

--Вивісті всіх співробітників, які у 2023 році отримали з/п більше за $300тис. та не працював у великих компаніях
select *
from salaries
where year = 2023 and salary_in_usd > 300000
     and company_size !='L'
;

--Чи є співробітники, які працюють в Українській компанії повністю віддалено?
select *
from salaries
where company_location='UA' and remote_ratio=100
;

--Вісті всіх співробітників, які в 2023 році працювали в Німеччині (comp_location = 'DE') отримували з/п більше за $100тис.
select *
from salaries
where company_location='DE' and salary_in_usd > 100000
;

-- Доопрацювати попередній запит: Вивести з результатів тільки ТОП 5 співробітників за рівнем з/п
select *
from salaries
where company_location='DE' and salary_in_usd > 100000
order by salary_in_usd desc 
limit 5
;
-- Додати в попередню таблицю окрім спеціалістів з Німеччини спеціалістів з Канади (CA)
select *
from salaries
where company_location in ('DE', 'CA') and salary_in_usd > 100000
order by salary_in_usd desc 
limit 5
;

--Надати перелік країн, у яких у 2021 році спеціалісти «ML Engineer» та «Data Scientist» отримують з/п в рамках між $50тис і $100тис.
select company_location
from salaries
where year = 2021 and job_title in ('ML Engineer', 'Data Scientist') and salary_in_usd between 50000 and 100000
;

--Порахувати кількість спеціалістів, які працюють у середніх компаніях (comp_size = M) та у великих компаніях (comp_size = L) віддалено (remote_ratio=100 або remote_ratio=50)
select COUNT(*) as specialists_count
from salaries
where  company_size in ('M', 'L') and remote_ratio in (100, 50)
;

--Виведіть кількість країн, які починаються на "С"
select COUNT(*) as country_count
from salaries
where  company_location like 'C%' 
;

-- Вивести професії, назва яких не складається з трьох слів
select job_title
from salaries
where LENGTH(job_title) - LENGTH(REPLACE(job_title, ' ', '')) + 1 <> 3
;

--Для кожного року наведіть дані щодо середньої заробітної плати та спеціалістів. 
select year,
       round (AVG (salary_in_usd), 2) as average_salary,
       COUNT(*) as number_of_specialists
from salaries
group by 1
order by 1
;


select *
from salarys
limit 10
;

--Згенерувати файл .csv із таблицею даних усіх спеціалістів, які у 2023 році мали з/п більше за $100 000 і працювали в компаніях середнього розміру (comp_size = 'M')
select job_title,
	   year,
	   comp_size,
	   salary_in_usd
from salarys
where year=2023 and comp_size = 'M'
group by 1, 2, 3, 4
having salary_in_usd>100000
;

--Виведіть кількість унікальних значень для кожної колонки, що містить текстові значення.
select COUNT (Distinct job_title) as count_job_title,
	   COUNT (Distinct exp_level)as count_exp_level,
	   COUNT (Distinct emp_type)as count_emp_type,
	   COUNT (Distinct comp_size) as count_comp_size
from salarys
;

--Виведіть унікальні значення для кожної колонки, що містить текстові значення. 
select Distinct job_title as uniq_job_title,
                exp_level as uniq_exp_level,
	            emp_type as uniq_emp_type,
	            comp_size as uniq_comp_size
from salarys
;

--Вивести середню, мінімальну та максимальну з/п (salary_in_usd) для кожного року. 
select 
	   year,
	   round (AVG (salary_in_usd),2) as average_salary,
	   MAX (salary_in_usd) as max_salary,
	   MIN (salary_in_usd) as min_salary
from salarys
group by 1
;

--Вивести середню з/п (salary_in_usd) на 2023 рік за кожною рівнем досвіду працівників (окремими запитами, у кожному з яких впроваджено фільтр року та досвіду).
select 
     (select round(AVG(salary_in_usd), 2) 
      from salarys
      where year = 2023 and exp_level='EX'
      group by exp_level)as average_salary_EX,
	  
     (select round(AVG(salary_in_usd), 2) 
      from salarys
      where year = 2023 and exp_level='MI'
      group by exp_level)as average_salary_MI,
	  
     (select round(AVG(salary_in_usd), 2) 
      from salarys
      where year = 2023 and exp_level='EN'
      group by exp_level)as average_salary_EN,
	  
     (select round(AVG(salary_in_usd), 2) 
      from salarys
      where year = 2023 and exp_level='SE'
      group by exp_level)as average_salary_SE
;
--Спосіб №2
select
      round(AVG(case when exp_level='EX' then salary_in_usd end), 2) as average_salary_EX,
	  round(AVG(case when exp_level='MI' then salary_in_usd end), 2) as average_salary_MI,
	  round(AVG(case when exp_level='EN' then salary_in_usd end), 2) as average_salary_EN,
	  round(AVG(case when exp_level='SE' then salary_in_usd end), 2) as average_salary_SE
from salarys
where year = 2023 
;
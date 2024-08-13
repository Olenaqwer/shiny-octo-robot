select *
from salaries s 
--Вивести 5 найвищих заробітних плат у 2023 році для представників спеціальності ML Engineer. Заробітні плати перевести в гривні
select year, --Спосіб 1
       job_title,
       salary_in_usd,
       salary_in_usd*40.5 as salary_in_hrn     
from salaries
where year=2023 and job_title='Machine Learning Engineer'
order by salary_in_usd desc 
limit 5
;

select year, --Спосіб 2
       job_title,
       salary_in_usd,
       case when job_title='Machine Learning Engineer' then salary_in_usd*40.5 end as salary_in_hrn     
from salaries
where year=2023 and job_title='Machine Learning Engineer'
order by salary_in_usd desc 
limit 5;

--Вивести Унікальні значення колонки remote_ratio, формат даних має бути дробовим з двома знаками після коми, приклад: значення 50 має відображатися у форматі 0.50
select
       DISTINCT round(remote_ratio / 100.0, 2) as formatted_remote_ratio
from salaries
;

--Перегляньте дані таблиці, додавши колонку 'exp_level_full' з повною назвою рівнів досвіду працівників відповідно до колонки exp_level. Визначення: Entry-level (EN), Mid-level (MI), Senior-level (SE), Executive-level (EX)
select *,
       case when exp_level='EN' then 'Entry-level'
            when exp_level='MI' then 'Mid-level'
            when exp_level='SE' then 'Senior-level'
            when exp_level='EX' then 'Executive-level'
       end as exp_level_full     
from salaries 
;

--Додаткова колонка "salary_category", яка буде відображати різні категорії заробітних плат відповідно до їх значення в колонці "salary_in_usd". 
--Значення Ви: з/п менша за 20 000 - Категорія 1, з/п менша за 50 000 - Категорія 2, з/ п менша за 100 000 - Категорія 3, з/п більша за 100 000 - Категорія 4
select *,
       case when salary_in_usd<20000 then 'Категорія 1'
            when salary_in_usd<50000 then 'Категорія 2'
            when salary_in_usd<100000 then 'Категорія 3'
            when salary_in_usd>100000 then 'Категорія 4'
       end as salary_category     
from salaries 
;

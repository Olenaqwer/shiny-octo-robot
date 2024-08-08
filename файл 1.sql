select *
from salarys
limit 10;

--Вивести з/п спеціалістів ML Engineer у 2023 році
select 
	year,     
       job_title,
       salary
from salarys
where year=2023 and job_title='ML Engineer'
;

--Назва країни (comp_location), в якій зафіксована найменша з/п спеціаліста у сфері Data Scientist у 2023 році
select 
	year, 
	comp_location,
    job_title,
    salary
from salarys
where year=2023 and job_title='Data Scientist'
order by salary
limit 1	
;

--Вивести з/п українців (код країни UA), додати сортування за зростанням з/п
select 
	comp_location,
    job_title,
    salary
from salarys
where comp_location='UA'
order by salary	
;

--Вивести топ 5 з/п усіх серед спеціалістів, які працюють повністю віддалено (remote_ratio = 100)
select 
    job_title,
    remote_ratio,
	salary
from salarys
where remote_ratio=100
order by salary DESC
limit 5		
;
       
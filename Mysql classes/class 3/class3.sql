select count(distinct(job)) from emp; 

select count(distinct(job)) as distinct_count from emp;

select * from emp;
select * from emp where hiredate <  "1981-01-01";
select * from emp where year(hiredate) < 1981;

select * from emp where year(hiredate) = 1981 and  month(hiredate) = 02;
select * from emp where year(hiredate) = 1981 and  month(hiredate) = 02;

select * , (salary/30) as daily_salary ,(salary*12) as annual_salary from emp order by annual_salary asc limit 5;

select * , (salary/30) as daily_salary ,(salary*12) as annual_salary from emp order by annual_salary desc limit 5;

alter table emp add daily_salary int generated always as (salary/30);
alter table emp add annual_salary_package dec(10,2) generated always as (salary*12);
select * from emp order by annual_salary_package  desc limit 5;
select empno,ename,job,hiredate from emp where manager_id=7698;

select hiredate,year(now())-year(hiredate) as experience from emp;
select hiredate,year(curdate())-year( hiredate) as experience from emp;

ALTER TABLE emp ADD experience INT GENERATED ALWAYS AS (YEAR('2026-12-31') - YEAR(hiredate));
select empno,ename,salary,experience from emp where manager_id =7368;
select * from emp where daily_salary >= 100;
select * from emp;
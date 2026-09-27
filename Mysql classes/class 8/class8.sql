use upgrade;

# over() partition by and order by questions 

select ename,salary,sum(salary) over() as invested_money from emp;

select 
	ename,salary,dept_no,sum(salary) over(partition by dept_no) as invested_money_of_dept,
	count(empno) over(partition by dept_no) as count_dept ,
	avg(salary) over(partition by dept_no) as avg_sal_deptwise 
from emp;


select empno,ename,salary,
max(salary) over(partition by dept_no) as max_salary_of_dept,dept_no from emp;

select empno,ename,salary,
min(salary) over(partition by dept_no) as min_salary_of_dept,dept_no from emp;

select ename ,salary,if(salary-avg(salary) over (partition by dept_no)  < 0,concat("LESS THAN AVG-- ",salary-avg(salary) over (partition by dept_no)*-1),
concat("MORE THAN AVG-- ",salary-avg(salary) over (partition by dept_no))) as lessormore_than_avg  from emp;


select empno,ename,salary,
rank() over(order by salary desc) as rank_of_company,dept_no from emp;

select empno,ename,salary,
dense_rank() over(order by salary desc) as rank_of_company,dept_no from emp;

select empno,ename,salary,
row_number() over(order by salary desc) as rank_of_company,dept_no from emp;

select empno,ename,salary,
row_number() over(order by hiredate),hiredate as hiring_order from emp;


## multiple scenarios
-- 11.	Show employee name, job, salary, and their rank within their job category by salary descending.
select empno,ename,salary,job,
rank() over(partition by job order by salary desc) as rank_of_job from emp;


-- 12.	Find the 2nd highest salary in each department using window functions. ( example of sub queries)
-- my attempt
select lag(ename) over(partition by dept_no order by salary desc) as e_name,lag(salary) over(partition by dept_no order by salary desc) from ;
-- correct approach 
-- using lag only
SELECT dept_no, ename, salary
FROM (
    SELECT 
        dept_no,
        ename,
        salary,
        LAG(salary) OVER(PARTITION BY dept_no ORDER BY salary DESC) AS second_highest
    FROM emp
) AS x
WHERE second_highest IS NULL;   -- this picks the row whose LAG is NULL (top salary)
-- using rank

SELECT ename, dept_no, salary
FROM (
    SELECT 
        ename,
        dept_no,
        salary,
        ROW_NUMBER() OVER(PARTITION BY dept_no ORDER BY salary DESC) AS rn
    FROM emp
) AS t
WHERE rn = 2;


-- 13.	Find the top 3 highest-paid employees in the company using window functions.
select ename,salary,dept_no
from(
	select
		ename,salary,dept_no,
        row_number() over(order by salary desc) as s_r
	from emp) as t
    where s_r between 1 and 3;
    
-- 14.	Show each employee’s salary and the salary of the next employee when ordered by emp_no.
select empno,ename,salary,lead(empno) over(order by empno),lead(salary) over(order by empno) from emp;

-- 15.	Show each employee’s salary and the salary of the previous employee when ordered by hire_date.
select empno,ename,salary,lag(empno) over(order by hiredate),lag(salary) over(order by hiredate) from emp;

-- 16.	Calculate the running total (cumulative sum) of salaries when employees are ordered by hire_date.
select empno,ename,salary,LEAD(salary) OVER (ORDER BY hiredate) AS next_salary,
if
	(salary+lag(salary) over(order by hiredate) is null,
	salary,salary+lead(salary) over(order by hiredate)) 
as cumulatatiov_sum 
from emp;






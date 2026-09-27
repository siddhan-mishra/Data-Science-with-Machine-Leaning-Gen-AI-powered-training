use upgrade;
select avg(salary),dept_no,job from emp group by job,dept_no;
SELECT dept_no, GROUP_CONCAT(ename) AS employees, max(salary) AS total_s_names
FROM emp
GROUP BY dept_no;

## WINDOW FUNCTIONS 

-- AGGREGATE FUNTIONS avg() max() min() sum() count()

-- RANKING OPERATIONS row_number() rank() dense_rank() percent_rank() ntile()

-- VALUE OPERATION lag() lead() first_value() last_value() nth-vlaure


## lag and lead operations 

select ename,salary,lag(ename) over(order by hiredate) as prev_name,lag(salary) over(order by hiredate) as prev_salary  from emp;
select ename,salary,lead(ename) over(order by hiredate) as next_name,lead(salary) over(order by hiredate) as next_salary  from emp;
select ename,salary,lag(ename) over(order by hiredate) as prev_name,lag(salary) over(order by hiredate) as prev_salary ,salary - lag(salary) over(order by hiredate) as difference_in_salary from emp;
select ename,salary,lead(ename) over(order by hiredate) as next_name,lead(salary) over(order by hiredate) as next_salary  from emp;


-- to find of the employee hired after next to you and check if their salary is more than you or not
select ename,salary,dept_no,lead(salary) over( partition by dept_no order by hiredate) as is_my_salary_lower_than_my_junior,lead(ename) over( partition by dept_no order by hiredate) as my_junior from emp  ;


select ename,salary,dept_no,
if(salary > lead(salary) over( partition by dept_no order by hiredate),
	concat(lead(salary) over( partition by dept_no order by hiredate),"  --",lead(ename) over( partition by dept_no order by hiredate)),
    "no" )as is_my_salary_lower_than_my_junior
from emp ;



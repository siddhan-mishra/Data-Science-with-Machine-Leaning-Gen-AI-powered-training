use upgrade;
## role dept
select * from emp;



-- question from ("" case related questions.docx "")
select 
	ename,empno,job,dept_no,
case 
	when job='salesman' and dept_no=30 then 'Sales & Marketing'
	when job='manager' and dept_no in(10,20) then 'Management Support'
	when job='cleark'  then 'Clerical Staff'
else 'Other'
end as role_dept_type from emp;

-- Create a new column called Adjusted_Sal.
select
	ename, job, salary, commision,
case
when job ='salesman' and commision > 0 then commision+salary
when job = 'analyst' then (salary*10)/100+salary
else salary
end as Adjusted_Sal 
from emp;

-- Task: Create a new column named Bonus_Amount.


select ename, hiredate, job, 
case
when year(hiredate)='1981' and job ='salesman' then 500
when year(hiredate)<'1981' and job ='cleark' then 200
else 0
end as Bonus_Amount from emp;


-- Task: Create a column named Reporting_To.
select empno, ename, manager_id,
case
when manager_id= 7839 then 'Reports to KING (President)'
when manager_id= 7698 then'Reports to BLAKE (Manager)'
when manager_id= 7566 then 'Reports to JONES (Manager)'
when manager_id= 7782 then'Reports to CLARK (Manager)'
when manager_id= 7902 then 'Reports to FORD (Analyst)'
when manager_id= 7788 then 'Reports to SCOTT (Analyst)'
when manager_id=  0 then'No Manager (Top Executive)'
else 'Unknown Manager'
end as Reporting_To from emp;


-- Task: Create a column called Dept_Sal_Evaluation.
select ename, dept_no, salary,
case
when dept_no = 10 AND salary>= 2500 then 'High Earner - Dept 10'
when dept_no = 20 AND salary>= 2000 then 'High Earner - Dept 20'
when dept_no = 30 AND salary>= 1500 then 'Lower Earner - Dept 30'
else 'Standard'
end as Dept_Sal_Evaluation from emp;

-- end for docx questions 





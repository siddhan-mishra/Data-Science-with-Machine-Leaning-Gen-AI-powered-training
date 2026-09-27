use upgrade;

select ename,dname from emp inner 
join dept on emp.dept_no = dept.dept_no;

SELECT 
    ename, dname
FROM
    emp
        JOIN
    dept ON emp.job = dept.dept_no;

select ename,job,loc from emp  
join dept on emp.dept_no = dept.dept_no;

-- find all the names of emps who work in dept sales 
select ename,dname,dept.dept_no from emp  
join dept on emp.dept_no= dept.dept_no where dept.dname = "sales";

-- show deptname and no of emps in each dept
	select dname, count(empno) from emp join dept on emp.dept_no = dept.dept_no group by dname;
		-- another way using window
	select distinct dname,count(empno) over(partition by dept.dept_no) from emp  
	join dept on emp.dept_no = dept.dept_no;

-- find all emps who work in newyork and have salary over 1000

	select empno,ename,dname,loc from emp e inner join dept d on e.dept_no=d.dept_no where salary > 1000 and loc = 'newyork';
    
-- list all salesmen(job as salesman) in chicago hired after 1981
	select job,loc,hiredate from emp e inner join dept d on e.dept_no = d.dept_no where loc = "chicago" and job='salesman' and year(hiredate)>'1981';
    
-- show eno name and dname for emps whose commision > salary
	select empno,ename,dname from emp e inner join dept d on e.dept_no=d.dept_no where commision>salary;
    
-- names of emp and their dept loc for emp job = analyst and are in dept 20 
	select ename,loc,job,d.dept_no from emp e inner join dept d on e.dept_no = d.dept_no where job ='analyst' and d.dept_no = 20;
    
-- all emps and their corresping dname
	select * from emp inner join dept on emp.dept_no = dept.dept_no;

-- enmae who work in sales dept
	select ename,dname from emp e inner join dept d on e.dept_no=d.dept_no where dname="sales";
    
-- empno, name job and loc 
		select empno,ename,job,loc from emp inner join dept on emp.dept_no = dept.dept_no;
        
-- list all dept and num of emp in each dept
	select distinct dname,d.dept_no,count(empno) over(partition by d.dept_no) from emp e inner join dept d on e.dept_no=d.dept_no;
    
--  find avg sal for each dept
	select dname,avg(salary) from emp e  join dept d on e.dept_no=d.dept_no group by dname;
-- find all emp woring in dept including depts that might not have emps so here priority is on dept hence right join
	select distinct dname,d.dept_no,count(empno) over(partition by d.dept_no) from emp e right join dept d on e.dept_no=d.dept_no;
    

-- find the names of managers for the emp ( here since we dont have the manager table but manager_id and that will also be their empno since they are employees so we used alias to have emp table into two different tables)
select e.ename,m.manager_id,m.ename as manager_name from emp e inner join emp m on e.empno = m.manager_id;

-- find managers who earn more than managers
select e.ename,m.manager_id,m.ename as manager_name from emp e inner join emp m on e.empno = m.manager_id where e.salary<m.salary;

-- 17.	For each department, list the department name, the number of employees, and the average salary. Only include departments where the average salary is above 2000.
		select distinct dname,d.dept_no,count(empno) over(partition by d.dept_no) as working_emp,avg(salary) over(partition by d.dept_no) as avg_salary from emp e inner join dept d on e.dept_no=d.dept_no;

-- Find the names of employees who are 'SALESMAN' and work in 'CHICAGO'.
		select job,loc from emp e inner join dept d on e.dept_no = d.dept_no where loc = "chicago" and job='salesman' ;
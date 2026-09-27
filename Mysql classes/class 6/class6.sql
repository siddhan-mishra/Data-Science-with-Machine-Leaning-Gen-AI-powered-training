use upgrade ;
-- count() , distinct , man(),min(),sum(), avg() are the functions.
select count(empno),count(dept_no) from emp where dept_no =20;
select distinct job from emp;
select sum(salary), sum(commision) from emp;
select sum(salary)from emp where job = "salesman";
select avg(salary)from emp;
select avg(commision)from emp where job = "salesman";
select min(salary) from emp;
select min(salary) from emp where dept_no = 10;
select max(salary) from emp;
select max(salary) from emp where job  in("manager");


##groups fucntion

select count(empno),dept_no from emp group by dept_no;
select avg(salary),dept_no from emp group by dept_no;
select max(salary),dept_no from emp group by dept_no;
select sum(salary),dept_no from emp group by dept_no;
select count(empno),year(hiredate) from emp group by year(hiredate);
-- count how no of employees for each job title within enach dept
select count(empno),job,dept_no from emp group by job,dept_no;
select avg(salary),dept_no,job from emp group by job,dept_no;
select count(job),dept_no,job from emp where job in("salesman") group by dept_no;
select count(ename),dept_no,ename from emp where ename like ('s%') group by dept_no,ename;
select max(salary),avg(salary),dept_no,count(empno) from emp where hiredate > '1981-06-01' group by dept_no;

select max(salary),dept_no,job from emp where job in('analyst','manager') group by job,dept_no;
	-- another method for the same question.
    select max(salary),dept_no,job from emp where job ='analyst' or job ='manager'group by job,dept_no;
    
    
select count(salary), job from emp where salary > 2000 group by job;


##  group by with having  function

select count(empno),dept_no from emp group by dept_no having count(empno) >3;
select sum(salary) as sal,dept_no from emp group by dept_no having sal<9000;
select count(empno) as eno,job from emp where salary > 3000 group by job having eno>= 2;
select count(empno) as eno,job from emp where job in('manager') group by job having eno =3;
select avg(salary) as sal,job from emp where year(hiredate)='1981' group by job having sal > 2000;
select avg(salary) as sal , dept_no from emp where salary > 1000 group by dept_no having count(empno)>2;
select count(empno) as eno,job from emp where job in('salesman') group by job;
select avg(salary) as eno,job from emp where job in('manager') group by job having sum(salary)>2500;

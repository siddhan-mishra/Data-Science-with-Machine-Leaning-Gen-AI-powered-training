use upgrade;
show tables;
select * from emp;
select ename,job from emp;
select distinct job from emp;
alter table emp add (mm int , mn int);
select concat(mm, mn) from emp;
select * from emp;
ALTER TABLE emp DROP COLUMN mm, DROP COLUMN mn;
select ename,salary from emp order by salary asc;
select ename,salary from emp order by salary desc;
select ename from emp order by salary asc;
select ename from emp order by salary asc;


select ename,salary from emp order by salary asc limit 5;
select ename,salary from emp order by salary desc limit 5;

select * from emp where manager_id = 7369;

select ename,job from emp where salary = 5000;
select ename,job from emp where salary <= 1600;






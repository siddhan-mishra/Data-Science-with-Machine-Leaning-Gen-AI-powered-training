use upgrade;
select ename,salary,experience,commision from emp where salary between 1000 AND 2000;
select ename,salary,experience,commision,annual_salary_package from emp where annual_salary_package between 22000 AND 45000;
select ename from emp where hiredate between "1981-01-01" and "1981-12-31"; -- ## when using date we need to add "" for them
select empno,ename from emp where empno between 7500 and 7800;
select * from emp where dept_no IN (20,30) and salary between 2500 and 3000;
select ename,salary from emp where salary not between 1000 AND 2000;
select empno,ename from emp where empno not between 7500 and 7800;
select * from emp where dept_no not between 20 and 30 or salary not between 2500 and 3000;


-- IN operator using 

select * from emp where dept_no IN (10,20,40);
select * from emp where job in ("SALESMAN","MANAGER");
select * from emp where ename in ("allen","smith","king");
select ename, hiredate from emp where hiredate in ("1981-05-1","1981-12-3","1981-12-17","1980-01-19") order by hiredate asc;
select * from emp where job not in ("president","MANAGER") order by salary asc;
select * from emp where dept_no not IN (20);
select ename, hiredate from emp where year(hiredate) not in ("1981");
select ename, hiredate from emp where hiredate not between "1981-01-01" and "1981-12-31";
select ename, hiredate from emp where month(hiredate) not in ("05");


-- Like operator 

select * from emp where ename like ('__r_');
select * from emp where ename like ('%n');
select * from emp where job like('%le%');
select * from emp where ename like ('_a%');
select * from emp where job like ('___s%');
select * from emp where ename like ('j%') and job like('c%');
select * from emp where ename like ('%ar%') or job like('%analyst%');
select * from emp where ename like ('%ar%') or job in('analyst');
select * from emp where job not like ('%er%');
select * from emp where ename like ('s%') and salary >1000;
select * from emp where job like ('%man%') and year(hiredate) = "1981";
select * from emp where ename like ('m%') order by hiredate asc;


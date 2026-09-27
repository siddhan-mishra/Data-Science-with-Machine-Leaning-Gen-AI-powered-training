use upgrade;
-- 1
select concat(upper(left(ename,1)), "was hired on", date_format(hiredate, '% %M %Y') , " hired for ", job) as employee_info , daily_salary,annual_salary_package from emp order by salary desc;
-- 2.1981 ename eno job and hiredate
select ename,empno,job,hiredate from emp where year(hiredate) = 1981;

-- 3.ename hiredate and day nanme sort by hiredate 
select ename, dayname(hiredate) from emp order by hiredate asc;

-- 4.name hiredate and years of service 
select concat( ename," hired on ",date_format(hiredate,'%D %M %Y')," years of service as of today ",experience," Years") as exp_as_of_today from emp order by experience desc;
     -- also be done as
     SELECT TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) AS years_worked FROM emp;




-- 5. start with s and ends with s , ename and job
select ename,job from emp where ename like('S%s');

-- 6. dpt name location in upper along with lenght of dept name
select upper(dname),upper(loc),char_length(dname) from dept;

-- 7.hired between feb 1981 and jun 1981 show name job hiredate in format dd-mon-yyyy  ( %b for abbrevieated months)
select concat(ename," Joined on ",date_format(hiredate,'%d-%b-%Y')) from emp where hiredate between '1981-02-01' AND '1981-06-30';

-- 8. ename and no of month worked as hired round to nearest whole no
select ename, timestampdiff(month,hiredate,curdate()) as Exp_in_months from emp;

-- 10. ename job but replace word cleark with clerk
select ename, replace(job,'cleark','clerk') as jobs from emp;

-- 10 name salary andcommision if commision is 0 dispaly no commision instead of 0  and hiredate as Month DD, YYYY
select ename, if(commision=0,"no commision", commision),date_format(hiredate,'%M %D, %Y') from emp ;

 -- 11. hired on wed show their name hire date ann day name 
 select ename,hiredate,dayname(hiredate) as hire_day from emp where dayname(hiredate)="wednesday";
 
 -- 12. last 3 charac of ech ename and first 3 chract of their job title combite them with hyphen eg ith-pre
 select concat(right(ename,3),"-",left(job,3)) from emp;
 
 -- 13. 

use upgrade;

delimiter //
create function Getannualcompensation (p_sal int , p_comm int)
returns int
deterministic
no sql
begin
	declare annual_comm int;
    
    -- calculate yearly salary plus commision
    
    set annual_comm= (p_sal)*12+ p_comm;
    getmanagername
    return annual_comm;
    end //

DELIMITER ;

select
ename,job,salary,commision,Getannualcompensation (salary,commision) as Annual_pay
from emp
order by annual_pay desc;

delimiter //
create function getmanagername(vempno int)
returns varchar(30)
deterministic
reads sql data
begin
declare vmgrno int;
declare vmgrname varchar(30);
declare vename varchar(30);

select manager_id,ename into vmgrno,vename from emp where empno=vempno;

if vmgrno = 0 or vmgrno is null then 
return concat(vename," is Top level excecutive");
else select ename into vmgrname from emp where empno=vmgrno;
return vmgrname;
end if;
end//

delimiter ;

select empno,ename,getmanagername(empno) as manager_name from emp;
select empno,ename,getmanagername(empno) as manager_name from emp where empno=7369;

-- executive,senior staff and junior staff

delimiter //

create function Getpaycategory (vempno int)
returns varchar(30)
deterministic
reads sql data
begin
	declare vpay int;
    declare vgrade varchar(30);
    
    select salary into vpay from emp where empno=vempno;
    
    if vpay > 3000 then
    set vgrade ='executive';
    
    elseif vpay >=1500 then
    set vgrade='senior executive';
    
    else set vgrade ='junior executive';
    end if;
    return vgrade;
    
    end//
    
delimiter ;

select ename,salary,getpaycategory(empno) as Pay_category from emp order by salary desc;


-- "employee: ename, Job: job" format full name with job

delimiter $$

create function getformatnamejob (vempno int)
returns varchar(50)
deterministic
reads sql data
begin

declare vename varchar(50);
declare vjob varchar(50);

select ename,job into vename,vjob from emp where empno=vempno;

return concat("EMPLOYEE: ",vename,", JOB= ",vjob);
end $$

delimiter ;

select empno,ename,job,getformatnamejob (empno) as ename_job from emp;



-- calculate_adjusted_salary 
-- It should return the sal plus comm, but if comm is NULL or 0,
-- it should assume comm is 10% of sal for the calculation. Write

delimiter $$
create function getcalculateadjustedsalary (vempno int)
returns decimal(10,2)
deterministic
reads sql data
begin
declare vsal decimal(10,2);
declare vcomm decimal(10,2);
declare cal_sal decimal(10,2);

select salary,commision into vsal,vcomm from emp where empno=vempno;

if vcomm = 0 then 
set cal_sal=(vsal*0.10)+vsal;


else
	set cal_sal=vsal+vcomm;
end if;
return cal_sal;
end $$

delimiter ;

select empno,ename,salary,commision,getcalculateadjustedsalary(empno) as adjusted_salary from emp;


-- mask_dept_name that takes a dname as input
-- the dname is 'accounting', 
-- it returns 'FINANCE'; if it's 'research', it returns 'R&D'; otherwise, it returns 'GENERAL_DEPT'
-- E_name and their masked_dept_name (using the UDF) by joining emp and dept tables.

delimiter \\
create function getmaskedempdeptname (vempno int,vdeptno int)
returns varchar(50)
deterministic
reads sql data
begin
	declare vename varchar(50);
    declare vdname varchar(50);
    declare maskedname varchar(50);
    
    select e.ename,d.dname into vename,vdname 
    from emp e inner join dept d on e.dept_no=d.dept_no 
    where e.empno=vempno and d.dept_no=vdeptno;
    
    if vdname='accounting' then
		set maskedname='finance';
    
    elseif vdname='research' then
		set maskedname='R&D';
    
    else 
		SET maskedname ='GENERAL_DEPT';
    
    end if;
    return concat("EMPLOYEE: ",vename," DEPT NAME: ",maskedname);
    END \\
    
    DELIMITER ;
    
    SELECT getmaskedempdeptname(empno,dept_no) as formatted_name from emp;
	SELECT getmaskedempdeptname(e.empno,e.dept_no) as formatted_name,e.ename,d.dname from emp e inner join dept d on e.dept_no=d.dept_no
    
-- get_years_of_service that takes an hire_date as input and 
-- returns the number of full years an employee has served. 
-- display E_name, hire_date, and their years_of_service
delimiter //
create function getyrsservice (hiredate date)
returns int
deterministic
reads sql data
begin
	declare years int;
    
    set years = DATEDIFF(YEAR, hire_date, GETDATE());
    
    return years;
    end // 
    
    
delimiter ;

select 

use upgrade;

delimiter //
create procedure allemployee()
begin
select * from emp;
select * from dept;
end//
delimiter ;

call allemployee;


delimiter //
create procedure insert_dept(
in i_dept_no int,
in i_dname varchar(20),
in i_loc varchar(20),
out total_num int)
begin
insert into dept(dept_no,dname, loc) values (i_dept_no, i_dname,i_loc);
select count(dept_no) as total_num from dept;
end //
delimiter ;
commit;




delimiter // 
create procedure enameandjobdetails ( 
in p_empno int, 
out pjob varchar(20),
out p_ename varchar(20))
begin 
select ename,job into p_ename,pjob from emp where empno=p_empno;
end//
delimiter ;

call enameandjobdetails(7902,@pjob,@p_ename);
select @pjob as job_title, @p_ename as empname;




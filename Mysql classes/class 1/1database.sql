create database upgrade;
use upgrade;
show tables;

CREATE TABLE ipl (
    player VARCHAR(50) NOT NULL,
    inns INT,
    runs INT,
    balls INT,
    4s INT,
    6s INT,
    6s_inns DECIMAL(5 , 2 )
);

CREATE table emp (empno int not null, ename varchar(50) not null, job varchar(50) not null, manager_id int not null, hiredate date not null, salary dec(10,2) not null check (salary>0) , commision dec (10,2) not null, dept_no int not null );
show tables;

SELECT * FROM EMP;
DESC emp;
show columns from emp;



insert into emp
(empno,Ename,job,manager_id,hiredate,salary,commision,dept_no)
values
(7369,'smith','cleark',7902,'1980-12-17',800,0,20),
(7499,'allen','salesman',7698,'1981-02-20',1600,300,30),
(7521,'ward','salesman',7698,'1981-02-22',1250,500,30),
(7566,'jones','manager',7839,'1981-04-02',2975,0,20),
(7654,'martin','salesman',7698,'1981-09-28',1250,1400,30),
(7698,'blake','manager',7839,'1981-05-01',2850,0,30),
(7782,'clark','manager',7839,'1981-06-09',2450,0,10),
(7788,'scott','analyst',7566,'1982-12-09',3000,0,20),
(7839,'king','president',0,'1981-11-17',5000,0,10),
(7844,'turner','salesman',7698,'1981-09-08',1500,0,30),
(7876,'adams','cleark',7788,'1983-01-12',1100,0,20),
(7900,'james','cleark',7698,'1981-12-03',950,0,30),
(7902,'ford','analyst',7566,'1981-12-03',3000,0,20),
(7934,'miller','cleark',7782,'1982-01-22',1300,0,10);


select * from emp;




create table dept (dept_no int, dname varchar (23), loc varchar (25));
insert into dept (dept_no,dname,loc) values
(10,"accounting", "newyork"),
(20,"research", "dallas"),
(30,"sales", "chicago"),
(40,"operations", "boston");


select * from dept;
select dname,loc from dept;

alter table ipl add ducks int;
alter table ipl drop ducks;
alter table ipl modify player char(50);

alter table ipl add injuries int;
alter table ipl rename column injuries to no_of_injuries_this_season;

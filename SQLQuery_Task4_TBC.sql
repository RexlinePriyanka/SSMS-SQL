use priya
CREATE TABLE EMPY
       (EMPNO int ,
        ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR int,
        HIREDATE date,
        SAL int,
        COMM int,
        DEPTNO int,
        GRADE int);

		INSERT INTO EMPY VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        CAST('1980-12-17' as DATE),  800, NULL, 20, 5);
INSERT INTO EMPY VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        CAST('1981-02-20' as DATE), 1600,  300, 30, 3);
INSERT INTO EMPY VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        CAST('1981-02-22' as DATE), 1250,  500, 30, 4);
INSERT INTO EMPY VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        CAST('1981-04-02' as DATE),  2975, NULL, 20, 2);
INSERT INTO EMPY VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        CAST('1981-09-28' as DATE), 1250, 1400, 30, 4);
INSERT INTO EMPY VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        CAST('1981-05-01' as DATE),  2850, NULL, 30, 2);
INSERT INTO EMPY VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        CAST('1981-06-09' as DATE),  2450, NULL, 10, 2);
INSERT INTO EMPY VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        CAST('1982-12-09' as DATE), 3000, NULL, 20, 1);
INSERT INTO EMPY VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        CAST('1981-11-17' as DATE), 5000, NULL, 10, 1);
INSERT INTO EMPY VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        CAST('1981-09-08' as DATE),  1500, NULL, 30, 3);
INSERT INTO EMPY VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        CAST('1983-01-12' as DATE), 1100, NULL, 20, 4);
INSERT INTO EMPY VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        CAST('1981-12-03' as DATE),   950, NULL, 30, 5);

INSERT INTO EMPY VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        CAST('1981-12-03' as DATE),  3000, NULL, 20, 1);
INSERT INTO EMPY VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        CAST('1982-01-23' as DATE), 1300, NULL, 10, 3);

select * from EMPY

CREATE TABLE DEPT
       (DEPTNO INT,
        DNAME VARCHAR(14),
        LOC VARCHAR(13) );


--QUERIES
--#1.Display all the information of the EMP table?
select * from empy
--#2.Display unique Jobs from EMP table?
select distinct job from EMPY
--#3.List the emps in the asc order of their Salaries?
select Ename,sal  from empy order by SAL
--#4.List the details of the emps in asc order of the Dptnos and desc of Jobs? 
select * from EMPY order by DEPTNO,job desc
--#5.Display all the unique job groups in the descending order? 
select distinct job from EMPY order by job desc
--#6.Display all the details of all ‘Mgrs’
select mgr from empy
--#7.List the emps who joined before 1981.
select * from empy where year(hiredate)<1981
--#8.List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
select Empno,Ename,sal,sal/30 Daily_sal from EMPY order by (sal*12)
--#9.Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
select empno,ename,job,hiredate,datediff(year,hiredate,getdate()) Experience from EMPY;
--#10.List the Empno, Ename, Sal, Exp of all emps working for Mgr 7839.
select * from empy
select empno,ename,sal,datediff(year,hiredate,getdate()) Experience,mgr from empy where mgr=7839
--#11.Display all the details of the emps whose Comm. Is more than their Sal.
select * from EMPY where comm>SAL
--#12.List the emps in the asc order of Designations of those joined after the second half of 1981.
select *from EMPY  where hiredate<='1981-07-01'order by job 
--13.List the emps along with their Exp and Daily Sal is more than Rs.100.
select datediff(year,hiredate,getdate()) Experience,sal/30 Dailysal from empy where sal/30>100
--#14.List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.
select * from empy where job in('clerk','analyst') order by ename desc
--15.List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.
select * from empy where hiredate in('1981-05-01','1981-12-03','1981-12-17','1980-01-19') order by HIREDATE
--16.List the emp who are working for the Deptno 10 or20.
select * from empy where DEPTNO=10 or DEPTNO=20
--17.List the emps who are joined in the year 81.
select * from empy where year(hiredate)=1981
--18.List the emps who are joined in the month of Aug 1980.
select * from empy where month(hiredate)=08 and year(hiredate)=1980
select * from empy
--19.List the emps Who Annual sal ranging from 22000 and 45000.
select ename,sal,sal*12 Annual_Sal from empy where sal*12 between 22000 and 45000
--20.List the Enames those are having five characters in their Names.
select ename,len(ename) from empy where len(ename) =5
--21.List the Enames those are starting with ‘S’ and with five characters.
select ename,len(ename) Name_Length from empy where len(ename) =5 and left(ename,1)='s'
select ename,len(ename) Name_Length from empy where len(ename) =5 and ename like 's%'
--22.List the emps those are having four chars and third character must be ‘r’.
select ename from empy where len(ename)=4 and SUBSTRING(ename,3,1)='r'
select ename from empy where len(ename)=4 and ename like '__r%'
--23.List the Five character names starting with ‘S’ and ending with ‘H’.
select ename from empy where len(ename)=5 and ename like 's%' and ename like '%h'
--24.List the emps who joined in January.
select * from EMPY
select * from empy where month(hiredate)=01
--25.List the emps who joined in the month of which second character is ‘a’.
select ename,hiredate,datename(month,hiredate) from empy where datename(month,hiredate) like '_a%'
--26.List the emps whose Sal is four digit number ending with Zero.
select * from empy where len(sal)=4 and sal like '%0';
--27.List the emps whose names having a character set ‘ll’ together.
select * from empy where ename like '%ll%';
--28.List the emps those who joined in 80’s.
select * from empy where year(hiredate) between 1980 and 1989 
--29.List the emps who does not belong to Deptno 20.
select * from empy where DEPTNO<>20
--30.List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
select * from empy where job not in('president','manager') order by SAL 
--31.List all the emps who joined before or after 1981.
select *,year(hiredate) from empy where year(hiredate)<1981 or year(hiredate)>1981 
--32.List the emps whose Empno not starting with digit 78.
use priya
select * from empy
select * from empy where empno not like '78%'
--33.List the emps who are working under ‘MGR’.
select * from empy where job='manager';
--34.List the emps who joined in any year but not belongs to the month of March.
select * from empy where month(hiredate)<>'03'
--35.List all the Clerks of Deptno 20.
select * from empy where job='clerk' and DEPTNO=20
--36.List the emps of Deptno 30 or 10 joined in the year 1981.
select * from empy where deptno in(10,30) and year(HIREDATE)=1981
--37.Display the details of SMITH.
select * from empy where ename='smith'
--38.Display the location of  SMITH.
select e.ename,d.LOC from empy e inner join DEPT d on e.DEPTNO=d.DEPTNO where ename='smith'
--39.List the total information of EMP table along with DNAME and Loc of all the emps 
--Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno
select e.EMPNO,e.ENAME,e.JOB,e.MGR,e.HIREDATE,e.SAL,e.COMM,e.DEPTNO,d.DNAME,d.LOC from empy e inner join DEPT d on e.DEPTNO=d.DEPTNO
where d.DNAME in('accounting','research'); 
select * from dept
select * from empy
--40.List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas with an exp more than 7 years
--without receiving the Comm asc order of Loc.
select e.ENAME,e.SAL,e.Job,e.HIREDATE,e.COMM,d.DNAME,d.LOC from empy e inner join DEPT d on e.DEPTNO=d.DEPTNO 
where e.JOB in('Manager','Analyst')
and d.loc in('New york','Dallas')
and datediff(year,hiredate,getdate())>7
order by d.LOC

--41.Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps 
--working at CHICAGO or working for ACCOUNTING dept with Ann Sal>28000, 
--but the Sal should not be=3000 or 2800 who doesn’t belongs to the Mgr 
--and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order of job.
use priya
select e.EMPNO,e.ENAME,e.SAL,e.sal*12 Annual_Sal,d.DNAME,d.LOC,d.DEPTNO,e.JOB from EMPY e inner join DEPT d on e.DEPTNO=d.DEPTNO 
where (loc='Chicago' or DNAME='Accounting') 
and (sal*12)>28000 
and (sal not in(3000,2800))
and job<>'Manager'
and (EMPNO like '__7%' or EMPNO like '__8%')
order by d.DEPTNO asc,e.JOB desc

--42.Display the total information of the emps along with Grades in the asc order.
select * from EMPY order by grade asc

--43.List all the Grade2 and Grade 3 emps.
select * from empy where GRADE=2 or GRADE=3

--44.Display all Grade 4,5 Analyst and Mgr.
select * from empy where GRADE=4 or GRADE=5 or job='analyst' or job='manager'

--45.List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of emps working for Dept10 or20.
select EMPNO,ENAME,SAL,d.DEPTNO,d.DNAME,GRADE,DATEDIFF(year,HIREDATE,GETDATE()) Experience,SAL*12 Annual_Sal from EMPY e 
inner join DEPT d on e.DEPTNO=d.DEPTNO where d.DEPTNO in(10,20)

--46.List all the information of emp with Loc and the Grade of all the emps belong to the Grade range from 2 to 4 
--working at the Dept those are not starting with char set ‘OP’ and not ending with ‘S’ 
--with the designation having a char ‘a’ any where joined in the year 1981
--but not in the month of Mar or Sep and Sal not end with ‘00’ in the asc order of Grades
select * from empy e inner join DEPT d on e.DEPTNO=d.DEPTNO where (GRADE between 2 and 4)
and (DNAME not like 'op%') 
and (DNAME not like '%s')
and (JOB like '%a%')
and (year(HIREDATE)=1981)
and (MONTH(hiredate) not in(3,9))
and SAL not like '%00'
order by GRADE 

--47.List the details of the Depts along with Empno, Ename or without the emps
select * from DEPT
select EMPNO,ENAME,DNAME from DEPT inner join EMPY on DEPT.DEPTNO=EMPY.DEPTNO

--48.List the details of the emps whose Salaries more than the employee BLAKE.
select * from EMPY where sal>
(select sal from EMPY where ENAME='BLAKE')

--49.List the emps whose Jobs are same as ALLEN.
select * from EMPY where job=(select JOB from EMPY where ENAME='ALLEN')

--50.List the emps who are senior to King.
select * from EMPY where HIREDATE<(select HIREDATE from EMPY where ENAME='KING')

--51.List the Emps who are senior to their own MGRS.
use priya
select * from EMPY
select * from DEPT
select E1.EMPNO,E1.ENAME,e1.HIREDATE,e1.MGR,e2.ENAME,e2.HIREDATE as Manager_Hiredate from EMPY E1 join Empy E2 on E1.MGR=E2.EMPNO
where e1.HIREDATE<e2.HIREDATE

--52.List the Emps of Deptno 20 whose Jobs are same as Deptno10.
select * from EMPY where DEPTNO=20 and JOB in (select job from EMPY where DEPTNO=10)

--53.List the Emps whose Sal is same as FORD or SMITH in desc order of Sal.
select * from EMPY where SAL in (select SAL from EMPY where ENAME in ('Ford','Smith')) order by SAL desc

--54.List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
select * from EMPY where JOB=(select job from EMPY where ENAME='Miller') or SAL>(select sal from EMPY where ENAME='Allen')

--55.List the Emps whose Sal is > the total remuneration of the SALESMAN.(ask yaash)
select * from EMPY

--56.List the emps who are senior to BLAKE working at CHICAGO & BOSTON.
select * from EMPY
select * from DEPT
select * from EMPY e1 join DEPT e2 on e1.DEPTNO=e2.DEPTNO where (e1.HIREDATE<(select HIREDATE from EMPY where ENAME='blake')) 
and e2.LOC in ('chicago','boston')

--57.List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and RESEARCH 
--whose Sal is more than ALLEN and exp more than SMITH in the asc order of EXP.
select *,DATEDIFF(year,HIREDATE,getdate()) as Experience from EMPY e1 join DEPT e2 on e1.DEPTNO=e2.DEPTNO 
where (e1.GRADE in (3,4))
and (e2.DNAME in('accounting','research'))
and (DATEDIFF(year,HIREDATE,getdate()) > (select datediff(year,hiredate,getdate()) from EMPY where ENAME='smith')) 
and (e1.SAL>(select SAL from EMPY where ENAME='allen'))
order by DATEDIFF(year,HIREDATE,getdate()) asc

--58.List the emps whose jobs same as SMITH or ALLEN.
select * from EMPY where JOB in(select job from EMPY where ENAME='smith' or ENAME='allen')

--59.Write a Query to display the details of emps whose Sal is same as of
--Any jobs of deptno 10 those that are not found in deptno 20.(Yaash)
use priya
select * from EMPY where SAL in
(select job,SAL from EMPY where DEPTNO=10) and JOB not in(select job from EMPY where DEPTNO=20))

--60.List of emps of emp1 who are not found in emp2.(Not correct different ways)
select * from EMPY where EMPNO not in(select distinct(MGR) from EMPY)
select * from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO where e1.EMPNO<>e1.MGR
select distinct(MGR) from EMPY
select emp.empno,emp.mgr,manager.MGR from 
(select * from EMPY) emp join
(select distinct(MGR) from EMPY)manager
on emp.empno<>manager.mgr

--61.Find the highest sal of EMP table.
select max(sal) from EMPY

--62.Find details of highest paid employee.
select top 1 * from EMPY order by SAL desc 

--63.Find the highest paid employee of sales department.(Yaash)
select deptno,max(sal) from EMPY group by deptno
select * from EMPY
select * from DEPT
select e1.DEPTNO,e2.DNAME,max(e1.SAL) High_Sal from EMPY e1 join DEPT e2 on e1.DEPTNO=e2.DEPTNO
where e2.DNAME='sales'
group by e1.DEPTNO,e2.DNAME

--64.List the most recently hired emp of grade3 belongs to  location CHICAGO.
select top 1 * from EMPY e1 join DEPT d1 on e1.DEPTNO=d1.DEPTNO
where e1.GRADE=3 and d1.LOC='chicago'
order by e1.HIREDATE desc

--65.List the employees who are senior to most recently hired employee working under king.
--option 1
select * from EMPY
where hiredate<
(select top 1 HIREDATE from EMPY where MGR=7839 order by HIREDATE desc)

--option 2
select * from EMPY
where hiredate<
(select top 1 e1.HIREDATE from empy e1 join EMPY e2 on e1.MGR=e2.EMPNO
where e2.ENAME='king'
order by e1.HIREDATE desc)


--66.List the details of the employee belongs to newyork with grade 3 to 5 except ‘PRESIDENT’ 
--whose sal> the highest paid employee of Chicago in a group where there is manager and salesman not working under king(incomplete)
select * from EMPY e1 join DEPT d1 on e1.DEPTNO=d1.DEPTNO
where (e1.GRADE between 3 and 5)
and (d1.LOC='new york')
and e1.JOB <> 'President'
and e1.SAL>(select top 1 ENAME from EMPY where LOC='chicago')

select * from EMPY e1 join DEPT d1 on e1.DEPTNO=d1.DEPTNO 
where d1.LOC='chicago'
order by e1.SAL desc

select * from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO
where e2.mgr 
here el.sal>(select top 1 ENAME from EMPY where e2.LOC='chicago')



--67.List the details of the senior employee belongs to 1981.
select top 1 * from EMPY where YEAR(hiredate)=1981 order by HIREDATE 

--68.List the employees who joined in 1981 with the job same as the most senior person of the year 1981.
select * from EMPY where YEAR(hiredate)=1981 
and JOB=(select top 1 JOB from EMPY where YEAR(hiredate)=1981 order by HIREDATE)

--69.List the most senior empl working under the king and grade is more than 3.
select top 1 e1.EMPNO,e1.ENAME,e1.JOB,e1.MGR,e1.HIREDATE,e1.SAL,e1.COMM,e1.DEPTNO,e1.GRADE from EMPY e1
join EMPY e2 on e1.MGR=e2.EMPNO
where e2.ENAME='king' 
and e1.GRADE>3
order by e1.HIREDATE

--70.Find the total sal given to the MGR.
select sum(e2.sal) Manager_Sal_Total from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO

--71.Find the total annual sal to distribute job wise in the year 81.
select JOB,sum(sal)*12 as Annual_sal_jobwise from EMPY where YEAR(hiredate)=1981 group by JOB

--72.Display total sal employee belonging to grade 3.
select sum(sal) as Total_sal_G3 from EMPY where GRADE=3

--73.Display the average salaries of all the clerks.
select AVG(sal) Avg_sal_Clerk from EMPY where JOB='clerk'


--74.List the employee in dept 20 whose sal is >the average sal 0f dept 10 emps.
select * from EMPY where DEPTNO=20 and SAL>(select AVG(sal) from EMPY where DEPTNO=10)

--75.Display the number of employee for each job group deptno wise.
select Deptno,Job,count(job) from EMPY group by DEPTNO,JOB
order by DEPTNO,JOB

--76.List the manager no and the number of employees working for those mgrs in the ascending Mgrno.
select e2.EMPNO Manager_NO,count(e1.ENAME) No_of_Emp from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO 
group by e2.EMPNO
order by e2.EMPNO

--77.List the department details where at least two emps are working(small doubt and error)
select d.DEPTNO,d.DNAME,d.loc,count(e.ENAME) No_of_Emp from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO group by d.DEPTNO,d.DNAME,d.LOC
where count(e.ENAME) >=2


--78.Display the Grade, Number of emps, and max sal of each grade.
use priya
select * from EMPY
select GRADE,COUNT(empno) No_of_Emp,max(sal) Max_Sal from EMPY group by GRADE


--79.Display dname, grade, No. of emps where at least two emps are clerks.(Not done yash)
select d.DNAME,JOB,GRADE from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO group by d.DNAME,JOB,GRADE
select * from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO 

--80.List the details of the department where maximum number of emps are working.(small doubt)
select * from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO
select * from DEPT where dname=
(select top 1 d.DNAME,count(e.EMPNO) Max from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO group by DNAME 
order by Max desc)

--81.Display the emps whose manager name is jones.
select * from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO where e2.ENAME='jones'

--82.List the employees whose salary is more than 3000 after giving 20% increment.
select *,((SAL*20)/100)+SAL Inc from EMPY where((SAL*20)/100)+SAL >3000

--83.List the emps with dept names.
select e.ENAME,d.DNAME from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO

--84.List the emps who are not working in sales dept.
select e.ENAME,d.DNAME from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO where d.DNAME<>'sales'

--85.List the emps name ,dept, sal and comm. For those whose salary is between 2000 and 5000 while loc is Chicago
select e.ENAME,d.DNAME,e.SAL,e.COMM,d.LOC from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO
where SAL between 2000 and 5000
and d.LOC='chicago'

--86.List the emps whose sal is greater than his managers salary(small doubt)
select * from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO where  e1.SAL>e2.SAL

--87.List the grade, EMP name for the deptno 10 or deptno 30
--but sal grade is not 4 while they joined the company before ’31-dec-82’.
select ENAME,GRADE,DEPTNO,HIREDATE from EMPY 
where DEPTNO in(10,30) and GRADE<>4 and HIREDATE<'1982-12-31'

--88.List the name ,job, dname, location for those who are working as MGRS.
select e.ENAME,e.JOB,DNAME,d.LOC from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO where e.JOB='manager'

--89.List the emps whose mgr name is jones and also list their manager name.(incomplete)

select * from empy e1 join EMPY e2 on e1.MGR=e2.EMPNO where e2.ENAME='jones'

select e2.ENAME from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO where e1.ENAME='jones'

--90.List the name and salary of ford if his salary is equal to hisal of his grade.(Yash to check)
select ENAME,SAL,GRADE from EMPY where ENAME='ford' and SAL=
(select max(SAL) from EMPY where grade=(select GRADE from EMPY where ENAME='ford'))

--91.Lit the name, job, dname ,sal, grade dept wise
select ENAME,JOB,d.DNAME,SAL,GRADE from EMPY e join DEPT d  on e.DEPTNO=d.DEPTNO 
order by e.DEPTNO

--92.List the emp name, job, sal, grade and dname except clerks and sort on the basis of highest sal.
select ENAME,JOB,SAL,GRADE,d.DNAME from EMPY e join DEPT d  on e.DEPTNO=d.DEPTNO where JOB<>'clerk'
order by SAL desc

--93.List the emps name, job who are with out manager.
select * from EMPY where MGR is null

--94.List the names of the emps who are getting the highest sal dept wise.(Half done)
select dname,max(sal) from EMPY e join DEPT d on e.DEPTNO=d.DEPTNO group by DNAME

--95.List the emps whose sal is equal to the average of max and minimum
use priya
select * from empy where SAL=(
select (max(sal)+MIN(sal))/2 from EMPY)

--96.List the no. of emps in each department where the no. is more than 3.
select Deptno,COUNT(Empno) as Count_Deptwise from EMPY group by DEPTNO having COUNT(Empno)>3

--97.List the names of depts. Where atleast 3 are working in that department.
select DNAME,COUNT(e.empno)  from empy e join dept d on e.DEPTNO=d.DEPTNO group by DNAME having COUNT(e.empno)>=3

--98.List the managers whose sal is more than his employess avg salary(Yash should i join 2 tables)
select e1.mgr,avg(e1.SAL) from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO group by e1.MGR
select distinct(e2.EMPNO),e2.ENAME,e2.SAL from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO

--99.List the name,salary,comm. For those employees whose net pay is greater than
--or equal to any other employee salary of the company.(dont know)
select * from EMPY
select *,(SAL+coalesce(COMM,0)) Net_Pay from EMPY

--100.List the emp whose sal<his manager but more than any other manager.(Yaash)
select * from EMPY e1 join EMPY e2 on e1.MGR=e2.EMPNO
where e1.SAL<e2.SAL
and e1.SAL>(select SAL from EMPY

--101.List the employee names and his average salary department wise.
select * from EMPY order by DEPTNO




--102.Find out least 5 earners of the company.
select top 5 * from EMPY order by SAL asc

--103.Find out emps whose salaries greater than salaries of their managers.









select * from EMPY where 













































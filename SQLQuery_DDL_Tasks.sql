use tasks
--#1 and  #2
create table Employees(Employee_ID int not null unique,First_Name varchar(50),Last_Name varchar(50),Hire_Date date,Dept_ID int,Fax_NO int,Phone_No int)
--#3
alter table Employees add Email varchar(100)
--#4
alter table Employees 
alter column First_Name varchar(70)

select * from Employees
--#5
alter table Employees
drop column Fax_NO
--#6
alter table Employees add constraint Cons_Phone unique(Phone_NO)
alter table Employees add constraint Cons_EID unique(Employee_ID)
--#7
alter table Employees add Salary int constraint Cons_Sal_Check check(Salary>5000)

insert into Employees values(1,'Push','Raj','2013-02-25',101,97864,'push@gmail.com')
insert into Employees values(2,'Priya','Murali','2013-02-23',101,94324,'priya@gmail.com')

update Employees set Salary =60000 where Employee_ID=1
update Employees set Salary =50000 where Employee_ID=2

--#8
use tasks
alter table Employees drop constraint Cons_Sal_Check
alter table Employees add constraint Sal_Check1 check(Salary>20000)

--#9
alter table Employees add Address1 varchar(100) not null

--#10
alter table Employees add Address2 varchar(100)
--#11
alter table Employees drop column Address1
--#12
alter table Employees drop column Address2
--#13
exec sp_rename 'dbo.employees.Phone_No','Mobile_Number','column'






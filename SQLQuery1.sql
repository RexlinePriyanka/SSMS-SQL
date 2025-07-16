create table Emp(ID int,Name varchar(10),City varchar(20))
create table Emp_Resigned(ID int)

insert into Emp values(1,'AAA','Chennai'),(2,'BBB','Trichy'),(3,'CCC','Chennai'),(4,'DDD','USA'),(5,'FFF','Italy'),(6,'GGG','Texas')
insert into Emp_Resigned values(1),(2),(3)
select * from emp
select * from Emp_Resigned

create procedure delete_Emp @ID int as
delete from Emp where ID=@ID

exec delete_Emp @ID=1

use priya

select * from EMPY
select * from DEPT
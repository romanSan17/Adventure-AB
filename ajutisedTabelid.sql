use AdventureWorksDW2019
Create Table #PersonDetails (Id int, Name nvarchar(20))
Insert into #PersonDetails Values(1, 'Mike') 
Insert into #PersonDetails Values (2, 'John')
Insert into #PersonDetails Values (3, 'Todd')

Select * from #PersonDetails

Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))
Insert into #PersonDetails Values (1, 'Mike')
Insert into #PersonDetails Values (2, 'John')
Insert into #PersonDetails Values (3, 'Todd')
Select * from #PersonDetails
End

Create Table ##EmployeeDetails(Id int, name nvarchar(20))

Select * from DimEmployee where VacationHours > 80 and VacationHours < 100

Create Index IX_tblEmployee_Salary
ON DimEmployee (ParentEmployeekey ASC)

EXEC sp_help 'DimEmployee';

Drop index IX_tblEmployee_Salary ON DimEmployee;

Create table [tblEmployee]
(
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)

insert into tblEmployee values(3, 'John', 4500, 'Male', 'New York')
insert into tblEmployee values(1, 'Sam', 2500, 'Male', 'London')
insert into tblEmployee values(4, 'Sara', 5500, 'Female', 'Tokyo')
insert into tblEmployee values(5, 'Todd', 3100, 'Male', 'Toronto')
insert into tblEmployee values(2, 'Pam', 6500, 'Female', 'Sydney')

Select * from tblEmployee

Create Clustered Index
IX_tblEmployee_Gender_Salary
ON tblEmployee (Gender DESC, Salary ASC)

Create table [tblEmployee]
(
[Id] int Primary Key,
[FirstName] nvarchar(50),
[LastName] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)

Execute sp_helpindex tblEmployee


Insert into tblEmployee Values(1, 'Mike', 'Sandoz',4500, 'Male', 'New York') 
Insert into tblEmployee Values(1, 'John', 'Menco',2500, 'Male', 'London')

drop index tblEmployee.PK__tblEmplo__3214EC076968FD95

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

execute SP_HELPCONSTRAINT tblEmployee

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

Insert into tblEmployee Values(1, 'Mike', 'Sandoz',4500, 'Male', 'New York')
Insert into tblEmployee Values (2, 'Sara', 'Menco', 6500, 'Female', 'London')
Insert into tblEmployee Values (3,'John', 'Barber',2500, 'Male', 'Sydney')
Insert into tblEmployee Values (4,'Pam', 'Grove',3500, 'Female', 'Toronto')
Insert into tblEmployee Values (5,'James', 'Mirch',7500, 'Male', 'London')

Create NonClustered Index IX_tblEmployee_Salary
On tblEmployee (Salary Asc)

Delete from tblEmployee where Salary = 2500
Update tblEmployee Set Salary = 9000 where Salary = 7500

Select * from tblEmployee order by Salary Desc

Select Salary, COUNT(Salary) as Total
from tblEmployee
Group by Salary
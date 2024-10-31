use AdventureWorksDW2019
--32
Create Function fn_ILTVF_GetEmployees()
Returns Table
as
Return (Select EmployeeKey, FirstName, Cast (BirthDate as Date) as DOB 
From DimEmployee)

Create Function
fn_MSTVF_GetEmployees()
Returns @Table Table (Id int, Name nvarchar(20), DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as Date)
From DimEmployee
Return
End

Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()

Update fn_ILTVF_GetEmployees() set FirstName='Sam1' Where EmployeeKey = 1

Create Function fn_GetEmloyeeNameById(@EmployeeKey int)
Returns nvarchar(20)
as
Begin
Return (Select EmergencyContactName from DimEmployee Where EmployeeKey = @EmployeeKey)
End

Alter Function fn_GetEmloyeeNameById(@EmployeeKey int)
Returns nvarchar(20)
With Encryption
as
begin
Return (Select EmergencyContactName from DimEmployee Where EmployeeKey = @EmployeeKey)
End

Alter Function fn_GetEmloyeeNameById(@EmployeeKey int)
Returns nvarchar(20)
With SchemaBinding
as
Begin
Return (Select EmergencyContactName from DimEmployee Where EmployeeKey = @EmployeeKey)
End

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

Create table tblDepartment
(
Deptid int Primary Key,
DeptName nvarchar(20)
)

Create table tblEmployee2
(
Id int Primary Key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
Departmentid int
)


Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2, 'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')
Insert into tblEmployee2 values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee2 values (2, 'Mike', 3400, 'Male', 2)
Insert into tblEmployee2 values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee2 values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee2 values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee2 values (6,'Ben', 4800, 'Male', 3)


Select Id, Name, Salary, Gender, DeptName
from tblEmployee2
join tblDepartment
on tblEmployee2.Departmentid = tblDepartment.Deptid



Create View VWEmployeesByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee2
join tblDepartment
on tblEmployee2.Departmentid = tblDepartment.Deptid


Create View VWITDepartment_Employees as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee2
join tblDepartment
on tblEmployee2.Departmentid = tblDepartment.Deptid
where tblDepartment.DeptName = 'IT'


Create View VWEmployeesNonConfidentialData
as
Select Id, Name, Gender, DeptName
from tblEmployee2
join tblDepartment
on tblEmployee2.Departmentid = tblDepartment.Deptid


Create View vwEmployeesCountByDepartment 
as
Select DeptName, COUNT(Id) as TotalEmployees 
from tblEmployee2
join tblDepartment
on tblEmployee2.Departmentid = tblDepartment.Deptid Group By DeptName


Create view vwEmployeesDataExceptSalary
as
Select Id, Name, Gender, Departmentid
from tblEmployee2

Update vwEmployeesDataExceptSalary
Set Name = 'Mikey' Where id = 2

Delete from vwEmployeesDataExceptSalary where id = 2
Insert into vwEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2)


Create view vwEmployeeDetailsByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee2
join tblDepartment
on tblEmployee2.Departmentid = tblDepartment.Deptid

Update vwEmployeeDetailsByDepartment
set DeptName='IT' where Name = 'John'

Create trigger trMyFirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
  Print 'New table created'
END

Create table test (id int)


ALTER TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
Print 'A table has just been created, modified or deleted'
END


ALTER TRIGGER trMyFirstTrigger ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
Rollback
Print 'You cannot create, alter or drop a table' 
END


CREATE TRIGGER trRenameTable
ON DATABASE
FOR RENAME
AS
BEGIN
Print 'You just renamed something'
END


CREATE TRIGGER tr_DatabaseScopeTrigger 
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE AS
BEGIN
ROLLBACK
Print 'You cannot create, alter or drop a table in the current database' 
END


CREATE TRIGGER tr_ServerScopeTrigger 
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE AS
BEGIN
ROLLBACK
Print 'You cannot create, alter or drop a table in any database on the server' 
END

Disable trigger tr_serverScopeTrigger on all server

Enable trigger tr_ServerScopeTrigger On all server

drop trigger tr_ServerScopeTrigger On all server
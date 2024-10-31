use AdventureWorksDW2019
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
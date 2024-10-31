use AdventureWorksDW2019
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


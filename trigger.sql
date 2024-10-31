use AdventureWorksDW2019
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
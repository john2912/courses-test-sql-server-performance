---
title       : Test database, table, role, and schema creation
description : Tests creating databases, creating tables, creating temp tables, bulk insert
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf


--- type:NormalExercise lang:sql xp:100 skills:1 key:cb66db1651
## Creating a database

Can we create a database?

**This code works if you run it in two stages: creating a database first, then querying. It doesn't work if you run it in one go.**

Presumably the problem is that the two statements need to be separated by `GO` commands. See [feature request](https://trello.com/c/PHJFOQ0N/94-support-t-sql-go-keyword).

*** =instructions

- Run the code to create a database named `mydb` using `CREATE DATABASE`.

*** =hint

*** =pre_exercise_code
```{sql}
'___BLOCK_SOLUTION_EXEC___'
# replace "sa" with "user_readonly" to restrict access
connect("", "", full_path="mssql+pyodbc://sa:12345abcdefG@localhost:1433/AdventureWorksLT?driver=FreeTDS")
# specify which schema to show tables from
# set_options(view_schema = "SalesLT")
```

*** =sample_code
```{sql}
/* Example A from
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-database-sql-server-transact-sql
but without the GO keyword
*/
USE master;

CREATE DATABASE mydb;

SELECT name, size, size * 1.0 / 128 AS [Size in MBs]
  FROM sys.master_files
  WHERE name = N'mydb';
```

*** =solution
```{sql}
/* Example A from
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-database-sql-server-transact-sql
but without the GO keyword
*/
USE master;

CREATE DATABASE mydb;

SELECT name, size, size * 1.0 / 128 AS [Size in MBs]
  FROM sys.master_files
  WHERE name = N'mydb'; 
```

*** =sct
```{sql}

```



--- type:NormalExercise lang:sql xp:100 skills:1 key:f402b5ae47
## Adding a table to a database

Can we add a table to a database, and insert some data?

**The CREATE TABLE step appears to be failing.** Should it have a different schema?

*** =instructions

The database `mydb` has been created for you.

- Run the code to add a table named `mytable` to `mydb` and insert a row of data.

*** =hint

*** =pre_exercise_code
```{sql}
'___BLOCK_SOLUTION_EXEC___'
connect("", "", full_path="mssql+pyodbc://sa:12345abcdefG@localhost:1433/AdventureWorksLT?driver=FreeTDS")

```

*** =sample_code
```{sql}
/* Adapted from 
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql
https://technet.microsoft.com/en-us/library/dd776381(v=sql.105).aspx#BasicSyntax
*/
USE master;
CREATE DATABASE mydb;
CREATE TABLE dbo.mytable(x INT);
INSERT INTO dbo.mytable
  VALUES (99);
SELECT * FROM dbo.mytable;
```

*** =solution
```{sql}
/* Adapted from 
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql
https://technet.microsoft.com/en-us/library/dd776381(v=sql.105).aspx#BasicSyntax
*/
USE master;
CREATE DATABASE mydb;
CREATE TABLE dbo.mytable(x INT);
INSERT INTO dbo.mytable
  VALUES (99);
SELECT * FROM dbo.mytable;
```

*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:5c4a8be91c
## Creating a temp table

Same as last exercise, but with a temp table.

**This is currently giving the error `Invalid object name '#mytable'`.**

*** =instructions
- Run the code to create a temp table named `#mytable` and insert a row of data.

*** =hint

*** =pre_exercise_code
```{sql}
'___BLOCK_SOLUTION_EXEC___'
connect("", "", full_path="mssql+pyodbc://sa:12345abcdefG@localhost:1433/AdventureWorksLT?driver=FreeTDS")
```

*** =sample_code
```{sql}
CREATE TABLE #mytable(x INT);
INSERT INTO #mytable
  VALUES (99);
SELECT * FROM #mytable;
```

*** =solution
```{sql}
CREATE TABLE #mytable(x INT);
INSERT INTO #mytable
  VALUES (99);
SELECT * FROM #mytable;
```

*** =sct
```{sql}

```


--- type:NormalExercise lang:sql xp:100 skills:1 key:2d99909834
## Bulk insert from CSV file

Bulk insert data from a CSV file.

**Currently not working, though possibly due to temp table creation problems.**

*** =instructions

- Run the code to import data from a CSV file into a temp table.

*** =hint

*** =pre_exercise_code
```{sql}
'___BLOCK_SOLUTION_EXEC___'
connect("", "", full_path="mssql+pyodbc://sa:12345abcdefG@localhost:1433/AdventureWorksLT?driver=FreeTDS")
```

*** =sample_code
```{sql}
/* Adapted from
https://docs.microsoft.com/en-us/sql/t-sql/statements/bulk-insert-transact-sql
*/
BULK INSERT #locations
  FROM 'https://s3.amazonaws.com/assets.datacamp.com/production/course_5401/datasets/locations.csv'
  WITH(
    FIELDTERMINATOR =',',  
    ROWTERMINATOR = '\n'
  );
SELECT * FROM #locations
```

*** =solution
```{sql}
/* Adapted from
https://docs.microsoft.com/en-us/sql/t-sql/statements/bulk-insert-transact-sql
*/
BULK INSERT #locations
  FROM 'https://s3.amazonaws.com/assets.datacamp.com/production/course_5401/datasets/locations.csv'
  WITH(
    FIELDTERMINATOR =',',  
    ROWTERMINATOR = '\n'
  );
SELECT * FROM #locations
```


*** =sct
```{sql}

```

--- type:NormalExercise lang:sql xp:100 skills:1 key:26a3153318
## Create role

Can we create database roles?

**It works!**

*** =instructions

- Run the code to create an `instructor` role, and query all roles.

*** =hint

*** =pre_exercise_code
```{sql}
'___BLOCK_SOLUTION_EXEC___'
connect("", "", full_path="mssql+pyodbc://sa:12345abcdefG@localhost:1433/AdventureWorksLT?driver=FreeTDS")
```

*** =sample_code
```{sql}
/* Adapted from
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-role-transact-sql
*/
CREATE ROLE instructor AUTHORIZATION db_datareader;

SELECT *
  FROM sysusers
  WHERE issqlrole = 1 AND name = 'instructor';
```

*** =solution
```{sql}
/* Adapted from
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-role-transact-sql
*/
CREATE ROLE instructor AUTHORIZATION db_datareader;

SELECT *
  FROM sysusers
  WHERE issqlrole = 1 AND name = 'instructor';
```

*** =sct
```{sql}

```


--- type:NormalExercise lang:sql xp:100 skills:1 key:b28aa0a032
## Create Schema

Can we create a schema, and a table within it?

**`CREATE SCHEMA` seems to run OK, but then can't find the schema.**

*** =instructions

- Run the code to create a `Sales` schema, and query to check it exists.

*** =hint

*** =pre_exercise_code
```{sql}
'___BLOCK_SOLUTION_EXEC___'
connect("", "", full_path="mssql+pyodbc://sa:12345abcdefG@localhost:1433/AdventureWorksLT?driver=FreeTDS")
```

*** =sample_code
```{sql}
/* From example B in
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-schema-transact-sql
*/
CREATE SCHEMA MySchema;  

SELECT * FROM sys.schemas WHERE name = 'MySchema';
```

*** =solution
```{sql}
/* From example B in
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-schema-transact-sql
*/
CREATE SCHEMA MySchema;  

SELECT * FROM sys.schemas WHERE name = 'MySchema';
```

*** =sct
```{sql}

```

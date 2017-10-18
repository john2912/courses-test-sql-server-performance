---
title       : Test database creation
description : Tests creating databases, creating tables, creating temp tables, bulk insert
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf


--- type:NormalExercise lang:sql xp:100 skills:1 key:cb66db1651
## Creating a database

Can we create a database?

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

Can we add a table to a database?

**The CREATE TABLE step appears to be failing.** Should it have a different schema?

*** =instructions

The database `mydb` has been created for you.

- Run the code to add a table named `mytable` to `mydb`.

*** =hint

*** =pre_exercise_code
```{sql}
'___BLOCK_SOLUTION_EXEC___'
connect("", "", full_path="mssql+pyodbc://sa:12345abcdefG@localhost:1433/AdventureWorksLT?driver=FreeTDS")

```

*** =sample_code
```{sql}
USE master;
CREATE DATABASE mydb;
CREATE TABLE dbo.mytable(x INT);
INSERT INTO dbo.mytable
  VALUES (99);
SELECT * FROM dbo.mytable;
```

*** =solution
```{sql}
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

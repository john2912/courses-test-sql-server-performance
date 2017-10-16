---
title       : Test database creation
description : Tests creating databases, creating tables, creating temp tables, bulk insert
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf


--- type:NormalExercise lang:sql xp:100 skills:1 key:cb66db1651
## Creating a database


*** =instructions

- Create a database named `mytest` using `CREATE DATABASE`.

*** =hint

*** =pre_exercise_code
```{sql}

```

*** =sample_code
```{sql}
USE master;  
GO  
CREATE DATABASE mytest;  
GO  
-- Verify the database files and sizes  
SELECT name, size, size*1.0/128 AS [Size in MBs]   
FROM sys.master_files  
WHERE name = N'mytest';  
GO  
```

*** =solution
```{sql}
USE master;  
GO  
CREATE DATABASE mytest;  
GO  
-- Verify the database files and sizes  
SELECT name, size, size*1.0/128 AS [Size in MBs]   
FROM sys.master_files  
WHERE name = N'mytest';  
GO  
```

*** =sct
```{sql}

```

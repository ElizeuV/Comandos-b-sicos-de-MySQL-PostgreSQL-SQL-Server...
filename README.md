# SQL
Comandos básicos MySQL, PostgreSQL

1. CREATE
CREATE command is used to create a table, schema or an index.

Syntax:
         CREATE TABLE table_name (
                column1 datatype,
                column2 datatype,
                ....);
2. ALTER
ALTER command is used to add, modify or delete columns or constraints from the database table.

Syntax
ALTER TABLE Table_name ADD column_name datatype;
3. TRUNCATE:
TRUNCATE command is used to delete the data present in the table but this will not delete the table.

Syntax
TRUNCATE table table_name;
4. DROP
DROP command is used to delete the table along with its data.

Syntax
DROP TABLE table_name;
5. RENAME
RENAME command is used to rename the table name.

Syntax
ALTER TABLE table_name1 RENAME to new_table_name1; 
6. INSERT
INSERT Statement is used to insert new records into the database table.

Syntax
INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);
7. SELECT
Select statement is used to select data from database tables.

Syntax:
SELECT column1, column2, ...
FROM table_name; 
8. UPDATE
UPDATE statement is used to modify the existing values of records present in the database table.

Syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition; 
9. DELETE
DELETE statement is used to delete the existing records present in the database table.

Syntax
DELETE FROM table_name where condition;

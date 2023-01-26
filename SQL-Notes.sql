/*
LEARNING POSTGRESQL
*/

/*
ENTITY-RELATIONSHIP DIAGRAMS
An entity relationship diagram (ERD) is a common way to view data in a database. Below is the ERD for the database we
will use from Parch & Posey. These diagrams help you visualize the data you are analyzing including:
-- The names of the tables.
-- The columns in each table.
-- The way the tables work together.
*/


/*
In the Parch & Posey database there are five tables (essentially 5 spreadsheets):
    -- web_events
    -- accounts
    -- orders
    -- sales_reps
    -- region
You can think of each of these tables as an individual spreadsheet.
*/


/*
OUTLINE OF THE COURSE
SQL Basics - Here you will get your first taste at how SQL works, and learn the basics of the SQL language. You will
learn how to write code to interact with tables similar to the ones we analyzed in Excel earlier. Specifically, you
will learn a little about databases, the basic syntax of SQL, and you will write your first queries!

SQL Joins - In this lesson, you will learn the real power of SQL. You will learn about Entity Relationship Diagrams
(ERDs), and how to join multiple tables together from a relational database. The power to join tables is what really
moved companies to adopt this approach to holding data.

SQL Aggregations - In this final lesson, you will learn some more advanced features of SQL. You will gain the ability
to summarize data from multiple tables in a database.
*/


/*
WHY DO BUSINESSES USE DATABASES?
Data integrity is ensured - only the data you want entered is entered, and only certain users are able to enter data
into the database.

Data can be accessed quickly - SQL allows you to obtain results very quickly from the data stored in a database. Code
can be optimized to quickly pull results.

Data is easily shared - multiple individuals can access data stored in a database, and the data is the same for all
users allowing for consistent results for anyone with access to your database.
*/


/*
HOW DATABASE STORE DATA
    1. Data in databases is stored in tables that can be thought of just like Excel spreadsheets.
    2. All the data in the same column must match in terms of data type.
    3. Consistent column types are one of the main reasons working with databases is fast.
*/


/*
TYPES OF SQL STATEMENTS
    1. SELECT - used to retrieve data from a database.
    2. UPDATE - used to update existing data within a database.
    3. DELETE - used to delete records from a database.
    4. INSERT INTO - used to insert new data into a database.
    5. CREATE DATABASE - used to create a new database.
    6. ALTER DATABASE - used to modify a database.
    7. CREATE TABLE - used to create a new table.
    8. ALTER TABLE - used to modify a table.
    9. DROP TABLE - used to delete a table.
    10. CREATE INDEX - used to create an index (search key).
    11. DROP INDEX - used to delete an index.
*/


/*
SELECT STATEMENT
    1. The SELECT statement is used to query the database.
    2. The data returned is stored in a result table, called the result-set.
    3. The result-set is analogous to a spreadsheet with rows and columns.
    4. The SELECT statement is the most common SQL statement.

An example of a SELECT statement:

    SELECT column_name(s)
    FROM table_name
    WHERE column_name operator value
*/

-- select all data from orders table
SELECT *
FROM orders;
/*
From the table returned above, we can see that a SELECT statement returns:
1. The column names.
2. The data in each column.
3. The number of rows returned.

It is also possible to select only certain columns from a table. For example, if we only wanted to see the id,
account_id, and occurred_at columns from the orders table, we could write the following query:
*/


-- select id, account_id, and occurred_at from orders table
SELECT id, account_id, occurred_at
FROM orders;
/*
The result of this query is the same as the previous query, except that we only see the id, account_id, and
occurred_at columns.
*/


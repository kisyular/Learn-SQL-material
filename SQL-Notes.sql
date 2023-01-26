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

/*
LIMIT
The LIMIT statement is useful when you want to see just the first few rows of a table.
The LIMIT command is always the very last part of a query.

For example, if we wanted to see the first 5 rows of the orders table, we could write the following query:
SELECT *
FROM orders
LIMIT 5;
*/

-- select the first 10 rows from the orders table and return the id, account_id, and occurred_at columns
SELECT id, account_id, occurred_at
FROM orders
LIMIT 10;
/*
The result of this query is the same as the previous query, except that the result only contains the first 10 rows
*/

/*
ORDER BY
The ORDER BY statement allows us to sort our results using the data in any column.
The ORDER BY statement always comes in a query after the SELECT and FROM statements, but before the LIMIT statement.
*/

/*
For example, if we wanted to see the first 10 rows of the orders table, sorted by the occurred_at column, we could
write the following query:
SELECT *
FROM orders
ORDER BY occurred_at
*/

-- select the first 100 rows from the orders table order by occurred_at in descending order
SELECT *
FROM orders
ORDER BY occurred_at DESC
LIMIT 100;


-- the 15 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 15;
/*
The result is sorted by the occurred_at column in ascending order. The earliest order is at the top of the table.
*/


-- the top 20 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd columns
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 20;

-- the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd columns
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

-- Include the id, account_id, and total_amt_usd columns, limit the results to 10 rows, and order by both account_id
-- and total_amt_usd in descending order
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id DESC, total_amt_usd DESC
LIMIT 5;

-- query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the
-- account ID (in ascending order), and then by the total dollar amount (in descending order).
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC
LIMIT 5;

-- query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the total
-- dollar amount (in descending order), and then by the account ID (in ascending order). Limit the results to 15 rows.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id
LIMIT 15;
/*
The result is sorted by the total_amt_usd column in descending order, and then by the account_id column in
ascending order. We can use multiple columns in the ORDER BY statement to sort by multiple columns.
*/


/*
WHERE
The WHERE statement allows us to filter the results of a query based on a condition.
The WHERE statement always comes after the FROM statement, but before the ORDER BY and LIMIT statements.
Common symbols used in WHERE statements include:
    -- = equal to
    -- != not equal to
    -- > greater than
    -- < less than
    -- >= greater than or equal to
    -- <= less than or equal to
    -- BETWEEN - between a certain range
    -- IN - to specify multiple possible values for a column
*/

-- Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than
-- or equal to 1000.
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;


-- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

-- Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) just
-- for the Exxon Mobil company in the accounts table.
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- Derived Columns - columns that are created from other columns in the same table or from other tables.
-- For example, if we wanted to see the total amount of sales for each account, we could write the following query:
SELECT id, account_id, total_amt_usd, total_amt_usd * 10 AS total_amt_eur
FROM orders
LIMIT 10;
/*
 The result of this query is the same as the previous query, except that we have added a new column called
 total_amt_eur. This column is a derived column, because it is created from the total_amt_usd multiplied by 10.
*/

--Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for
-- each order. Limit the results to the first 10 orders, and include the id and account_id fields.
SELECT id, account_id, standard_amt_usd / standard_qty AS standard_unit_price
FROM orders
LIMIT 10;


/*
LIKE
LIKE This allows you to perform operations similar to using WHERE and =, but for cases when you might not know
exactly what you are looking for.

IN This allows you to perform operations similar to using WHERE and =, but for more than one condition.
NOT This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
AND & BETWEEN These allow you to combine operations where all combined conditions must be true.
OR This allows you to combine operations where at least one of the combined conditions must be true.
*/

-- All the companies whose names start with 'C'.
SELECT *
FROM accounts
WHERE name LIKE 'C%'
LIMIT 10;

-- All companies whose names contain the string 'one' somewhere in the name.
SELECT *
FROM accounts
WHERE name LIKE '%one%';

-- All companies whose names end with 's'.
SELECT *
FROM accounts
WHERE name LIKE '%s'
LIMIT 10;

-- Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

-- Use the web_events table to find all information regarding individuals who were contacted via the channel of organic
-- or adwords.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')
LIMIT 5;

-- Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target,
-- and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

-- Use the web_events table to find all information regarding individuals who were contacted via any method except using
-- organic or adwords methods.
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');


-- All the companies whose names do not start with 'C'.
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%';


-- All companies whose names do not contain the string 'one' somewhere in the name.
SELECT *
FROM accounts
WHERE name NOT LIKE '%one%';

-- All companies whose names do not end with 's'.
SELECT *
FROM accounts
WHERE name NOT LIKE '%s';


-- Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the
-- gloss_qty is 0.
SELECT *
FROM orders
WHERE standard_qty > 1000
  AND poster_qty = 0
  AND gloss_qty = 0;

-- Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%'
  AND name NOT LIKE '%s';

-- Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords
-- channels, and started their account at any point in 2016, sorted from newest to oldest.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')
  AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

-- Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the
-- resulting table.
SELECT id
FROM orders
WHERE gloss_qty > 4000
   OR poster_qty > 4000;

-- Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is
-- over 1000.
SELECT *
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but
-- it doesn't contain 'eana'.
SELECT name, primary_poc
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%' OR primary_poc NOT LIKE '%eana%');


/*
DATABASE NORMALIZATION
-- Normalization is a process used to organize a database into tables and columns.
-- The idea is that a table should be about a specific topic and only supporting topics included.
-- By limiting a table to one purpose you reduce the number of duplicate data contained within your database.
-- There are three main reasons to normalize a database:
    -- Minimize duplicate data
    -- Minimize or avoid data modification issues
    -- Simplify queries
-- There are three common forms of database normalization: 1st, 2nd, and 3rd normal form.
-- First Normal Form - The information is stored in a relational table with each column containing atomic values.
-- There are no repeating groups of columns.
-- Second Normal Form - The table is in first normal form and all the columns depend on the table's primary key.
-- Third Normal Form - the table is in second normal form and all of its columns are not transitively dependent on
the primary key.
*/

/*
1st Normal Form
-- The information is stored in a relational table with each column containing atomic values.
-- There are no repeating groups of columns.
-- Example:
    -- Consider a table called students that contains the following columns:
        -- id
        -- name
        -- address
        -- phone
    -- The table is in first normal form because each column contains atomic values.
    -- There are no repeating groups of columns.
*/


/*
2nd Normal Form
    -- The table is in first normal form and all the columns depend on the table's primary key.
    -- Example:
        -- Consider a table called students that contains the following columns:
            -- id
            -- name
            -- address
            -- phone
        -- The table is in first normal form because each column contains atomic values.
        -- There are no repeating groups of columns.
        -- The table is in second normal form because all the columns depend on the table's primary key.
*/

/*
3rd Normal Form
    -- The table is in second normal form and all of its columns are not transitively dependent on the primary key.
    -- Example:
        -- Consider a table called students that contains the following columns:
            -- id
            -- name
            -- address
            -- phone
        -- The table is in first normal form because each column contains atomic values.
        -- There are no repeating groups of columns.
        -- The table is in second normal form because all the columns depend on the table's primary key.
        -- The table is in third normal form because none of its columns are transitively dependent on the primary key.
*/


/*
ENTITY RELATIONSHIP DIAGRAMS
From the last lesson, you might remember that an entity relationship diagram (ERD) is a common way to view data in a
database. It is also a key element to understanding how we can pull data from multiple tables.

If you look a little closer, you might notice that the PK is associated with the first column in every table. The PK
here stands for primary key. A primary key exists in every table, and it is a column that has a unique value for every
row.

PRIMARY KEY (PK)
A primary key is a unique column in a particular table. This is the first column in each of our tables. Here, those
columns are all called id, but that doesn't necessarily have to be the name. It is common that the primary key is the
first column in our tables in most databases.

FOREIGN KEY (FK)
A foreign key is a column in one table that is a primary key in a different table. We can see in the Parch & Posey
ERD that the foreign keys are:
region_id
account_id
sales_rep_id

That's right! Foreign keys are always associated with a primary key, and they are associated with the crow-foot notation
above to show they can appear multiple times in a particular table.

Then in the ON, we will ALWAYS have the PK equal to the FK:
*/


/*
JOIN
-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
-- The most common type of JOIN is the INNER JOIN, which returns all rows when there is at least one match in both
tables.
-- The following are the different types of JOINs:
    -- INNER JOIN: Returns all rows when there is at least one match in both tables
    -- LEFT JOIN: Returns all rows from the left table, and the matched rows from the right table
    -- RIGHT JOIN: Returns all rows from the right table, and the matched rows from the left table
    -- FULL JOIN: Returns all rows when there is a match in one of the tables
*/

/*
INNER JOIN
-- The INNER JOIN keyword selects all rows from both tables as long as there is a match between the columns in both
tables.
-- The following statement selects all orders and the account name for each order from the orders and accounts
tables.
*/

-- Try pulling all the data from the accounts table, and all the data from the orders table.
SELECT orders.*, accounts.*
FROM accounts
         JOIN orders ON accounts.id = orders.account_id;


-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and then website and the primary_poc
-- from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM accounts
         JOIN orders ON accounts.id = orders.account_id;


-- pull data from web_events, accounts, and orders tables using a JOIN.
SELECT web_events.*, accounts.*, orders.*
FROM web_events
         JOIN accounts ON web_events.account_id = accounts.id
         JOIN orders ON accounts.id = orders.account_id;

-- pull data from web_events, accounts, and orders tables using a JOIN using ALIAS a for accounts, w for web_events and
-- o for orders.
SELECT w.*, a.*, o.*
FROM web_events AS w
         JOIN accounts AS a ON w.account_id = a.id
         JOIN orders AS o ON a.id = o.account_id;

-- Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure
-- to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add
-- a fourth column to assure only Walmart events were chosen.
SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events AS w
         JOIN accounts AS a ON w.account_id = a.id
WHERE a.name = 'Walmart';


-- Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table
-- should include three columns: the region name, the sales rep name, and the account name. Sort the accounts
-- alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
         JOIN region r
              ON s.region_id = r.id
         JOIN accounts a
              ON a.sales_rep_id = s.id
ORDER BY a.name;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid
-- (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit
-- price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name region, a.name account, o.total_amt_usd / (o.total + 0.01) unit_price
FROM region r
         JOIN sales_reps s
              ON s.region_id = r.id
         JOIN accounts a
              ON a.sales_rep_id = s.id
         JOIN orders o
              ON o.account_id = a.id
ORDER BY r.name DESC;


-- Lets create a customer table
CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    first_name  VARCHAR(255) NOT NULL,
    last_name   VARCHAR(255) NOT NULL,
    email       VARCHAR(255) NOT NULL,
    address     VARCHAR(255) NOT NULL
);

-- Insert data into the customers table
INSERT INTO customers (customer_id, first_name, last_name, email, address)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '123 Main St.'),
       (2, 'Jane', 'Doe', 'janedoe@example.com', '456 Park Ave.'),
       (3, 'Bob', 'Smith', 'bobsmith@example.com', '789 Elm St.');

-- Create products table
CREATE TABLE products
(
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(255)   NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL
);

-- Insert data into the products table
INSERT INTO products (product_id, product_name, product_price)
VALUES (1, 'Product 1', 10.00),
       (2, 'Product 2', 20.00),
       (3, 'Product 3', 30.00),
       (4, 'Product 4', 40.00),
       (5, 'Product 5', 50.00);


-- Create a table for orders
CREATE TABLE orders_join
(
    order_id    INT PRIMARY KEY,
    customer_id INT            NOT NULL,
    product_id  INT            NOT NULL,
    order_date  DATE           NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- Insert data into the orders table
INSERT INTO orders_join (order_id, customer_id, product_id, order_date, total_price)
VALUES (1, 1, 1, '2022-01-01', 100.00),
       (2, 2, 2, '2022-01-02', 50.00),
       (3, 1, 3, '2022-01-03', 75.00),
       (4, 3, 1, '2022-01-04', 200.00),
       (5, 2, 5, '2022-01-05', 100.00),
       (6, 3, 4, '2022-01-06', 80.00);

/*
INNER JOIN
An INNER JOIN in SQL is used to combine rows from two or more tables based on a related column between them.
The result of an INNER JOIN only includes rows where there is a match in both tables.
For example, if we have a table of customers and a table of orders, we can use the customer_id column to combine
the two tables and only include orders where there is a matching customer_id.
Example:
SELECT *
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
*/

SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, o.total_price
FROM orders_join as o
         INNER JOIN customers as c
                    ON o.customer_id = c.customer_id;
/*
This SQL statement combines data from the "orders" table and the "customers" table, and returns all columns from both
tables where the customer_id column in the "orders" table matches the customer_id column in the "customers" table. It
returns only the matching row from both tables.
*/

SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, o.total_price
FROM orders_join as o
         JOIN customers as c
              ON o.customer_id = c.customer_id;
-- It would give the same result.

/*
You can think of an INNER JOIN as an intersection of two tables, meaning it returns only the rows where there is a
match in both tables.

You can also use the JOIN keyword instead of the INNER JOIN, since INNER JOIN is the default behaviour.

To learn more about INNER JOIN, let's look at a more complex example. We have a table of customers, a table of
orders, and a table of products. We can use the customer_id column in the "orders" table to combine it with the
"customers" table, and the product_id column in the "orders" table to combine it with the "products" table.
*/

SELECT customers.first_name, customers.last_name, orders_join.order_date, products.product_name
FROM customers
         INNER JOIN orders_join
                    ON customers.customer_id = orders_join.customer_id
         INNER JOIN products
                    ON orders_join.product_id = products.product_id;
/*
The query I provided uses INNER JOIN to combine data from three tables: customers, orders, and products. The query
returns the first_name, last_name, order_date and product_name of all customers along with the products they ordered.
*/


SELECT customers.first_name, customers.last_name, orders_join.order_date, products.product_name
FROM customers
         INNER JOIN orders_join
                    ON customers.customer_id = orders_join.customer_id
         INNER JOIN products
                    ON orders_join.product_id = products.product_id;
/*
Here is how the query works step-by-step:

The query starts by selecting the first_name, last_name, order_date and product_name columns from the customers table.

Then it uses the INNER JOIN keyword to combine the customers table with the orders table. The ON clause specifies that
the join should be based on the customer_id column of the customers table matching the customer_id column of the orders
table.

After that, it uses another INNER JOIN keyword to combine the orders table with the products table. The ON clause
specifies that the join should be based on the product_id column of the orders table matching the product_id column of
the products table.

The final result of the query will be the customer first_name, last_name, order_date and product_name that only have
matches on the customer_id and product_id in customers, orders, and products table.

This query will return only the rows where there are matches in all three tables. If a customer or a product does not
have a matching order it will not be in the results, so it only returns the records where there is a match between
customer, product and order in the respective id columns.
*/

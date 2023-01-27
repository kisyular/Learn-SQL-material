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


/*
Let's look at another example. We have a table of join_accounts and a table of join_orders. We can use the account_id
column in the "join_orders" table to combine it with the "join_accounts" table.
*/

-- create a table called join_accounts with column id and name
CREATE TABLE join_accounts
(
    id   INTEGER PRIMARY KEY,
    name TEXT
);
-- insert data into join_accounts
INSERT INTO join_accounts (id, name)
VALUES (1001, 'Walmart'),
       (1011, 'Exxon Mobil'),
       (1021, 'Apple');

-- create a table called join_orders with column id, account_id, and total
CREATE TABLE join_orders
(
    id         INTEGER PRIMARY KEY,
    account_id INTEGER,
    total      INTEGER
);
-- insert data into join_orders
INSERT INTO join_orders (id, account_id, total)
VALUES (1, 1001, 169),
       (2, 1001, 288),
       (17, 1011, 541),
       (18, 1021, 539),
       (19, 1021, 558),
       (24, 1031, 1363);


-- Pull data for join_accounts
SELECT *
FROM join_accounts;


-- Pull data for join_orders
SELECT *
FROM join_orders;


-- Perform an inner join on the join_accounts and join_orders tables. The join should be on the account_id column in
-- join_orders and the id column in join_accounts. The final table should have three columns: id, name, and total.
SELECT a.id, a.name, o.total
FROM join_accounts a
         JOIN join_orders o ON a.id = o.account_id;

/*
LEFT JOIN
A LEFT JOIN also known as a LEFT OUTER JOIN in SQL is used to combine rows from two or more tables based on a related
column between them.
The result of a LEFT JOIN includes all rows from the left table (table1), with the matching rows in the right table
(table2). If there is no match, the result will still include the row from the left table, but with NULL in the columns
from the right table.

Here's an example of a LEFT JOIN:
SELECT *
FROM customers
LEFT JOIN orders_join
ON customers.customer_id = orders_join.customer_id;
*/

SELECT *
FROM customers
         LEFT JOIN orders_join
                   ON customers.customer_id = orders_join.customer_id;
/*
This query will combine data from the "customers" table and the "orders" table, and return all columns from both
tables where the customer_id column in the "customers" table matches the customer_id column in the "orders" table.
However, it will also return all the rows from the "customers" table, even if there is no match in the "orders" table.
The result set will contain NULL values for all columns from the "orders" table for the non-matching rows from the
"customers" table.

You can think of a LEFT JOIN as an union of two tables, where all the rows from the left table are included in the
result set and the matching rows from the right table are included. If a row from left table does not have a match in
the right table, the non-matching fields will be filled with NULL values.

You can use the LEFT JOIN to combine data from three tables as well. Let's look at an example:

SELECT customers.first_name, customers.last_name, orders_join.order_date, products.product_name
FROM orders_join
LEFT JOIN customers
ON orders_join.customer_id = customers.customer_id
LEFT JOIN products
ON orders_join.product_id = products.product_id;
*/

SELECT customers.first_name, customers.last_name, orders_join.order_date, products.product_name
FROM orders_join
         LEFT JOIN customers
                   ON orders_join.customer_id = customers.customer_id
         LEFT JOIN products
                   ON orders_join.product_id = products.product_id;

/*
This query will combine data from the "orders" table, the "customers" table, and the "products" table by joining them
based on the customer_id and product_id columns, respectively. It will return all columns from all three tables where
the customer_id column in the "orders" table matches the customer_id column in the "customers" table, and product_id
column in the "orders" table matches the product_id column in the "products" table.

However, it will also return all the rows from the "orders" table, even if there is no match in the "customers" table
or in the "products" table. The result set will contain NULL values for the first_name, last_name, and product_name
columns from the "customers" and "products" table for the non-matching rows from the "orders" table.

It is important to notice that since the orders table is the left table, all the rows will be in the result set, so
even if there is no match between the order, customer and product, the order will be in the results, with NULL values
in the customer and product columns.
*/

-- Perform a left join on the join_accounts and join_orders tables. The join should be on the account_id column in
-- join_orders and the id column in join_accounts. The final table should have three columns: id, name, and total.
SELECT a.id, a.name, o.total
FROM join_accounts a
         LEFT JOIN join_orders o ON a.id = o.account_id;


/*
RIGHT JOIN
A RIGHT JOIN also known as a RIGHT OUTER JOIN in SQL is used to combine rows from two or more tables based on a
related column between them.
The result of a RIGHT JOIN includes all rows from the right table (table2), with the matching rows in the left table
(table1). If there is no match, the result will still include the row from the right table, but with NULL in the columns
from the left table.

Here's an example of a RIGHT JOIN:

SELECT *
FROM join_accounts
RIGHT JOIN join_orders
ON join_accounts.customer_id = join_accounts.customer_id;
*/

-- Perform a right join on the join_accounts and join_orders tables. The join should be on the account_id column in
-- join_orders and the id column in join_accounts. The final table should have three columns: id, name, and total.
SELECT a.id, a.name, o.total
FROM join_orders o
         RIGHT JOIN join_accounts a ON a.id = o.account_id;
/*
This query will combine data from the "join_accounts" table and the "Join_orders" table, and return all columns from
both tables where the account_id column in the "join_accounts" table matches the account_id column in the "join_orders"
table. However, it will also return all the rows from the "join_orders" table, even if there is no match in the
"join_accounts" table. The result set will contain NULL values for all columns from the "join_accounts" table for the
non-matching rows from the "join_orders" table.

You can think of a RIGHT JOIN as the opposite of a LEFT JOIN, all the rows from the right table are included in the
result set and the matching rows from the left table are included. If a row from right table does not have a match in
the left table, the non-matching fields will be filled with NULL values.

You can use the RIGHT JOIN to combine data from three tables as well. Let's look at an example:
SELECT customers.first_name, customers.last_name, orders.order_date, products.product_name
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id
RIGHT JOIN products
ON orders.product_id = products.product_id;
*/

SELECT customers.first_name, customers.last_name, orders_join.order_date, products.product_name
FROM customers
         RIGHT JOIN orders_join
                    ON customers.customer_id = orders_join.customer_id
         RIGHT JOIN products
                    ON orders_join.product_id = products.product_id;
/*
This query will combine data from the "customers" table, the "orders" table, and the "products" table by joining them
based on the customer_id and product_id columns, respectively. It will return all columns from all three tables where
the customer_id column in the "customers" table matches the customer_id column in the "orders" table, and product_id
column in the "products" table matches the product_id column in the "orders" table.

However, it will also return all the rows from the "products" table, even if there is no match in the "customers" table
or in the "orders" table. The result set will contain NULL values for the first_name, last_name, and order_date columns
from the "customers" and "orders" table for the non-matching rows from the "products" table.

It is important to notice that since the products table is the right table, all the rows will be in the result set, so
even if there is no match between the product, customer and order, the product will be in the results, with NULL values
in the customer and order columns.
*/


/*
FULL JOIN
A FULL JOIN also known as a FULL OUTER JOIN in SQL is used to combine rows from two or more tables based on a
related column between them.
The result of a FULL JOIN includes all rows from both tables, with the matching rows in both tables. If there is no
match, the result will still include the row from the left table, but with NULL in the columns from the right table, and
vice versa. Here's an example of a FULL JOIN:
SELECT a.id, a.name, o.total
FROM join_accounts a
FULL JOIN join_orders o ON a.id = o.account_id;
*/

-- Perform a full join on the join_accounts and join_orders tables. The join should be on the account_id column in
-- join_orders and the id column in join_accounts. The final table should have three columns: id, name, and total.
SELECT a.id, a.name, o.total
FROM join_accounts a
         FULL JOIN join_orders o ON a.id = o.account_id;
/*
This query will combine data from the "join_accounts" table and the "join_orders" table, and return all columns from
both tables where the account_id column in the "join_accounts" table matches the account_id column in the "join_orders"
table. However, it will also return all the rows from both tables, even if there is no match in the other table. The
result set will contain NULL values for all columns from the other table for the non-matching rows from the other table.
*/

-- Perform a full join on the customers, orders, and products tables. The join should be on the customer_id column in
-- orders and the customer_id column in customers, and the product_id column in orders and the product_id column in
-- products. The final table should have four columns: first_name, last_name, order_date, and product_name.
SELECT customers.first_name, customers.last_name, orders_join.order_date, products.product_name
FROM customers
         FULL JOIN orders_join
                   ON customers.customer_id = orders_join.customer_id
         FULL JOIN products
                   ON orders_join.product_id = products.product_id;

/*
This query will combine data from the "customers" table, the "orders" table, and the "products" table by joining them
based on the customer_id and product_id columns, respectively. It will return all columns from all three tables where
the customer_id column in the "customers" table matches the customer_id column in the "orders" table, and product_id
column in the "products" table matches the product_id column in the "orders" table.

However, it will also return all the rows from both tables, even if there is no match in the other table. The result set
will contain NULL values for all columns from the other table for the non-matching rows from the other table.

It is important to notice that since the products table is the right table, all the rows will be in the result set, so
even if there is no match between the product, customer and order, the product will be in the results, with NULL values
in the customer and order columns.
*/


/*
QUIZ
*/

-- Create Country table with countryID, countryName columns.
CREATE TABLE Country
(
    countryID   INT,
    countryName VARCHAR(50)
);
-- Insert data into Country table.
INSERT INTO Country (countryID, countryName)
VALUES (1, 'India'),
       (2, 'Nepal'),
       (3, 'United States'),
       (4, 'Canada'),
       (5, 'Sri Lanka'),
       (6, 'Brazil');

-- Create State table with stateID, stateName, countryID columns.
CREATE TABLE State
(
    stateID   INT,
    countryID INT,
    stateName VARCHAR(50)
);
-- Insert data into State table.
INSERT INTO State (stateID, countryID, stateName)
VALUES (1, 1, 'Maharashtra'),
       (2, 1, 'Punjab'),
       (3, 2, 'Kathmandu'),
       (4, 3, 'California'),
       (5, 3, 'Texas'),
       (6, 4, 'Alberta');

-- Select countryID, countryName and stateName from Country and State tables.
SELECT Country.countryID, Country.countryName, State.stateName
FROM Country
         JOIN State
              ON Country.countryID = State.countryID;

-- Select countryID, countryName and stateName from Country and State tables using LEFT JOIN.
SELECT Country.countryID, Country.countryName, State.stateName
FROM Country
         LEFT JOIN State
                   ON Country.countryID = State.countryID;

-- Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for
-- the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the
-- account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT region.name, sales_reps.name, accounts.name
FROM region
         JOIN sales_reps
              ON region.id = sales_reps.region_id
         JOIN accounts
              ON sales_reps.id = accounts.sales_rep_id
WHERE region.name = 'Midwest'
ORDER BY accounts.name;

-- Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for
-- accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should
-- include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically
-- (A-Z) according to account name.
SELECT region.name, sales_reps.name, accounts.name
FROM region
         JOIN sales_reps
              ON region.id = sales_reps.region_id
         JOIN accounts
              ON sales_reps.id = accounts.sales_rep_id
WHERE region.name = 'Midwest'
  AND sales_reps.name LIKE 'S%'
ORDER BY accounts.name;

-- Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for
-- accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should
-- include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically
-- (A-Z) according to account name.
SELECT region.name, sales_reps.name, accounts.name
FROM region
         JOIN sales_reps
              ON region.id = sales_reps.region_id
         JOIN accounts
              ON sales_reps.id = accounts.sales_rep_id
WHERE region.name = 'Midwest'
  AND sales_reps.name LIKE '% K%'
ORDER BY accounts.name;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid
-- (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity
-- exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid
-- a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).
SELECT region.name, accounts.name, total_amt_usd / (total + 0.01) AS unit_price
FROM region
         JOIN sales_reps
              ON region.id = sales_reps.region_id
         JOIN accounts
              ON sales_reps.id = accounts.sales_rep_id
         JOIN orders
              ON accounts.id = orders.account_id
WHERE orders.standard_qty > 100;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid
-- (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity
-- exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account
-- name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01
-- to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT region.name, accounts.name, total_amt_usd / (total + 0.01) AS unit_price
FROM region
         JOIN sales_reps
              ON region.id = sales_reps.region_id
         JOIN accounts
              ON sales_reps.id = accounts.sales_rep_id
         JOIN orders
              ON accounts.id = orders.account_id
WHERE orders.standard_qty > 100
  AND orders.poster_qty > 50
ORDER BY unit_price;

-- What are the different channels used by account id 1001? Your final table should have only 2 columns: account name
-- and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT DISTINCT accounts.name, web_events.channel
FROM accounts
         JOIN web_events
              ON accounts.id = web_events.account_id
WHERE accounts.id = 1001;

/*
The DISTINCT keyword is used to return only distinct (different) values. The result set will not contain any duplicate
values. The DISTINCT keyword is used with the SELECT statement.

The following SQL statement selects all the different channels used by account id 1001:
SELECT DISTINCT accounts.name, web_events.channel
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
WHERE accounts.id = 1001;
*/


-- Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order
-- total, and order total_amt_usd.
-- Hint: You can use the EXTRACT function to extract the year from the occurred_at column.
-- EXTRACT(YEAR FROM occurred_at) AS year
SELECT orders.occurred_at, accounts.name, orders.total, orders.total_amt_usd
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
WHERE EXTRACT(YEAR FROM orders.occurred_at) = 2015;


/*
SQL AGGREGATE FUNCTIONS
----------------------------------------------------------------------------------------------------------------------
In SQL, aggregate functions are used to perform calculations on a set of values and return a single value. Some common
aggregate functions include:

COUNT() - returns the number of rows in a table or the number of non-NULL values in a column
SUM() - returns the sum of all non-NULL values in a column
AVG() - returns the average of all non-NULL values in a column
MIN() - returns the minimum value in a column
MAX() - returns the maximum value in a column
These functions are typically used in combination with a GROUP BY clause to group the results by one or more columns.
For example, you could use the SUM() function to find the total sales for each region, by grouping the results by the
region column.

It's worth noting that some databases have additional aggregate functions that may not be supported by other databases.
FOR EXAMPLE:
SELECT COUNT(*) FROM orders;
SELECT SUM(total) FROM orders;
SELECT AVG(total) FROM orders;
SELECT MIN(total) FROM orders;
SELECT MAX(total) FROM orders;
SELECT region, SUM(total) as total_sales FROM orders GROUP BY region;

The COUNT() function returns the number of rows in a table or the number of non-NULL values in a column. The following
SQL statement returns the number of rows in the orders table:
SELECT COUNT(*) FROM orders;

When performing calculations on a set of values, it's important to remember that NULL values are ignored. The following
SQL statement returns the number of non-NULL values in the total column of the orders table:
SELECT COUNT(total) FROM orders;


What are NULL values?
NULL values are special values that indicate that a value is missing or unknown. NULL values are ignored when
calculating aggregate values. For example, if you use the SUM() function to calculate the total sales for each
region, the result will not include any NULL values in the total column.

There are two common ways in which you are likely to encounter NULLs:

-- NULLs frequently occur when performing a LEFT or RIGHT JOIN. You saw in the last lesson - when some rows in the left
table of a left join are not matched with rows in the right table, those rows will contain some NULL values in the
result set.

-- NULLs can also occur from simply missing data in our database.
To check for NULL values, you can use the IS NULL operator. For example, the following SQL statement returns all
orders where the total column is NULL:
SELECT * FROM orders WHERE total IS NULL;
*/


/*
COUNT() - returns the number of rows in a table or the number of non-NULL values in a column
*/

-- How many orders were placed in 2015? Your final table should have 1 column: count.
SELECT COUNT(*) as order_placed_in_2015
FROM orders
WHERE EXTRACT(YEAR FROM occurred_at) = 2015;

/*
Notice that COUNT does not consider rows that have NULL values. Therefore, this can be useful for quickly identifying
which rows have missing data. You will learn GROUP BY in an upcoming concept, and then each of these aggregators will
become much more useful.
*/

-- Find the number of orders placed by each customer and the total amount spent by each customer. Your final table
-- should have 4 columns: customer_id, name, count, and sum. The name column should be the both the customer's first
-- name and last name, separated by a space.
SELECT customers.customer_id,
       customers.first_name || ' ' || customers.last_name as name,
       COUNT(orders_join.order_id),
       SUM(orders_join.total_price)
FROM customers
         JOIN orders_join
              ON customers.customer_id = orders_join.customer_id
GROUP BY customers.customer_id;

/*
SUM() - returns the sum of all non-NULL values in a column
An important thing to remember: aggregators only aggregate vertically - the values of a column. They do not aggregate
horizontally - the values of a row.
*/

-- Find the total amount of poster_qty paper ordered in the orders table.
SELECT SUM(poster_qty) as total_poster_qty
FROM orders;

-- Find the total amount of standard_qty paper ordered in the orders table.
SELECT SUM(standard_qty) as total_standard_qty
FROM orders;

-- Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT SUM(total_amt_usd) as total_dollar_amount
FROM orders;

-- Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table.
-- This should give a dollar amount for each order in the table.
SELECT orders.id, SUM(standard_amt_usd + gloss_amt_usd) as total_dollar_amount
FROM orders
GROUP BY orders.id;

-- Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a
-- mathematical operator.
SELECT SUM(standard_amt_usd) / SUM(standard_qty + 0.01) as standard_amt_usd_per_unit
FROM orders;


/*
MAX and MIN
MAX() - returns the maximum value in a column
MIN() - returns the minimum value in a column
These functions can be used to get the earliest or latest date in a table, the highest or lowest value in a column or
the values alphabetically.
*/

/*
AVG() - returns the average of all non-NULL values in a column
*/


-- When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at) as earliest_order
FROM orders;

-- Try performing the same query as in question 1 without using an aggregation function.
SELECT occurred_at as earliest_order
FROM orders
ORDER BY occurred_at
LIMIT 1;

-- When did the most recent (latest) web_event occur? You only need to return the date.
SELECT MAX(occurred_at) as latest_web_event
FROM web_events;

-- Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type
-- purchased per order. Your final answer should have 6 values - one for each paper type for the average number of
-- sales, as well as the average amount.

SELECT AVG(standard_qty)     as avg_standard_qty,
       AVG(gloss_qty)        as avg_gloss_qty,
       AVG(poster_qty)       as avg_poster_qty,
       AVG(standard_amt_usd) as avg_standard_amt_usd,
       AVG(gloss_amt_usd)    as avg_gloss_amt_usd,
       AVG(poster_amt_usd)   as avg_poster_amt_usd
FROM orders;

-- What is the MEDIAN total_usd spent on all orders?
-- The median is the middle value in a sorted list of values. If there is an even number of values, the median is the
-- average of the two middle values.

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_amt_usd) as median_total_usd
FROM orders;


/*
GROUP BY
----------------------------------------------------------------------------------------------------------------------
The GROUP BY clause in SQL is used in a SELECT statement to group rows that have the same values in one or more columns.
This allows you to perform aggregate functions, such as COUNT, SUM, AVG, MIN, and MAX, on the grouped data.

For example, you might have a table of orders that contains multiple rows for each customer, and you want to find the
total number of orders and the total value of all orders for each customer. You could use the GROUP BY clause to group
the rows by the customer_id column, and then use the COUNT and SUM functions to find the number of orders and the total
value of all orders for each group of rows:

The GROUP BY always goes between WHERE and ORDER BY.
*/

-- Which account (by name) placed the earliest order? Your solution should have the account name and the date of
-- the order. Use ORDER BY to sort your results by the date of the order.
SELECT accounts.name, MIN(orders.occurred_at) as earliest_order
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.name
ORDER BY earliest_order
LIMIT 1;

-- Find the total sales in usd for each account. You should include two columns - the total sales for each company's
-- orders in usd and the company name.
SELECT accounts.name, SUM(orders.total_amt_usd) as total_sales_usd
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.name;

-- Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event?
-- Your query should return only three values - the date, channel, and account name.
SELECT web_events.occurred_at, web_events.channel, accounts.name
FROM web_events
         JOIN accounts
              ON web_events.account_id = accounts.id
ORDER BY web_events.occurred_at DESC
LIMIT 1;

-- Find the total number of web_events for each channel. Your solution should have two columns - the channel and the
-- total number of web_events for that channel.
SELECT web_events.channel, COUNT(web_events.id) as total_web_events
FROM web_events
GROUP BY web_events.channel;


/*
You can GROUP BY multiple columns at once, as we showed here. This is often useful to aggregate across a number of
different segments.
The order of columns listed in the ORDER BY clause does make a difference. You are ordering the columns from left to
right.
*/

-- Find the total number of web_events for each channel and for each account. Your solution should have three columns -
-- the channel, the account name, and the total number of web_events for that channel and account.
SELECT web_events.channel, accounts.name, COUNT(web_events.id) as total_web_events
FROM web_events
         JOIN accounts
              ON web_events.account_id = accounts.id
GROUP BY web_events.channel, accounts.name
ORDER BY web_events.channel, accounts.name;


/*
 QUIZ
 */

 -- For each account, determine the average amount of each type of paper they purchased across their orders. Your
 -- result should have four columns - one for the account name and one for the average quantity purchased for each
 -- of the paper types for each account.
SELECT accounts.name, AVG(orders.standard_qty) as avg_standard_qty, AVG(orders.gloss_qty) as avg_gloss_qty,
       AVG(orders.poster_qty) as avg_poster_qty
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.name;


-- For each account, determine the average amount spent per order on each paper type. Your result should have four
-- columns - one for the account name and one for the average amount spent on each paper type.
SELECT accounts.name, AVG(orders.standard_amt_usd) as avg_standard_amt_usd,
       AVG(orders.gloss_amt_usd) as avg_gloss_amt_usd,
       AVG(orders.poster_amt_usd) as avg_poster_amt_usd
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.name;


-- Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final
-- table should have three columns - the name of the sales rep, the channel, and the number of occurrences.
-- Order your table with the highest number of occurrences first.
SELECT sales_reps.name, web_events.channel, COUNT(web_events.id) as total_web_events
FROM web_events
         JOIN accounts
              ON web_events.account_id = accounts.id
         JOIN sales_reps
              ON accounts.sales_rep_id = sales_reps.id
GROUP BY sales_reps.name, web_events.channel
ORDER BY total_web_events DESC;


-- Determine the number of times a particular channel was used in the web_events table for each region. Your final
-- table should have three columns - the region name, the channel, and the number of occurrences. Order your table
-- with the highest number of occurrences first.
SELECT region.name, web_events.channel, COUNT(web_events.id) as total_web_events
FROM accounts
         JOIN web_events
              ON accounts.id = web_events.account_id
         JOIN sales_reps
                ON accounts.sales_rep_id = sales_reps.id
            JOIN region
                ON sales_reps.region_id = region.id
GROUP BY region.name, web_events.channel
ORDER BY total_web_events DESC;


/*
DISTINCT
-------------------------------------------------------------------------------------------------------------------
The DISTINCT keyword is used to return only distinct (different) values. For example, if you have a table of
orders that contains multiple rows for each customer, and you want to find the total number of orders and the
total value of all orders for each customer. You could use the GROUP BY clause to group the rows by the
customer_id column, and then use the COUNT and SUM functions to find the number of orders and the total value
of all orders for each group of rows:
SELECT customer_id, COUNT(*), SUM(total_amt_usd)
FROM orders
GROUP BY customer_id;

However, if you want to find the total number of orders and the total value of all orders for all customers, you
can use the DISTINCT keyword to find the number of unique customer_id values and the total value of all orders
for all customers:
SELECT COUNT(DISTINCT customer_id), SUM(total_amt_usd)
FROM orders;

The DISTINCT keyword can be used with any column or expression in a SELECT statement. For example, if you want
to find the number of unique values in the channel column of the web_events table, you can use the following
query:
SELECT COUNT(DISTINCT channel)
FROM web_events;

The DISTINCT keyword can also be used with multiple columns or expressions. For example, if you want to find the
number of unique combinations of channel and account_id values in the web_events table, you can use the
following query:
SELECT COUNT(DISTINCT channel, account_id)
FROM web_events;

The DISTINCT keyword can be used with the GROUP BY clause. For example, if you want to find the number of
unique values in the channel column of the web_events table for each account, you can use the following query:
SELECT account_id, COUNT(DISTINCT channel)
FROM web_events
GROUP BY account_id;
*/

-- Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT region.id as region_id, accounts.id as account_id, accounts.name as account_name, region.name as region_name
FROM accounts
         JOIN sales_reps
              ON accounts.sales_rep_id = sales_reps.id
         JOIN region
              ON sales_reps.region_id = region.id;
-- With DISTINCT
SELECT DISTINCT id, name
FROM accounts;
/*
From the result, we can see that there are no accounts associated with more than one region. If each account was
associated with more than one region, the first query should have returned more rows than the second query.
*/


-- Have any sales reps worked on more than one account?
SELECT sales_reps.id, sales_reps.name, COUNT( accounts.id) as num_accounts
FROM sales_reps
         JOIN accounts
              ON sales_reps.id = accounts.sales_rep_id
GROUP BY sales_reps.id, sales_reps.name
ORDER BY num_accounts DESC;

-- Let's use DISTINCT
SELECT DISTINCT sales_reps.id, sales_reps.name
FROM sales_reps;
/*
Actually all of the sales reps have worked on more than one account. The fewest number of accounts any sales rep
works on is 3.
*/


/*
HAVING
-------------------------------------------------------------------------------------------------------------------
The HAVING clause in SQL is used in conjunction with the GROUP BY clause in a SELECT statement to filter the results
of a query based on aggregate functions (such as COUNT, SUM, AVG, etc.). It is used to filter groups of rows based on
the values of the aggregate functions, rather than the individual rows.

For example, if you want to retrieve the number of orders placed by each customer and only show customers who have
placed more than 10 orders, you would use a query like this:

SELECT customer_id, COUNT(order_id) as num_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 10;

In this example, the GROUP BY clause groups the rows by customer_id, and the COUNT(order_id) function calculates the
number of orders for each customer. The HAVING clause filters the results to only show customers who have placed more
than 10 orders.

REMEMBER:
WHERE subsets the returned data based on a logical condition.
WHERE appears after the FROM, JOIN, and ON clauses, but before GROUP BY.
HAVING appears after the GROUP BY clause, but before the ORDER BY clause.
HAVING is like WHERE, but it works on logical statements involving aggregations.
*/

-- How many of the sales reps have more than 5 accounts that they manage?
SELECT sales_reps.id, sales_reps.name, COUNT(accounts.id) as num_accounts
FROM sales_reps
         JOIN accounts
              ON sales_reps.id = accounts.sales_rep_id
GROUP BY sales_reps.id, sales_reps.name
HAVING COUNT(accounts.id) > 5
ORDER BY num_accounts;


-- How many accounts have more than 20 orders?
SELECT accounts.id, accounts.name, COUNT(orders.id) as num_orders
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.id, accounts.name
HAVING COUNT(orders.id) > 20
ORDER BY num_orders;


-- Which account has the most orders?
SELECT accounts.id, accounts.name, COUNT(orders.id) as num_orders
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.id, accounts.name
ORDER BY num_orders DESC
LIMIT 1;


-- Which accounts spent more than 30,000 usd total across all orders?
SELECT accounts.id, accounts.name, SUM(orders.total_amt_usd) as total_spent
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.id, accounts.name
HAVING SUM(orders.total_amt_usd) > 30000
ORDER BY total_spent;


-- Which accounts spent less than 1,000 usd total across all orders?
SELECT accounts.id, accounts.name, SUM(orders.total_amt_usd) as total_spent
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.id, accounts.name
HAVING SUM(orders.total_amt_usd) < 1000
ORDER BY total_spent;


-- Which account has spent the most with us?
SELECT accounts.id, accounts.name, SUM(orders.total_amt_usd) as total_spent
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.id, accounts.name
ORDER BY total_spent DESC
LIMIT 1;


-- Which account has spent the least with us?
SELECT accounts.id, accounts.name, SUM(orders.total_amt_usd) as total_spent
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.id, accounts.name
ORDER BY total_spent
LIMIT 1;


-- Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT accounts.id, accounts.name, web_events.channel, COUNT(web_events.id) as num_facebook_events
FROM accounts
         JOIN web_events
              ON accounts.id = web_events.account_id
GROUP BY accounts.id, accounts.name, web_events.channel
HAVING web_events.channel = 'facebook' AND COUNT(web_events.id) > 6
ORDER BY num_facebook_events DESC;


-- Which account used facebook most as a channel?
SELECT accounts.id, accounts.name, web_events.channel, COUNT(web_events.id) as num_facebook_events
FROM accounts
         JOIN web_events
              ON accounts.id = web_events.account_id
WHERE web_events.channel = 'facebook'
GROUP BY accounts.id, accounts.name, web_events.channel
ORDER BY num_facebook_events DESC
LIMIT 1;


-- Which channel was most frequently used by most accounts?
SELECT web_events.channel, COUNT(web_events.id) as num_events
FROM web_events
GROUP BY web_events.channel
ORDER BY num_events DESC
LIMIT 1;



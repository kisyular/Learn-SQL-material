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
DATABASES WE WILL USE
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

-- select the first 15 rows from the orders table and return the id, account_id, and occurred_at columns
SELECT id, account_id, occurred_at
FROM orders
LIMIT 15;
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

-- select the first 15 rows from the orders table order by occurred_at in descending order
SELECT *
FROM orders
ORDER BY occurred_at DESC
LIMIT 18;


-- the 15 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 15;
/*
The result is sorted by the occurred_at column in ascending order. The earliest order is at the top of the table.
Sorting allows us to see the data in a different way than we would have seen it otherwise.
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
LIMIT 20;
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
LIMIT 25;


-- Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target,
-- and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');



-- Use the web_events table to find all information regarding individuals who were contacted via any method except using
-- organic or adwords methods.
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords')
LIMIT 5;

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
   OR poster_qty > 4000
LIMIT 5;

-- Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is
-- over 1000.
SELECT *
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000)
LIMIT 5;


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
/*
You can that the table is filtered by region "Midwest" and Sales Rep name starting with "S".
The LIKE operator is used to compare a value to a pattern. The pattern can contain the wildcard characters % and _.
The % wildcard represents zero, one, or multiple characters. The _ wildcard represents a single character.
The LIKE operator is case insensitive.

The table is sorted by account name in ascending order.
*/


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
/*
You can that the table is filtered by region "Midwest" and Sales Rep last name starting with "K".
The LIKE operator is used to compare a value to a pattern. The pattern can contain the wildcard characters % and _.
*/


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

The DISTINCT keyword above is used to return only distinct (different) values. The result set will not contain any
duplicate values.
The WHERE clause is used to filter records to return only those that fulfill a specified condition.
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
SELECT accounts.name,
       AVG(orders.standard_qty) as avg_standard_qty,
       AVG(orders.gloss_qty)    as avg_gloss_qty,
       AVG(orders.poster_qty)   as avg_poster_qty
FROM accounts
         JOIN orders
              ON accounts.id = orders.account_id
GROUP BY accounts.name;


-- For each account, determine the average amount spent per order on each paper type. Your result should have four
-- columns - one for the account name and one for the average amount spent on each paper type.
SELECT accounts.name,
       AVG(orders.standard_amt_usd) as avg_standard_amt_usd,
       AVG(orders.gloss_amt_usd)    as avg_gloss_amt_usd,
       AVG(orders.poster_amt_usd)   as avg_poster_amt_usd
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
SELECT sales_reps.id, sales_reps.name, COUNT(accounts.id) as num_accounts
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

You can use the HAVING clause with multiple conditions. For example, if you want to retrieve the number of orders
placed by each customer and only show customers who have placed more than 10 orders and have a total order value
greater than $100, you would use a query like this:
SELECT customer_id, COUNT(order_id) as num_orders, SUM(total_amt_usd) as total_order_value
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 10 AND SUM(total_amt_usd) > 100;

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
HAVING web_events.channel = 'facebook'
   AND COUNT(web_events.id) > 6
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


/*
DATE FUNCTIONS
-------------------------------------------------------------------------------------------------------------------
PostgreSQL provides a variety of date and time functions for manipulating and working with date and time values. Some
commonly used date functions include:

CURRENT_DATE returns the current date.
CURRENT_TIME returns the current time.
CURRENT_TIMESTAMP returns the current date and time.
NOW() returns the current date and time.
EXTRACT(field FROM date) extracts a specific field (such as year, month, or day) from a date or time value.
DATE_TRUNC(field, date) truncates a date or time value to a specific field (such as year or month).
AGE(date1, date2) calculates the age (in years) between two date or time values.
DATE_PART(field, date) returns the specified field of a date or time value.

*/

-- What is the current date?
SELECT CURRENT_DATE;

-- What is the current time?
SELECT CURRENT_TIME;

-- Add 10 days to the occurred_at date of the orders table.
SELECT occurred_at, occurred_at + INTERVAL '10 days' as occurred_at_plus_10_days
FROM orders;

-- Which day of the week did the most orders occur on using DATE_PART?
SELECT DATE_PART('dow', occurred_at) as day_of_week, COUNT(id) as num_orders
FROM orders
GROUP BY day_of_week
ORDER BY num_orders DESC;

-- Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice
-- any trends in the yearly sales totals?
SELECT EXTRACT(year FROM occurred_at) as year, SUM(total_amt_usd) as total_sales
FROM orders
GROUP BY year
ORDER BY total_sales DESC;
/*
When we look at the yearly totals, you might notice that 2013 and 2017 have much smaller totals than all other years.
If we look further at the monthly data, we see that for 2013 and 2017 there is only one month of sales for each of
these years (12 for 2013 and 1 for 2017). Therefore, neither of these are evenly represented. Sales have been
increasing year over year, with 2016 being the largest sales to date. At this rate, we might expect 2017 to have the
largest sales.
*/
-- SELECT only the year and total sales for only 2013 and 2017 don't use between
SELECT EXTRACT(year FROM occurred_at)  as year,
       EXTRACT(month FROM occurred_at) as month,
       SUM(total_amt_usd)              as total_sales
FROM orders
WHERE EXTRACT(year FROM occurred_at) IN (2013, 2017)
GROUP BY year, month;

-- Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented
-- by the dataset?
SELECT EXTRACT(month FROM occurred_at) as month, SUM(total_amt_usd) as total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month
ORDER BY total_sales DESC;
/*
The greatest sales amounts occur in December (12).
Again, 2013 and 2017 are not evenly represented to the other years in the dataset.
BETWEEN '2014-01-01' AND '2017-01-01' is used to only look at the years 2014 to 2017 since the BETWEEN operator
is inclusive, meaning that the start and end values are included in the range.
*/


-- Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly
-- represented by the dataset? Use the DATE_PART function.
SELECT DATE_PART('year', occurred_at) as year, COUNT(id) as num_orders
FROM orders
GROUP BY year
ORDER BY num_orders DESC;
/*
Again, 2016 by far has the most amount of orders, but again 2013 and 2017 are not evenly represented to the other
years in the dataset.
*/

/*
DIFFERENCE BETWEEN DATE_PART AND EXTRACT
-------------------------------------------------------------------------------------------------------------------
The EXTRACT function is a more modern version of the DATE_PART function. The EXTRACT function is more readable and
is easier to use. The EXTRACT function is preferred over the DATE_PART function.

SELECT DATE_PART('year', occurred_at) as year, COUNT(id) as num_orders
FROM orders
GROUP BY year
ORDER BY num_orders DESC;
*/


-- Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly
-- represented by the dataset? Use the DATE_PART function.
SELECT DATE_PART('month', occurred_at) as month, COUNT(id) as num_orders
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;
/*
December still has the most sales, but interestingly, November has the second most sales (but not the most dollar
sales. To make a fair comparison from one month to another 2017 and 2013 data were removed.
*/

/*
SELECT EXTRACT(year FROM occurred_at) as year, COUNT(id) as num_orders
FROM orders
GROUP BY year
ORDER BY num_orders DESC;
*/

-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
SELECT EXTRACT(year FROM occurred_at)  as year,
       EXTRACT(month FROM occurred_at) as month,
       SUM(total_amt_usd)              as total_sales
FROM orders
         JOIN accounts
              ON orders.account_id = accounts.id
WHERE accounts.name = 'Walmart'
GROUP BY year, month
ORDER BY total_sales DESC
LIMIT 1;


/*
CASE STATEMENTS
-------------------------------------------------------------------------------------------------------------------
PostgreSQL provides a CASE statement for performing conditional logic. The CASE statement is similar to an IF statement
in other programming languages. The CASE statement is used to create a new column based on the values of existing
columns. The CASE statement is also used to filter rows based on the values of existing columns.

CASE WHEN condition THEN result
     WHEN condition THEN result
     ELSE result
END

- The CASE statement always goes in the SELECT clause.
- CASE must include the following components: WHEN, THEN, and END. ELSE is an optional component to catch cases that
  did not meet any of the other previous CASE conditions.
- You can make any conditional statement using any conditional operator (like WHERE) between WHEN and THEN.
  This includes stringing together multiple conditional statements using AND and OR.
- You can include multiple WHEN statements, as well as an ELSE statement again, to deal with any unaddressed conditions.
*/

-- Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for
-- each order. Limit the results to the first 10 orders, and include the id and account_id fields.
/*
NOTE - you will be thrown an error with the correct solution to this question. This is for a division by zero.
You will learn how to get a solution without an error to this query when you learn about CASE statements in a later
section.
*/
-- USE CASE STATEMENT TO FIX DIVISION BY ZERO ERROR
SELECT account_id,
       CASE
           WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
           ELSE standard_amt_usd / standard_qty
           END AS unit_price
FROM orders
LIMIT 10;


-- Write a query to display for each order, the account ID, total amount of the order, and the level of the order -
-- ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.
SELECT account_id,
       total_amt_usd,
       CASE
           WHEN total_amt_usd >= 3000 THEN 'Large'
           ELSE 'Small'
           END AS order_level
FROM orders
LIMIT 20;

-- Write a query to display the number of orders in each of three categories, based on the total number of items in
-- each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
SELECT CASE
           WHEN total >= 2000 THEN 'At Least 2000'
           WHEN total >= 1000 THEN 'Between 1000 and 2000'
           ELSE 'Less than 1000'
           END   AS order_level,
       COUNT(id) AS num_orders
FROM orders
GROUP BY order_level;

/*
STEPS TO SOLVE THIS PROBLEM
The CASE statement checks the value of the "total" column for each row in the "orders" table, and assigns the value
'At Least 2000' to the "order_level" column if the "total" value is greater than or equal to 2000, 'Between 1000 and
2000' if the "total" value is greater than or equal to 1000 and less than 2000, and 'Less than 1000' if the "total"
value is less than 1000.

COUNT() function to count the number of orders for each order_level and the GROUP BY clause to group the result by
order_level, so that the query returns the number of orders for each order_level.

This query will return a result set with 2 columns: order_level and num_orders, where order_level can be
'At Least 2000', 'Between 1000 and 2000', 'Less than 1000' and num_orders will be the count of orders for each
order_level.
*/

-- We would like to understand 3 different branches of customers based on the amount associated with their purchases.
-- The top branch includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd.
-- The second branch is between 200,000 and 100,000 usd. The lowest branch is anyone under 100,000 usd. Provide a
-- table that includes the level associated with each account. You should provide the account name, the total sales
-- of all orders for the customer, and the level. Order with the top spending customers listed first.
SELECT accounts.name,
       SUM(total_amt_usd) AS total_sales,
       CASE
           WHEN SUM(total_amt_usd) > 200000 THEN 'Top'
           WHEN SUM(total_amt_usd) > 100000 THEN 'Middle'
           ELSE 'Low'
           END            AS level
FROM orders
         JOIN accounts
              ON orders.account_id = accounts.id
GROUP BY accounts.name
ORDER BY total_sales DESC;

-- We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by
-- customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending
-- customers listed first.
SELECT accounts.name,
       SUM(total_amt_usd) AS total_sales,
       CASE
           WHEN SUM(total_amt_usd) > 200000 THEN 'Top'
           WHEN SUM(total_amt_usd) > 100000 THEN 'Middle'
           ELSE 'Low'
           END            AS level
FROM orders
         JOIN accounts
              ON orders.account_id = accounts.id
WHERE occurred_at BETWEEN '2016-01-01' AND '2017-12-31'
GROUP BY accounts.name
ORDER BY total_sales DESC;

-- We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders.
-- Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if
-- they have more than 200 orders. Place the top sales people first in your final table.
SELECT sales_reps.name,
       COUNT(orders.id) AS num_orders,
       CASE
           WHEN COUNT(orders.id) > 200 THEN 'Top'
           ELSE 'Not Top'
           END          AS top
FROM orders
         JOIN accounts
              ON orders.account_id = accounts.id
         JOIN sales_reps
              ON accounts.sales_rep_id = sales_reps.id
GROUP BY sales_reps.name
ORDER BY num_orders DESC;

-- The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they
-- want to see these characteristics represented as well. We would like to identify top performing sales reps, which
-- are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep
-- with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders,
-- total sales across all orders, and a column with top, middle, or low depending on this criteria. Place the top sales
-- people based on dollar amount of sales first in your final table. You might see a few upset sales people by this
-- criteria!
SELECT sales_reps.name,
       COUNT(orders.id)   AS num_orders,
       SUM(total_amt_usd) AS total_sales,
       CASE
           WHEN COUNT(orders.id) > 200 OR SUM(total_amt_usd) > 750000 THEN 'Top'
           WHEN COUNT(orders.id) > 150 OR SUM(total_amt_usd) > 500000 THEN 'Middle'
           ELSE 'Low'
           END            AS level
FROM orders
         JOIN accounts
              ON orders.account_id = accounts.id
         JOIN sales_reps
              ON accounts.sales_rep_id = sales_reps.id
GROUP BY sales_reps.name
ORDER BY total_sales DESC;


/*
SQL SUBQUERIES AND TEMPORARY TABLES
A sub-query is a query that is nested inside another query, and it is used to retrieve data that will
be used by the outer query. A sub-query can be used in different clauses of an SQL statement, such as the SELECT, FROM,
WHERE, and HAVING clauses.

For example, the following SQL statement uses a subquery in the WHERE clause to retrieve all the
orders from customers who have placed orders with a total amount greater than 2000:
*/
SELECT *
FROM orders
WHERE id IN (SELECT id
             FROM orders
             GROUP BY id
             HAVING SUM(total) > 2000);

/*
A temporary table, also known as a derived table or a subtable, is a table that exists only for the duration of a
single SQL statement. The data in a temporary table is not permanently stored in the database, and it is deleted
automatically when the session ends.

Temporary tables are useful when you need to store intermediate results of a query that will be used by another query.
*/
-- Create a temporary table that an account's name and the total amount of all orders for that account.
CREATE TEMPORARY TABLE temp_table AS
SELECT accounts.name, SUM(total_amt_usd) AS total_sales
FROM orders
         JOIN accounts
              ON orders.account_id = accounts.id
GROUP BY accounts.name;

-- Use the temporary table to find the top 10 accounts by total sales.
SELECT *
FROM temp_table
ORDER BY total_sales DESC
LIMIT 10;

-- Drop the temporary table.
DROP TABLE temp_table;

-- Create a temporary table that an account's name and the total amount of all orders for that account. Use WITH clause.
WITH temp_table AS (SELECT accounts.name, SUM(total_amt_usd) AS total_sales
                    FROM orders
                             JOIN accounts
                                  ON orders.account_id = accounts.id
                    GROUP BY accounts.name)
SELECT *
FROM temp_table
ORDER BY total_sales DESC
LIMIT 15;

/*
This code is using a SQL query that utilizes a subquery with a Common Table Expression (CTE) to create a temporary
table named temp_table.

The subquery, which is enclosed in parentheses and preceded by the keywords WITH temp_table AS, is joining the orders
table and accounts table on the account_id column and uses the SUM function to calculate the total sales for each
account name. The query then groups the results by account name.

The outer query then selects all columns from the temp_table and orders the results by descending total_sales and
limits the results to the top 10 rows.

The query can be broken down as:
The subquery creates a temporary table named temp_table by joining the orders table and accounts table on the
account_id column and calculates the total sales for each account name and groups the results by account name
The outer query selects all columns from the temp_table and orders the results by descending total_sales
The final query limits the results to the top 10 rows.
This query will retrieve the top 10 accounts with the highest total sales.
*/

/*
Whenever we need to use existing tables to create a new table that we then want to query again, this is an indication
that we will need to use some sort of subquery.
*/

-- Find the number of events that occur for each day for each channel.
-- Use DATE_TRUNC to extract the day from occurred_at and group by the day and channel.
SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(id) AS num_events
FROM web_events
GROUP BY day, channel
ORDER BY num_events DESC;

-- Now create a subquery that simply provides all of the data from your first query.
SELECT *
FROM (SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(id) AS num_events
      FROM web_events
      GROUP BY day, channel
      ORDER BY num_events DESC) AS subquery;

-- Now find the average number of events for each channel. Since you broke out by day earlier, this is giving you an
-- average per day.
SELECT channel, AVG(num_events) AS avg_events
FROM (SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(id) AS num_events
      FROM web_events
      GROUP BY day, channel
      ORDER BY num_events DESC) AS subquery
GROUP BY channel
ORDER BY avg_events DESC;


/*
SELECT name, order_date
FROM orders
WHERE customer_id = (SELECT id
                     FROM customers
                     WHERE name = 'John Smith');
In this example, the subquery is selecting the id from the customers table where the name is 'John Smith'.
The outer query then uses this result to select the name and order_date from the orders table where the customer_id
is the result of the subquery.
*/

-- Find the orders which occurred earliest in the order table. Use the MIN function to find the earliest order date.
-- Use DATE_TRUNC to extract the month from occurred_at.
SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month, COUNT(id) AS num_orders
FROM orders;

-- Now add a subquery to the query above to find orders that occurred at the same month as the earliest order.
SELECT *
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month
                                          FROM orders)
ORDER BY occurred_at;

-- Use DATE_TRUNC to pull month level information about the first order ever placed in the orders table.
-- Use the MIN function to find the earliest order date.
SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month, COUNT(id) AS num_orders
FROM orders;
/*
The result of this query is the month of the first order, and the number of orders that occurred in that month.
*/
-- Use the result of the previous query to find only the orders that took place in the same month and year as the first
-- order, and then pull the average for each type of paper qty in this month.
SELECT AVG(standard_qty)  AS avg_standard_qty,
       AVG(gloss_qty)     AS avg_gloss_qty,
       AVG(poster_qty)    AS avg_poster_qty,
       SUM(total_amt_usd) AS total_sales
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month
                                          FROM orders)
GROUP BY DATE_TRUNC('month', occurred_at)
ORDER BY DATE_TRUNC('month', occurred_at);
/*
The Subquery is finding the month of the first order, and the outer query is using this result to find the number of
orders that occurred in that month.
*/



-- Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
-- STEP 1: Find the total_amt_usd totals associated with each sales rep, and I also wanted the region in which they
-- were located
SELECT sales_reps.name AS sales_rep, region.name AS region, SUM(total_amt_usd) AS total_sales
FROM sales_reps
         JOIN accounts
              ON accounts.sales_rep_id = sales_reps.id
         JOIN orders
              ON orders.account_id = accounts.id
         JOIN region
              ON sales_reps.region_id = region.id
GROUP BY sales_rep, region
ORDER BY total_sales DESC;

-- STEP 2: Find the largest total_amt_usd sales for each region.
SELECT region, MAX(total_sales) AS max_sales
FROM (SELECT sales_reps.name AS sales_rep, region.name AS region, SUM(total_amt_usd) AS total_sales
      FROM sales_reps
               JOIN accounts
                    ON accounts.sales_rep_id = sales_reps.id
               JOIN orders
                    ON orders.account_id = accounts.id
               JOIN region
                    ON sales_reps.region_id = region.id
      GROUP BY sales_rep, region
      ORDER BY total_sales DESC) AS t1
GROUP BY region
ORDER BY max_sales DESC;
/*
This is a SQL code that uses multiple joins to join the sales_reps, accounts, orders and region tables. Then, it
calculates the total sales for each sales rep and region by summing the total amount in USD in the orders table. The
sales_rep, region and total_sales information is then grouped by sales_rep and region. The result is sorted in
descending order of total_sales.

Finally, the code calculates the maximum total sales for each region by using the MAX function and grouping the result
by region. The result is sorted again in descending order of max_sales. The result of the query will show the maximum
total sales for each region.
*/

/*
STEPS
- The SELECT statement starts with the region and a column called max_sales, which is calculated using the MAX function.
- The data for the max_sales column is sourced from the subquery in the parentheses.
- The subquery starts with a SELECT statement that selects three columns: sales_rep, region, and total_sales.
- The sales_rep column is obtained from the sales_reps table, the region column from the region table and the
total_sales column is calculated as the sum of the total_amt_usd column from the orders table.
- The data for the subquery is obtained by joining the sales_reps, accounts, orders, and region tables.
- The joining conditions ensure that each row from the orders table corresponds to a row in the accounts table and each
row from the accounts table corresponds to a row in the sales_reps table.
- The subquery groups the data by the sales_rep and region columns, and orders the result set by the total_sales column
in descending order.
- The subquery result set is aliased as t1.
- The main query groups the data by the region column and calculates the max_sales value for each region.
- Finally, the result set is ordered by the max_sales column in descending order.

*/

-- STEP 3: Find the sales_rep in each region with the largest amount of total_amt_usd sales.
-- Use RANK() OVER to rank the total_amt_usd sales for each region, and then use the rank to find the sales_rep
-- with the largest total_amt_usd sales for each region.
SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) total_amt
FROM (SELECT sales_reps.name rep_name, region.name region_name, SUM(orders.total_amt_usd) total_amt
        FROM sales_reps
                 JOIN accounts
                        ON accounts.sales_rep_id = sales_reps.id
                 JOIN orders
                        ON orders.account_id = accounts.id
                 JOIN region
                        ON sales_reps.region_id = region.id
        GROUP BY rep_name, region_name) AS t1
GROUP BY region_name) AS t2
         JOIN (SELECT sales_reps.name rep_name, region.name region_name, SUM(orders.total_amt_usd) total_amt
               FROM sales_reps
                        JOIN accounts
                             ON accounts.sales_rep_id = sales_reps.id
                        JOIN orders
                             ON orders.account_id = accounts.id
                        JOIN region
                             ON sales_reps.region_id = region.id
               GROUP BY rep_name, region_name
               ORDER BY total_amt DESC) AS t3
              ON t2.region_name = t3.region_name AND t2.total_amt = t3.total_amt;

/*
The code is a SQL query that returns the name of the sales representative (rep_name), the name of the region
(region_name), and the total amount (total_amt) for each region where the sum of the total_amt_usd from the orders
table is the maximum among all the representatives.

The query uses nested subqueries and multiple joins. It first performs a subquery t1 which calculates the sum of the
total_amt_usd for each sales representative and region. Then, it performs another subquery t2 which selects the maximum
total_amt among all representatives in each region. Finally, it joins the subquery t2 with another subquery t3 which
calculates the total_amt for each representative and region, and orders the results by total_amt in descending order.
The final result is the intersection of t2 and t3 on the conditions t2.region_name = t3.region_name and
t2.total_amt = t3.total_amt.
*/


-- For the region with the largest sales total_amt_usd, how many total orders were placed?
-- STEP 1: Find the total_amt_usd totals associated with each sales rep, and I also wanted the region in which they
-- were located
SELECT sales_reps.name AS sales_rep, region.name AS region, SUM(total_amt_usd) AS total_amt
FROM sales_reps
         JOIN accounts
              ON accounts.sales_rep_id = sales_reps.id
         JOIN orders
              ON orders.account_id = accounts.id
         JOIN region
              ON sales_reps.region_id = region.id
GROUP BY sales_rep, region
ORDER BY total_amt DESC;


-- STEP 2: Find the largest total_amt_usd sales for each region from the previous query.
SELECT region, MAX(total_amt) AS max_sales
FROM (SELECT sales_reps.name AS sales_rep, region.name AS region, SUM(total_amt_usd) AS total_amt
      FROM sales_reps
               JOIN accounts
                    ON accounts.sales_rep_id = sales_reps.id
               JOIN orders
                    ON orders.account_id = accounts.id
               JOIN region
                    ON sales_reps.region_id = region.id
      GROUP BY sales_rep, region
      ORDER BY total_amt DESC) AS t1
GROUP BY region
ORDER BY max_sales DESC;


-- STEP 3: Pull the total number of orders for the region with the largest total_amt_usd sales.
SELECT region.name as region_name, COUNT(orders.total) AS num_orders
FROM sales_reps
         JOIN accounts
              ON accounts.sales_rep_id = sales_reps.id
         JOIN orders
              ON orders.account_id = accounts.id
         JOIN region
              ON sales_reps.region_id = region.id
GROUP BY region_name
HAVING SUM(orders.total_amt_usd) = (SELECT MAX(total_amt) AS max_sales
                                    FROM (SELECT region.name AS region, SUM(total_amt_usd) AS total_amt
                                          FROM sales_reps
                                                   JOIN accounts
                                                        ON accounts.sales_rep_id = sales_reps.id
                                                   JOIN orders
                                                        ON orders.account_id = accounts.id
                                                   JOIN region
                                                        ON sales_reps.region_id = region.id
                                          GROUP BY region) AS t1);
/*
Sure, this query is counting the number of orders per region and showing the region with the maximum sales.

Joins the sales_reps, accounts, orders, and region tables using the relationship between sales_reps and accounts
(sales_rep_id), between accounts and orders (account_id), and between sales_reps and region (region_id) respectively.

Groups the result by region_name (which is the name of the region obtained from the region table).
Calculates the number of orders (num_orders) for each region by counting the total column of the orders table.
Filters the result by selecting only those regions that have the highest total amount of sales (total_amt_usd) by
comparing the sum of total_amt_usd for each region with the maximum value obtained from a subquery.

The subquery performs the following steps:
a. Joins the sales_reps, accounts, orders, and region tables.
b. Groups the result by region.
c. Sums up the total_amt_usd for each region.
d. Selects the maximum total_amt from the result of step c.
Finally, the query returns the region_name and num_orders for each region that meets the criteria in the HAVING clause.
*/


-- How many accounts had more total purchases than the account name which has bought the most standard_qty paper
-- throughout their lifetime as a customer?
-- STEP 1: Find the account that had the most standard_qty paper purchased.
SELECT accounts.name AS account_name, SUM(standard_qty) AS total_standard_qty, SUM(total) AS total
FROM accounts
         JOIN orders
              ON orders.account_id = accounts.id
GROUP BY account_name
ORDER BY total_standard_qty DESC
LIMIT 1;


-- STEP 2: Find all the accounts with more total sales than the account with the most standard_qty paper purchased.
-- Use the subquery from STEP 1
-- Use HAVING to filter out the account with the most standard_qty paper purchased.
SELECT accounts.name AS account_name
FROM accounts
         JOIN orders
              ON orders.account_id = accounts.id
GROUP BY account_name
HAVING SUM(total) > (SELECT total
                     FROM (SELECT accounts.name AS account_name, SUM(standard_qty) AS total_standard_qty,
                                  SUM(total) AS total
                           FROM accounts
                                    JOIN orders
                                         ON orders.account_id = accounts.id
                           GROUP BY account_name
                           ORDER BY total_standard_qty DESC
                           LIMIT 1) AS sub);

-- STEP 3: We can get the count of the accounts with more total sales than the account with the most standard_qty
-- paper purchased by using COUNT() on the subquery from STEP 2.
SELECT COUNT(*) AS num_accounts
FROM (SELECT accounts.name AS account_name
      FROM accounts
               JOIN orders
                    ON orders.account_id = accounts.id
      GROUP BY account_name
      HAVING SUM(total) > (SELECT total
                           FROM (SELECT accounts.name AS account_name, SUM(standard_qty) AS total_standard_qty,
                                        SUM(total) AS total
                                 FROM accounts
                                          JOIN orders
                                               ON orders.account_id = accounts.id
                                 GROUP BY account_name
                                 ORDER BY total_standard_qty DESC
                                 LIMIT 1) AS sub)) AS sub2;
/*
This SQL code returns the number of accounts whose total sum of orders is greater than the largest total sum of orders
for any one account.

Start with the innermost query:
SELECT accounts.name AS account_name, SUM(standard_qty) AS total_standard_qty, SUM(total) AS total
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
This query gets the total standard quantity and total amount for each account by joining the accounts and orders tables.
Group by account_name and order the results by total_standard_qty in descending order.
LIMIT 1 to get the account with the highest total_standard_qty value.

The second query inside:
SELECT total
FROM (previous query result) AS sub
This query gets the total value for the account with the highest total_standard_qty.

The main query:
SELECT COUNT(*) AS num_accounts
FROM (SELECT accounts.name AS account_name
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
GROUP BY account_name
HAVING SUM(total) > (previous query result)) AS sub2
The main query gets the number of accounts that have a total amount greater than the total amount of the account with
the highest standard quantity.

The query starts by joining the accounts and orders tables and grouping the results by account_name.
Then it uses the HAVING clause to filter the results based on the total amount being greater than the result of the
previous query.
Finally, it counts the number of accounts that match the condition and gives the result the name num_accounts.
*/


-- For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events
-- did they have for each channel?
-- STEP 1: Find the customer that spent the most total_amt_usd.
SELECT accounts.id, accounts.name AS account_name, SUM(total_amt_usd) AS total_amt
FROM accounts
         JOIN orders
              ON orders.account_id = accounts.id
GROUP BY accounts.id, account_name
ORDER BY total_amt DESC
LIMIT 1;

-- STEP 2: Find the number of events on each channel this company had.
SELECT accounts.name, web_events.channel, COUNT(web_events.channel) AS num_events
FROM web_events
         JOIN accounts
              ON web_events.account_id = accounts.id AND accounts.id =
                     (SELECT id
                      FROM (SELECT accounts.id, accounts.name AS account_name, SUM(total_amt_usd) AS total_amt
                            FROM accounts
                                     JOIN orders
                                          ON orders.account_id = accounts.id
                            GROUP BY accounts.id, account_name
                            ORDER BY total_amt DESC
                            LIMIT 1) AS sub)
GROUP BY accounts.name, web_events.channel
ORDER BY num_events DESC;
/*
This SQL code retrieves the name of the account with the highest total amount in sales, the channel of web events
associated with that account, and the number of events for each channel.

Here's what happens step by step:

The innermost query (sub) retrieves the account with the highest total amount in sales by joining the accounts table
with the orders table on the account_id column. The query groups the data by accounts.id and account_name, and orders
the results by the total_amt column in descending order. It then limits the result to only the top 1 account.

The next query (web_events) joins the web_events table with the result of the innermost query (sub) on the account_id
column of the web_events table and the id column of the result of subquery.

The final query groups the data by accounts.name and web_events.channel, and counts the number of events for each
channel. The results are ordered by the num_events column in descending order.
*/

-- What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?
-- STEP 1: Find the top 10 total spending accounts.
SELECT accounts.name AS account_name, SUM(total_amt_usd) AS total_amt
FROM accounts
         JOIN orders
              ON orders.account_id = accounts.id
GROUP BY account_name
ORDER BY total_amt DESC
LIMIT 10;

-- STEP 2: Find the average amount spent for the top 10 total spending accounts.
SELECT AVG(total_amt) AS avg_total_amt
FROM (SELECT accounts.name AS account_name, SUM(total_amt_usd) AS total_amt
      FROM accounts
               JOIN orders
                    ON orders.account_id = accounts.id
      GROUP BY account_name
      ORDER BY total_amt DESC
      LIMIT 10) AS sub;
/*
This SQL query calculates the average value of total_amt from a subquery that returns the sum of total_amt_usd for the
top 10 accounts (based on the sum of total_amt_usd for each account).

Steps:

The subquery (SELECT accounts.name AS account_name, SUM(total_amt_usd) AS total_amt ...) calculates the sum of
total_amt_usd for each account.
The subquery orders the results by total_amt in descending order and returns only the top 10 records.
The outer query (SELECT AVG(total_amt) AS avg_total_amt ...) calculates the average of total_amt from the results of
the subquery.
*/

-- What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more
-- per order, on average, than the average of all orders

-- STEP 1: Find the average amount spent per order.
SELECT AVG(total_amt_usd) AS avg_total_amt
FROM orders;


-- STEP 2: Find the average amount spent per order for companies that spent more per order than the average
-- of all orders.
SELECT orders.account_id, AVG(orders.total_amt_usd) AS avg_total_amt
FROM orders
GROUP BY orders.account_id
HAVING AVG(orders.total_amt_usd) > (SELECT AVG(orders.total_amt_usd) AS avg_total_amt
                       FROM orders);

--STEP 3: Get the average of these values.
SELECT AVG(avg_total_amt) AS avg_total_amt
FROM (SELECT AVG(total_amt_usd) AS avg_total_amt
      FROM orders
      GROUP BY account_id
      HAVING AVG(total_amt_usd) > (SELECT AVG(total_amt_usd) AS avg_total_amt
                                         FROM orders)) AS sub;
/*
This SQL statement calculates the average of the average order amounts for all accounts that have an average order
amount greater than the overall average order amount for all accounts.

The innermost query calculates the average order amount for each account by grouping the orders by account_id and using
the AVG function on total_amt_usd.

The result of the innermost query is then filtered using the HAVING clause, which only includes the accounts that have
an average order amount greater than the overall average order amount, which is calculated by the second query.
The second query calculates the average order amount for all accounts by using the AVG function on total_amt_usd in the
orders table.

The result of the second query is then used as the threshold in the HAVING clause of the innermost query.
The outermost query calculates the average of the average order amounts returned by the second query by using the AVG
function on avg_total_amt.

The final result is the average of the average order amounts for all accounts that have an average order amount greater
than the overall average order amount for all accounts.
*/



/*
The WITH statement is often called a Common Table Expression or CTE. Though these expressions serve the exact same
purpose as subqueries, they are more common in practice, as they tend to be cleaner for a future reader to follow the
logic.

In the next concept, we will walk through this example a bit more slowly to make sure you have all the similarities
between subqueries and these expressions down for you to use in practice!
*/


-- You need to find the average number of events for each channel per day.
-- STEP 1: Find the number of events for each channel per day.
WITH events_per_day AS (
    SELECT DATE_TRUNC('day',occurred_at) AS day,
       channel, COUNT(*) as events
FROM web_events
GROUP BY day, channel
)
SELECT channel, AVG(events) AS avg_events
FROM events_per_day
GROUP BY channel
ORDER BY avg_events DESC;
/*
This is a SQL query that calculates the average number of events per day for each channel. The query consists of two
parts:
The WITH clause: This creates a derived table named "events_per_day". The derived table contains the following columns:
"day", "channel", and "events". The "day" column is created by using the DATE_TRUNC function to round the "occurred_at"
column to the nearest day. The "channel" and "events" columns are aggregated from the "web_events" table by grouping
the data by day and channel and counting the number of events for each group.

The SELECT clause: This selects the "channel" and "avg_events" columns from the derived table "events_per_day". The
"avg_events" column is calculated as the average number of events per day by grouping the data by "channel". Finally,
the results are ordered by the "avg_events" column in descending order.
*/

-- Using the WITH statement
-- Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
WITH t1 AS (SELECT sales_reps.name AS rep_name,
                   region.name AS region_name,
                   SUM(total_amt_usd) AS total_amt
            FROM sales_reps
                JOIN accounts
                    ON accounts.sales_rep_id = sales_reps.id
                JOIN orders
                    ON orders.account_id = accounts.id
                JOIN region
                    ON sales_reps.region_id = region.id
            GROUP BY rep_name, region_name
            ORDER BY total_amt DESC),
    t2 AS (SELECT region_name, MAX(total_amt) AS total_amt
           FROM t1
   GROUP BY 1)
SELECT t1.rep_name, t1.region_name, t1.total_amt
FROM t1
    JOIN t2
        ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt;
/*
The query first defines a Common Table Expression (CTE) named "t1" which calculates the total sales for each sales
representative (rep_name) and region (region_name). The calculation is done by joining several tables: sales_reps,
accounts, orders, and region. The result of the calculation is grouped by rep_name and region_name, and ordered by
total sales amount (total_amt) in descending order.
The query then defines another CTE named "t2" which calculates the maximum total sales for each region. This is done
by grouping the results of "t1" by region_name and taking the maximum total sales (total_amt) for each region.
Finally, the query selects the rep_name, region_name, and total_amt from "t1" where the region_name and total_amt match
the region_name and total_amt in "t2". This results in the rep_name and region_name for each region with the maximum
total sales.
*/

-- For the region with the largest sales total_amt_usd, how many total orders were placed?
-- Using the WITH statement
WITH t1 AS (SELECT region.name AS region_name,
                   SUM(total_amt_usd) AS total_amt
            FROM sales_reps
                JOIN accounts
                    ON accounts.sales_rep_id = sales_reps.id
                JOIN orders
                    ON orders.account_id = accounts.id
                JOIN region
                    ON sales_reps.region_id = region.id
            GROUP BY region_name),
    t2 AS (SELECT MAX(total_amt) AS total_amt
           FROM t1)
SELECT region.name, COUNT(orders.total) AS num_orders
FROM sales_reps
    JOIN accounts
        ON accounts.sales_rep_id = sales_reps.id
    JOIN orders
        ON orders.account_id = accounts.id
    JOIN region
        ON sales_reps.region_id = region.id
GROUP BY region.name
HAVING SUM(orders.total_amt_usd) = (SELECT *
                    FROM t2);


-- For the account that purchased the most (in total over their lifetime as a customer) standard_qty paper, how many
-- accounts still had more in total purchases?
-- Using the WITH statement
WITH t1 AS (
    SELECT accounts.name AS account_name,
           SUM(orders.standard_qty) AS total_standard_qty,
           SUM(orders.total) AS total
    FROM accounts
        JOIN orders
            ON orders.account_id = accounts.id
    GROUP BY account_name
    ORDER BY total_standard_qty DESC
    LIMIT 1),
    t2 AS (
        SELECT accounts.name AS account_name
        FROM accounts
            JOIN orders
                ON orders.account_id = accounts.id
        GROUP BY account_name
        HAVING SUM(orders.total) > (SELECT total
                                           FROM t1))
SELECT COUNT(*) AS num_accounts
FROM t2;

-- For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events
-- did they have for each channel?
-- Using the WITH statement
WITH t1 AS (
    SELECT accounts.name AS account_name, accounts.id,
           SUM(orders.total_amt_usd) AS total_amt
    FROM accounts
        JOIN orders
            ON orders.account_id = accounts.id
    GROUP BY accounts.id, account_name
    ORDER BY total_amt DESC
    LIMIT 1)
SELECT accounts.name AS account_name, web_events.channel, COUNT(*) AS num_events
FROM accounts
    JOIN web_events
        ON web_events.account_id = accounts.id AND accounts.id = (SELECT id FROM t1)
GROUP BY account_name, channel
ORDER BY num_events DESC;

-- What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?
-- Using the WITH statement
WITH t1 AS (
    SELECT accounts.name AS account_name, accounts.id,
           SUM(orders.total_amt_usd) AS total_amt
    FROM accounts
        JOIN orders
            ON orders.account_id = accounts.id
    GROUP BY accounts.id, account_name
    ORDER BY total_amt DESC
    LIMIT 10)
SELECT AVG(total_amt) AS avg_total_amt
FROM t1;

-- What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more
-- per order, on average, than the average of all orders.
-- Using the WITH statement
WITH t1 AS (
    SELECT AVG(orders.total_amt_usd) AS avg_total_amt
    FROM orders
    JOIN accounts ON accounts.id = orders.account_id),
    t2 AS (
        SELECT accounts.id, AVG(orders.total_amt_usd) AS avg_total_amt_usd
        FROM accounts
            JOIN orders ON orders.account_id = accounts.id
        GROUP BY accounts.id
        HAVING AVG(orders.total_amt_usd) > (SELECT avg_total_amt
                                                   FROM t1))
SELECT AVG(avg_total_amt_usd) AS avg_total_amt
FROM t2;

/*
DATA CLEANING
In this lesson, you will be learning a number of techniques to

Clean and re-structure messy data.
Convert columns to different data types.
Tricks for manipulating NULLs.

This will give you a robust toolkit to get from raw data to clean data that's useful for analysis.
*/

-- Create a customer_data table
CREATE TABLE customer_data (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(15),
  location VARCHAR(50)
);

-- Insert data into customer_data.
INSERT INTO customer_data (first_name, last_name,  phone_number, location)
VALUES
  ('John', 'Doe', '301-678-1234', 'Lansing, MI'),
  ('Jane', 'Doe', '202-555-5432', 'New York, NY'),
  ('Jim', 'Smith', '203-545-2345', 'Boston, MA'),
  ('Emily', 'Johnson', '301-616-9045', 'Lansing, MI'),
  ('David', 'Williams', '203-871-3012', 'Boston, MA'),
  ('Michael', 'Brown', '301-678-2510', 'Philadelphia, PA'),
  ('Sarah', 'Miller', '202-517-2310', 'New York, NY'),
  ('William', 'Davis', '301-555-0123', 'Columbus, OH'),
  ('Ashley', 'Garcia', '203-765-6540', 'Boston, MA'),
  ('Sophia', 'Rodriguez', '202-816-6587', 'Raleigh, NC'),
  ('Ethan', 'Martinez', '301-901-8708', 'Columbus, OH'),
  ('Isabella', 'Anderson', '203-675-5609', 'San Jose, CA'),
  ('Noah', 'Taylor', '301-402-8907', 'San Diego, CA'),
  ('Mia', 'Thomas', '202-201-0987', 'New York, NY'),
  ('Liam', 'Moore', '301-309-5623', 'Columbus, OH'),
  ('Aria', 'Jackson', '203-313-2134', 'Boston, MA'),
  ('Jacob', 'Martin', '202-212-2345', 'Houston, TX'),
  ('Emily', 'Lee', '301-517-4532', 'Dallas, TX'),
  ('Mason', 'Harris', '203-689-6574', 'Atlanta, GA'),
  ('Madison', 'Clark', '202-678-4356', 'Miami, FL'),
  ('Jayden', 'Lewis', '301-670-5410', 'Portland, OR'),
  ('Charlotte', 'King', '203-909-6543', 'Boston, MA'),
  ('Elijah', 'Walker', '301-764-8097', 'Columbus, OH'),
  ('Ava', 'Wright', '202-313-9087', 'San Francisco, CA'),
  ('William', 'Allen', '203-541-5423', 'Washington, DC');

-- Show data in customer_data
SELECT * FROM customer_data;
/*
LEFT
LEFT pulls a specified number of characters for each row in a specified column starting at the beginning
(or from the left). As you saw here, you can pull the first three digits of a phone number using LEFT(phone_number, 3).

RIGHT pulls a specified number of characters for each row in a specified column starting at the end (or from the right).
As you saw here, you can pull the last eight digits of a phone number using RIGHT(phone_number, 8).

LENGTH provides the number of characters for each row of a specified column. Here, you saw that we could use this to
get the length of each phone number as LENGTH(phone_number).
*/

-- SELECT all columns from customer_data, include a column called area_code that contains the first three digits of
-- the phone number.
SELECT *, LEFT(phone_number, 3) AS area_code FROM customer_data
LIMIT 10;

-- SELECT all columns from customer_data, include a column called phone_number_only that contains the last eight digits
-- of the phone number.
SELECT *, RIGHT(phone_number, 8) AS phone_number_only FROM customer_data
LIMIT 10;

-- SELECT all columns from customer_data, include a column called phone_number_length that contains the length of the
-- phone number. area_code and phone_number_only from the previous exercises.
SELECT *, LENGTH(phone_number) AS phone_number_length, LEFT(phone_number, 3) AS area_code,
       RIGHT(phone_number, 8) AS phone_number_only
FROM customer_data
LIMIT 10;

-- Pull the extension of the website from the url column in the accounts table.
SELECT website, RIGHT(website, 3) AS extension
FROM accounts;

-- Using WITH, use the code from the previous exercise to create a table called t1 that contains the extension of the
-- website from the url column in the accounts table and counts the number of times each extension appears.
-- Then, use this table to find the most common extension.
WITH t1 AS (
    SELECT RIGHT(website, 3) AS extension, COUNT(*) AS num
    FROM accounts
    GROUP BY extension
    ORDER BY num DESC)
SELECT * FROM t1;

-- Use the accounts table to pull the first letter of each company name to see the distribution of company names that
-- begin with each letter (or number).
SELECT LEFT(name, 1) AS first_letter, COUNT(*) AS num
FROM accounts
GROUP BY first_letter
ORDER BY num DESC;

-- Use the accounts table and a CASE statement to create two groups: one group of company names that start with a
-- number and a second group of those company names that start with a letter
SELECT name, CASE WHEN LEFT(name, 1) ~ '[0-9]' THEN 'starts with a number'
                  ELSE 'starts with a letter'
             END AS group_name
FROM accounts;

-- COUNT the number of companies in each group
SELECT CASE WHEN LEFT(name, 1) ~ '[0-9]' THEN 'starts with a number'
                  ELSE 'starts with a letter'
             END AS group_name,
       COUNT(*) AS num
FROM accounts
GROUP BY group_name;

-- Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel, and what percent start
-- with anything else
SELECT CASE WHEN LEFT(name, 1) ~ '[aeiou]' OR LEFT(name, 1) ~ '[AEIOU]'
    THEN 'starts with a vowel'
                  ELSE 'starts with anything else'
             END AS group_name,
       COUNT(*) AS num
FROM accounts
GROUP BY group_name;
/*
This code is a SQL query that uses a CASE statement to categorize the names of accounts based on the first letter of
their name. The query uses the LEFT function to get the first letter of the name column, and then the ~ operator to
check if the first letter is a vowel. If it is, then the CASE statement assigns the value 'starts with a vowel' to the
group_name column. If the first letter is not a vowel, then the value 'starts with anything else' is assigned.

The query then uses the COUNT function to count the number of accounts in each group, and the GROUP BY clause to group
the data by the group_name column. The query then orders the results by the number of accounts in each group, in
descending order.


LOWER
LOWER converts all characters in a specified column to lowercase.

UPPER
UPPER converts all characters in a specified column to uppercase.
*/

-- Use the customer_data table to create a new column called first_name_lower that contains the lowercase version of
-- the first_name column and first_name_upper that contains the uppercase version of the first_name column.
SELECT first_name, LOWER(first_name) AS first_name_lower, UPPER(first_name) AS first_name_upper
FROM customer_data
LIMIT 10;


/*
POSITION takes a character and a column, and provides the index where that character is for each row. The index of the
first position is 1 in SQL. If you come from another programming language, many begin indexing at 0. Here, you saw that
you can pull the index of a comma as POSITION(',' IN city_state).

STRPOS provides the same result as POSITION, but the syntax for achieving those results is a bit different as shown
here: STRPOS(city_state, ',').

Note, both POSITION and STRPOS are case sensitive, so looking for A is different than looking for a.

Therefore, if you want to pull an index regardless of the case of a letter, you might want to use LOWER or UPPER to
make all of the characters lower or uppercase.
*/


-- Use POSITION and STRPOS to find the index of the comma in the location column in the customer_data table.
SELECT location, POSITION(',' IN location) AS position, STRPOS(location, ',') AS strpos
FROM customer_data
LIMIT 10;

-- Use POSITION and STRPOS to find the index of the comma in the location column in the customer_data table, but
-- regardless of the case of the letter.
SELECT location, POSITION(',' IN LOWER(location)) AS position, STRPOS(LOWER(location), ',') AS strpos
FROM customer_data
LIMIT 10;

-- Use the customer_data table to create a new column called city that contains the city name from the location column.
SELECT location, LEFT(location, POSITION(',' IN LOWER(location)) - 1) AS city
FROM customer_data
LIMIT 10;

-- Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
SELECT primary_poc, LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) AS first_name,
       RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name
FROM accounts
LIMIT 10;

-- Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last
-- name columns.
SELECT name, LEFT(name, POSITION(' ' IN name) - 1) AS first_name,
       RIGHT(name, LENGTH(name) - POSITION(' ' IN name)) AS last_name
FROM sales_reps
LIMIT 20;

/*
REPLACE takes a column, a character to replace, and a character to replace it with. Here, you saw that you could
replace all instances of a comma with a space as REPLACE(city_state, ',', ' ').
*/

-- Use REPLACE to replace all instances of a comma with a space in the location column in the customer_data table.
SELECT location, REPLACE(location, ',', ' ') AS location_replaced
FROM customer_data
LIMIT 25;

/*
SUBSTRING takes a column, a starting index, and an optional length. Here, you saw that you could pull the first
three characters of a column as SUBSTRING(city_state, 1, 3).
*/

-- Use SUBSTRING to pull the first three characters of the location column in the customer_data table.
SELECT location, SUBSTRING(location, 1, 3) AS first_three
FROM customer_data
LIMIT 22;

/*
CONCAT
CONCAT takes two columns and combines them into one column. Here, you saw that you could combine the first and
last name columns into a full name column as CONCAT(first_name, ' ', last_name).

PIPE (||)
The pipe (||) is another way to combine columns. Here, you saw that you could combine the first and last name
columns into a full name column as first_name || ' ' || last_name.
*/

-- Use both CONCAT and PIPE (||) to combine the first and last name columns in the customer_data table into a full
-- name column.
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name,
       first_name || ' ' || last_name AS full_name_pipe
FROM customer_data
LIMIT 15;

-- Each company in the accounts table wants to create an email address for each primary_poc. The email address should
-- be the first name of the primary_poc . last name primary_poc @ company name .com.
-- Remember to remove any spaces from the company name and make the email address lowercase.
SELECT primary_poc, name, CONCAT(LOWER(LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1)), '.',
                                 LOWER(RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc))), '@',
                                 REPLACE(LOWER(name), ' ', ''), '.com') AS email
FROM accounts
LIMIT 20;

-- We would also like to create an initial password, which they will change after their first log in. The first
-- password will be the first letter of the primary_poc's first name (lowercase), then the last letter of their
-- first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name
-- (lowercase), the number of letters in their first name, the number of letters in their last name, and then the
-- name of the company they are working with, all capitalized with no spaces.
SELECT primary_poc, name, CONCAT(LOWER(LEFT(primary_poc, 1)), LOWER(RIGHT(primary_poc, 1)),
                                 LOWER(LEFT(RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)), 1)),
                                 LOWER(RIGHT(RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)), 1)),
                                 LENGTH(REPLACE(primary_poc, ' ', '')),
                                 UPPER(REPLACE(name, ' ', ''))) AS password
FROM accounts
LIMIT 20;

-- The above query is a bit long and hard to read. Let's break it up into multiple steps.
SELECT primary_poc, name,
       LOWER(LEFT(primary_poc, 1)) AS first_initial,
       LOWER(RIGHT(primary_poc, 1)) AS last_initial,
       LOWER(LEFT(RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)), 1)) AS first_last_initial,
       LOWER(RIGHT(RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)), 1)) AS last_last_initial,
       LENGTH(REPLACE(primary_poc, ' ', '')) AS name_length,
       UPPER(REPLACE(name, ' ', '')) AS company_name
FROM accounts
LIMIT 20;

-- Get the length of the first name and last name.
SELECT primary_poc, name,
       LENGTH(LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1)) AS first_name_length,
       LENGTH(RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc))) AS last_name_length
FROM accounts
LIMIT 25;


/*
CAST
CAST takes a column and converts it to a different data type.
*/

-- create a crime_data table.
CREATE TABLE crime_data (
    incidnt_num VARCHAR(250),
    category VARCHAR(250),
    descript VARCHAR(300),
    day_of_week VARCHAR(250),
    date VARCHAR(300),
    time VARCHAR(300),
    pd_district VARCHAR(300),
    resolution VARCHAR(250),
    address VARCHAR(300),
    lon VARCHAR(250),
    lat VARCHAR(250),
    location VARCHAR(300),
    id VARCHAR(50)
    );

-- I used pgAdmin to import the CSV file into the crime_data table

-- Select the first 10 rows from the crime_data table.
SELECT *
FROM crime_data
LIMIT 10;

-- Use SUBSTRING and CONCAT to create a new column called date_time ih the format yyyy-mm-dd
SELECT date, time, CONCAT(SUBSTRING(date, 7, 4), '-', SUBSTRING(date, 1, 2), '-', SUBSTRING(date, 4, 2))
    AS date_time
FROM crime_data;

-- Use ::DATE to convert the date column to a date data type.
-- Use SUBSTR to convert the date column to format yyyy-mm-dd.
SELECT date, time,  (SUBSTR(date, 7, 4) || '-' || SUBSTR(date, 1, 2) || '-' || SUBSTR(date, 4, 2))::DATE AS date_date
FROM crime_data;



/*
COALESCE
COALESCE takes multiple columns and returns the first non-null value.
*/
SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;


-- Use COALESCE to fill the accounts.id column with the account.id for the NULL values
SELECT COALESCE(o.id, a.id) AS filled_id, a.name, a.website, a.lat,
       a.lon, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;


-- Use COALESCE to fill the orders.account_id column with the account.id for the NULL values
SELECT COALESCE(o.id, a.id) AS filled_id, a.name, a.website, a.lat,
       a.lon, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) as account_id,  o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;


-- Use COALESCE to fill the qty and usd columns with 0 for the NULL values
SELECT COALESCE(o.id, a.id) AS filled_id, a.name, a.website, a.lat, a.lon, a.primary_poc, a.sales_rep_id,
       COALESCE(o.account_id, a.id) as account_id, o.occurred_at, COALESCE(o.standard_qty, 0) as standard_qty,
       COALESCE(o.gloss_qty,0) as gloss_qty, COALESCE(o.poster_qty,0) as poster_qty, COALESCE(o.total,0) as total,
       COALESCE(o.standard_amt_usd,0) as standard_amt_usd, COALESCE(o.gloss_amt_usd,0) as gloss_amt_usd,
       COALESCE(o.poster_amt_usd,0) as poster_amt_usd, COALESCE(o.total_amt_usd,0) as total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;


-- Run the query again to see the results with where removed.
SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

-- Run the query again to see the results with where removed.
SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.lon, a.primary_poc, a.sales_rep_id,
       COALESCE(o.account_id, a.id) as account_id, o.occurred_at, COALESCE(o.standard_qty, 0) as standard_qty,
       COALESCE(o.gloss_qty,0) as gloss_qty, COALESCE(o.poster_qty,0) as poster_qty, COALESCE(o.total,0) as total,
       COALESCE(o.standard_amt_usd,0) as standard_amt_usd, COALESCE(o.gloss_amt_usd,0) as gloss_amt_usd,
       COALESCE(o.poster_amt_usd,0) as poster_amt_usd, COALESCE(o.total_amt_usd,0) as total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;


/*
SQL Window Functions
Window functions are a powerful tool that allow you to perform calculations on a set of rows.

Window functions are used in SQL to perform calculations across rows of a query result, similar to aggregate functions.
However, unlike aggregate functions, which return a single result per group, window functions return a value for each
row based on calculations performed over a specified set of rows, referred to as a "window".

Some common uses of window functions include calculating cumulative totals, running totals, percentiles, and rankings.
Examples of window functions include:
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PERCENT_RANK()
- NTILE()
- LAG()
- LEAD()
- FIRST_VALUE()
- LAST_VALUE()
- NTH_VALUE()

Window functions are used in conjunction with the OVER clause, which specifies the window over which the window
function will be applied.

The OVER clause can be used in the
SELECT, WHERE, and ORDER BY clauses.

Examples of window functions used in the SELECT clause:
SELECT order_id, product, price, SUM(price) OVER (ORDER BY order_id) AS running_total
FROM sales
ORDER BY order_id;

This query calculates the running total of price for each row in the sales table, ordered by order_id. The window
function SUM(price) OVER (ORDER BY order_id) calculates the cumulative sum of price for each row, based on the
specified window ORDER BY order_id. The result is a table that displays the running total for each row in the sales
table.
*/

--Create a empsalary table for the next few exercises
CREATE TABLE empsalary (
  id serial PRIMARY KEY,
  emp_no integer,
  name text,
  dep_id text,
  salary numeric,
  enroll_date date
);


-- Insert some data into the empsalary table
INSERT INTO empsalary (emp_no, name, dep_id, salary, enroll_date)
VALUES
  (101, 'John Doe', '1356', 91000, '2012-01-18'),
  (102, 'Jane Doe', '1356', 77000, '2016-02-11'),
  (103, 'Jim Smith', '8567', 90000, '2020-03-17'),
  (104, 'Sarah Johnson', '1356', 35000, '2021-04-11'),
  (105, 'Bob Brown', '1234', 52000, '2020-05-16'),
  (106, 'Liam Davis', '1356', 56000, '2020-06-21'),
  (107, 'Emma Wilson', '1356', 133000, '2015-07-01'),
  (108, 'Olivia Taylor', '1234', 35000, '2010-08-25'),
  (109, 'Noah Jones', '1234', 57000, '2017-09-21'),
  (110, 'Ethan Clark', '1390', 87000, '2018-10-18'),
  (111, 'Ava Lewis', '8567', 125000, '2019-11-19'),
  (112, 'Isabella Parker', '1356', 49000, '2022-12-15'),
  (113, 'William Davis', '1234', 87000, '2023-01-04'),
  (114, 'Mia Anderson', '1390', 39000, '2017-02-09'),
  (115, 'Jacob Wilson', '1356', 63000, '2017-03-01'),
  (116, 'Sophia Davis', '1234', 58000, '2020-04-21'),
  (117, 'Michael Wilson', '1234', 44000, '2016-05-19'),
  (118, 'Emily Anderson', '1390', 66000, '2020-06-28'),
  (119, 'Matthew Davis', '8567', 82000, '2021-07-26'),
  (120, 'Rellika Kisyula', '8567', 138000, '2009-09-23');
/*
The empsalary table contains the following data for employees in a company such as salary, department_id, and
enrollment date.
*/


--Create a departments table for the next few exercises
CREATE TABLE departments (
  id serial PRIMARY KEY,
  dep_id text,
  dep_name text,
  dep_location text
);
--Insert data into the departments table
INSERT INTO departments (dep_id, dep_name, dep_location)
VALUES
  ('1234', 'Accounting', 'Lansing'),
  ('1356', 'Sales', 'Chicago'),
  ('8567', 'IT', 'Boston'),
  ('1390', 'Engineering', 'New York');

-- Compare each employee's salary with the average salary in his or her department
-- Use JOIN to combine the empsalary and departments tables
SELECT e.name, e.salary, d.dep_name, d.dep_location,
       AVG(e.salary) OVER (PARTITION BY d.dep_name) AS avg_dep_salary
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
ORDER BY d.dep_name, e.salary DESC;
/*
The first three output columns come directly from the table empsalary, and there is one output row for each row in the
table. The fourth column represents an average taken across all the table rows that have the same dep_name value as the
current row. (This actually is the same function as the non-window avg aggregate, but the OVER clause causes it to be
treated as a window function and computed across the window frame.)

A window function call always contains an OVER clause directly following the window function's name and argument(s).
This is what syntactically distinguishes it from a normal function or non-window aggregate. The OVER clause determines
exactly how the rows of the query are split up for processing by the window function. The PARTITION BY clause within
OVER divides the rows into groups, or partitions, that share the same values of the PARTITION BY expression(s).
For each row, the window function is computed across the rows that fall into the same partition as the current row.

You can also control the order in which rows are processed by window functions using ORDER BY within OVER.
(The window ORDER BY does not even have to match the order in which the rows are output.) Here is an example:
SELECT name, salary, dep_name, dep_location,
       RANK() OVER (PARTITION BY dep_name ORDER BY salary DESC) AS dep_rank
FROM empsalary
JOIN departments
ON empsalary.dep_id = departments.dep_id
ORDER BY dep_name, salary DESC;
*/

-- Perform ranking of employees within each department based on salary
SELECT e.name, e.salary, d.dep_name, d.dep_location,
       RANK() OVER (PARTITION BY d.dep_name ORDER BY e.salary DESC) AS dep_rank
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
ORDER BY d.dep_name, e.salary DESC;
/*
As shown here, the rank function produces a numerical rank for each distinct ORDER BY value in the current row's
partition, using the order defined by the ORDER BY clause. rank needs no explicit parameter, because its behavior is
entirely determined by the OVER clause.

The rows considered by a window function are those of the “virtual table” produced by the query's FROM clause as
filtered by its WHERE, GROUP BY, and HAVING clauses if any. For example, a row removed because it does not meet the
WHERE condition is not seen by any window function. A query can contain multiple window functions that slice up the
data in different ways using different OVER clauses, but they all act on the same collection of rows defined by this
virtual table.

We already saw that ORDER BY can be omitted if the ordering of rows is not important. It is also possible to omit
PARTITION BY, in which case there is a single partition containing all rows.

There is another important concept associated with window functions: for each row, there is a set of rows within its
partition called its window frame. Some window functions act only on the rows of the window frame, rather than of the
whole partition. By default, if ORDER BY is supplied then the frame consists of all rows from the start of the
partition up through the current row, plus any following rows that are equal to the current row according to the
ORDER BY clause. When ORDER BY is omitted the default frame consists of all rows in the partition. [5] Here is an
example using sum:

SELECT salary, sum(salary) OVER () FROM empsalary;
*/
SELECT salary, sum(salary) OVER () FROM empsalary;
/*
Above, since there is no ORDER BY in the OVER clause, the window frame is the same as the partition, which for lack of
PARTITION BY is the whole table; in other words each sum is taken over the whole table and so we get the same result
for each output row.

But if we add an ORDER BY clause, we get very different results:
SELECT salary, sum(salary) OVER (ORDER BY salary) FROM empsalary;
*/
SELECT salary, sum(salary) OVER (ORDER BY salary) FROM empsalary;
/*
Here the sum is taken from the first (lowest) salary up through the current one, including any duplicates of
the current one (notice the results for the duplicated salaries). The sum for the last row is the sum of all the
salaries in the table.

Window functions are permitted only in the SELECT list and the ORDER BY clause of the query. They are forbidden
elsewhere, such as in GROUP BY, HAVING and WHERE clauses. This is because they logically execute after the processing
of those clauses. Also, window functions execute after non-window aggregate functions. This means it is valid to
include an aggregate function call in the arguments of a window function, but not vice versa.

If there is a need to filter or group rows after the window calculations are performed, you can use a sub-select.
For example:
*/
SELECT dep_name, emp_no, salary, enroll_date, pos
FROM
  (SELECT d.dep_name, e.emp_no, salary, enroll_date,
          rank() OVER (PARTITION BY d.dep_name ORDER BY salary DESC, e.emp_no) AS pos
     FROM empsalary e JOIN departments d ON (e.dep_id = d.dep_id)
  ) AS ss
WHERE pos < 3
ORDER BY salary DESC;
/*
The sub-select computes the rank for each row, and the outer query uses it to select the top two employees in each
department. The sub-select is also useful for adding a column to the output that is not part of the window function
calculation.

The above query only shows the rows from the inner query having rank less than 3.

When a query involves multiple window functions, it is possible to write out each one with a separate OVER clause,
but this is duplicative and error-prone if the same windowing behavior is wanted for several functions. Instead, each
windowing behavior can be named in a WINDOW clause and then referenced in OVER. For example:
*/
SELECT sum(e.salary) OVER w, avg(salary) OVER w
  FROM empsalary e
  JOIN departments d ON (e.dep_id = d.dep_id)
  WINDOW w AS (PARTITION BY d.dep_name ORDER BY salary DESC);

-- Find the top 1 employee in each department based on salary.
SELECT dep_name, emp_no, salary, enroll_date
FROM
  (SELECT d.dep_name, e.emp_no, salary, enroll_date,
          rank() OVER (PARTITION BY d.dep_name ORDER BY salary DESC, e.emp_no) AS pos
     FROM empsalary e JOIN departments d ON (e.dep_id = d.dep_id)
  ) AS ss
WHERE pos = 1;
/*
This code is a SQL query that retrieves data from two tables "empsalary" and "departments". The query first performs
a join between the two tables on the "dep_id" column, combining the relevant information from both tables into one
result set. The query then calculates the "pos" value for each row in the result set, using the "rank()" window
function.

The "rank()" function is used to determine the position of each row in the result set, based on the values of the
"salary" and "emp_no" columns. The function uses the "PARTITION BY" clause to group the rows by department name
("d.dep_name") and the "ORDER BY" clause to specify the sort order for each group (highest salary first, then employee
number).

Finally, the query filters the result set to only include rows where the "pos" value is equal to 1, using a "WHERE"
clause. This results in a table that shows the department name, employee number, salary, and enrollment date for the
employee with the highest salary in each department.
*/

-- Find the name, salary, and department and experience of each employee.
-- The Experience is calculated as the difference between the current date and the date of joining.
SELECT e.name, e.salary, d.dep_name, d.dep_location,
       age(current_date, e.enroll_date) AS experience
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
ORDER BY d.dep_name, e.salary DESC
LIMIT 10;

-- Find employees who have been with the company for more than 4 years.
SELECT e.name, e.salary, d.dep_name, d.dep_location,
       DATE_PART('year', age(current_date, e.enroll_date)) AS year_in_company
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE DATE_PART('year', age(current_date, e.enroll_date)) > 2
ORDER BY year_in_company DESC;

-- Find the average salary of employees in each department.
SELECT d.dep_name, d.dep_location, AVG(e.salary)
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location;

-- Find the name, salary, and department of employees whose salary is greater than the average salary of the
-- department.
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.salary > (SELECT AVG(salary) FROM empsalary WHERE dep_id = e.dep_id)
ORDER BY d.dep_name, e.salary DESC;


-- Find employees who work in the same department as the employee with the highest salary.
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id = (SELECT dep_id FROM empsalary ORDER BY salary DESC LIMIT 1)
ORDER BY d.dep_name, e.salary DESC;


-- Find the employees who work in the same department as Rellika Kisyula.
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id = (SELECT dep_id FROM empsalary WHERE name = 'Rellika Kisyula')
ORDER BY d.dep_name, e.salary DESC;

-- Find the employees who work in the same department as Matthew Davis and have a salary greater than his.
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id = (SELECT dep_id FROM empsalary WHERE name = 'Matthew Davis')
AND e.salary > (SELECT salary FROM empsalary WHERE name = 'Matthew Davis')
ORDER BY d.dep_name, e.salary DESC;

-- Find employee whose is paid more in department of Matthew Davis.
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id = (SELECT dep_id FROM empsalary WHERE name = 'Matthew Davis')
AND e.salary = (SELECT MAX(salary) FROM empsalary WHERE dep_id = e.dep_id)
ORDER BY d.dep_name, e.salary DESC;
/*
The query only selects data where the "dep_id" of the employee in the "empsalary" table matches the "dep_id" of the
employee whose name is "Matthew Davis", and the salary of the employee matches the maximum salary of all employees
within that department.
Finally, the data is ordered by the department name and then by the salary of the employee in descending order.
*/

-- Find the employee who joined the company latest
SELECT e.name, e.salary, d.dep_name, d.dep_location, e.enroll_date
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.enroll_date = (SELECT MAX(enroll_date) FROM empsalary)
ORDER BY d.dep_name, e.salary DESC;

-- Find the employee who joined the company earliest in each department.
SELECT e.name, e.salary, d.dep_name, d.dep_location, e.enroll_date
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.enroll_date = (SELECT MIN(enroll_date) FROM empsalary WHERE dep_id = e.dep_id)
ORDER BY d.dep_name, e.salary DESC;

-- Find the total salary of each department.
SELECT d.dep_name, d.dep_location, SUM(e.salary) AS total_salary
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location
ORDER BY d.dep_name, d.dep_location;


-- Find the highest salary
SELECT d.dep_name, MAX(e.salary) as salary
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name
ORDER BY salary DESC
LIMIT 1;



-- Find the total salary of the department where Ethan Clark works.
SELECT d.dep_name, d.dep_location, SUM(e.salary) AS total_salary
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id = (SELECT dep_id FROM empsalary WHERE name = 'Ethan Clark')
GROUP BY d.dep_name, d.dep_location
ORDER BY d.dep_name, d.dep_location;
/*
This code returns the department name, location and total salary of the employees in a department where the employee
named 'Ethan Clark' works.

Steps:
It selects the department name, department location and the sum of employee salaries from the empsalary table (e) and
departments table (d).

The empsalary and departments tables are joined on the 'dep_id' column, which is a foreign key in the empsalary table
that refers to the primary key in the departments table.

It filters the results to only include the department where the employee named 'Ethan Clark' works. This is done using
a subquery in the WHERE clause that retrieves the 'dep_id' of the employee named 'Ethan Clark' from the empsalary table.

The results are grouped by department name and location and ordered by the department name and location.

The final result shows the department name, location, and total salary for the department where the employee named
'Ethan Clark' works.
*/

-- Find employees whose salary is greater that average salary of department where Ethan Clark works.
-- STEP 1: Find average salary of department where Ethan Clark works.
SELECT AVG(e.salary) AS avg_salary
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id = (SELECT dep_id FROM empsalary WHERE name = 'Ethan Clark');

-- STEP 2: Find employees whose salary is greater that average salary of department where Ethan Clark works.
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.salary > (SELECT AVG(e.salary) AS avg_salary
                  FROM empsalary e
                  JOIN departments d
                  ON e.dep_id = d.dep_id
                  WHERE e.dep_id = (SELECT dep_id FROM empsalary WHERE name = 'Ethan Clark'))
ORDER BY d.dep_name, e.salary DESC;
-- How many employees work in each department?
SELECT d.dep_name, d.dep_location, COUNT(e.name) AS num_employees
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location
ORDER BY num_employees DESC;
/*
This SQL code is selecting the department name, department location, and count of employees in each department.
The data is being fetched from two tables: "empsalary" and "departments". The join condition is used to link the two
tables on the "dep_id" column.
The SELECT statement is retrieving the department name and location, as well as counting the number of employees in
each department. The result of this count is stored in the "num_employees" column.
The "GROUP BY" clause is grouping the data by the department name and location so that we get an aggregated result
for each department.
The "ORDER BY" clause is sorting the result in descending order based on the number of employees in each department.
*/

-- Find those departments where maximum number of employees work
SELECT d.dep_name, d.dep_location, COUNT(e.name) AS num_employees
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location
HAVING COUNT(e.name) = (SELECT MAX(num_employees) FROM
                        (SELECT COUNT(e.name) AS num_employees
                         FROM empsalary e
                         JOIN departments d
                         ON e.dep_id = d.dep_id
                         GROUP BY d.dep_name, d.dep_location) AS ss)
ORDER BY d.dep_name, d.dep_location;
/*
This code is used to find the department with the most employees, along with the number of employees and the location
of that department.

The steps involved in this code are:

Join the empsalary and departments tables on dep_id.
Group the result by dep_name and dep_location.
Count the number of employees in each group and label it as num_employees.
Find the department with the maximum number of employees by selecting the MAX num_employees from a subquery.
Filter the result from step 4 to get only departments with the maximum number of employees, using a HAVING clause.
Order the result by dep_name and dep_location.
*/

-- Find employees who don't work in the department where maximum number of employees work
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id <> (SELECT dep_id FROM
                   (SELECT d.dep_id
                    FROM empsalary e
                    JOIN departments d
                    ON e.dep_id = d.dep_id
                    GROUP BY d.dep_name, d.dep_id
                    HAVING COUNT(e.name) = (SELECT MAX(num_employees) FROM
                                            (SELECT COUNT(e.name) AS num_employees
                                             FROM empsalary e
                                             JOIN departments d
                                             ON e.dep_id = d.dep_id
                                             GROUP BY d.dep_name, d.dep_location) AS ss)) AS ss)
ORDER BY d.dep_name, e.salary DESC;
/*
This SQL query retrieves the name, salary, department name and location of all employees from the "empsalary" table
and joins it with the "departments" table. The "ON" clause specifies the join condition that the "dep_id" in the
"empsalary" table must match the "dep_id" in the "departments" table.

The query then filters the results to exclude all employees that belong to the department with the most number of
employees using a subquery. The subquery first counts the number of employees per department and location, then finds
the maximum count using another subquery. The "HAVING" clause in the subquery filters the result to only include
departments with the maximum count of employees.

The final result is sorted by the department name and then the employee salary in descending order.
*/

/*
You can also use the following STEPS to solve the above problem:
STEP 1: Find the department where maximum number of employees work.
STEP 2: Find employees who don't work in the department where maximum number of employees work.
*/


-- Find the department where maximum number of employees work.
SELECT d.dep_name, d.dep_location, COUNT(e.name) AS num_employees
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location
HAVING COUNT(e.name) = (SELECT MAX(num_employees) FROM
                        (SELECT COUNT(e.name) AS num_employees
                         FROM empsalary e
                         JOIN departments d
                         ON e.dep_id = d.dep_id
                         GROUP BY d.dep_name, d.dep_location) AS ss)
ORDER BY d.dep_name, d.dep_location;

-- Find employees who don't work in the department where maximum number of employees work.
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id <> (SELECT dep_id FROM
                   (SELECT d.dep_id
                    FROM empsalary e
                    JOIN departments d
                    ON e.dep_id = d.dep_id
                    GROUP BY d.dep_name, d.dep_id
                    HAVING COUNT(e.name) = (SELECT MAX(num_employees) FROM
                                            (SELECT COUNT(e.name) AS num_employees
                                             FROM empsalary e
                                             JOIN departments d
                                             ON e.dep_id = d.dep_id
                                             GROUP BY d.dep_name, d.dep_location) AS ss)) AS ss)
ORDER BY d.dep_name, e.salary DESC;

-- You can also use LIMIT clause to find the department where maximum number of employees work.
SELECT d.dep_name, d.dep_location, COUNT(e.name) AS num_employees
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location
ORDER BY num_employees DESC
LIMIT 1;


SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.dep_id <> (SELECT d.dep_id
                    FROM empsalary e
                    JOIN departments d
                    ON e.dep_id = d.dep_id
                    GROUP BY d.dep_name, d.dep_id
                    ORDER BY COUNT(e.name) DESC
                    LIMIT 1)
ORDER BY d.dep_name, e.salary DESC;

-- Find those employees whose salary is equal or more to the average of maximum and minimum salary
SELECT e.name, e.salary, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.salary >= (SELECT (MAX(salary) + MIN(salary))/2
                   FROM empsalary e)
ORDER BY d.dep_name, e.salary DESC;

-- Find those departments where the number of character in the first name is equal to character in department name
-- Use POSITION() function to find the position of the first space in the name.
-- Use SUBSTRING() function to extract the first name.
-- Use LENGTH() function to find the length of the first name.
-- Use LENGTH() function to find the length of the department name.
SELECT d.dep_name, d.dep_location, e.name
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE LENGTH(SUBSTRING(e.name, 1, POSITION(' ' IN e.name) - 1)) = LENGTH(d.dep_name)
ORDER BY d.dep_name, e.name;


-- Find employees who joined the company in the same date
SELECT e.name, e.salary, e.enroll_date, d.dep_name, d.dep_location
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.enroll_date IN (SELECT enroll_date
                         FROM empsalary
                         GROUP BY enroll_date
                         HAVING COUNT(name) > 1)
ORDER BY e.enroll_date, e.salary DESC;

-- Find department where more than average number of employees work
-- STEP 1: Find the number of employees in each department.
SELECT COUNT(e.name) AS num_employees
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name;
-- STEP 2: Find the average number of employees
SELECT AVG(num_employees) FROM
(SELECT COUNT(e.name) AS num_employees
 FROM empsalary e
 JOIN departments d
 ON e.dep_id = d.dep_id
 GROUP BY d.dep_name) AS ss;


-- STEP 3: Find the departments where the number of employees is more than average number of employees.
SELECT d.dep_name, d.dep_location, COUNT(e.name) AS num_employees
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location
HAVING COUNT(e.name) > (SELECT AVG(num_employees) FROM
                        (SELECT COUNT(e.name) AS num_employees
                         FROM empsalary e
                         JOIN departments d
                         ON e.dep_id = d.dep_id
                         GROUP BY d.dep_name) AS ss)
ORDER BY d.dep_name, d.dep_location;


-- Find recently hired employees in each department. The result should have 4 rows.
SELECT d.dep_name, d.dep_location, e.name, e.enroll_date
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.enroll_date IN (SELECT MAX(enroll_date)
                       FROM empsalary e
                       WHERE e.dep_id = d.dep_id)
ORDER BY d.dep_name, e.enroll_date;

-- Find the department where the average salary is more than the average salary of the company.
SELECT d.dep_name, d.dep_location, AVG(e.salary) AS avg_salary
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name, d.dep_location
HAVING AVG(e.salary) > (SELECT AVG(salary)
                        FROM empsalary)
ORDER BY d.dep_name, d.dep_location;

-- Create a running total of standard_amt_usd (in the orders table) over order time.
SELECT occurred_at, standard_amt_usd, SUM(standard_amt_usd) OVER (ORDER BY occurred_at) AS running_total
FROM orders
ORDER BY occurred_at
LIMIT 10;

-- Create a running total of standard_amt_usd (in the orders table) over order time, but this time, date truncate
-- occurred_at by year and partition by that same year-truncated occurred_at variable
SELECT DATE_TRUNC('year', occurred_at) as year, standard_amt_usd, SUM(standard_amt_usd)
    OVER (PARTITION BY EXTRACT(YEAR FROM occurred_at) ORDER BY occurred_at) AS running_total
FROM orders
ORDER BY occurred_at;

/*
RANK()
RANK() is a window function that assigns a rank to each row in a result set. The rank is based on the order of the rows
in the result set. The first row has a rank of 1, the second row has a rank of 2, and so on. If two rows have the same
value, the next row will have a rank that skips the next number in the sequence. For example, if the third and fourth
rows have the same value, the next row will have a rank of 5.

Example:
SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS rank
FROM empsalary
ORDER BY salary DESC;

In SQL, the RANK function is used to assign a unique rank or a numbering to each row within a result set based on a
specific column.
*/

-- Find the rank of each employee based on salary
SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS rank
FROM empsalary
ORDER BY salary DESC;

-- Lets create a students table to demonstrate the use of RANK() function
CREATE TABLE student (
    id serial PRIMARY KEY,
    student_number text NOT NULL,
    name text NOT NULL,
    english integer NOT NULL,
    mathematics integer NOT NULL,
    science integer NOT NULL,
    kiswahili integer NOT NULL,
    social_studies integer NOT NULL
);

INSERT INTO student (student_number, name, english, mathematics, science, kiswahili, social_studies)
VALUES
    ('s001', 'John Doe', 75, 83, 100, 85, 92),
    ('s002', 'Jane Doe', 95, 75, 56, 87, 96),
    ('s003', 'Jim Smith', 80, 85, 95, 75, 84),
    ('s004', 'Lisa Williams', 92, 75, 94, 75, 73),
    ('s005', 'Bob Johnson', 85, 93, 80, 79, 87),
    ('s006', 'Mary Brown', 75, 89, 98, 83, 80),
    ('s007', 'Patricia Jones', 65, 75, 70, 80, 90),
    ('s008', 'Linda Miller', 80, 85, 95, 75, 80),
    ('s009', 'Barbara Davis', 74, 78, 98, 87, 73),
    ('s010', 'Elizabeth Garcia', 89, 90, 82, 75, 100);

-- Let's see the students table
SELECT * FROM student;

-- Here's an example of using the RANK function in SQL to rank the students based on their total scores:
SELECT student_number, name, english + mathematics + science + kiswahili + social_studies AS total,
    RANK() OVER (ORDER BY english + mathematics + science + kiswahili + social_studies DESC) AS rank
FROM student
ORDER BY total DESC;
/*
This will give you a result set with the student number, name, total score, and their rank based on their total score,
with 1 being the highest score.
*/

/*
ROW_NUMBER()
The ROW_NUMBER function in SQL is used to assign a unique number to each row within a result set. You can use the
ROW_NUMBER function to assign a ranking to each row, which is useful for pagination and finding the top N records.

For example, let's say you want to find the top 5 students in terms of total marks in the student table you created.
You can use the ROW_NUMBER function as follows:

SELECT student_number, name, english + mathematics + science + kiswahili + social_studies AS total,
    ROW_NUMBER() OVER (ORDER BY english + mathematics + science + kiswahili + social_studies DESC) AS rank
FROM student
ORDER BY total DESC
LIMIT 5;
*/

SELECT student_number, name, english + mathematics + science + kiswahili + social_studies AS total,
    ROW_NUMBER() OVER (ORDER BY english + mathematics + science + kiswahili + social_studies DESC) AS rank
FROM student
ORDER BY total DESC
LIMIT 5;

-- We can also use WITH
WITH student_rank AS (
    SELECT student_number, name, english + mathematics + science + kiswahili + social_studies AS total,
        ROW_NUMBER() OVER (ORDER BY english + mathematics + science + kiswahili + social_studies DESC) AS rank
    FROM student
    ORDER BY total DESC
)
SELECT student_number, name, total, rank
FROM student_rank
WHERE rank <= 3;

SELECT name, mathematics, science, ROW_NUMBER() OVER (ORDER BY mathematics DESC) AS rank
FROM student;
/*
This query returns name, mathematics, science from the student table and adds an additional column rank which is
assigned a unique number based on the descending order of the mathematics score. The ROW_NUMBER() function assigns
a unique number to each row within the result set, with the first row getting 1, the second row getting 2, and so on.
The OVER clause defines the sorting order of the result set, in this case descending by mathematics.
*/

WITH student_scores AS (
  SELECT id, name, english + mathematics + science + kiswahili + social_studies AS total_score
  FROM student
)
SELECT id, name, total_score,
       ROW_NUMBER() OVER (ORDER BY total_score DESC) AS rank
FROM student_scores;
/*
In this example, a common table expression (CTE) student_scores is used to calculate the total score for each student
by summing up their scores in each subject. The ROW_NUMBER() function is then used to assign a unique rank to each
student based on their total score in descending order.
*/

-- Select the id, account_id, and total variable from the orders table, then create a column called total_rank that
-- ranks this total amount of paper ordered (from highest to lowest) for each account using a partition. Your final
-- table should have these four columns.
SELECT id, account_id, total, ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders;

-- NOTE: When you omit the ORDER BY clause in an aggregate with window functions, the order in which the rows are
-- processed is undefined. This means that the result of the aggregate with the window function will also be undefined
-- and can vary each time the query is run. It is therefore recommended to always include an ORDER BY clause to specify
-- the order in which the rows should be processed when using window functions in aggregates.

/*
ALIASES FOR WINDOW FUNCTIONS
The following aliases can be used for window functions in SQL:
RANK() -> DENSE_RANK()
RANK() -> ROW_NUMBER()
*/

-- When writing multiple window functions in a single query, you can use the following aliases to simplify the query:
SELECT name, salary,
    RANK() OVER main_window AS rank,
    MIN(salary) OVER main_window AS min_salary,
    MAX(salary) OVER main_window AS max_salary
FROM empsalary
WINDOW main_window AS (ORDER BY salary DESC);

/*
Now, create and use an alias to shorten the following query that has multiple window functions. Name the alias
account_year_window, which is more descriptive than main_window.

SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS count_total_amt_usd,
       AVG(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS min_total_amt_usd,
       MAX(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS max_total_amt_usd
FROM orders
*/
SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER account_year_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at));

/*
COMPARING ROWS WITH PREVIOUS ROWS
The LAG() and LEAD() functions can be used to compare the current row with the previous or next row in the result set.
The LAG function takes two arguments: the first is the expression that you want to retrieve for the previous row, and
the second is an offset that specifies how many rows back from the current row you want to retrieve the value from.

The general syntax for the LAG() function is:
LAG(column, offset, default_value) OVER (ORDER BY order_columns)
Where: - column is the column you want to retrieve the value from.
       - offset is the number of rows ahead to look.
       - default_value is the value to return if there is no next row.
       - ORDER BY is used to specify the order of the rows.

For example:
SELECT name,
       english,
       LAG(english, 1) OVER (ORDER BY id) AS prev_english
FROM student;
This query returns the name, english, and previous english score for each student in the student table. The LAG()
function is used to retrieve the previous english score for each student, with the offset set to 1. This means that the
previous english score is retrieved from the row that comes before the current row in the result set.
The ORDER BY clause specifies the order in which the rows are processed, and the result set will be sorted by the
id column in ascending order.
*/
SELECT name,
       english,
       LAG(english, 1) OVER (ORDER BY id) AS prev_english
FROM student;

/*
The LEAD() function is similar to the LAG() function, except that it retrieves the value from the next row instead of
the previous row. The LEAD() function takes two arguments: the first is the expression that you want to retrieve for
the next row, and the second is an offset that specifies how many rows forward from the current row you want to
retrieve the value from.

The general syntax for the LEAD() function is:
LEAD(column, offset, default_value) OVER (ORDER BY order_columns)
Where: - column is the column you want to retrieve the value from.
       - offset is the number of rows ahead to look.
       - default_value is the value to return if there is no next row.
       - ORDER BY is used to specify the order of the rows.

For example:
SELECT name,
       english,
       LEAD(english, 1) OVER (ORDER BY id) AS next_english
FROM student;
This query returns the name, english, and next english score for each student in the student table. The LEAD()
function is used to retrieve the next english score for each student, with the offset set to 1. This means that the
next english score is retrieved from the row that comes after the current row in the result set.
The ORDER BY clause specifies the order in which the rows are processed, and the result set will be sorted by the
id column in ascending order.

You can use the LAG() and LEAD() functions to perform the following tasks:
To find the next value in a sequence of data, such as calculating the next quarter's revenue based on current quarter's
revenue.
To compare the current row to the next row in a result set, such as calculating the increase or decrease in stock price
from one day to the next.
To perform a running calculation, such as finding the cumulative total of sales over a set of rows.
To compute the difference between two rows, such as calculating the time elapsed between two events.
*/
SELECT name,
       english,
       LEAD(english, 1) OVER (ORDER BY id) AS next_english
FROM student;

/*
PERCENTILE -NTILE() FUNCTION
The NTILE() function divides the rows in a result set into a specified number of groups, and assigns a group number
to each row. The NTILE() function takes one argument, which is the number of groups to divide the rows into. The
groups are numbered from 1 to the number of groups specified.

The general syntax for the NTILE() function is:
NTILE(number_of_groups) OVER (ORDER BY order_columns)
Where: - number_of_groups is the number of groups to divide the rows into.
       - ORDER BY is used to specify the order of the rows.
*/

-- Calculate the 4th percentile of the students mathematics score.
SELECT name,
       mathematics,
       NTILE(4) OVER (ORDER BY mathematics) AS percentile
FROM student;

-- Calculating the 75th percentile in a mathematics score. Use WITH.
WITH student_percentile AS (
    SELECT name,
           mathematics,
           NTILE(4) OVER (ORDER BY mathematics) AS percentile
    FROM student
)
SELECT name,
       mathematics,
       percentile
FROM student_percentile
WHERE percentile = 3;

-- Use the NTILE functionality to divide the accounts into 4 levels in terms of the amount of standard_qty for their
-- orders. Your resulting table should have the account_id, the occurred_at time for each order, the total amount of
-- standard_qty paper purchased, and one of four levels in a standard_quartile column.

SELECT account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
FROM orders
ORDER BY account_id DESC;

-- Use the NTILE functionality to divide the accounts into two levels in terms of the amount of gloss_qty for their
-- orders. Your resulting table should have the account_id, the occurred_at time for each order, the total amount of
-- gloss_qty paper purchased, and one of two levels in a gloss_half column.
SELECT account_id,
       occurred_at,
       gloss_qty,
         NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
FROM orders
ORDER BY account_id DESC;

-- Use the NTILE functionality to divide the orders for each account into 100 levels in terms of the amount of
-- total_amt_usd for their orders. Your resulting table should have the account_id, the occurred_at time for each
-- order, the total amount of total_amt_usd paper purchased, and one of 100 levels in a total_percentile column.
SELECT account_id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
FROM orders
ORDER BY account_id DESC;


/*
WINDOW FUNCTIONS CONTINUED
*/
-- Find highest salary for each department.
SELECT d.dep_name AS department,
       MAX(e.salary) AS highest_salary
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
GROUP BY d.dep_name;
/*
This query returns the department name and the highest salary for each department. The GROUP BY clause is used to
group the rows by the department name, and the MAX() function is used to find the highest salary for each group.

However, if you want to get the employee name and the highest salary for each department, the query will not work
without using a subquery or a window function.
*/

-- Find highest salary for each department using a subquery.
SELECT d.dep_name AS department,
       e.salary AS highest_salary,
       e.name AS employee
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE e.salary = (SELECT MAX(salary)
                  FROM empsalary
                  WHERE dep_id = e.dep_id);

-- We can also rewrite the above subquery like below.
SELECT d.dep_name AS department,
       e.salary AS highest_salary,
       e.name AS employee
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE (e.salary, e.dep_id) IN (SELECT MAX(salary), dep_id
                               FROM empsalary
                               GROUP BY dep_id);

-- Find highest salary for each department using a window function.
-- Use RANK()
SELECT d.dep_name AS department,
       RANK() OVER (PARTITION BY e.dep_id
                    ORDER BY e.salary DESC) AS rank,
         e.salary AS highest_salary,
            e.name AS employee
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id;

-- Let's now use the RANK() function and subquery to find the highest salary for each department.
SELECT *
FROM (SELECT d.dep_name AS department,
       RANK() OVER (PARTITION BY d.dep_name
                    ORDER BY e.salary DESC) AS rank,
         e.salary AS highest_salary,
            e.name AS employee_name
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id) e
WHERE e.rank = 1;

-- Using LAG() function to find the difference between the current row and the previous row in the salary column.
SELECT d.dep_name AS department,
       e.salary AS salary,
       LAG(e.salary, 1) OVER (PARTITION BY e.dep_id
                              ORDER BY e.salary DESC) AS previous_salary,
       e.salary - LAG(e.salary, 1) OVER (PARTITION BY e.dep_id
                                        ORDER BY e.salary DESC) AS difference
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id;

-- Using LEAD() function to indicate if the salary is higher or lower than the next row for sales department.
SELECT d.dep_name AS department,
       e.salary AS salary,
       LEAD(e.salary, 1) OVER (PARTITION BY e.dep_id
                               ORDER BY e.salary DESC) AS next_salary,
       CASE WHEN e.salary > LEAD(e.salary, 1) OVER (PARTITION BY e.dep_id
                                                   ORDER BY e.salary DESC)
            THEN 'higher'
            ELSE 'lower'
       END AS salary_comparison
FROM empsalary e
JOIN departments d
ON e.dep_id = d.dep_id
WHERE d.dep_name = 'Sales';

-- Generate a product table with the product_id, product_category, brand, product_name, and price columns.
CREATE TABLE my_products (
    product_id INT,
    product_category VARCHAR(50),
    brand VARCHAR(50),
    product_name VARCHAR(50),
    price INT
);

-- Insert data into the products table.
INSERT INTO my_products (product_id, product_category, brand, product_name, price)
VALUES
(1, 'Phone', 'Apple', 'iPhone 13 Pro Max', 1300),
(2, 'Phone', 'Apple', 'iPhone 13 Pro', 1100),
(3, 'Phone', 'Apple', 'iPhone 13', 1000),
(4, 'Phone', 'Samsung', 'Galaxy Z Fold 4', 1800),
(5, 'Phone', 'Samsung', 'Galaxy Z Flip 4', 1000),
(6, 'Phone', 'Samsung', 'Galaxy Note 20 Plus', 1200),
(7, 'Phone', 'Samsung', 'Galaxy S23', 1500),
(8, 'Phone', 'OnePlus', 'OnePlus 10', 800),
(9, 'Phone', 'Google', 'Pixel 5', 600),
(10, 'Laptop', 'Apple', 'MacBook Pro 13', 2000),
(11, 'Laptop', 'Apple', 'MacBook Air', 1200),
(12, 'Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
(13, 'Laptop', 'Dell', 'XPS 13', 2000),
(14, 'Laptop', 'Dell', 'XPS 15', 2300),
(15, 'Laptop', 'Dell', 'XPS 17', 2500),
(16, 'Earphone', 'Apple', 'AirPods Pro', 280),
(17, 'Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
(18, 'Earphone', 'Samsung', 'Galaxy Buds Live', 170),
(19, 'Earphone', 'Sony', 'WF-1000XM4', 250),
(20, 'Headphone', 'Sony', 'WH-1000XM4', 400),
(21, 'Headphone', 'Apple', 'AirPods Max', 550),
(22, 'Headphone', 'Microsoft', 'Surface Headphones 2', 250),
(23, 'Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
(24, 'Smartwatch', 'Apple', 'Apple Watch SE', 400),
(25, 'Smartwatch', 'Samsung', 'Galaxy Watch 4', 600);


-- Display my_products table.
SELECT * FROM my_products;

/*
FIRST_VALUE() function returns the first value in the specified column. The function ignores null values.
The syntax of the FIRST_VALUE() function is as follows:
FIRST_VALUE(column_name) OVER (PARTITION BY column_name ORDER BY column_name ASC/DESC)
*/

-- Find the first product name for each product category.
SELECT *,
       FIRST_VALUE(product_name) OVER (PARTITION BY product_category
                                       ORDER BY product_id ) AS first_product
FROM my_products;

-- Write query to display the most expensive product under each category (corresponding to each record)
SELECT *,
       FIRST_VALUE(price) OVER (PARTITION BY product_category
                                ORDER BY price DESC) AS most_expensive_product
FROM my_products;


/*
LAST_VALUE() function returns the last value in the specified column. The function ignores null values.
The syntax of the LAST_VALUE() function is as follows:
LAST_VALUE(column_name) OVER (PARTITION BY column_name ORDER BY column_name ASC/DESC)
*/

-- Find the last product name for each product category.
SELECT *,
       LAST_VALUE(product_name) OVER (PARTITION BY product_category
                                      ORDER BY price DESC ) AS last_product
FROM my_products;
/*
The results above is not correct because the LAST_VALUE() function takes into consideration the default FRAME clause
which is RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.

RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW means that the function will return the last value in the current row
and all the rows preceding the current row.

To fix this, we need to specify the RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING clause.
*/

-- Find the last product name for each product category.
-- Specify the RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING clause.
SELECT *,
       LAST_VALUE(product_name) OVER (PARTITION BY product_category
                                      ORDER BY price DESC
                                      RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_product
FROM my_products;

/*
CUME_DIST() function returns the cumulative distribution of a value in a group of values.
The syntax of the CUME_DIST() function is as follows:
CUME_DIST() OVER (PARTITION BY column_name ORDER BY column_name ASC/DESC)
*/

-- Find the cumulative distribution of the price for each product category.
SELECT *,
       CUME_DIST() OVER (PARTITION BY product_category
                         ORDER BY price DESC) AS cumulative_distribution
FROM my_products;

SELECT *,
       round(CUME_DIST() OVER (PARTITION BY product_category
                         ORDER BY price DESC)::numeric, 2) AS cumulative_distribution
FROM my_products;


/*
PERCENT_RANK() function returns the percentage rank of a value in a group of values.
The syntax of the PERCENT_RANK() function is as follows:
PERCENT_RANK() OVER (PARTITION BY column_name ORDER BY column_name ASC/DESC)
*/

-- Find the percentage rank of the price for each product category.
SELECT *,
       round(PERCENT_RANK() OVER (ORDER BY price)::numeric * 100, 2) AS percentage_rank
FROM my_products;

-- Compare how expensive is Surface Headphones 2 compared to other products
SELECT product_name, percentage_rank
FROM (SELECT *,
             round(PERCENT_RANK() OVER (ORDER BY price)::numeric * 100, 2) AS percentage_rank
      FROM my_products) AS p_table
WHERE p_table.product_name = 'Surface Headphones 2';

/*
CTE (Common Table Expression) is a temporary result set that can be referenced in the FROM clause of a SELECT statement.
The CTE is defined using the WITH clause and can be used in the same query or in a subquery.
The CTE can be used to simplify complex queries and improve the readability of the query.
The CTE syntax is as follows:
WITH CTE_name AS (
    SELECT column_name
    FROM table_name
    WHERE condition
)
SELECT column_name
FROM CTE_name
*/

-- Display the student table
SELECT * FROM student;

-- Using CTE, find the students whose score in the math test is greater than the average score of all students.
WITH math_score AS (
    SELECT id, mathematics, name, AVG(mathematics) OVER () AS avg_math_score
    FROM student
)
SELECT s.id, s.name, s.mathematics, s.avg_math_score
FROM math_score AS s
WHERE s.mathematics > s.avg_math_score;

-- This can also be done by using a subquery.
SELECT s.id, s.name, s.mathematics, s.avg_math_score
FROM (SELECT id, mathematics, name, AVG(mathematics) OVER () AS avg_math_score
      FROM student) AS s
WHERE s.mathematics > (SELECT AVG(mathematics) FROM student);

-- Find the average price in my_products table.
SELECT AVG(price) FROM my_products;

-- Find the total price of each product category.
SELECT product_category, SUM(price) AS total_price
FROM my_products
GROUP BY product_category;

-- Using the query above, find the average total price of each product category.
SELECT AVG(total_price) FROM (
    SELECT SUM(price) AS total_price
    FROM my_products
    GROUP BY product_category
) AS p_table;

SELECT product_category, SUM(price) AS total_price
FROM my_products
GROUP BY product_category
HAVING SUM(price) > (SELECT AVG(total_price)
                     FROM (SELECT SUM(price) AS total_price
                           FROM my_products
                           GROUP BY product_category) AS p_table);

-- Rewrite the query above using CTE.
WITH product_category_total_price AS (
    SELECT product_category, SUM(price) AS total_price_per_category
    FROM my_products
    GROUP BY product_category
)
SELECT product_category, total_price_per_category
FROM product_category_total_price
WHERE total_price_per_category > (SELECT AVG(total_price_per_category)
                     FROM product_category_total_price);

-- Lets include the average total price in the result.
WITH product_category_total_price AS (
    SELECT product_category, SUM(price) AS total_price_per_category
    FROM my_products
    GROUP BY product_category
)
SELECT product_category, total_price_per_category,
       (SELECT AVG(total_price_per_category)
        FROM product_category_total_price) AS avg_total_price
FROM product_category_total_price
WHERE total_price_per_category > (SELECT AVG(total_price_per_category)
                     FROM product_category_total_price);


/*
MORE TRAINING ON JOINS
*/

-- Create join_employee tables, emp_id, emp_name, salary, dep_id, manager_id
CREATE TABLE join_employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dep_id INT,
    manager_id INT
);

-- Insert data into join_employee table
INSERT INTO join_employee (emp_id, emp_name, salary, dep_id, manager_id)
VALUES (1, 'James Smith', 50000, 1234, 6789),
       (2, 'Michael Jordan', 60000,1111 , 8888),
       (3, 'Robert Pattinson', 100000, 1111, 6666),
       (4, 'Emma Watson', 90000, 2345, 5678),
       (5, 'Meda Chepkoech', 110000, 2345, 5678),
       (6, 'Lionel Messi', 80000, 2222, 8976),
       (7, 'Cristiano Ronaldo', 70000, 1234, 8976),
       (8, 'Neyman Jr', 120000, 2345, 9999),
       (9, 'Virat Kohli', 95000, 4324, 6789),
       (10, 'Rohit Sharma', 85000, 4444, 8976),
       (11, 'Steve Smith', 105000, 4444, 9876),
       (12, 'Kane Williamson', 115000, 2345, 9876),
       (13, 'Joe Root', 125000, 3333, 9876),
       (14, 'Ben Stokes', 135000, 1234, 9999),
       (15, 'Marcus Labuschagne', 145000, 3333, 7777);

-- Display the join_employee table
SELECT * FROM join_employee;

-- Create join_department table, dep_id, dep_name
CREATE TABLE join_department (
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(50)
);
-- Insert data into join_department table
INSERT INTO join_department (dep_id, dep_name)
VALUES (1234, 'Sales'),
       (2345, 'Marketing'),
       (4321, 'IT'),
       (4324, 'Finance'),
       (5678, 'Human Resources'),
       (5432, 'Admin'),
       (6543, 'Operations');
-- Display the join_department table
SELECT * FROM join_department;

-- Create join_manager table, manager_id, manager_name, dep_id
CREATE TABLE join_manager (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(50),
    dep_id INT
);

-- Insert data into join_manager table
INSERT INTO join_manager (manager_id, manager_name, dep_id)
VALUES (5678, 'Rellika Kisyula', 2345),
       (6789, 'Jane Doe', 4321),
       (9876, 'Christie Markus', 4324),
       (8976, 'Miles Morales', 1234),
       (8667, 'Superman Clark', 2345),
       (9870, 'Kratos Spartan', 4324),
       (8765, 'Lara Croft', 4322),
       (5432, 'Tony Stark', 4324),
       (2109, 'Peter Parker', 2335),
       (4987, 'Bruce Wayne', 4321);

-- Display the join_manager table
SELECT * FROM join_manager;

-- Create a join_project table, project_id, project_name, team_member_id
CREATE TABLE join_project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    team_member_id INT
);
-- Insert data into join_project table
INSERT INTO join_project (project_id, project_name, team_member_id)
VALUES (1, 'SQL Injection', 5678),
         (2, 'Web Development', 82),
         (3, 'Data Analysis', 14),
         (4, 'Machine Learning', 79),
         (5, 'Visualization With Python', 5678),
         (6, 'Test Automation', 6789),
         (7, 'Adding Authentication Services', 9876),
         (8, 'Mining and Data Collection', 1);

-- Display the join_project table
SELECT * FROM join_project;

-- Fetch the employee name, salary, department name
SELECT e.emp_name, e.salary, d.dep_name
FROM join_employee e
JOIN join_department d
ON d.dep_id = e.dep_id;

-- Fetch all the employees and their department name
SELECT e.emp_name, d.dep_name
FROM join_employee e
LEFT JOIN join_department d
ON d.dep_id = e.dep_id;

-- Fetch all departments and the employees in each department using RIGHT JOIN
SELECT d.dep_name, e.emp_name
FROM join_employee e
RIGHT JOIN join_department d
ON d.dep_id = e.dep_id;
-- Fetch all employees, their department name, their manager name and the project they are working on
SELECT e.emp_name, d.dep_name, m.manager_name, p.project_name
FROM join_employee e
LEFT JOIN join_department d
ON d.dep_id = e.dep_id
LEFT JOIN join_manager m
ON m.manager_id = e.manager_id
LEFT JOIN join_project p
ON p.team_member_id = e.emp_id;

-- Fetch all the employees and all the departments name
SELECT e.emp_name, d.dep_name
FROM join_employee e
FULL JOIN join_department d
ON d.dep_id = e.dep_id;

-- SELF JOIN
-- Create a family table, id, name, parent_id, age
CREATE TABLE family (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    parent_id INT,
    age INT
);
-- Insert data into family table
INSERT INTO family (id, name, parent_id, age)
VALUES (1, 'James Smith', NULL, 70),
       (2, 'Michael Jordan', NULL, 60),
       (3, 'Robert Pattinson', 1, 35),
       (4, 'Emma Watson', 1, 28),
       (5, 'Meda Chepkoech', 2, 8),
       (6, 'Lionel Messi', 2, 5),
       (7, 'Cristiano Ronaldo', 3, 3),
       (8, 'Neyman Jr', 3, 2),
       (9, 'Virat Kohli', 4, 9),
       (10, 'Rohit Sharma', 4, 5);

-- Display the family table
SELECT * FROM family;

-- Fetch all the children and their parents name
SELECT f1.name AS child, f2.name AS parent, f1.age AS child_age, f2.age AS parent_age
FROM family f1
JOIN family f2
ON f1.parent_id = f2.id;

/*
SUB QUERY REVISIT
*/

-- Find the employees who earn more than the average salary
SELECT emp_name, salary
FROM join_employee
WHERE salary > (SELECT AVG(salary) FROM join_employee);

/*
SCALAR SUB QUERY
Scalar sub query returns a single value. It is used in the WHERE clause, HAVING clause, SELECT clause and INSERT clause.
Example:
SELECT emp_name, salary
FROM join_employee
WHERE salary > (SELECT AVG(salary) FROM join_employee);
*/

-- Find the employees who earn more than the average salary
SELECT emp_name, salary
FROM join_employee
WHERE salary > (SELECT AVG(salary) FROM join_employee);

/*
MULTI ROW SUB QUERY
Multi row sub query returns multiple rows.
Example:
SELECT emp_name, salary
FROM join_employee
WHERE salary IN (SELECT salary FROM join_employee WHERE salary > 90000);
*/
SELECT emp_name, salary
FROM join_employee
WHERE salary IN (SELECT salary FROM join_employee WHERE salary > 90000);

/*
MULTI COLUMN SUB QUERY
Multi column sub query returns multiple columns.
Example:
SELECT emp_name, salary
FROM join_employee
WHERE (emp_name, salary) IN (SELECT emp_name, salary FROM join_employee WHERE salary > 90000);
*/
SELECT emp_name, salary
FROM join_employee
WHERE (emp_name, salary) IN (SELECT emp_name, salary FROM join_employee WHERE salary > 90000);

-- Find the employees who earn most in each department. Include the department name
SELECT e.emp_name, e.salary, d.dep_name, e.dep_id
FROM join_employee e
JOIN join_department d
ON d.dep_id = e.dep_id
WHERE e.salary = (SELECT MAX(salary) FROM join_employee WHERE dep_id = e.dep_id);

-- We can also use WITH clause to solve the above problem. Include the department name
WITH max_salary AS (
    SELECT dep_id, MAX(salary) AS max_salary
    FROM join_employee
    GROUP BY dep_id
)
SELECT e.emp_name, e.salary, d.dep_name, e.dep_id
FROM join_employee e
JOIN join_department d
ON d.dep_id = e.dep_id
JOIN max_salary m
ON m.dep_id = e.dep_id
WHERE e.salary = m.max_salary;

/*
CORRELATED SUB QUERY
Correlated sub query is a sub query that uses a column from the outer query.
Example:
SELECT emp_name, salary
FROM join_employee
WHERE salary > (SELECT AVG(salary) FROM join_employee WHERE dep_id = 1);
*/
SELECT emp_name, salary, dep_id
FROM join_employee e
WHERE salary > (SELECT AVG(salary) FROM join_employee e2 WHERE e2.dep_id = e.dep_id);

-- Find the employees who earn more than the average salary of their department
SELECT emp_name, salary, dep_id
FROM join_employee e
WHERE salary > (SELECT AVG(salary) FROM join_employee e2 WHERE e2.dep_id = e.dep_id);

-- Find the employees who earn more than the average salary of their department. Include the department name
SELECT e.emp_name, e.salary, d.dep_name, e.dep_id
FROM join_employee e
JOIN join_department d
ON d.dep_id = e.dep_id
WHERE e.salary > (SELECT AVG(salary) FROM join_employee e2 WHERE e2.dep_id = e.dep_id);

-- Find the employees who earn more than the average salary of their department. Include the department name and
-- the average salary of the department
SELECT e.emp_name, e.salary, d.dep_name, e.dep_id,
       (SELECT AVG(salary) FROM join_employee e2 WHERE e2.dep_id = e.dep_id) AS avg_salary
FROM join_employee e
JOIN join_department d
ON d.dep_id = e.dep_id
WHERE e.salary > (SELECT AVG(salary) FROM join_employee e2 WHERE e2.dep_id = e.dep_id);

-- Get average salary of each department, include the department name
SELECT d.dep_name, e.dep_id, AVG(e.salary) AS avg_salary
FROM join_employee e
JOIN join_department d
ON d.dep_id = e.dep_id
GROUP BY e.dep_id, d.dep_name;

-- Show employees in Finance department who earn more than the average salary of the Finance department
SELECT e.emp_name, e.salary, d.dep_name, e.dep_id
FROM join_employee e
JOIN join_department d
ON d.dep_id = e.dep_id
WHERE d.dep_name = 'Finance';

-- Find department who do not have any employee
SELECT d.dep_name, d.dep_id
FROM join_department d
LEFT JOIN join_employee e
ON d.dep_id = e.dep_id
WHERE e.emp_id IS NULL;

-- We can also use NOT EXISTS to solve the above problem
SELECT d.dep_name, d.dep_id
FROM join_department d
WHERE NOT EXISTS (SELECT * FROM join_employee e WHERE e.dep_id = d.dep_id);


















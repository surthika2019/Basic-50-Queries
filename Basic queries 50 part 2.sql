/*JOINS*/

/*JOINS*/
/*Types of Join*/
/* 1. Inner join*/
/* 2. Outer Join (Left Outer join, right Outer Join, Full outer Join)*/
/* 3. self join*/

/* INNER JOIN : returns only rows that have matching values in both tables
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;*/

/*OUTER JOIN*/
/*LEFT JOIN : returns all rows from the left table (table1), and only the matched rows from the right table (table2).
If there is no match in the right table, the result for the columns from the right table will be NULL.
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;*/

/*RIGHT JOIN : returns all rows from the right table (table2), and only the matched rows from the left table (table1).
If there is no match in the left table, the result for the columns from the left table will be NULL.
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;*/

/*FULL JOIN :  returns all rows when there is a match in either the left or right table.
If a row in the left table has no match in the right table, the result set includes the left row's data and NULL values for all columns of the right table.
If a row in the right table has no match in the left table, the result set includes the right row's data and NULL values for all columns of the left table.
SELECT column_name(s)
FROM table1
FULL JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;*/

/*SELF JOIN : A self join is a regular join, but the table is joined with itself.
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;*/

 /*-------------------*/
 
 
/*I wanna see SPID which along their name which is it available in this column.
so the names are available in People column. 
And am gonna Join them both to get the details like I Wish*/
select * from sales;
select * from people;

/*will show only the saledate, amount and spid of Sales table which we named as s*/
select s.SaleDate, s.Amount, s.SPID 
from sales s;

/* We joined the two tables with Join function using SPID as Primary key(Key column) */
select s.SaleDate, s.Amount, s.spid, p.SPID, p.Salesperson
from sales s
join people p on p.SPID = s.SPID;

/*left join using sales and product table*/
/*Since we started from sales table, that will be my left table. product will be my right table*/
/*Since we are Performing left join, left table details will be kept fully
while only the similar values join from right table*/

select s.SaleDate, s.Amount, pr.product
from sales s
left join products pr on pr.PID = s.PID;

/*Joininng Multiple table (sales, product, people)*/
select s.SaleDate, s.Amount, s.spid, p.Salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = s.PID;

/*Joins can also have conditions*/
select s.SaleDate, s.Amount, s.spid, p.Salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = s.PID
where s.Amount <500;

/*Multiple joins with multiple conditions*/
select s.SaleDate, s.Amount, s.spid, p.Salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = s.PID
where s.Amount <500
and p.team = 'Jucies';

/*Extract the ppl who doesn't belong to any table*/
select s.SaleDate, s.Amount, s.spid, p.Salesperson, pr.product, p.team
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = s.PID
where s.Amount <500
and p.team = '';

/*Extract the data for Location either India or New Zealand*/
select s.SaleDate, s.Amount, s.spid, p.Salesperson, pr.product, p.team, g.Geo
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = s.PID
join geo g on g.GeoID = s.GeoID
where s.Amount <500
and p.team = ''
and g.Geo in ('New Zealand','India')
Order by SaleDate;


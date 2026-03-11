/* GROUP BY : used in conjunction with aggregate functions, like COUNT(), MAX(), MIN(), SUM(), AVG(), to perform calculations on each group.
              used to group rows that have the same values into summary rows, like "Find the number of customers in each country".
              SELECT column1, aggregate_function(column2), column3, ...
FROM table_name
WHERE condition
GROUP BY column1, column3
ORDER BY column_name;*/

/* Extracting the total amount of geoID's present*/
select geoID, sum(amount)
from sales
group by geoID;
              
select geoID, sum(amount), avg(amount), sum(boxes)
from sales
group by geoID;      

/*We can also fo this in Joined tables*/
select g.geo, sum(amount), avg(amount), sum(boxes)
from sales s
join geo g on s.GeoID = g.GeoID
group by g.Geo;   

/*Get data from ppl and product table*/
select pr.category, p.team, sum(boxes), sum(amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
group by pr.category, p.team;

/*With Order by*/
select pr.category, p.team, sum(boxes), sum(amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
group by pr.category, p.team
order by pr.category, p.team;

/*When we dont need the null value*/
select pr.category, p.team, sum(boxes), sum(amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where p.team <> ''      /*<> means is not equal to*/
group by pr.category, p.team
order by pr.category, p.team;

/*Total amounts by product amount*/
select pr.Product, sum(s.amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'Total Amount' desc;

/*Total amounts by product amount and just the top 10*/
select pr.Product, sum(s.amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'Total Amount' desc
limit 10;
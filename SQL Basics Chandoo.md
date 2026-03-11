show tables;

desc geo;

desc sales;

select \* from sales;

select SaleDate, Customers from sales;



###### **/\* Order doesn't matter. it will provide in the order we want it to be \*/**



select Boxes, Amount, PID from sales;



###### **/\* arithmetic function \*/**



select SaleDate, Amount, Boxes, Amount / Boxes from sales;



###### **/\* column name changing for the Arithmetically Operated Coulmn \*/**



select SaleDate, Amount, Boxes, Amount / Boxes as 'Amount per box' from sales;



select SaleDate, Amount, Boxes, Amount / Boxes 'Amount per box' from sales;



###### **/\* Where clause \*/**



select \* from sales

where amount > 10000;



###### **/\* Order by in Ascending and descending \*/**



select \* from sales

where amount > 10000

order by amount;



select \* from sales

where amount > 10000

order by amount desc;



###### **/\* Order by Operations in multiple Columns \*/**



select \* from sales

where GeoID = 'g1'

order by PID, Amount desc;



###### **/\* With date Function \*/**



select \* from sales

where Amount > 10000 and SaleDate >= '2022-01-01';



select SaleDate, Amount from sales

where Amount > 10000 and year(SaleDate) = 2022

order by Amount desc;



###### **/\* With Between function \*/**



select \* from sales

where Boxes > 0 and  Boxes <= 50;



###### **/\* this is the alternative method but this includes 0 too \*/**



select \* from sales

where Boxes between 0 and 50;



###### **/\* weekday Function \*/**



select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week' from sales

where weekday(SaleDate) = 4;



##### **/\* Using other tables \*/**



select \* from people;



###### **/\* Get data of ppl from either Delish or Jucies\*/**



select \* from people

where team = 'Delish' or team = 'Jucies';



###### **/\* Using In Clause\*/**

select \* from people

where team in ('Delish', 'Jucies');



###### **/\* PATTERN MATCHING\*/**

#### 


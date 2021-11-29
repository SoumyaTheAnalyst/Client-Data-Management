CREATE DATABASE [Client Data Management];

USE [Client Data Management];

SELECT * FROM Master_Dataset;

--01. find how many quentity are sold of each product.
select [Product ID], sum([Quantity]) as total_quantity from Master_Dataset group by [Product ID];

--02. find total sales in respective year.
select YEAR([order date]) as sales_year, SUM([Quantity]) as total_sales from Master_Dataset group by year( [Order Date]);

--03. how many products purchased by each customer.
select count([Product ID]) as Total_purchased_product, [customer id] from Master_Dataset group by [Customer ID];

--04. Find out top 5 best-selling product.
select top 5 [Product ID], sum([Quantity]) as TotalQuantity from Master_Dataset group by [product id] order by sum( [Quantity]) desc;

--05. Find out top 10 states in which we have maximum customer. 
select top 10 state, count(*)/ count (distinct ( [state])) as maxcustomer from Master_Dataset group by [state] order by maxcustomer desc;

--06. find count of category.
select Category, count(*) as totalqtys from Master_Dataset group by Category;

--07. find quentity and count of category and sub categoty.
select [Category], [Sub-Category], sum([Quantity]) as total_quentity,count([Sub-Category]) as [number_of_sub-category] from Master_Dataset group by Category, [Sub-Category];

--08. find Quantity of top 5 sub category.
select top 5 [Sub-Category], sum( [Quantity]) as TotalQuantity from Master_Dataset group by [Sub-Category] order by sum([quantity]) desc;

--09. find sales and counts of category and Sub-Category where category is furniture.
select [Category], [Sub-Category], sum([Sales]) as [Total_Sales], count([Sub-Category]) as [number_of_sub-category] from Master_Dataset
where [Category]= 'Furniture' group by [Category], [Sub-Category];

--10.find sales and counts of cate and sub cate where sales is more then 1000.
select [Category], [Sub-Category], sum ([Sales]) as [Total_Sales], count([Sub-Category]) as [number_of_sub-category] from Master_Dataset
where Sales > 1000 group by [Category], [Sub-Category];

--11. find out numbers of unique customers are there in this dataset?
select count(distinct([customer ID])) as [unique customer] from Master_Dataset;

--12. Find the customer with the lowest overall profit.
select min(profit) as [minimum profit] from Master_Dataset;

--13. Find the customer with the highest overall profit.
select max(profit) as [maximum profit] from Master_Dataset;

--14. Write a query to show the details of tachnology catagory.
select * from Master_Dataset where Category = 'technology';

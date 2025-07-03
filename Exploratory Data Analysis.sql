#EXPLORATORY DATA ANALYSIS

# Orders, Sales, quantity by region 
select c.region, count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from customers c
join orders o
on c.CustomerID =  o.CustomerID
group by c.Region

# Orders, Sales, quantity by Country
select c.Country, count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from customers c
join orders o
on c.CustomerID =  o.CustomerID
group by c.Country

#Top 15 Country with High Sales & quantity
select c.Country, count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from customers c
join orders o
on c.CustomerID =  o.CustomerID
group by c.Country
order by Total_Sales desc
limit 15

#Top 15 Country with Low Sales & quantity
select c.Country, count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from customers c
join orders o
on c.CustomerID =  o.CustomerID
group by c.Country
order by Total_Sales asc
limit 15

# Orders, Sales, quantity by Customer Segment
select c.Segment,count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from customers c
join orders o
on c.CustomerID =  o.CustomerID
group by c.Segment

# Orders, Sales, quatity by Category
select p.Category, count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from products p
join orders o
on p.ProductID =  o.ProductID
group by p.Category

# Orders, Sales, quatity by SubCategory
select p.SubCategory, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from products p
join orders o
on p.ProductID =  o.ProductID
group by p.SubCategory

#Most profittable Category 
select p.Category, sum(Quantity) Total_quantity, sum(o.Sales) Total_Sales , sum(o.Profit) Total_Profit
from orders o
join products p
on o.ProductID = p.ProductID
group by Category
order by Total_Profit desc

#Loss making SubCategory
select p.SubCategory, sum(o.Sales) Total_Sales , sum(o.Profit) Total_Profit
from orders o
join products p
on o.ProductID = p.ProductID
group by p.SubCategory
having Total_Profit < 0
order by Total_Profit desc

#Top 50 Products by Sales, Orders, Quantity
select distinct p.ProductName,count(orderID) Total_orders, p.ProductID, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from products p
join orders o
on p.ProductID =  o.ProductID
group by p.ProductID, p.ProductName
order by Total_Sales desc
limit 50

#Bottom 50 Products by Sales, Orders, Quantity
select distinct p.ProductName,count(orderID) Total_orders, p.ProductID, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from products p
join orders o
on p.ProductID =  o.ProductID
group by p.ProductID, p.ProductName
order by Total_Sales asc
limit 50

#Yearly Orders, Sales & Profit 
select 
case when ShipDate between '2011-01-01' and '2011-12-31' then 2011
     when ShipDate between '2012-01-01' and '2012-12-31' then 2012
     when ShipDate between '2013-01-01' and '2013-12-31' then 2013
     when ShipDate between '2014-01-01' and '2014-12-31' then 2014
     when ShipDate between '2015-01-01' and '2015-12-31' then 2015
     when ShipDate between '2016-01-01' and '2016-12-31' then 2016
end as Year_,
count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from products p
join orders o
on p.ProductID =  o.ProductID
group by year_
order by year_

#Season wise Orders, Sales & Profit 
SELECT 
case 
	 when month(ShipDate) between 1 and 3 then 'Jan-Mar'
	 when month(ShipDate) between 4 and 6 then 'Apr-Jun'
	 when month(ShipDate) between 7 and 9 then 'Jul-Sep'
	 when month(ShipDate) between 10 and 12 then 'Oct-Dec'
end as Season,
count(orderID) Total_orders, sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from products p
join orders o 
on p.ProductID = o.ProductID
group by Season
order by field(Season, 'Jan-Mar', 'Apr-Jun', 'Jul-Sep', 'Oct-Dec');

#Top 50 Customers by Profit
select distinct c.CustomerName, count(o.orderID) Total_orders,  sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from customers c
join orders o
on c.CustomerID =  o.CustomerID
group by c.CustomerID
order by Profit desc
limit 50

#Top 50 Loss making Customers 
select distinct c.CustomerName, count(o.orderID) Total_orders,  sum(o.sales) Total_Sales, sum(o.quantity) Total_Quantity, sum(ShippingCost) Total_ShippingCost, sum(o.Discount) Total_Discount, sum(o.Profit) as Profit
from customers c
join orders o
on c.CustomerID =  o.CustomerID
group by c.CustomerID
order by Profit asc
limit 50


# Profit margins by Category
select Category, sum(Sales) Total_Sales, sum(Profit) Total_Profit,
   round((sum(Profit) / sum(Sales)) * 100, 2)  Profit_Margin_Percentage
from orders o
join products p
on o.ProductID = p.ProductID
group by Category
order by Profit_Margin_Percentage desc;

# Profit margins by SubCategory
select p.SubCategory, sum(o.Sales) Total_Sales, sum(o.Profit) Total_Profit,
   round((sum(o.Profit) / sum(o.Sales)) * 100, 2)  Profit_Margin_Percentage
from orders o
join products p
on o.ProductID = p.ProductID
group by SubCategory
order by Profit_Margin_Percentage desc;

# Profit margins by Segment
select c.Segment, sum(o.Sales) Total_Sales, sum(o.Profit) Total_Profit,
   round((sum(o.Profit) / sum(o.Sales)) * 100, 2)  Profit_Margin_Percentage
from orders o
join customers c
on o.CustomerID = c.CustomerID
group by Segment
order by Profit_Margin_Percentage desc;

# Profit margins Customer
select c.CustomerName, sum(o.Sales) Total_Sales, sum(o.Profit) Total_Profit,
   round((sum(o.Profit) / sum(o.Sales)) * 100, 2)  Profit_Margin_Percentage
from orders o
join customers c
on o.CustomerID = c.CustomerID
group by c.CustomerName
order by Profit_Margin_Percentage desc;

#Factor affecting profit : ShippingCost
select 
    case 
        when ShippingCost < 20 then 'Low (<20)'
        when ShippingCost between 20 and 50 then 'Medium (20-50)'
        else 'High (>50)'
    end as ShippingCost_bucket,
    count(*) as orders,
    sum(sales) as total_sales,
    sum(profit) as total_profit,
    round((sum(profit) / sum(sales)) * 100, 2) as profit_margin
from orders
group by ShippingCost_bucket
order by ShippingCost_bucket;


#Factor affecting profit : Discount
select  distinct Discount, sum(profit) Total_profit
from orders
group by Discount
order by Discount

# Orders, Sales, quantity by region 
# Orders, Sales, quantity by Country
# Top 15 Country with High Sales & quantity
# Top 15 Country with Low Sales & quantity
# Orders, Sales, quantity by Customer Segment
# Orders, Sales, quatity by Category
# Orders, Sales, quantity by SubCategory
# Most profittable Category 
# Loss making SubCategory
# Top 50 Products by Sales, Orders, Quantity
# Bottom 50 Products by Sales, Orders, Quantity
# Yearly Orders, Sales & Profit 
# Season wise Orders, Sales & Profit 
# Top 50 Customers by Profit
# Top 50 Loss making Customers 
# Profit margins by Category
# Profit margins by SubCategory
# Profit margins by Segment
# Profit margins by customers
# Factor affecting profit : ShippingCost
# Factor affecting profit : Discount

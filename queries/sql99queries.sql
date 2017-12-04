#1.	Slice to find sales by type of customer, by state, by product type and business unit
select c.typeName as Customer_Type, typeDescription as Product_Type, BUID, c. state, SUM(f.salesAmount) TotalAmount
     from sales_fact f join product_dimension p using(product_sk)
    join customer_dimension c using(customer_sk)
     group by Customer_Type, Product_Type, BUID, state;


#2.	Drill Down on product to find description, type, total sales amount through year, quarter and month
select prodDescription,sum(salesAmount) TotalAmount,typeDescription, CalendarMonth, CalendarQuarter,CalendarYear
from Sales_Fact sf join product_dimension pd 
using(product_sk)
join Sale_Date_Dimension d
on sf.saledate_sk = d.saledate_sk 
group by prodDescription,typeDescription, CalendarYear;



#3.	Rank to find top customer 
select a.customer_sk, a.Name, a.CalendarYear, a.TotalSalesAmount, count(b.TotalSalesAmount) as Rank
from (select  cd.Name, cd.customer_sk, d.CalendarYear, sum(salesAmount) TotalSalesAmount 
from sales_fact f 
inner join Customer_Dimension cd  on f.customer_sk = cd.customer_sk 
inner join Sale_Date_Dimension d on f.saleDate_sk = d.saleDate_sk 
group by f.customer_sk) a 
join
(select cd.Name, cd.customer_sk, d.CalendarYear, sum(salesAmount) TotalSalesAmount 
from sales_fact f
inner join Customer_Dimension cd  on f.customer_sk = cd.customer_sk 
inner join Sale_Date_Dimension d on f.saleDate_sk = d.saleDate_sk
group by f.customer_sk) b 
 where a.TotalSalesAmount <= b.TotalSalesAmount 
 group by a.customer_sk, a.Name
 order by a.TotalSalesAmount desc;


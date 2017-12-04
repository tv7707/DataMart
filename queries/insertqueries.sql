#Lost Fact Table

insert into Sales_Fact_lost(Customer_sk, orderdate_sk, totalQty)
select Customer_Dimension.Customer_sk, orderDate_sk, sum(qty) as totalQty 
from sales_fact f join customer_dimension using (customer_sk)  
group by Customer_Dimension.Customer_sk,orderDate_sk;

#Shrunken orderdate dimension monthly

insert into order_date_dimension_monthly 
select orderDate_sk, CalendarMonth, CalendarQuarter, sum(CalendarYear), FiscalMonth, FiscalQuarter, FiscalYear from order_date_dimension group by orderDate_sk, CalendarMonth, CalendarQuarter, FiscalMonth, FiscalQuarter, FiscalYear;

#Shrunken Fact table
insert into Sales_Fact_Shrunken(Customer_sk, orderdate_monthly_sk, totalQty)
select Customer_Dimension.Customer_sk, orderDate_sk, sum(qty) as totalQty 
from sales_fact f join customer_dimension using (customer_sk)  
join order_date_dimension using (orderDate_sk) 
group by Customer_Dimension.Customer_sk,orderDate_sk;

#Collapsed Fact Table
insert into Sales_Fact_collapsed(CustomerName,prodDescription,totalSalesAmount)
select c.Name , prodDescription, sum(salesAmount)
from Sales_Fact f join Customer_Dimension c
on f.Customer_sk = c.Customer_sk
join Product_Dimension p
on f.Product_sk = p.Product_sk
group by Name,prodDescription ;

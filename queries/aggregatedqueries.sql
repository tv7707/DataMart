#Shrunken Loading
insert into order_date_dimension_monthly 
select orderDate_sk, CalendarMonth, CalendarQuarter, sum(CalendarYear), FiscalMonth, FiscalQuarter, FiscalYear from order_date_dimension group by orderDate_sk, CalendarMonth, CalendarQuarter, FiscalMonth, FiscalQuarter, FiscalYear;

insert into Sales_Fact_Shrunken(Customer_sk, orderdate_monthly_sk, totalQty)
select Customer_Dimension.Customer_sk, orderDate_sk, sum(qty) as totalQty 
from sales_fact f join customer_dimension using (customer_sk)  
join order_date_dimension using (orderDate_sk) 
group by Customer_Dimension.Customer_sk,orderDate_sk;

#summary query for lost
select totalQty, cd.Name,Date
from Sales_Fact_Lost f join Customer_Dimension cd
on f.Customer_sk = cd.Customer_sk
join 
Order_Date_Dimension d
on d.orderDate_sk = f.orderDate_sk
where Date = 2009-07-05;

#summary query for lost
select totalQty, cd.State,Date
from Sales_Fact_Lost f join Customer_Dimension cd
on f.Customer_sk = cd.Customer_sk
join 
Order_Date_Dimension d
on d.orderDate_sk = f.orderDate_sk
where Date = "2005-11-09";

#summary query for shrunken
select totalQty, Customer_sk
from Sales_Fact_Shrunken f inner join Order_Date_Dimension_monthly d
on  f.orderDate_monthly_sk= d.orderDate_monthly_sk
where CalendarMonth = "12"
group by Customer_sk;

#summary query for shrunken
select Customer_sk,totalQty,CalendarMonth,CalendarYear from Sales_Fact_Shrunken f inner join Order_Date_Dimension_monthly d on  f.orderDate_monthly_sk= d.orderDate_monthly_sk where CalendarMonth = "12"and CalendarYear = "2009" group by Customer_sk;





#loading query for collapsed
insert into Sales_Fact_collapsed(CustomerName,prodDescription,totalSalesAmount)
select c.Name , prodDescription, sum(salesAmount)
from Sales_Fact f join Customer_Dimension c
on f.Customer_sk = c.Customer_sk
join Product_Dimension p
on f.Product_sk = p.Product_sk
group by Name,prodDescription ;

#summary query for collapsed

select CustomerName,totalSalesAmount from Sales_Fact_Collapsed where totalSalesAmount >= 5000000;

select CustomerName,prodDescription,totalSalesAmount from Sales_Fact_Collapsed where CustomerName = "United HealthCare" and prodDescription = "Bandage" ;

#Query On Sales Fact

select Name,typeName,salesAmount,qty,CalendarYear, CalendarQuarter, CalendarMonth from Sales_Fact f inner join customer_dimension cd on f.customer_sk  = cd.customer_sk join order_date_dimension d on f.orderdate_sk = d.orderdate_sk group by CalendarYear ;

select prodDescription,Name,Abbrev,salesAmount,qty,typeDescription,CalendarYear, CalendarQuarter, CalendarMonth from Sales_Fact f inner join product_dimension pd on f.product_sk  = pd.product_sk join order_date_dimension d on f.orderdate_sk = d.orderdate_sk group by CalendarYear ;

select supplierName, prodDescription , qty from sales_fact f inner join supplier_dimension sd on f.supplier_sk = sd.supplier_sk join product_dimension pd on f.product_sk = 
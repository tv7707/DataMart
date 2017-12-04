#1.	Summary query to show the sales, and costs associated with each customer or customer type on an annual, quarterly, monthly or weekly basis
Select cd.Name,cd.typeName, f.salesAmount,f.qty, d.CalendarYear, d.CalendarQuarter, d.CalendarMonth
     from Sales_Fact f inner join customer_dimension cd use index(custin)
     using (Customer_sk)
     join order_date_dimension d on f.orderdate_sk = d.orderdate_sk 
     group by CalendarYear ;

 
#2.	Summary query to show the sales, and costs associate at the product level/ product type/ business unit
select pd.prodDescription, pd.Name, pd.Abbrev,f.salesAmount,f.qty,pd.typeDescription,d.CalendarYear, d.CalendarQuarter, d.CalendarMonth 
from Sales_Fact f 
inner join product_dimension pd  use index(prodin) 
using (product_sk)
join order_date_dimension d 
on f.orderdate_sk = d.orderdate_sk 
group by CalendarYear ;


#3.	Query to find the average number of products supplied by each supplier
select supplierName, prodDescription, qty 
from sales_fact f 
inner join supplier_dimension sd use index(suppin)
on f.supplier_sk = sd.supplier_sk 
join product_dimension pd 
on f.product_sk = pd.product_sk 
group by supplierName;


    # Creating view 
    create view sales_view as 
    select c.Name, c.typeName, p.typeDescription, p.unitCost,sum(f.qty) as TotalQuantity
    from sales_fact f join Customer_Dimension c
    using(customer_sk)
    join product_dimension p
    using(product_sk)
    group by 1,2,3,4

    select * from sales_view;

    drop view sales_view;

 # Creating view 
 
    create view sales_view_supplier as 
    select s.supplierName, p.typeDescription, sum(f.qty) as TotalQuantity
    from sales_fact f join Supplier_Dimension s
    using(supplier_sk)
    join product_dimension p
    using(product_sk)
    group by 1,2;

    select * from sales_view_supplier;
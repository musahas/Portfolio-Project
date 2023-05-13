---Portfolio Project: Developing Executive Dashboard (Revenue Dashboard)
---Data Source: Data retrieved from the company’s(BikeStore) relational database.
---Data Link:  http://www.sqlservertutorial.net/load-sample-database/ 
---#Write SQL query that brings all the necessary fields from multiple tables within the database

SELECT 
	ord.order_id
	,CONCAT(cus.first_name,' ',cus.last_name) As 'Customer Name' 
	,cus.city
	,cus.[state]
	,ord.order_date
	,SUM(ite.quantity) AS 'Total_Units'
	,SUM(ite.quantity*ite.list_price) AS 'Revenue'	
	,pro.product_name
	,cat.category_name
	,sto.store_name
	,CONCAT(sta.first_name,' ',sta.last_name) AS 'Sales Rep'
	,PB.[brand_name]
FROM  [sales].[orders] ord
JOIN sales.customers cus
ON ord.customer_id=cus.customer_id
JOIN sales.order_items ite
ON ord.order_id=ite.order_id
JOIN [production].[products] pro
ON ite.product_id=pro.product_id
JOIN [production].[categories] cat
ON pro.category_id=cat.category_id
JOIN sales.stores sto
ON ord.store_id=sto.store_id
JOIN [sales].[staffs] sta
ON sta.[staff_id]=ord.[staff_id]
JOIN [production].[brands] PB
ON PB.[brand_id]=pro.[brand_id]
GROUP BY ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name), 
	cus.city,
	cus.[state],
	ord.order_date, 
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name),
	PB.[brand_name]
 

/*
Groups the items in SalesOrderDetail by ProductID and counts the number of sales of each ProductID.
Displays the count of sales, ProductID, and ProductName of each product in descending order based on
the count of sales.
*/

SELECT
	COUNT(*) AS NumberOfSales,
	x.ProductID AS ProdID,
	(SELECT Production.Product.Name FROM Production.Product WHERE Production.Product.ProductID = x.ProductID) AS Sub
FROM 
	Sales.SalesOrderDetail
	INNER JOIN Production.Product AS x
	ON Sales.SalesOrderDetail.ProductID = x.ProductID 
GROUP BY
	x.ProductID
ORDER BY
	NumberOfSales DESC
	
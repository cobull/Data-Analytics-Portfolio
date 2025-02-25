/*
Groups the items in SalesOrderDetail by ProductID and sums the line totals for each ProductID.
Displays the sums of the line totals, ProductID, and ProductName of each product in descending order
based on sum of line totals.
*/

SELECT
	SUM(x.LineTotal) AS Total,
	x.ProductID,
	(SELECT y.Name FROM Production.Product AS y WHERE y.ProductID = x.ProductID) AS ProductName
FROM 
	Sales.SalesOrderDetail AS x
GROUP BY
	x.ProductID
ORDER BY 
	Total DESC
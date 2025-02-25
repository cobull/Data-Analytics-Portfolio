/*
Groups items by ProductID and Territory and counts the number of sales. Subsequently 
selects the item from each territory that had the highest number of sales. Displays 
the count of sales, ProductID, TerritoryID, and ProductName of the item with the 
highest number of sales in each of the territories.
*/

WITH cte AS (
SELECT
	COUNT(*) AS Total, 
	x.ProductID, 
	y.TerritoryID, 
	DENSE_RANK() OVER (PARTITION BY y.TerritoryID ORDER BY COUNT(*) DESC) AS Rnk
FROM Sales.SalesOrderDetail AS x
INNER JOIN Sales.SalesOrderHeader AS y
ON y.SalesOrderID = x.SalesOrderID
GROUP BY x.ProductID, y.TerritoryID
)
SELECT 
	cte.Total, 
	cte.ProductID, 
	cte.TerritoryID, 
	z.Name AS ProductName
FROM cte 
INNER JOIN Production.Product AS z 
ON cte.ProductID = z.ProductID 
WHERE rnk = 1
/*
Groups items by ProductID and Territory and sums the line totals. Subsequently selects
the item from each territory that had the highest sum of line totals. Displays the 
sum of line totals, ProductID, TerritoryID, and ProductName of the item with the 
highest revenue in each of the territories.
*/

WITH cte AS (
SELECT
	SUM(x.LineTotal) AS Total, 
	x.ProductID, 
	y.TerritoryID, 
	DENSE_RANK() OVER (PARTITION BY y.TerritoryID ORDER BY SUM(x.LineTotal) DESC) AS Rnk
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